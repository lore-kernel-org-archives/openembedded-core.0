Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6A9601D6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 16:45:48 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5LGq9tM005503 for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 17:52:09 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vQCpXsitewIw
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 17:52:08 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5LGq35p005500
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 17:52:05 +0100
Message-ID: <1371833133.20823.306.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Jun 2013 17:45:33 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sanity.bbclass: Various improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Jun 2013 16:45:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

I started trying to make some changes in sanity.bbclass and couldn't stand
the current code. This patch splits out the one big function into a number
of smaller units and adds a status class which handles queuing of messages
and issues like network errors and whether a reparse is required. It also
cleans up some syntax and obsolete code.

The other fundamental change is the tests are split into ones which run
once and those which run at every build. This was always the way the
class was intended to work but that got lost somewhere along the way.
This patch fixes that.

Its still far from perfect but it is hopefully an improvement
and sets the scene for other improvements to be built on top of this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 7e61daa..f62625a 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -158,7 +158,7 @@ def check_toolchain(data):
             if tune_errors:
                 tune_error_set.append(tune_errors)
     if tune_error_set:
-        return "Toolchain tunings invalid:\n" + '\n'.join(tune_error_set)
+        return "Toolchain tunings invalid:\n" + '\n'.join(tune_error_set) + "\n"
 
     return ""
 
@@ -174,36 +174,6 @@ def check_conf_exists(fn, data):
             return True
     return False
 
-def check_sanity_sstate_dir_change(sstate_dir, data):
-    # Sanity checks to be done when the value of SSTATE_DIR changes
-
-    # Check that SSTATE_DIR isn't on a filesystem with limited filename length (eg. eCryptFS)
-    testmsg = ""
-    if sstate_dir != "":
-        testmsg = check_create_long_filename(sstate_dir, "SSTATE_DIR")
-        # If we don't have permissions to SSTATE_DIR, suggest the user set it as an SSTATE_MIRRORS
-        try:
-            err = testmsg.split(': ')[1].strip()
-            if err == "Permission denied.":
-                testmsg = testmsg + "You could try using %s in SSTATE_MIRRORS rather than as an SSTATE_CACHE.\n" % (sstate_dir)
-        except IndexError:
-            pass
-    return testmsg
-
-def check_sanity_tmpdir_change(tmpdir, data):
-    # Sanity checks to be done when the value of TMPDIR changes
-
-    # Check that TMPDIR isn't on a filesystem with limited filename length (eg. eCryptFS)
-    testmsg = check_create_long_filename(tmpdir, "TMPDIR")
-    # Check that we can fetch from various network transports
-    errmsg = check_connectivity(data)
-    testmsg = testmsg + check_connectivity(data)
-    return testmsg, errmsg != ""
-        
-def check_sanity_version_change(data):
-    # Sanity checks to be done when SANITY_VERSION changes
-    return ""
-
 def check_create_long_filename(filepath, pathname):
     testfile = os.path.join(filepath, ''.join([`num`[-1] for num in xrange(1,200)]))
     try:
@@ -338,226 +308,323 @@ def check_gcc_march(sanity_data):
 
 # Tar version 1.24 and onwards handle overwriting symlinks correctly
 # but earlier versions do not; this needs to work properly for sstate
-def check_tar_version(sanity_data, loosever):
+def check_tar_version(sanity_data):
+    from distutils.version import LooseVersion
     status, result = oe.utils.getstatusoutput("tar --version")
     if status != 0:
         return "Unable to execute tar --version, exit code %s\n" % status
     version = result.split()[3]
-    if loosever(version) < loosever("1.24"):
+    if LooseVersion(version) < LooseVersion("1.24"):
         return "Your version of tar is older than 1.24 and has bugs which will break builds. Please install a newer version of tar.\n"
     return None
 
 # We use git parameters and functionality only found in 1.7.5 or later
-def check_git_version(sanity_data, loosever):
+def check_git_version(sanity_data):
+    from distutils.version import LooseVersion
     status, result = oe.utils.getstatusoutput("git --version 2> /dev/null")
     if status != 0:
         return "Unable to execute git --version, exit code %s\n" % status
     version = result.split()[2]
-    if loosever(version) < loosever("1.7.5"):
+    if LooseVersion(version) < LooseVersion("1.7.5"):
         return "Your version of git is older than 1.7.5 and has bugs which will break builds. Please install a newer version of git.\n"
     return None
 
 
