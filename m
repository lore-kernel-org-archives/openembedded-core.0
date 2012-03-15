Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S809m-00034h-1P
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 03:11:10 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Mar 2012 19:02:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119089808"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 14 Mar 2012 19:02:19 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Mar 2012 19:02:17 -0700
Message-Id: <513484b0dacc94af1730ddf919b88f57adc63f53.1331776832.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <ad10381bea270e54aeefbbc3af0f9f1dce60e49f.1331776831.git.nitin.a.kamble@intel.com>
References: <ad10381bea270e54aeefbbc3af0f9f1dce60e49f.1331776831.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1331776831.git.nitin.a.kamble@intel.com>
References: <cover.1331776831.git.nitin.a.kamble@intel.com>
Subject: [PATCH 8/8] gcc: enable multilib for target gcc
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
X-List-Received-Date: Thu, 15 Mar 2012 02:11:10 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

add a task to setup multilib configuration for target gcc.

This commit modifies target gcc, in such a way that it supports
configured multilib targets output.

Tested this, and this works on the target now.

root@qemux86-64:~# gcc -m64 t.c -o t
root@qemux86-64:~# file t
t: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.16, not stripped
root@qemux86-64:~# ./t
Hello World !
root@qemux86-64:~# gcc -m32 t.c -o t
root@qemux86-64:~# file t
t: ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux 2.6.16, not stripped
root@qemux86-64:~# ./t
Hello World !

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc           |   23 +++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-target.inc |    1 +
 meta/recipes-devtools/gcc/gcc-multilib-config.inc  |  155 ++++++++++++++++++++
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |   42 ++++++
 5 files changed, 222 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-multilib-config.inc

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index f550aab..b371ba1 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -34,6 +34,29 @@ def get_gcc_multiarch_setting(bb, d):
             return multiarch_options[target_arch]
     return ""
 
+# this is used by the multilib setup of gcc
+def get_tune_parameters (tune, d) :
+    availtunes = d.getVar('AVAILTUNES', True)
+    if tune not in availtunes.split():
+        bb.error('The tune: %s is not one of the available tunes: %s', tune, availtunes)
+
+    localdata = bb.data.createCopy(d)
+    override = ':tune-' + tune
+    localdata.setVar('OVERRIDES', localdata.getVar('OVERRIDES', False) + override)
+    bb.data.update_data(localdata)
+
+    retdict = {}
+    retdict['tune'] = tune
+    retdict['ccargs'] = localdata.getVar('TUNE_CCARGS', True)
+    retdict['features'] = localdata.getVar('TUNE_FEATURES', True)
+    retdict['baselib'] = localdata.getVar('BASE_LIB', True)
+    retdict['arch'] = localdata.getVar('TUNE_ARCH', True)
+    retdict['abiextension'] = localdata.getVar('ABIEXTENSION', True)
+    retdict['target_fpu'] = localdata.getVar('TARGET_FPU', True)
+    retdict['pkgarch'] = localdata.getVar('TUNE_PKGARCH', True)
+    retdict['package_extra_archs'] = localdata.getVar('PACKAGE_EXTRA_ARCHS', True)
+    return retdict
+
 # We really need HOST_SYS here for some packages and TARGET_SYS for others.
 # For now, libgcc is most important so we fix for that - RP.
 SHLIBSDIR = "${STAGING_DIR_TARGET}/shlibs"
diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 7a96e91..6933a70 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -25,7 +25,7 @@ EXTRA_OECONF_PATHS ?= ""
 EXTRA_OECONF_INITIAL ?= ""
 EXTRA_OECONF_INTERMEDIATE ?= ""
 
-GCCMULTILIB = "--disable-multilib"
+GCCMULTILIB ?= "--disable-multilib"
 
 EXTRA_OECONF = "${@['--enable-clocale=generic', ''][d.getVar('USE_NLS', True) != 'no']} \
                 --with-gnu-ld \
diff --git a/meta/recipes-devtools/gcc/gcc-configure-target.inc b/meta/recipes-devtools/gcc/gcc-configure-target.inc
index 8b169a7..9001bcf 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-target.inc
@@ -1,4 +1,5 @@
 require gcc-configure-common.inc
