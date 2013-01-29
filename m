Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U0D6Q-0008NB-Fa
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 16:28:05 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 Jan 2013 07:12:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,561,1355126400"; d="scan'208";a="196280527"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Jan 2013 07:11:46 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2013 17:12:36 +0200
Message-Id: <daeb226578cae79f94a3a39fb6622613990bdf79.1359470548.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1359470548.git.constantinx.musca@intel.com>
References: <cover.1359470548.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1359470548.git.constantinx.musca@intel.com>
References: <cover.1359470548.git.constantinx.musca@intel.com>
Subject: [PATCH v4 3/3] gcc: enable multilib for target gcc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 15:28:07 -0000

- add a task to setup multilib configuration for target gcc
- this commit adapts Nitin Kamble's work to gcc 4.7
- use a hash for storing arch-dependent multilib options
- patch gcc in order to use the multilib config files from the
build directory

Tests:
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

[YOCTO #1369]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc              |   3 +-
 .../gcc/gcc-4.7/use-ml-conf-files-from-B.patch     |  87 ++++++++++
 meta/recipes-devtools/gcc/gcc-common.inc           |  24 +++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   3 +-
 meta/recipes-devtools/gcc/gcc-configure-target.inc |   1 +
 meta/recipes-devtools/gcc/gcc-multilib-config.inc  | 190 +++++++++++++++++++++
 meta/recipes-devtools/gcc/libgcc_4.7.bb            |  73 ++++++++
 7 files changed, 379 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/use-ml-conf-files-from-B.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-multilib-config.inc

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 2548f84..d4caf61 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r14"
+PR = "r15"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
@@ -74,6 +74,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://ppc_no_crtsavres.patch \
 	   file://0001-crtstuff.c-USE_PT_GNU_EH_FRAME-Define-for-systems-us.patch \
 	   file://0001-Makefile.in-vis_hide-gen-hide-list-Do-not-make-defin.patch \
+	   file://use-ml-conf-files-from-B.patch \
 	  "
 SRC_URI[md5sum] = "cc308a0891e778cfda7a151ab8a6e762"
 SRC_URI[sha256sum] = "8a9283d7010fb9fe5ece3ca507e0af5c19412626384f8a5e9434251ae100b084"
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/use-ml-conf-files-from-B.patch b/meta/recipes-devtools/gcc/gcc-4.7/use-ml-conf-files-from-B.patch
new file mode 100644
index 0000000..4d22924
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.7/use-ml-conf-files-from-B.patch
@@ -0,0 +1,87 @@
+Use the multilib config files from ${B} instead of using the ones from ${S}
+so that the source can be shared between gcc-cross-initial,
+gcc-cross-intermediate, gcc-cross, gcc-runtime, and also the sdk build.
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
+
+Index: gcc-4.7.2/gcc/configure
+===================================================================
+--- gcc-4.7.2.orig/gcc/configure
++++ gcc-4.7.2/gcc/configure
+@@ -11717,10 +11717,20 @@ done
+ tmake_file_=
+ for f in ${tmake_file}
+ do
+-	if test -f ${srcdir}/config/$f
+-	then
+-		tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
+-	fi
++  case $f in
++    */t-linux64 )
++       if test -f ./config/$f
++       then
++         tmake_file_="${tmake_file_} ./config/$f"
++       fi
++       ;;
++    * )
++       if test -f ${srcdir}/config/$f
++       then
++         tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
++       fi
++       ;;
++  esac
+ done
+ tmake_file="${tmake_file_}"
+ 
+@@ -11731,6 +11741,10 @@ tm_file_list="options.h"
+ tm_include_list="options.h insn-constants.h"
+ for f in $tm_file; do
+   case $f in
++    */linux64.h )
++       tm_file_list="${tm_file_list} ./config/$f"
++       tm_include_list="${tm_include_list} ./config/$f"
++       ;;
+     ./* )
+        f=`echo $f | sed 's/^..//'`
+        tm_file_list="${tm_file_list} $f"
+Index: gcc-4.7.2/gcc/configure.ac
+===================================================================
+--- gcc-4.7.2.orig/gcc/configure.ac
++++ gcc-4.7.2/gcc/configure.ac
+@@ -1701,10 +1701,20 @@ done
+ tmake_file_=
+ for f in ${tmake_file}
+ do
+-	if test -f ${srcdir}/config/$f
+-	then
+-		tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
+-	fi
++  case $f in
++    */t-linux64 )
++       if test -f ./config/$f
++       then
++         tmake_file_="${tmake_file_} ./config/$f"
++       fi
++       ;;
++    * )
++       if test -f ${srcdir}/config/$f
++       then
++         tmake_file_="${tmake_file_} \$(srcdir)/config/$f"
++       fi
++       ;;
++  esac
+ done
+ tmake_file="${tmake_file_}"
+ 
+@@ -1715,6 +1725,10 @@ tm_file_list="options.h"
+ tm_include_list="options.h insn-constants.h"
+ for f in $tm_file; do
+   case $f in
++    */linux64.h )
++       tm_file_list="${tm_file_list} ./config/$f"
++       tm_include_list="${tm_include_list} ./config/$f"
++       ;;
+     ./* )
+        f=`echo $f | sed 's/^..//'`
+        tm_file_list="${tm_file_list} $f"
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 6e64441..ad96989 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -34,6 +34,30 @@ def get_gcc_multiarch_setting(bb, d):
             return multiarch_options[target_arch]
     return ""
 
+# this is used by the multilib setup of gcc
+def get_tune_parameters(tune, d):
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
+    # BASELIB is used by the multilib code to change library paths
+    retdict['baselib'] = localdata.getVar('BASE_LIB', True) or localdata.getVar('BASELIB', True)
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
index 4eb59fd..b87ea62 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -1,3 +1,4 @@
+require gcc-multilib-config.inc
 #
 # Build the list of lanaguages to build.
 #
@@ -25,7 +26,7 @@ EXTRA_OECONF_PATHS ?= ""
 EXTRA_OECONF_INITIAL ?= ""
 EXTRA_OECONF_INTERMEDIATE ?= ""
 
-GCCMULTILIB = "--disable-multilib"
+GCCMULTILIB ?= "--disable-multilib"
 GCCTHREADS ?= "posix"
 
 EXTRA_OECONF = "${@['--enable-clocale=generic', ''][d.getVar('USE_NLS', True) != 'no']} \
diff --git a/meta/recipes-devtools/gcc/gcc-configure-target.inc b/meta/recipes-devtools/gcc/gcc-configure-target.inc
index f41301f..6cc374b 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-target.inc
@@ -1,3 +1,4 @@
+GCCMULTILIB = "--enable-multilib"
 require gcc-configure-common.inc
 
 EXTRA_OECONF_PATHS = " \
diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
new file mode 100644
index 0000000..9403aab
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -0,0 +1,190 @@
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
+#    gcc/config/mips/t-linux64
+#    gcc/config/rs6000/t-linux64
+#    gcc/config/i386/linux64.h
+#    gcc/config/mips/linux64.h
+#    gcc/config/rs6000/linux64.h
+
+python gcc_multilib_setup() {
+    import re
+    import shutil
+    import glob
+
+    srcdir = d.getVar('S', True)
+    builddir = d.getVar('B', True)
+    src_conf_dir = '%s/gcc/config' % srcdir
+    build_conf_dir = '%s/gcc/config' % builddir
+
+    bb.utils.remove(build_conf_dir, True)
+    ml_globs = ('%s/*/t-linux64' % src_conf_dir,
+                '%s/*/linux64.h' % src_conf_dir)
+
+    # copy the target multilib config files to ${B}
+    for ml_glob in ml_globs:
+        for fn in glob.glob(ml_glob):
+            rel_path = os.path.relpath(fn, src_conf_dir)
+            parent_dir = os.path.dirname(rel_path)
+            bb.utils.mkdirhier('%s/%s' % (build_conf_dir, parent_dir))
+            bb.copyfile(fn, '%s/%s' % (build_conf_dir, rel_path))
+
+    multilibs = (d.getVar('MULTILIB_VARIANTS', True) or '').split()
+    if not multilibs:
+        return
+
+    mlprefix = d.getVar('MLPREFIX', True)
+    if ('%sgcc' % mlprefix) != d.getVar('PN', True):
+        return
+
+
+    def write_config(root, files, options, dirnames, osdirnames):
+        for ml_conf_file in files:
+            with open(root + '/' + ml_conf_file, 'r') as f:
+                filelines = f.readlines()
+                # recreate multilib configuration variables
+                substs = [
+                    (r'^(\s*(MULTILIB_OPTIONS\s*=).*)$', r'\2 %s' % '/'.join(options)),
+                    (r'^(\s*MULTILIB_OPTIONS\s*\+=.*)$', ''),
+                    (r'^(\s*(MULTILIB_DIRNAMES\s*=).*)$', r'\2 %s' % ' '.join(dirnames)),
+                    (r'^(\s*MULTILIB_DIRNAMES\s*\+=.*)$', ''),
+                    (r'^(\s*(MULTILIB_OSDIRNAMES\s*=).*)$', r'\2 %s' % ' '.join(osdirnames)),
+                    (r'^(\s*MULTILIB_OSDIRNAMES\s*\+=.*)$', ''),
+                ]
+
+                for (i, line) in enumerate(filelines):
+                    for subst in substs:
+                        line = re.sub(subst[0], subst[1], line)
+                    filelines[i] = line
+
+                with open(root + '/' + ml_conf_file, 'w') as f:
+                    f.write(''.join(filelines))
+
+    def write_headers(root, files, libdir32, libdir64, libdirx32, libdirn32):
+        def wrap_libdir(libdir):
+            if libdir.find('SYSTEMLIBS_DIR') != -1:
+                return libdir
+            else:
+                return '"/%s/"' % libdir
+
+        for ml_conf_file in files:
+            with open(root + '/' + ml_conf_file, 'r') as f:
+                filelines = f.readlines()
+
+                # replace lines like
+                # #define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
+                # by
+                # #define GLIBC_DYNAMIC_LINKER32 "/lib/" "ld-linux.so.2"
+                # this is needed to put the correct dynamic loader path in the generated binaries
+                substs = [
+                    (r'^(#define\s*GLIBC_DYNAMIC_LINKER32\s*)(\S+)(\s*\".*\")$',
+                        r'\1' + wrap_libdir(libdir32) + r'\3'),
+                    (r'^(#define\s*GLIBC_DYNAMIC_LINKER64\s*)(\S+)(\s*\".*\")$',
+                        r'\1' + wrap_libdir(libdir64) + r'\3'),
+                    (r'^(#define\s*GLIBC_DYNAMIC_LINKERX32\s*)(\S+)(\s*\".*\")$',
+                        r'\1' + wrap_libdir(libdirx32) + r'\3'),
+                    (r'^(#define\s*GLIBC_DYNAMIC_LINKERN32\s*)(\S+)(\s*\".*\")$',
+                        r'\1' + wrap_libdir(libdirn32) + r'\3'),
+                ]
+
+                for (i, line) in enumerate(filelines):
+                    for subst in substs:
+                        line = re.sub(subst[0], subst[1], line)
+                    filelines[i] = line
+
+                with open(root + '/' + ml_conf_file, 'w') as f:
+                    f.write(''.join(filelines))
+
+
+    gcc_target_config_files = {
+        'x86_64'    : ['gcc/config/i386/t-linux64'],
+        'i586'      : ['gcc/config/i386/t-linux64'],
+        'mips'      : ['gcc/config/mips/t-linux64'],
+        'powerpc'   : ['gcc/config/rs6000/t-linux64'],
+    }
+
+    gcc_header_config_files = {
+        'x86_64'    : ['gcc/config/i386/linux64.h'],
+        'i586'      : ['gcc/config/i386/linux64.h'],
+        'mips'      : ['gcc/config/mips/linux64.h'],
+        'powerpc'   : ['gcc/config/rs6000/linux64.h'],
+    }
+
+    target_arch = (d.getVar('TARGET_ARCH_MULTILIB_ORIGINAL', True) if mlprefix
+                    else d.getVar('TARGET_ARCH', True))
+    if target_arch not in gcc_target_config_files:
+        bb.warn('gcc multilib setup is not supported for TARGET_ARCH=' + target_arch)
+        return
+
+    libdir32 = 'SYSTEMLIBS_DIR'
+    libdir64 = 'SYSTEMLIBS_DIR'
+    libdirx32 = 'SYSTEMLIBS_DIR'
+    libdirn32 = 'SYSTEMLIBS_DIR'
+
+    target_config_files = gcc_target_config_files[target_arch]
+    header_config_files = gcc_header_config_files[target_arch]
+
+    ml_list = ['DEFAULTTUNE_MULTILIB_ORIGINAL' if mlprefix else 'DEFAULTTUNE']
+    mltunes = [('DEFAULTTUNE_virtclass-multilib-%s' % ml) for ml in multilibs]
+    if mlprefix:
+        mlindex = 0
+        for ml in multilibs:
+            if mlprefix.startswith(ml):
+                break
+            mlindex += 1
+
+        ml_list.extend(mltunes[:mlindex] + ['DEFAULTTUNE'] + mltunes[(mlindex + 1):])
+    else:
+        ml_list.extend(mltunes)
+
+    options = []
+    dirnames = []
+    osdirnames = []
+
+    for ml in ml_list:
+        tune = d.getVar(ml, True)
+        if not tune:
+            bb.warn("%s doesn't have a corresponding tune. Skipping..." % ml)
+            continue
+        tune_parameters = get_tune_parameters(tune, d)
+
+        tune_baselib = tune_parameters['baselib']
+        if not tune_baselib:
+            bb.warn("Tune %s doesn't have a baselib set. Skipping..." % tune)
+            continue
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
+        # take out '-' and march='s from parameters
+        options.append(re.sub(r'march=[^ ]+ *', '',
+                            re.sub(r' +\-+', ' ',
+                                re.sub(r'^ *\-+', '', tune_parameters['ccargs']))))
+        if tune_baselib == 'lib':
+            dirnames.append('32')  # /lib => 32bit lib
+        else:
+            dirnames.append(tune_baselib.replace('lib', ''))
+        osdirnames.append('../' + tune_baselib)
+
+    write_config(builddir, target_config_files, options, dirnames, osdirnames)
+    write_headers(builddir, header_config_files, libdir32, libdir64, libdirx32, libdirn32)
+}
+
+gcc_multilib_setup[cleandirs] = "${B}/gcc/config"
+
+EXTRACONFFUNCS += "gcc_multilib_setup"
diff --git a/meta/recipes-devtools/gcc/libgcc_4.7.bb b/meta/recipes-devtools/gcc/libgcc_4.7.bb
index c12aeef..550a3c9 100644
--- a/meta/recipes-devtools/gcc/libgcc_4.7.bb
+++ b/meta/recipes-devtools/gcc/libgcc_4.7.bb
@@ -15,6 +15,10 @@ FILES_${PN} = "${base_libdir}/libgcc*.so.*"
 FILES_${PN}-dev = " \
   ${base_libdir}/libgcc*.so \
   ${libdir}/${TARGET_SYS}/${BINV}/*crt* \
+  ${libdir}/${TARGET_SYS}/${BINV}/64 \
+  ${libdir}/${TARGET_SYS}/${BINV}/32 \
+  ${libdir}/${TARGET_SYS}/${BINV}/x32 \
+  ${libdir}/${TARGET_SYS}/${BINV}/n32 \
   ${libdir}/${TARGET_SYS}/${BINV}/libgcc*"
 FILES_libgcov-dev = " \
   ${libdir}/${TARGET_SYS}/${BINV}/libgcov.a \
@@ -70,3 +74,72 @@ BBCLASSEXTEND = "nativesdk"
 
 INSANE_SKIP_${PN}-dev = "staticdev"
 INSANE_SKIP_${MLPREFIX}libgcov-dev = "staticdev"