-def check_sanity(sanity_data):
-    import subprocess
-
-    reparse = False
-    try:
-        from distutils.version import LooseVersion
-    except ImportError:
-        def LooseVersion(v):
-            print("WARNING: sanity.bbclass can't compare versions without python-distutils")
-            return 1
-
-    if 0 == os.getuid():
-        raise_sanity_error("Do not use Bitbake as root.", sanity_data)
-
-    messages = ""
-
-    # Check the Python version, we now have a minimum of Python 2.7.3
-    import sys
-    if sys.hexversion < 0x020703F0:
-        messages = messages + 'The system requires at least Python 2.7.3 to run. Please update your Python interpreter.\n'
-    # Check the python install is complete. glib-2.0-natives requries
-    # xml.parsers.expat
-    try:
-        import xml.parsers.expat
-    except ImportError:
-        messages = messages + 'Your python is not a full install. Please install the module xml.parsers.expat (python-xml on openSUSE and SUSE Linux).\n'
-
-    # Check the bitbake version meets minimum requirements
-    minversion = sanity_data.getVar('BB_MIN_VERSION', True)
-    if (LooseVersion(bb.__version__) < LooseVersion(minversion)):
-        messages = messages + 'Bitbake version %s is required and version %s was found\n' % (minversion, bb.__version__)
-
-    # Check that the MACHINE is valid, if it is set
-    machinevalid = True
-    if sanity_data.getVar('MACHINE', True):
-        if not check_conf_exists("conf/machine/${MACHINE}.conf", sanity_data):
-            messages = messages + 'Please set a valid MACHINE in your local.conf or environment\n'
-            machinevalid = False
-        else:
-            messages = messages + check_sanity_validmachine(sanity_data)
-    else:
-        messages = messages + 'Please set a MACHINE in your local.conf or environment\n'
-        machinevalid = False
-
-    tarmsg = check_tar_version(sanity_data, LooseVersion)
-    if tarmsg:
-        messages = messages + tarmsg
-
-    gitmsg = check_git_version(sanity_data, LooseVersion)
-    if gitmsg:
-        messages = messages + gitmsg
-
-
+def sanity_check_conffiles(status, d):
     # Check we are using a valid local.conf
-    current_conf  = sanity_data.getVar('CONF_VERSION', True)
-    conf_version =  sanity_data.getVar('LOCALCONF_VERSION', True)
+    current_conf  = d.getVar('CONF_VERSION', True)
+    conf_version =  d.getVar('LOCALCONF_VERSION', True)
 
     if current_conf != conf_version:
-        messages = messages + "Your version of local.conf was generated from an older/newer version of local.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/local.conf ${COREBASE}/meta*/conf/local.conf.sample\" is a good way to visualise the changes.\n"
+        status.addresult("Your version of local.conf was generated from an older/newer version of local.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/local.conf ${COREBASE}/meta*/conf/local.conf.sample\" is a good way to visualise the changes.\n")
 
     # Check bblayers.conf is valid
-    current_lconf = sanity_data.getVar('LCONF_VERSION', True)
-    lconf_version = sanity_data.getVar('LAYER_CONF_VERSION', True)
+    current_lconf = d.getVar('LCONF_VERSION', True)
+    lconf_version = d.getVar('LAYER_CONF_VERSION', True)
     if current_lconf != lconf_version:
-        funcs = sanity_data.getVar('BBLAYERS_CONF_UPDATE_FUNCS', True).split()
+        funcs = d.getVar('BBLAYERS_CONF_UPDATE_FUNCS', True).split()
         for func in funcs:
             success = True
             try:
-                bb.build.exec_func(func, sanity_data)
+                bb.build.exec_func(func, d)
             except Exception:
                 success = False
             if success:
                 bb.note("Your conf/bblayers.conf has been automatically updated.")
-                reparse = True
+                status.reparse = True
                 break
-        if not reparse:
-            messages = messages + "Your version of bblayers.conf was generated from an older/newer version of bblayers.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/bblayers.conf ${COREBASE}/meta*/conf/bblayers.conf.sample\" is a good way to visualise the changes.\n"
+        if not status.reparse:
+            status.addresult("Your version of bblayers.conf was generated from an older/newer version of bblayers.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/bblayers.conf ${COREBASE}/meta*/conf/bblayers.conf.sample\" is a good way to visualise the changes.\n")
 
     # If we have a site.conf, check it's valid
