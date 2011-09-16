Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R4SPh-00005W-0n
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 09:00:41 +0200
Received: by bke11 with SMTP id 11so4460668bke.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2011 23:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=NFiDiqX0SwsF3ltb5kL0kk0nrsQwoPmCFU0K+VwYz30=;
	b=byJyZHkrthgOFTwCKVpWr2FLbbNU6+falJE1uElFrtg9bw77wLaWUDz1o88Gh7gVks
	/GKRXiXBZ3AdBBk0r90ZiPlXKvtqLzflYguiSXJb00xGb2sRNrLGKQXoTvORbN/Xtzyr
	NR+/vl8gY2eg1VAh4gozL8QHbt5Rnc+0TdU0Q=
Received: by 10.204.129.67 with SMTP id n3mr1347577bks.304.1316156127117;
	Thu, 15 Sep 2011 23:55:27 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id m18sm5371047bkt.12.2011.09.15.23.55.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 23:55:26 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Sep 2011 10:55:16 +0400
Message-Id: <1316156117-22147-2-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316156117-22147-1-git-send-email-dbaryshkov@gmail.com>
References: <1316156117-22147-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 2/3] icecc.bbclass: replace with updated version
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Sep 2011 07:00:41 -0000

Replace a non-working icecc class with a rewritten one. It's cleaned up,
most things are handled now in shell scripts, as it's possible that
toolchains won't exist at the time of parsing/python substitution.
Packages which empty PARALLEL_MAKE are ignored now, as not to break
them.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/classes/icecc.bbclass |  390 ++++++++++++++++----------------------------
 1 files changed, 144 insertions(+), 246 deletions(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 715f870..e20666b 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -26,295 +26,193 @@
 #Error checking is kept to minimum so double check any parameters you pass to the class
 ###########################################################################################
 
+ICECC_ENV_EXEC ?= "${STAGING_BINDIR_NATIVE}/icecc-create-env"
 
-def icc_determine_gcc_version(gcc):
-    """
-    Hack to determine the version of GCC
-
-    'i686-apple-darwin8-gcc-4.0.1 (GCC) 4.0.1 (Apple Computer, Inc. build 5363)'
-    """
-    return os.popen("%s --version" % gcc ).readline().split()[2]
-
-def create_cross_env(bb,d):
-    """
-    Create a tar.bz2 of the current toolchain
-    """
-    # Constin native-native compilation no environment needed if
-    # host prefix is empty (let us duplicate the query for ease)
-    prefix = bb.data.expand('${HOST_PREFIX}', d)
-    if len(prefix) == 0:
-        return ""
-
-    import tarfile, socket, time
-    prefix  = bb.data.expand('${HOST_PREFIX}' , d)
-    ice_dir = bb.data.expand("${STAGING_DIR_NATIVE}${prefix_native}")
-    distro  = bb.data.expand('${DISTRO}', d)
-    target_sys = bb.data.expand('${TARGET_SYS}',  d)
-    target_prefix = bb.data.expand('${TARGET_PREFIX}',  d)
-    float   = bb.data.getVar('TARGET_FPU', d) or "hard"
-    name    = socket.gethostname()
-
-    # Stupid check to determine if we have built a libc and a cross
-    # compiler.
-    try:
-        os.stat(os.path.join(ice_dir, target_sys, 'lib', 'libc.so'))
-        os.stat(os.path.join(ice_dir, target_sys, 'bin', 'g++'))
-    except: # no cross compiler built yet
-        return ""
-
-    VERSION = icc_determine_gcc_version( os.path.join(ice_dir,target_sys,"bin","g++") )
-    cross_name = prefix + distro + "-" + target_sys + "-" + float + "-" + VERSION + "-" + name
-    tar_file = os.path.join(ice_dir, 'ice', cross_name + '.tar.gz')
-
-    try:
-        os.stat(tar_file)
-	# tar file already exists
-        return tar_file
-    except: 
-        try:
-            os.makedirs(os.path.join(ice_dir,'ice'))
-        except:
-            # directory already exists, continue
-            pass
-
-
-    #check if user has specified a specific icecc-create-env script
-    #if not use the OE provided one
-    cr_env_script = bb.data.getVar('ICECC_ENV_EXEC',  d) or  bb.data.expand('${STAGING_DIR}', d)+"/ice/icecc-create-env"
-    #call the modified create-env script
-    result=os.popen("%s %s %s %s %s %s" %(cr_env_script,
-           "--silent",
-           os.path.join(ice_dir,target_sys,'bin','gcc'),
-           os.path.join(ice_dir,target_sys,'bin','g++'),
-           os.path.join(ice_dir,target_sys,'bin','as'),
-           os.path.join(ice_dir,"ice",cross_name) ) )
-    return tar_file
-
+def icecc_dep_prepend(d):
+    # INHIBIT_DEFAULT_DEPS doesn't apply to the patch command.  Whether or  not
+    # we need that built is the responsibility of the patch function / class, not
+    # the application.
+    if not bb.data.getVar('INHIBIT_DEFAULT_DEPS', d):
+        return "icecc-create-env"
+    return ""
 
-def create_native_env(bb,d):
-    import tarfile, socket, time
-    ice_dir = bb.data.expand("${STAGING_DIR_NATIVE}${prefix_native}")
-    prefix  = bb.data.expand('${HOST_PREFIX}' , d)
-    distro  = bb.data.expand('${DISTRO}', d)
-    target_sys = bb.data.expand('${TARGET_SYS}',  d)
-    target_prefix = bb.data.expand('${TARGET_PREFIX}',  d)
-    float   = bb.data.getVar('TARGET_FPU', d) or "hard"
-    name    = socket.gethostname()
+DEPENDS_prepend += "${@icecc_dep_prepend(d)} "
 
-    archive_name = "local-host-env" + "-" + name
-    tar_file = os.path.join(ice_dir, 'ice', archive_name + '.tar.gz')
-
-    try:
-        os.stat(tar_file)
-	# tar file already exists
-        return tar_file
-    except: 
-        try:
-            #os.makedirs(os.path.join(ice_dir))
-            os.makedirs(os.path.join(ice_dir,'ice'))
-        except:
-            # directory already exists, continue
-            pass
-
-    #check if user has specified a specific icecc-create-env script
-    #if not use the OE provided one
-    cr_env_script = bb.data.getVar('ICECC_ENV_EXEC',  d) or  bb.data.expand('${STAGING_DIR}', d)+"/ice/icecc-create-env"
-    result=os.popen("%s %s %s %s %s %s" %(cr_env_script,
-           "--silent",
-           os.popen("%s gcc" % "which").read()[:-1],
-           os.popen("%s g++" % "which").read()[:-1],
-           os.popen("%s as" % "which").read()[:-1],
-           os.path.join(ice_dir,"ice",archive_name) ) )
-    return tar_file
-
-
-
-def create_cross_kernel_env(bb,d):
-    import tarfile, socket, time
-    ice_dir = bb.data.expand("${STAGING_DIR_NATIVE}${prefix_native}")
-    prefix  = bb.data.expand('${HOST_PREFIX}' , d)
-    distro  = bb.data.expand('${DISTRO}', d)
-    target_sys = bb.data.expand('${TARGET_SYS}',  d)
-    target_prefix = bb.data.expand('${TARGET_PREFIX}',  d)
-    float   = bb.data.getVar('TARGET_FPU', d) or "hard"
-    name    = socket.gethostname()
+def get_cross_kernel_cc(bb,d):
     kernel_cc = bb.data.expand('${KERNEL_CC}', d)
-    kernel_cc = kernel_cc[:-1]
-
-    # Stupid check to determine if we have built a libc and a cross
-    # compiler.
-    try:
-       os.stat(os.path.join(ice_dir, 'bin', kernel_cc))
-    except: # no cross compiler built yet
-        return ""
-
-    VERSION = icc_determine_gcc_version( os.path.join(ice_dir,"bin",kernel_cc) )
-    cross_name = prefix + distro + "-" + target_sys + "-" + float + "-" + VERSION + "-" + name
-    tar_file = os.path.join(ice_dir, 'ice', cross_name + '.tar.gz')
-
-    try:
-        os.stat(tar_file)
-	# tar file already exists
-        return tar_file
-    except: 
-        try:
-            os.makedirs(os.path.join(ice_dir,'ice'))
-        except:
-            # directory already exists, continue
-            pass
-
+    kernel_cc = kernel_cc.replace('ccache', '').strip()
+    kernel_cc = kernel_cc.split(' ')[0]
+    kernel_cc = kernel_cc.strip()
+    return kernel_cc
 
-    #check if user has specified a specific icecc-create-env script
-    #if not use the OE provided one
-    cr_env_script = bb.data.getVar('ICECC_ENV_EXEC',  d) or  bb.data.expand('${STAGING_DIR}', d)+"/ice/icecc-create-env"
-    result=os.popen("%s %s %s %s %s %s" %(cr_env_script,
-           "--silent",
-           os.path.join(ice_dir,'bin',kernel_cc),
-           os.path.join(ice_dir,target_sys,'bin','g++'),
-           os.path.join(ice_dir,target_sys,'bin','as'),
-           os.path.join(ice_dir,"ice",cross_name) ) )
-    return tar_file
-
-
-def create_env(bb,d):
-
-        #return create_cross_kernel_env(bb,d) 
-
-        if bb.data.inherits_class("native", d):
-          return create_native_env(bb,d)
-        elif bb.data.inherits_class("kernel", d):
-          return create_cross_kernel_env(bb,d)
-        elif bb.data.inherits_class("cross", d):
-          return create_native_env(bb,d)
-        elif bb.data.inherits_class("sdk", d):
-          return create_native_env(bb,d)
-        else:  
-          return create_cross_env(bb,d)
-
-
-def create_path(compilers, type, bb, d):
+def create_path(compilers, bb, d):
     """
     Create Symlinks for the icecc in the staging directory
     """
-    staging = os.path.join(bb.data.expand('${STAGING_DIR}', d), "ice", type)
+    staging = os.path.join(bb.data.expand('${STAGING_BINDIR}', d), "ice")
+    if icc_is_kernel(bb, d):
+        staging += "-kernel"
 
     #check if the icecc path is set by the user
-    icecc   = bb.data.getVar('ICECC_PATH', d) or os.popen("%s icecc" % "which").read()[:-1]
+    icecc   = bb.data.getVar('ICECC_PATH', d) or os.popen("which icecc").read()[:-1]
 
     # Create the dir if necessary
     try:
         os.stat(staging)
     except:
-        os.makedirs(staging)
+        try:
+            os.makedirs(staging)
+        except:
+            pass
 
     for compiler in compilers:
         gcc_path = os.path.join(staging, compiler)
         try:
             os.stat(gcc_path)
         except:
-            os.symlink(icecc, gcc_path)
+            try:
+                os.symlink(icecc, gcc_path)
+            except:
+                pass
 
-    return staging + ":"
+    return staging
 
+def use_icc(bb,d):
+    package_tmp = bb.data.expand('${PN}', d)
 
-def use_icc_version(bb,d):
-      icecc_ver = "yes"
-      system_class_blacklist = [ "none" ] 
-
-      for black in system_class_blacklist:
-           if bb.data.inherits_class(black, d):
-              icecc_ver = "no"
-
-      user_class_blacklist =  bb.data.getVar('ICECC_USER_CLASS_BL', d) or "none"
-      user_class_blacklist = user_class_blacklist.split()
-
-      for black in user_class_blacklist:
-           if bb.data.inherits_class(black, d):
-              icecc_ver = "no"
-
-      return icecc_ver
-
+    system_class_blacklist = [ "none" ] 
+    user_class_blacklist = (bb.data.getVar('ICECC_USER_CLASS_BL', d) or "none").split()
+    package_class_blacklist = system_class_blacklist + user_class_blacklist
 
-def icc_path(bb,d,compile):
-    package_tmp = bb.data.expand('${PN}', d)
+    for black in package_class_blacklist:
+        if bb.data.inherits_class(black, d):
+            #bb.note(package_tmp, ' class ', black, ' found in blacklist, disable icecc')
+            return "no"
 
     #"system" package blacklist contains a list of packages that can not distribute compile tasks
     #for one reason or the other
-    system_package_blacklist = [ "uclibc", "glibc-intermediate", "gcc", "qemu", "bind", "u-boot", "dhcp-forwarder", "enchant" ]
-
-    for black in system_package_blacklist:
-      if black in package_tmp:
-         bb.data.setVar("PARALLEL_MAKE" , "", d) 
-         return ""
-
-    #user defined exclusion list
-    user_package_blacklist = bb.data.getVar('ICECC_USER_PACKAGE_BL', d) or "none"   
-    user_package_blacklist = user_package_blacklist.split()
-
-    for black in user_package_blacklist:
-      if black in package_tmp:
-         bb.data.setVar("PARALLEL_MAKE" , "", d) 
-         return ""
-
-
-    prefix = bb.data.expand('${HOST_PREFIX}', d)
-
-            
-    if compile and bb.data.inherits_class("cross", d):
-       return create_path( ["gcc", "g++"], "native", bb, d)
-
-    elif compile and bb.data.inherits_class("native", d):
-         return create_path( ["gcc", "g++"], "native", bb, d)
-
-    elif compile and bb.data.inherits_class("kernel", d):
-          return create_path( [get_cross_kernel_ver(bb,d), "foo"], "cross-kernel", bb, d)
+    system_package_blacklist = [ "uclibc", "glibc", "gcc", "bind", "u-boot", "dhcp-forwarder", "enchant", "connman", "orbit2" ]
+    user_package_blacklist = (bb.data.getVar('ICECC_USER_PACKAGE_BL', d) or "").split()
+    package_blacklist = system_package_blacklist + user_package_blacklist
+
+    for black in package_blacklist:
+        if black in package_tmp:
+            #bb.note(package_tmp, ' found in blacklist, disable icecc')
+            return "no"
+
+    if bb.data.getVar('PARALLEL_MAKE', d) == "":
+        bb.note(package_tmp, " ", bb.data.expand('${PV}', d), " has empty PARALLEL_MAKE, disable icecc")
+        return "no"
+
+    return "yes"
+
+def icc_is_kernel(bb, d):
+    return \
+        bb.data.inherits_class("kernel", d);
+
+def icc_is_native(bb, d):
+    return \
+        bb.data.inherits_class("cross", d) or \
+        bb.data.inherits_class("cross-canadian", d) or \
+        bb.data.inherits_class("native", d) or \
+        bb.data.inherits_class("nativesdk", d);
+
+def icc_version(bb, d):
+    if use_icc(bb, d) == "no":
+        return ""
 
-    elif not compile or len(prefix) == 0:
-           return create_path( ["gcc", "g++"], "native", bb, d)
+    parallel = bb.data.getVar('ICECC_PARALLEL_MAKE', d) or ""
+    bb.data.setVar("PARALLEL_MAKE", parallel, d)
 
+    if icc_is_native(bb, d):
+        archive_name = "local-host-env"
+    elif bb.data.expand('${HOST_PREFIX}', d) == "":
+        bb.fatal(bb.data.expand("${PN}", d), " NULL prefix")
     else:
-           return create_path( [prefix+"gcc", prefix+"g++"], "cross", bb, d)      
+        prefix = bb.data.expand('${HOST_PREFIX}' , d)
+        distro = bb.data.expand('${DISTRO}', d)
+        target_sys = bb.data.expand('${TARGET_SYS}', d)
+        float = bb.data.getVar('TARGET_FPU', d) or "hard"
+        archive_name = prefix + distro + "-"        + target_sys + "-" + float
+        if icc_is_kernel(bb, d):
+            archive_name += "-kernel"
+
+    import socket
+    ice_dir = bb.data.expand('${STAGING_DIR_NATIVE}${prefix_native}', d)
+    tar_file = os.path.join(ice_dir, 'ice', archive_name + "-@VERSION@-" + socket.gethostname() + '.tar.gz')
 
+    return tar_file
 
+def icc_path(bb,d):
+    if icc_is_kernel(bb, d):
+        return create_path( [get_cross_kernel_cc(bb,d), ], bb, d)
 
+    else:
+        prefix = bb.data.expand('${HOST_PREFIX}', d)
+        return create_path( [prefix+"gcc", prefix+"g++"], bb, d)      
+
+def icc_get_tool(bb, d, tool):
+    if icc_is_native(bb, d):
+        return os.popen("which %s" % tool).read()[:-1]
+    elif icc_is_kernel(bb, d):
+        return os.popen("which %s" % get_cross_kernel_cc(bb, d)).read()[:-1]
+    else:
+        ice_dir = bb.data.expand('${STAGING_BINDIR_TOOLCHAIN}', d)
+        target_sys = bb.data.expand('${TARGET_SYS}',  d)
+        return os.path.join(ice_dir, "%s-%s" % (target_sys, tool))
+
+set_icecc_env() {
+    ICECC_VERSION="${@icc_version(bb, d)}"
+    if [ "x${ICECC_VERSION}" = "x" ]
+    then
+        return
+    fi
 
-def icc_version(bb,d):
-    return create_env(bb,d)
+    ICE_PATH="${@icc_path(bb, d)}"
+    if [ "x${ICE_PATH}" = "x" ]
+    then
+        return
+    fi
 
+    ICECC_CC="${@icc_get_tool(bb,d, "gcc")}"
+    ICECC_CXX="${@icc_get_tool(bb,d, "g++")}"
+    if [ ! -x "${ICECC_CC}" -o ! -x "${ICECC_CXX}" ]
+    then
+        return
+    fi
 
-def check_for_kernel(bb,d):     
-    if  bb.data.inherits_class("kernel", d):
-         return "yes"
-    return "no"
+    ICE_VERSION=`$ICECC_CC -dumpversion`
+    ICECC_VERSION=`echo ${ICECC_VERSION} | sed -e "s/@VERSION@/$ICE_VERSION/g"`
+    if [ ! -x "${ICECC_ENV_EXEC}" ]
+    then
+        return
+    fi
 
+    ICECC_AS="`${ICECC_CC} -print-prog-name=as`"
+    if [ "`dirname "${ICECC_AS}"`" = "." ]
+    then
+        ICECC_AS="`which as`"
+    fi
 
-def get_cross_kernel_ver(bb,d):
+    if [ ! -r "${ICECC_VERSION}" ]
+    then
+        mkdir -p "`dirname "${ICECC_VERSION}"`"
+        ${ICECC_ENV_EXEC} "${ICECC_CC}" "${ICECC_CXX}" "${ICECC_AS}" "${ICECC_VERSION}"
+    fi
 
-       return  bb.data.expand('${KERNEL_CC}', d).strip() or "gcc"
+    export ICECC_VERSION ICECC_CC ICECC_CXX
+    export PATH="$ICE_PATH:$PATH"
+    export CCACHE_PATH="$PATH"
+}
 
-# set the icecream environment variables
 do_configure_prepend() {
-    export PATH=${@icc_path(bb,d,False)}$PATH
-    export ICECC_CC="gcc"
-    export ICECC_CXX="g++"
+    set_icecc_env
 }
 
 do_compile_prepend() {
-
-    export PATH=${@icc_path(bb,d,True)}$PATH
- 
- #check if we are building a kernel and select gcc-cross-kernel
- if [ "${@check_for_kernel(bb,d)}" = "yes" ]; then
-    export ICECC_CC="${@get_cross_kernel_ver(bb,d)}"
-    export ICECC_CXX="${HOST_PREFIX}g++"
- else
-    export ICECC_CC="${HOST_PREFIX}gcc"
-    export ICECC_CXX="${HOST_PREFIX}g++"
- fi
-
-    if [ "${@use_icc_version(bb,d)}" = "yes" ]; then
-        export ICECC_VERSION="${@icc_version(bb,d)}"
-    else
-        export ICECC_VERSION="NONE"
-    fi
+    set_icecc_env
 }
+
+#do_install_prepend() {
+#    set_icecc_env
+#}
-- 
1.7.2.5