+require gcc-multilib-config.inc
 
 EXTRA_OECONF_PATHS = " \
     --with-local-prefix=${STAGING_DIR_TARGET}${prefix} \
diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
new file mode 100644
index 0000000..8c7706e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -0,0 +1,155 @@
+GCCMULTILIB = "--enable-multilib"
+
+addtask gcc_multilib_setup after do_patch before do_configure
+
+# following code modifies these definitions in the gcc config
+#    MULTILIB_OPTIONS
+#    MULTILIB_DIRNAMES
+#    MULTILIB_OSDIRNAMES
+#    GLIBC_DYNAMIC_LINKER32
+#    GLIBC_DYNAMIC_LINKER64
+#    GLIBC_DYNAMIC_LINKERX32
+#    GLIBC_DYNAMIC_LINKERN32
+#  For more information on use of these variables look at these files in the gcc source code
+#    gcc/config/i386/t-linux64
+#    gcc/config/i386/t-linux
+#    gcc/config/mips/t-linux64
+#    gcc/config/mips/t-linux
+#    gcc/config/rs6000/t-linux64
+#    gcc/config/i386/linux64.h
+#    gcc/config/i386/linux.h
+#    gcc/config/mips/linux64.h
+#    gcc/config/rs6000/linux64.h
+#    gcc/config/rs6000/linux.h
+# Nitin Kamble 2012/02/13
+
+python do_gcc_multilib_setup() {
+    import re
+
+    # do this only for target recipe
+    if d.getVar('PN', True) != 'gcc':
+        return
+
+    srcdir = d.getVar('S', True)
+    multilibs = d.getVar('MULTILIB_VARIANTS', True)
+    target_arch = d.getVar('TARGET_ARCH', True)
+
+    gcc_target_config_files = {     
+        'x86_64'      : ['gcc/config/i386/t-linux64', 'gcc/config/i386/t-linux'],
+        'i586'        : ['gcc/config/mips/t-linux'],
+        'mips'        : ['gcc/config/mips/t-linux64', 'gcc/config/mips/t-linux'],
+        'ppc'         : ['gcc/config/rs6000/t-linux64'] }
+
+    gcc_header_config_files = {     
+        'x86_64'      : ['gcc/config/i386/linux64.h'],
+        'i586'        : ['gcc/config/mips/linux.h'],
+        'mips'        : ['gcc/config/mips/linux64.h', 'gcc/config/mips/linux.h'],
+        'ppc'         : ['gcc/config/rs6000/linux64.h', 'gcc/config/rs6000/linux.h'] }
+
+    if target_arch not in gcc_target_config_files:
+        bb.warn('gcc multilib setup is not supported for TARGET_ARCH=' + target_arch)
+        return
+
+    gcc_multilib_target_config_files = gcc_target_config_files[target_arch]
+    gcc_multilib_header_config_files = gcc_header_config_files[target_arch]
+
+    ml_list = ['DEFAULTTUNE']
+    if multilibs != '':
+        for ml in multilibs.split(' '):
+            ml_list.append('DEFAULTTUNE_virtclass-multilib-' + ml)
+
+    libdir32 = 'SYSTEMLIBS_DIR'
+    libdir64 = 'SYSTEMLIBS_DIR'
+    libdirx32 = 'SYSTEMLIBS_DIR'
+    libdirn32 = 'SYSTEMLIBS_DIR'
+
+    multilib_options = []
+    multilib_dirnames = []
+    multilib_osdirnames = []
+
+    for ml in ml_list:
+        tune = d.getVar(ml, True)
+	tune_parameters = get_tune_parameters(tune, d)
+	for a, b in tune_parameters.iteritems():
+		bb.warn(a + ': ' + b)
+
+        tune_baselib = tune_parameters['baselib']
+
+        if tune_baselib == 'lib64':
+            libdir64 = tune_baselib
+        elif tune_baselib == 'libx32':
+            libdirx32 = tune_baselib
+        elif tune_baselib == 'lib32':
+            libdirn32 = tune_baselib
+        elif tune_baselib == 'lib':
+            libdir32 = tune_baselib
+        else:
+            bb.error('Unknown libdir (%s) of the tune : %s' % (tune_baselib, tune))
+
+        # take out '-' in parameters
+        multilib_options.append(re.sub(r' +\-+', ' ', re.sub(r'^ *\-+', '', tune_parameters['ccargs'])))
+        if tune_baselib == 'lib':
+            multilib_dirnames.append('32')  # /lib => 32bit lib
+        else:
+            multilib_dirnames.append(tune_baselib.replace('lib', ''))
+        multilib_osdirnames.append('../' + tune_baselib)
+    
+    # go over t-linux64 kind target files
+    for ml_conf_file in gcc_multilib_target_config_files:
+        with open(srcdir + '/' + ml_conf_file, 'r') as f:
+            filelines = f.read()
+            f.close()
+
+            # recreate multilib configuration variables
+
+            filelines = re.sub(r'^\s*MULTILIB_OPTIONS\s*=.*$',
+                'MULTILIB_OPTIONS = ' + '/'.join(multilib_options),
+                filelines, flags=re.MULTILINE)
+
+            filelines = re.sub(r'^\s*MULTILIB_DIRNAMES\s*=.*$',
+                'MULTILIB_DIRNAMES = ' + ' '.join(multilib_dirnames),
+                filelines, flags=re.MULTILINE)
+
+            filelines = re.sub(r'^\s*MULTILIB_OSDIRNAMES\s*=.*$',
+                'MULTILIB_OSDIRNAMES = ' + ' '.join(multilib_osdirnames),
+                filelines, flags=re.MULTILINE)
+    
+            with open(srcdir + '/' + ml_conf_file, 'w') as f:
+                f.write(filelines)
+                f.close()
+            with open('/tmp/ml.out', 'w') as f:
+                f.write(filelines)
+                f.close()
+
+    # go over linux64.h kind header files
+    for ml_conf_file in gcc_multilib_header_config_files:
+        with open(srcdir + '/' + ml_conf_file, 'r') as f:
+            filelines = f.read()
+            f.close()
+
+            # replace lines like
+            # #define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
+            # by
+            # #define GLIBC_DYNAMIC_LINKER32 "/lib/" "ld-linux.so.2"
+            # this is needed to put the correct dynamic loader path in the generated binaries
+
+            filelines = re.sub(r'^(#define\s*GLIBC_DYNAMIC_LINKER32\s*)(SYSTEMLIBS_DIR)(\s*\".*\")$',
+                r'\1"/' + libdir32 + r'/"\3',
+                filelines, flags=re.MULTILINE)
+
+            filelines = re.sub(r'^(#define\s*GLIBC_DYNAMIC_LINKER64\s*)(SYSTEMLIBS_DIR)(\s*\".*\")$',
+                r'\1"/' + libdir64 + r'/"\3',
+                filelines, flags=re.MULTILINE)
+
+            filelines = re.sub(r'^(#define\s*GLIBC_DYNAMIC_LINKERX32\s*)(SYSTEMLIBS_DIR)(\s*\".*\")$',
+                r'\1"/' + libdirx32 + r'/"\3',
+                filelines, flags=re.MULTILINE)
+
+            filelines = re.sub(r'^(#define\s*GLIBC_DYNAMIC_LINKERN32\s*)(SYSTEMLIBS_DIR)(\s*\".*\")$',
+                r'\1"/' + libdirn32 + r'/"\3',
+                filelines, flags=re.MULTILINE)
+
+            with open(srcdir + '/' + ml_conf_file, 'w') as f:
+                f.write(filelines)
+                f.close()
+}
diff --git a/meta/recipes-devtools/gcc/libgcc_4.6.bb b/meta/recipes-devtools/gcc/libgcc_4.6.bb
index 04e2877..6a13e73 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.6.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.6.bb
@@ -14,6 +14,9 @@ FILES_${PN} = "${base_libdir}/libgcc*.so.*"
 FILES_${PN}-dev = " \
   ${base_libdir}/libgcc*.so \
   ${libdir}/${TARGET_SYS}/${BINV}/crt* \
+  ${libdir}/${TARGET_SYS}/${BINV}/32 \
+  ${libdir}/${TARGET_SYS}/${BINV}/x32 \
+  ${libdir}/${TARGET_SYS}/${BINV}/n32 \
   ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
 FILES_libgcov-dev = " \
   ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a"