-    if check_conf_exists("conf/site.conf", sanity_data):
-        current_sconf = sanity_data.getVar('SCONF_VERSION', True)
-        sconf_version = sanity_data.getVar('SITE_CONF_VERSION', True)
+    if check_conf_exists("conf/site.conf", d):
+        current_sconf = d.getVar('SCONF_VERSION', True)
+        sconf_version = d.getVar('SITE_CONF_VERSION', True)
         if current_sconf != sconf_version:
-            messages = messages + "Your version of site.conf was generated from an older version of site.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/site.conf ${COREBASE}/meta*/conf/site.conf.sample\" is a good way to visualise the changes.\n"
+            status.addresult("Your version of site.conf was generated from an older version of site.conf.sample and there have been updates made to this file. Please compare the two files and merge any changes before continuing.\nMatching the version numbers will remove this message.\n\"meld conf/site.conf ${COREBASE}/meta*/conf/site.conf.sample\" is a good way to visualise the changes.\n")
 
-    assume_provided = sanity_data.getVar('ASSUME_PROVIDED', True).split()
-    # Check user doesn't have ASSUME_PROVIDED = instead of += in local.conf
-    if "diffstat-native" not in assume_provided:
-        messages = messages + 'Please use ASSUME_PROVIDED +=, not ASSUME_PROVIDED = in your local.conf\n'
 
-    # Check that DL_DIR is set, exists and is writable. In theory, we should never even hit the check if DL_DIR isn't 
-    # set, since so much relies on it being set.
-    dldir = sanity_data.getVar('DL_DIR', True)
-    if not dldir:
-        messages = messages + "DL_DIR is not set. Your environment is misconfigured, check that DL_DIR is set, and if the directory exists, that it is writable. \n"
-    if os.path.exists(dldir) and not os.access(dldir, os.W_OK):
-        messages = messages + "DL_DIR: %s exists but you do not appear to have write access to it. \n" % dldir
-    
-    # Check that the DISTRO is valid, if set
-    # need to take into account DISTRO renaming DISTRO
-    distro = sanity_data.getVar('DISTRO', True)
-    if distro:
-        if not ( check_conf_exists("conf/distro/${DISTRO}.conf", sanity_data) or check_conf_exists("conf/distro/include/${DISTRO}.inc", sanity_data) ):
-            messages = messages + "DISTRO '%s' not found. Please set a valid DISTRO in your local.conf\n" % sanity_data.getVar("DISTRO", True )
+def sanity_handle_abichanges(status, d):
+    #
+    # Check the 'ABI' of TMPDIR
+    #
+    current_abi = d.getVar('OELAYOUT_ABI', True)
+    abifile = d.getVar('SANITY_ABIFILE', True)
+    if os.path.exists(abifile):
+        with open(abifile, "r") as f:
+            abi = f.read().strip()
+        if not abi.isdigit():
+            with open(abifile, "w") as f:
+                f.write(current_abi)
+        elif abi == "2" and current_abi == "3":
+            bb.note("Converting staging from layout version 2 to layout version 3")
+            subprocess.call(d.expand("mv ${TMPDIR}/staging ${TMPDIR}/sysroots"), shell=True)
+            subprocess.call(d.expand("ln -s sysroots ${TMPDIR}/staging"), shell=True)
+            subprocess.call(d.expand("cd ${TMPDIR}/stamps; for i in */*do_populate_staging; do new=`echo $i | sed -e 's/do_populate_staging/do_populate_sysroot/'`; mv $i $new; done"), shell=True)
+            with open(abifile, "w") as f:
+                f.write(current_abi)
+        elif abi == "3" and current_abi == "4":
+            bb.note("Converting staging layout from version 3 to layout version 4")
+            if os.path.exists(d.expand("${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}")):
+                subprocess.call(d.expand("mv ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS} ${STAGING_BINDIR_CROSS}"), shell=True)
+                subprocess.call(d.expand("ln -s ${STAGING_BINDIR_CROSS} ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}"), shell=True)
+            with open(abifile, "w") as f:
+                f.write(current_abi)
+        elif abi == "4":
+            status.addresult("Staging layout has changed. The cross directory has been deprecated and cross packages are now built under the native sysroot.\nThis requires a rebuild.\n")
+        elif abi == "5" and current_abi == "6":
+            bb.note("Converting staging layout from version 5 to layout version 6")
+            subprocess.call(d.expand("mv ${TMPDIR}/pstagelogs ${SSTATE_MANIFESTS}"), shell=True)
+            with open(abifile, "w") as f:
+                f.write(current_abi)
+        elif abi == "7" and current_abi == "8":
+            status.addresult("Your configuration is using stamp files including the sstate hash but your build directory was built with stamp files that do not include this.\nTo continue, either rebuild or switch back to the OEBasic signature handler with BB_SIGNATURE_HANDLER = 'OEBasic'.\n")
+        elif (abi != current_abi and current_abi == "9"):
+            status.addresult("The layout of the TMPDIR STAMPS directory has changed. Please clean out TMPDIR and rebuild (sstate will be still be valid and reused)\n")
+        elif (abi != current_abi):
+            # Code to convert from one ABI to another could go here if possible.
+            status.addresult("Error, TMPDIR has changed its layout version number (%s to %s) and you need to either rebuild, revert or adjust it at your own risk.\n" % (abi, current_abi))
+    else:
+        with open(abifile, "w") as f:
+            f.write(current_abi)
+
+def check_sanity_sstate_dir_change(sstate_dir, data):
+    # Sanity checks to be done when the value of SSTATE_DIR changes
+
+    # Check that SSTATE_DIR isn't on a filesystem with limited filename length (eg. eCryptFS)
+    testmsg = ""
+    if sstate_dir != "":
+        testmsg = check_create_long_filename(sstate_dir, "SSTATE_DIR")
+        # If we don't have permissions to SSTATE_DIR, suggest the user set it as an SSTATE_MIRRORS
+        try:
+            err = testmsg.split(': ')[1].strip()
+            if err == "Permission denied.":
+                testmsg = testmsg + "You could try using %s in SSTATE_MIRRORS rather than as an SSTATE_CACHE.\n" % (sstate_dir)
+        except IndexError:
+            pass
+    return testmsg
+       
+def check_sanity_version_change(status, d):
+    # Sanity checks to be done when SANITY_VERSION changes
+    # In other words, these tests run once in a given build directory and then 
+    # never again until the sanity version changes.
+
+    # Check the python install is complete. glib-2.0-natives requries
+    # xml.parsers.expat
+    try:
+        import xml.parsers.expat
+    except ImportError:
+        status.addresult('Your python is not a full install. Please install the module xml.parsers.expat (python-xml on openSUSE and SUSE Linux).\n')
+
+    status.addresult(check_tar_version(d))
+    status.addresult(check_git_version(d))
 
     missing = ""
 