+
+addtask multilib_install after do_install before do_package do_populate_sysroot
+# this makes multilib gcc files findable for target gcc
+# e.g.
+#    /usr/lib/i586-pokymllib32-linux/4.7/
+# by creating this symlink to it
+#    /usr/lib64/x86_64-poky-linux/4.7/32
+
+python do_multilib_install() {
+    import re
+
+    multilibs = d.getVar('MULTILIB_VARIANTS', True)
+    if not multilibs:
+        return
+
+    binv = d.getVar('BINV', True)
+
+    mlprefix = d.getVar('MLPREFIX', True)
+    if ('%slibgcc' % mlprefix) != d.getVar('PN', True):
+        return
+
+    if mlprefix:
+        orig_tune = d.getVar('DEFAULTTUNE_MULTILIB_ORIGINAL', True)
+        orig_tune_params = get_tune_parameters(orig_tune, d)
+        orig_tune_baselib = orig_tune_params['baselib']
+        orig_tune_bitness = orig_tune_baselib.replace('lib', '')
+        if not orig_tune_bitness:
+            orig_tune_bitness = '32'
+
+        src = '../../../' + orig_tune_baselib + '/' + \
+            d.getVar('TARGET_SYS_MULTILIB_ORIGINAL', True) + '/' + binv + '/'
+
+        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + \
+            d.getVar('TARGET_SYS', True) + '/' + binv + '/' + orig_tune_bitness
+
+        if os.path.lexists(dest):
+            os.unlink(dest)
+        os.symlink(src, dest)
+        return
+
+
+    for ml in multilibs.split():
+        tune = d.getVar('DEFAULTTUNE_virtclass-multilib-' + ml, True)
+        if not tune:
+            bb.warn('DEFAULTTUNE_virtclass-multilib-%s is not defined. Skipping...' % ml)
+            continue
+
+        tune_parameters = get_tune_parameters(tune, d)
+        tune_baselib = tune_parameters['baselib']
+        if not tune_baselib:
+            bb.warn("Tune %s doesn't have a baselib set. Skipping..." % tune)
+            continue
+
+        tune_arch = tune_parameters['arch']
+        tune_bitness = tune_baselib.replace('lib', '')
+        if not tune_bitness:
+            tune_bitness = '32' # /lib => 32bit lib
+
+        src = '../../../' + tune_baselib + '/' + \
+            tune_arch + d.getVar('TARGET_VENDOR', True) + 'ml' + ml + \
+            '-' + d.getVar('TARGET_OS', True) + '/' + binv + '/'
+
+        dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + \
+            d.getVar('TARGET_SYS', True) + '/' + binv + '/' + tune_bitness
+
+        if os.path.lexists(dest):
+            os.unlink(dest)
+        os.symlink(src, dest)
+}
-- 
1.7.11.7



