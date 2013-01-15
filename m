Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tv8MV-0007Ow-UB
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 16:23:48 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Jan 2013 07:08:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,473,1355126400"; d="scan'208";a="277141013"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by fmsmga002.fm.intel.com with ESMTP; 15 Jan 2013 07:08:14 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 17:08:46 +0200
Message-Id: <069a3388def2c8e8cef63cfa1b048d12df838f22.1358262293.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1358262293.git.constantinx.musca@intel.com>
References: <cover.1358262293.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1358262293.git.constantinx.musca@intel.com>
References: <cover.1358262293.git.constantinx.musca@intel.com>
Subject: [PATCH v3 4/6] gcc: enable multilib for target gcc
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
X-List-Received-Date: Tue, 15 Jan 2013 15:23:50 -0000

- add a task to setup multilib configuration for target gcc
- this commit adapts Nitin Kamble's work to gcc 4.7
- gcc_multilib_setup creates the same patch for all gcc variants
- use a hash for storing the multilib default options
- use a hash for storing arch-dependent multilib options

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
 meta/recipes-devtools/gcc/gcc-4.7.inc              |   2 +-
 meta/recipes-devtools/gcc/gcc-common.inc           |  25 +++
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   3 +-
 meta/recipes-devtools/gcc/gcc-configure-target.inc |   1 +
 meta/recipes-devtools/gcc/gcc-multilib-config.inc  | 198 +++++++++++++++++++++
 meta/recipes-devtools/gcc/libgcc_4.7.bb            |  44 +++++
 6 files changed, 271 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-multilib-config.inc

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 2fad764..13a1e7e 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r14"
+PR = "r15"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 6e64441..8c8168f 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -34,6 +34,29 @@ def get_gcc_multiarch_setting(bb, d):
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
@@ -62,10 +85,12 @@ SS = "${TMPDIR}/stamps/work-shared/gcc-${PV}-${PR}"
 do_fetch[stamp-base] = "${SS}"
 do_unpack[stamp-base] = "${SS}"
 do_patch[stamp-base] = "${SS}"
+do_gcc_multilib_setup[stamp-base] = "${SS}"
 SSCLEAN = "${TMPDIR}/stamps/work-shared/gcc-[0-9]*-*"
 do_fetch[stamp-base-clean] = "${SSCLEAN}"
 do_unpack[stamp-base-clean] = "${SSCLEAN}"
 do_patch[stamp-base-clean] = "${SSCLEAN}"