-    if not check_app_exists("${MAKE}", sanity_data):
+    if not check_app_exists("${MAKE}", d):
         missing = missing + "GNU make,"
 
-    if not check_app_exists('${BUILD_PREFIX}gcc', sanity_data):
-        missing = missing + "C Compiler (%sgcc)," % sanity_data.getVar("BUILD_PREFIX", True)
+    if not check_app_exists('${BUILD_PREFIX}gcc', d):
+        missing = missing + "C Compiler (%sgcc)," % d.getVar("BUILD_PREFIX", True)
+
+    if not check_app_exists('${BUILD_PREFIX}g++', d):
+        missing = missing + "C++ Compiler (%sg++)," % d.getVar("BUILD_PREFIX", True)
+
+    required_utilities = d.getVar('SANITY_REQUIRED_UTILITIES', True)
+
+    for util in required_utilities.split():
+        if not check_app_exists(util, d):
+            missing = missing + "%s," % util
 
-    if not check_app_exists('${BUILD_PREFIX}g++', sanity_data):
-        missing = missing + "C++ Compiler (%sg++)," % sanity_data.getVar("BUILD_PREFIX", True)
+    if missing:
+        missing = missing.rstrip(',')
+        status.addresult("Please install the following missing utilities: %s\n" % missing)
 
-    required_utilities = sanity_data.getVar('SANITY_REQUIRED_UTILITIES', True)
+    assume_provided = d.getVar('ASSUME_PROVIDED', True).split()
+    # Check user doesn't have ASSUME_PROVIDED = instead of += in local.conf
+    if "diffstat-native" not in assume_provided:
+        status.addresult('Please use ASSUME_PROVIDED +=, not ASSUME_PROVIDED = in your local.conf\n')
 
     if "qemu-native" in assume_provided:
-        if not check_app_exists("qemu-arm", sanity_data):
-            messages = messages + "qemu-native was in ASSUME_PROVIDED but the QEMU binaries (qemu-arm) can't be found in PATH"
+        if not check_app_exists("qemu-arm", d):
+            status.addresult("qemu-native was in ASSUME_PROVIDED but the QEMU binaries (qemu-arm) can't be found in PATH")
 
-    if check_gcc_march(sanity_data):
-        messages = messages + "Your gcc version is older than 4.5, please add the following param to local.conf\n \
-        BUILD_CFLAGS_append = \" -march=native\"\n"
+    if check_gcc_march(d):
+        status.addresult("Your gcc version is older than 4.5, please add the following param to local.conf\n \
+        BUILD_CFLAGS_append = \" -march=native\"\n")
 
-    paths = sanity_data.getVar('PATH', True).split(":")
-    if "." in paths or "" in paths:
-        messages = messages + "PATH contains '.' or '' (empty element), which will break the build, please remove this.\n"
-        messages = messages + "Parsed PATH is " + str(paths) + "\n"
-
-    bbpaths = sanity_data.getVar('BBPATH', True).split(":")
-    if ("." in bbpaths or "" in bbpaths) and not reparse:
-        # TODO: change the following message to fatal when all BBPATH issues
-        # are fixed
-        bb.warn("BBPATH references the current directory, either through "    \
+    # Check that TMPDIR isn't on a filesystem with limited filename length (eg. eCryptFS)
+    tmpdir = d.getVar('TMPDIR', True)
+    status.addresult(check_create_long_filename(tmpdir, "TMPDIR"))
+
+    # Check that we can fetch from various network transports
+    netcheck = check_connectivity(d)
+    status.addresult(netcheck)
+    if netcheck:
+        status.network_error = True
+
+    nolibs = d.getVar('NO32LIBS', True)
+    if not nolibs:
+        lib32path = '/lib'
+        if os.path.exists('/lib64') and ( os.path.islink('/lib64') or os.path.islink('/lib') ):
+           lib32path = '/lib32'
+
+        if os.path.exists('%s/libc.so.6' % lib32path) and not os.path.exists('/usr/include/gnu/stubs-32.h'):
+            status.addresult("You have a 32-bit libc, but no 32-bit headers.  You must install the 32-bit libc headers.\n")
+
+    bbpaths = d.getVar('BBPATH', True).split(":")
+    if ("." in bbpaths or "" in bbpaths) and not status.reparse:
+        status.addresult("BBPATH references the current directory, either through "    \
                 "an empty entry, or a '.'.\n\t This is unsafe and means your "\
                 "layer configuration is adding empty elements to BBPATH.\n\t "\
                 "Please check your layer.conf files and other BBPATH "        \
                 "settings to remove the current working directory "           \
-                "references.");
-        bb.warn("Parsed BBPATH is" + str(bbpaths));
+                "references.\n" \
+                "Parsed BBPATH is" + str(bbpaths));
 