@@ -51,3 +54,42 @@ BBCLASSEXTEND = "nativesdk"
 INSANE_SKIP_libgcc-dev = "staticdev"
 INSANE_SKIP_libgcov-dev = "staticdev"
 
+addtask multilib_install after do_install before do_package
+# this makes multilib gcc files findable for target gcc
+# like this directory is made findable 
+#    /usr/lib/i586-pokymllib32-linux/4.6.3/
+# by creating this symlink to it
+#    /usr/lib64/x86_64-poky-linux/4.6.3/32
+
+python do_multilib_install() {
+    import re
+    # do this only for multilib extended recipe
+    if d.getVar('PN', True) != 'libgcc':
+        return
+
+    multilibs = d.getVar('MULTILIB_VARIANTS', True) or ''
+    if multilibs == '':
+        return
+
+    binv = d.getVar('BINV', True) or ''
+
+    for ml in multilibs.split(' '):
+        tune = d.getVar('DEFAULTTUNE_virtclass-multilib-' + ml, True) or ''
+        tune_parameters = get_tune_parameters(tune, d)
+        tune_baselib = tune_parameters['baselib']
+        tune_arch = tune_parameters['arch']
+        tune_bitness = tune_baselib.replace('lib', '')
+        if tune_bitness == '' :
+            tune_bitness = '32' # /lib => 32bit lib
+
+    src = '../../../' + tune_baselib + '/' + \
+        tune_arch + d.getVar('TARGET_VENDOR', True) + 'ml' + ml + \
+        '-' + d.getVar('TARGET_OS', True) + '/' + binv + '/'
+
+    dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + \
+        d.getVar('TARGET_SYS', True) + '/' + binv + '/' + tune_bitness
+
+    if os.path.lexists(dest):
+        os.unlink(dest)
+    os.symlink(src, dest)
+}
-- 
1.7.6.4