+do_gcc_multilib_setup[stamp-base-clean] = "${SSCLEAN}"
 
 # SW means Shared Work directory
 SW = "${TMPDIR}/work-shared/gcc-${PV}-${PR}"
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
index 0000000..b9d09ad
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -0,0 +1,198 @@
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
+#    gcc/config/mips/t-linux64
+#    gcc/config/rs6000/t-linux64
+#    gcc/config/i386/linux64.h
+#    gcc/config/mips/linux64.h
+#    gcc/config/rs6000/linux64.h
+
+python do_gcc_multilib_setup() {
+    import re
+
+    srcdir = d.getVar('S', True)
+
+    def write_config(files, options, dirnames, osdirnames):
+        for ml_conf_file in files:
+            with open(srcdir + '/' + ml_conf_file, 'r') as f:
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
+                with open(srcdir + '/' + ml_conf_file, 'w') as f:
+                    f.write(''.join(filelines))
+
+    def write_headers(files, libdir32, libdir64, libdirx32, libdirn32):
+        def wrap_libdir(libdir):
+            if libdir.find('SYSTEMLIBS_DIR') != -1:
+                return libdir
+            else:
+                return '"/%s/"' % libdir
+
+        for ml_conf_file in files:
+            with open(srcdir + '/' + ml_conf_file, 'r') as f:
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
+                with open(srcdir + '/' + ml_conf_file, 'w') as f:
+                    f.write(''.join(filelines))
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
+    default_ml_config = {
+        'gcc/config/i386/t-linux64' : {
+            'options'      : ['$(subst $(comma),/,$(TM_MULTILIB_CONFIG))'],
+            'dirnames'     : ['.'] * 2,
+            'osdirnames'   : ['../$(shell basename $(base_libdir))'] * 2,
+        },
+        'gcc/config/mips/t-linux64' : {
+            'options'      : ['mabi=n32', 'mabi=32', 'mabi=64'],
+            'dirnames'     : ['.'] * 3,
+            'osdirnames'   : ['../$(shell basename $(base_libdir))'] * 3,
+        },
+        'gcc/config/rs6000/t-linux64' : {
+            'options'      : ['m64/m32 msoft-float'],
+            'dirnames'     : ['.'] * 3,
+            'osdirnames'   : ['../$(shell basename $(base_libdir))'] * 3,
+        },
+    }
+
+    multilibs = (d.getVar('MULTILIB_VARIANTS', True) or "").split()
+    default_ml = False if multilibs else True
+
+    mlvariant = False
+    mlindex = 0
+    pn = d.getVar('PN', True)
+    for ml in multilibs:
+        if pn.startswith(ml):
+            mlvariant = True
+            break
+        mlindex += 1
+
+    target_arch = (d.getVar('TARGET_ARCH_MULTILIB_ORIGINAL', True) if mlvariant
+                    else d.getVar('TARGET_ARCH', True))
+
+    if target_arch not in gcc_target_config_files:
+        if multilibs:
+            bb.warn('gcc multilib setup is not supported for TARGET_ARCH=' + target_arch)
+        default_ml = True
+
+    libdir32 = 'SYSTEMLIBS_DIR'
+    libdir64 = 'SYSTEMLIBS_DIR'
+    libdirx32 = 'SYSTEMLIBS_DIR'
+    libdirn32 = 'SYSTEMLIBS_DIR'
+
+    if default_ml:
+        for fn in default_ml_config:
+            write_config([fn],
+                default_ml_config[fn]['options'],
+                default_ml_config[fn]['dirnames'],
+                default_ml_config[fn]['osdirnames'])
+
+        write_headers([item for sublist in gcc_header_config_files.values()
+                            for item in sublist],
+                    libdir32, libdir64, libdirx32, libdirn32)
+        return
+
+    target_config_files = gcc_target_config_files[target_arch]
+    header_config_files = gcc_header_config_files[target_arch]
+    ml_list = ['DEFAULTTUNE_MULTILIB_ORIGINAL' if mlvariant else 'DEFAULTTUNE']
+
+    mltunes = ['DEFAULTTUNE_virtclass-multilib-%s' % ml for ml in multilibs]
+    if multilibs:
+        if mlvariant:
+            ml_list.extend(mltunes[:mlindex] + ['DEFAULTTUNE'] + mltunes[(mlindex + 1):])
+        else:
+            ml_list.extend(mltunes)
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
+        # take out '-' in parameters
+        options.append(re.sub(r' +\-+', ' ', re.sub(r'^ *\-+', '', tune_parameters['ccargs'])))
+        if tune_baselib == 'lib':
+            dirnames.append('32')  # /lib => 32bit lib
+        else:
+            dirnames.append(tune_baselib.replace('lib', ''))
+        osdirnames.append('../' + tune_baselib)
+
+    write_config(target_config_files, options, dirnames, osdirnames)
+    write_headers(header_config_files, libdir32, libdir64, libdirx32, libdirn32)
+}
diff --git a/meta/recipes-devtools/gcc/libgcc_4.7.bb b/meta/recipes-devtools/gcc/libgcc_4.7.bb
index 5eaa515..c17c78a 100644
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
@@ -70,3 +74,43 @@ BBCLASSEXTEND = "nativesdk"
 
 INSANE_SKIP_${PN}-dev = "staticdev"
 INSANE_SKIP_${MLPREFIX}libgcov-dev = "staticdev"
+
+addtask multilib_install after do_install before do_package
+# this makes multilib gcc files findable for target gcc
+# e.g.
+#    /usr/lib/i586-pokymllib32-linux/4.7/
+# by creating this symlink to it
+#    /usr/lib64/x86_64-poky-linux/4.7/32
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