-    if sanity_data.getVar('TARGET_ARCH', True) == "arm":
+    oes_bb_conf = d.getVar( 'OES_BITBAKE_CONF', True)
+    if not oes_bb_conf:
+        status.addresult('You do not include the OpenEmbedded version of conf/bitbake.conf. This means your environment is misconfigured, in particular check BBPATH.\n')
+
+    # The length of tmpdir can't be longer than 410
+    status.addresult(check_path_length(tmpdir, "TMPDIR", 410))
+
+def check_sanity_everybuild(status, d):
+    # Sanity tests which test the users environment so need to run at each build (or are so cheap
+    # it makes sense to always run them.
+
+    if 0 == os.getuid():
+        raise_sanity_error("Do not use Bitbake as root.", d)
+
+    # Check the Python version, we now have a minimum of Python 2.7.3
+    import sys
+    if sys.hexversion < 0x020703F0:
+        status.addresult('The system requires at least Python 2.7.3 to run. Please update your Python interpreter.\n')
+
+    # Check the bitbake version meets minimum requirements
+    from distutils.version import LooseVersion
+    minversion = d.getVar('BB_MIN_VERSION', True)
+    if (LooseVersion(bb.__version__) < LooseVersion(minversion)):
+        status.addresult('Bitbake version %s is required and version %s was found\n' % (minversion, bb.__version__))
+
+    sanity_check_conffiles(status, d)
+
+    paths = d.getVar('PATH', True).split(":")
+    if "." in paths or "" in paths:
+        status.addresult("PATH contains '.' or '' (empty element), which will break the build, please remove this.\nParsed PATH is " + str(paths) + "\n")
+
+    # Check that the DISTRO is valid, if set
+    # need to take into account DISTRO renaming DISTRO
+    distro = d.getVar('DISTRO', True)
+    if distro:
+        if not ( check_conf_exists("conf/distro/${DISTRO}.conf", d) or check_conf_exists("conf/distro/include/${DISTRO}.inc", d) ):
+            status.addresult("DISTRO '%s' not found. Please set a valid DISTRO in your local.conf\n" % d.getVar("DISTRO", True))
+
+    # Check that DL_DIR is set, exists and is writable. In theory, we should never even hit the check if DL_DIR isn't 
+    # set, since so much relies on it being set.
+    dldir = d.getVar('DL_DIR', True)
+    if not dldir:
+        status.addresult("DL_DIR is not set. Your environment is misconfigured, check that DL_DIR is set, and if the directory exists, that it is writable. \n")
+    if os.path.exists(dldir) and not os.access(dldir, os.W_OK):
+        status.addresult("DL_DIR: %s exists but you do not appear to have write access to it. \n" % dldir)
+
+    # Check that the MACHINE is valid, if it is set
+    machinevalid = True
+    if d.getVar('MACHINE', True):
+        if not check_conf_exists("conf/machine/${MACHINE}.conf", d):
+            status.addresult('Please set a valid MACHINE in your local.conf or environment\n')
+            machinevalid = False
+        else:
+            status.addresult(check_sanity_validmachine(d))
+    else:
+        status.addresult('Please set a MACHINE in your local.conf or environment\n')
+        machinevalid = False
+    if machinevalid:
+        status.addresult(check_toolchain(d))
+
+    check_supported_distro(d)
+
+    # Check if DISPLAY is set if IMAGETEST is set
+    if d.getVar( 'IMAGETEST', True ) == 'qemu':
+        display = d.getVar("BB_ORIGENV", False).getVar("DISPLAY", True)
+        if not display:
+            status.addresult('qemuimagetest needs a X desktop to start qemu, please set DISPLAY correctly (e.g. DISPLAY=:1.0)\n')
+
+    omask = os.umask(022)
+    if omask & 0755:
+        status.addresult("Please use a umask which allows a+rx and u+rwx\n")
+    os.umask(omask)
+
+    if d.getVar('TARGET_ARCH', True) == "arm":
         # This path is no longer user-readable in modern (very recent) Linux
         try:
             if os.path.exists("/proc/sys/vm/mmap_min_addr"):
                 f = open("/proc/sys/vm/mmap_min_addr", "r")
                 try:
                     if (int(f.read().strip()) > 65536):
-                        messages = messages + "/proc/sys/vm/mmap_min_addr is not <= 65536. This will cause problems with qemu so please fix the value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr = 65536 in /etc/sysctl.conf.\n"
+                        status.addresult("/proc/sys/vm/mmap_min_addr is not <= 65536. This will cause problems with qemu so please fix the value (as root).\n\nTo fix this in later reboots, set vm.mmap_min_addr = 65536 in /etc/sysctl.conf.\n")
                 finally:
                     f.close()
         except:
             pass
 
-    for util in required_utilities.split():
-        if not check_app_exists( util, sanity_data ):
-            missing = missing + "%s," % util
-
-    if missing != "":
-        missing = missing.rstrip(',')
-        messages = messages + "Please install the following missing utilities: %s\n" % missing
-
-    check_supported_distro(sanity_data)
-    if machinevalid:
-        toolchain_msg = check_toolchain(sanity_data)
-        if toolchain_msg != "":
-            messages = messages + toolchain_msg + '\n'
+    oeroot = d.getVar('COREBASE')
+    if oeroot.find ('+') != -1:
+        status.addresult("Error, you have an invalid character (+) in your COREBASE directory path. Please move the installation to a directory which doesn't include a +.")
+    elif oeroot.find (' ') != -1:
+        status.addresult("Error, you have a space in your COREBASE directory path. Please move the installation to a directory which doesn't include a space.")
 
-    # Check if DISPLAY is set if IMAGETEST is set
-    if sanity_data.getVar( 'IMAGETEST', True ) == 'qemu':
-        display = sanity_data.getVar("BB_ORIGENV", False).getVar("DISPLAY", True)
-        if not display:
-            messages = messages + 'qemuimagetest needs a X desktop to start qemu, please set DISPLAY correctly (e.g. DISPLAY=:1.0)\n'
+    # Check that TMPDIR hasn't changed location since the last time we were run
+    tmpdir = d.getVar('TMPDIR', True)
+    checkfile = os.path.join(tmpdir, "saved_tmpdir")
+    if os.path.exists(checkfile):
+        with open(checkfile, "r") as f:
+            saved_tmpdir = f.read().strip()
+            if (saved_tmpdir != tmpdir):
+                status.addresult("Error, TMPDIR has changed location. You need to either move it back to %s or rebuild\n" % saved_tmpdir)
+    else:
+        bb.utils.mkdirhier(tmpdir)
+        with open(checkfile, "w") as f:
+            f.write(tmpdir)
 
-    omask = os.umask(022)
-    if omask & 0755:
-        messages = messages + "Please use a umask which allows a+rx and u+rwx\n"
-    os.umask(omask)
+def check_sanity(sanity_data):
+    import subprocess
 
-    oes_bb_conf = sanity_data.getVar( 'OES_BITBAKE_CONF', True)
-    if not oes_bb_conf:
-        messages = messages + 'You do not include the OpenEmbedded version of conf/bitbake.conf. This means your environment is misconfigured, in particular check BBPATH.\n'
+    class SanityStatus(object):
+        def __init__(self):
+            self.messages = ""
+            self.network_error = False
+            self.reparse = False
 
-    nolibs = sanity_data.getVar('NO32LIBS', True)
-    if not nolibs:
-        lib32path = '/lib'
-        if os.path.exists('/lib64') and ( os.path.islink('/lib64') or os.path.islink('/lib') ):
-           lib32path = '/lib32'
+        def addresult(self, message):
+            if message:
+                self.messages = self.message + message
 
-        if os.path.exists('%s/libc.so.6' % lib32path) and not os.path.exists('/usr/include/gnu/stubs-32.h'):
-            messages = messages + "You have a 32-bit libc, but no 32-bit headers.  You must install the 32-bit libc headers.\n"
+    status = SanityStatus()
 
     tmpdir = sanity_data.getVar('TMPDIR', True)
     sstate_dir = sanity_data.getVar('SSTATE_DIR', True)
 
-    # The length of tmpdir can't be longer than 410
-    messages = messages + check_path_length(tmpdir, "TMPDIR", 410)
-
     # Check saved sanity info
     last_sanity_version = 0
     last_tmpdir = ""
@@ -572,92 +639,28 @@ def check_sanity(sanity_data):
                     last_tmpdir = line.split()[1]
                 if line.startswith('SSTATE_DIR'):
                     last_sstate_dir = line.split()[1]
+
+    check_sanity_everybuild(status, sanity_data)
     
     sanity_version = int(sanity_data.getVar('SANITY_VERSION', True) or 1)
     network_error = False
     if last_sanity_version < sanity_version: 
-        messages = messages + check_sanity_version_change(sanity_data)
-        err, network_error = check_sanity_tmpdir_change(tmpdir, sanity_data)
-        messages = messages + err
-        messages = messages + check_sanity_sstate_dir_change(sstate_dir, sanity_data)
+        check_sanity_version_change(status, sanity_data)
+        status.addresult(check_sanity_sstate_dir_change(sstate_dir, sanity_data))
     else: 
-        if last_tmpdir != tmpdir:
-            err, network_error = check_sanity_tmpdir_change(tmpdir, sanity_data)
-            messages = messages + err
         if last_sstate_dir != sstate_dir:
-            messages = messages + check_sanity_sstate_dir_change(sstate_dir, sanity_data)
-    if os.path.exists("conf") and not messages:
+            status.addresult(check_sanity_sstate_dir_change(sstate_dir, sanity_data))
+    if os.path.exists("conf") and not status.messages:
         with open(sanityverfile, 'w') as f:
             f.write("SANITY_VERSION %s\n" % sanity_version) 
             f.write("TMPDIR %s\n" % tmpdir) 
             f.write("SSTATE_DIR %s\n" % sstate_dir) 
 
-    #
-    # Check that TMPDIR hasn't changed location since the last time we were run
-    #
-    checkfile = os.path.join(tmpdir, "saved_tmpdir")
-    if os.path.exists(checkfile):
-        with open(checkfile, "r") as f:
-            saved_tmpdir = f.read().strip()
-            if (saved_tmpdir != tmpdir):
-                messages = messages + "Error, TMPDIR has changed location. You need to either move it back to %s or rebuild\n" % saved_tmpdir
-    else:
-        bb.utils.mkdirhier(tmpdir)
-        with open(checkfile, "w") as f:
-            f.write(tmpdir)
-
-    #
-    # Check the 'ABI' of TMPDIR
-    #
-    current_abi = sanity_data.getVar('OELAYOUT_ABI', True)
-    abifile = sanity_data.getVar('SANITY_ABIFILE', True)
-    if os.path.exists(abifile):
-        with open(abifile, "r") as f:
-            abi = f.read().strip()
-        if not abi.isdigit():
-            with open(abifile, "w") as f:
-                f.write(current_abi)
-        elif abi == "2" and current_abi == "3":
-            bb.note("Converting staging from layout version 2 to layout version 3")
-            subprocess.call(sanity_data.expand("mv ${TMPDIR}/staging ${TMPDIR}/sysroots"), shell=True)
-            subprocess.call(sanity_data.expand("ln -s sysroots ${TMPDIR}/staging"), shell=True)
-            subprocess.call(sanity_data.expand("cd ${TMPDIR}/stamps; for i in */*do_populate_staging; do new=`echo $i | sed -e 's/do_populate_staging/do_populate_sysroot/'`; mv $i $new; done"), shell=True)
-            with open(abifile, "w") as f:
-                f.write(current_abi)
-        elif abi == "3" and current_abi == "4":
-            bb.note("Converting staging layout from version 3 to layout version 4")
-            if os.path.exists(sanity_data.expand("${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}")):
-                subprocess.call(sanity_data.expand("mv ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS} ${STAGING_BINDIR_CROSS}"), shell=True)
-                subprocess.call(sanity_data.expand("ln -s ${STAGING_BINDIR_CROSS} ${STAGING_DIR_NATIVE}${bindir_native}/${MULTIMACH_HOST_SYS}"), shell=True)
-            with open(abifile, "w") as f:
-                f.write(current_abi)
-        elif abi == "4":
-            messages = messages + "Staging layout has changed. The cross directory has been deprecated and cross packages are now built under the native sysroot.\nThis requires a rebuild.\n"
-        elif abi == "5" and current_abi == "6":
-            bb.note("Converting staging layout from version 5 to layout version 6")
-            subprocess.call(sanity_data.expand("mv ${TMPDIR}/pstagelogs ${SSTATE_MANIFESTS}"), shell=True)
-            with open(abifile, "w") as f:
-                f.write(current_abi)
-        elif abi == "7" and current_abi == "8":
-            messages = messages + "Your configuration is using stamp files including the sstate hash but your build directory was built with stamp files that do not include this.\nTo continue, either rebuild or switch back to the OEBasic signature handler with BB_SIGNATURE_HANDLER = 'OEBasic'.\n"
-        elif (abi != current_abi and current_abi == "9"):
-            messages = messages + "The layout of the TMPDIR STAMPS directory has changed. Please clean out TMPDIR and rebuild (sstate will be still be valid and reused)\n"
-        elif (abi != current_abi):
-            # Code to convert from one ABI to another could go here if possible.
-            messages = messages + "Error, TMPDIR has changed its layout version number (%s to %s) and you need to either rebuild, revert or adjust it at your own risk.\n" % (abi, current_abi)
-    else:
-        with open(abifile, "w") as f:
-            f.write(current_abi)
-
-    oeroot = sanity_data.getVar('COREBASE')
-    if oeroot.find ('+') != -1:
-        messages = messages + "Error, you have an invalid character (+) in your COREBASE directory path. Please move the installation to a directory which doesn't include a +."
-    elif oeroot.find (' ') != -1:
-        messages = messages + "Error, you have a space in your COREBASE directory path. Please move the installation to a directory which doesn't include a space."
+    sanity_handle_abichanges(status, sanity_data)
 
-    if messages != "":
-        raise_sanity_error(sanity_data.expand(messages), sanity_data, network_error)
-    return reparse
+    if status.messages != "":
+        raise_sanity_error(sanity_data.expand(status.messages), sanity_data, status.network_error)
+    return status.reparse
 
 # Create a copy of the datastore and finalise it to ensure appends and 
 # overrides are set - the datastore has yet to be finalised at ConfigParsed



