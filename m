Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S05y1-0007bR-Le
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 07:46:25 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Feb 2012 22:37:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="109312590"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 21 Feb 2012 22:37:55 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2012 22:37:51 -0800
Message-Id: <e63f62b491b637aa4d97174fb7a0682fff6a872b.1329892604.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <2125b0a630c007976b62237dca790abcc5718825.1329892604.git.nitin.a.kamble@intel.com>
References: <2125b0a630c007976b62237dca790abcc5718825.1329892604.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1329892604.git.nitin.a.kamble@intel.com>
References: <cover.1329892604.git.nitin.a.kamble@intel.com>
Subject: [PATCH 08/10] target gcc: gcc-multilib-setup
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
X-List-Received-Date: Wed, 22 Feb 2012 06:46:27 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

add a task to setup multilib configuration for target gcc.

now the multilib setup file is tweeked as needed.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>

gcc-multilib-config.inc: tail

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-target.inc |    1 +
 meta/recipes-devtools/gcc/gcc-multilib-config.inc  |  149 ++++++++++++++++++++
 3 files changed, 151 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-multilib-config.inc

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index c4b6ac1..f4f0112 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -25,7 +25,7 @@ EXTRA_OECONF_PATHS ?= ""
 EXTRA_OECONF_INITIAL ?= ""
 EXTRA_OECONF_INTERMEDIATE ?= ""
 
-GCCMULTILIB = "--disable-multilib"
+GCCMULTILIB ?= "--disable-multilib"
 
 EXTRA_OECONF = "${@['--enable-clocale=generic', ''][d.getVar('USE_NLS', 1) != 'no']} \
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
index 0000000..173c2fe
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -0,0 +1,149 @@
+GCCMULTILIB = "--enable-multilib"
+
+addtask gcc_multilib_setup after do_patch before do_configure
+
+# following code modifies these definitions in the gcc config
+#	MULTILIB_OPTIONS
+#	MULTILIB_DIRNAMES
+#	MULTILIB_OSDIRNAMES
+#	GLIBC_DYNAMIC_LINKER32
+#	GLIBC_DYNAMIC_LINKER64
+#	GLIBC_DYNAMIC_LINKERX32
+#	GLIBC_DYNAMIC_LINKERN32
+#  For more information on use of these variables look at these files in the gcc source code
+#	gcc/config/i386/t-linux64
+#	gcc/config/mips/t-linux64
+#	gcc/config/rs6000/t-linux64
+#	gcc/config/i386/linux64.h
+#	gcc/config/mips/linux64.h
+#	gcc/config/rs6000/linux64.h
+# Nitin Kamble 2012/02/13
+
+python do_gcc_multilib_setup() {
+	import re
+
+	# do this only for target recipe
+ 	if d.getVar('PN', 1) != 'gcc':
+		return
+
+ 	srcdir = d.getVar('S', 1) or ''
+
+ 	multilibs = d.getVar('MULTILIB_VARIANTS', 1) or ''
+ 	if multilibs == '':
+		return
+
+	gcc_target_config_files = { 	'x86_64'	: 'gcc/config/i386/t-linux64',
+					'mips'		: 'gcc/config/mips/t-linux64' ,
+					'ppc' 		: 'gcc/config/rs6000/t-linux64' }
+
+	gcc_header_config_files = { 	'x86_64'	: 'gcc/config/i386/linux64.h',
+					'mips'		: 'gcc/config/mips/linux64.h' ,
+					'ppc' 		: 'gcc/config/rs6000/linux64.h' }
+
+ 	target_arch = d.getVar('TARGET_ARCH', 1) or ''
+
+	if target_arch not in gcc_target_config_files:
+		bb.warn('gcc multilib setup is not supported for TARGET_ARCH=' + target_arch)
+		return
+
+	gcc_multilib_target_config_file = gcc_target_config_files[target_arch]
+
+	gcc_multilib_header_config_file = gcc_header_config_files[target_arch]
+
+	ml_list = ['DEFAULTTUNE']
+	for ml in multilibs.split(' '):
+		ml_list.append('DEFAULTTUNE_virtclass-multilib-' + ml)
+
+	tunes_32 = ['x86', 'core2', 'i586', 'mips', 'mipsel', 'mips-nf', 'mipsel-nf', 'powerpc', 'powerpc-nf']
+	tunes_64 = ['x86-64', 'core2-64', 'mips64', 'mips64el', 'mips64-nf', 'mips64el-nf', 'powerpc64']
+	tunes_x32 = ['x86-64-x32', 'core2-64-x32']
+	tunes_n32 = ['mips64-n32', 'mips64el-n32', 'mips64-nf-n32', 'mips64el-nf-n32']
+
+	libdir32 = 'SYSTEMLIBS_DIR'
+	libdir64 = 'SYSTEMLIBS_DIR'
+	libdirx32 = 'SYSTEMLIBS_DIR'
+	libdirn32 = 'SYSTEMLIBS_DIR'
+
+	multilib_options = []
+	multilib_dirnames = []
+	multilib_osdirnames = []
+
+	for ml in ml_list:
+ 		ml_tune = d.getVar(ml, 1) or ''
+ 		ml_tune_features = d.getVar('TUNE_FEATURES_tune-' + ml_tune, 1) or ''
+ 		ml_baselib = d.getVar('BASE_LIB_tune-' + ml_tune, 1) or ''
+
+		if ml_tune in tunes_32:
+			libdir32 = ml_baselib
+		elif ml_tune in tunes_64:
+			libdir64 = ml_baselib
+		elif ml_tune in tunes_x32:
+			libdirx32 = ml_baselib
+		elif ml_tune in tunes_n32:
+			libdirn32 = ml_baselib
+
+		ml_tune_ccargs_list = []
+		for feature in ml_tune_features.split():
+ 			ml_feature_ccargs = d.getVar('TUNE_FEATURE_CCARGS-' + feature, 1) or ''
+			ml_tune_ccargs_list.append(ml_feature_ccargs)
+		ml_tune_ccargs = ' '.join(ml_tune_ccargs_list)
+		# take out '-' in parameters
+		multilib_options.append(re.sub(r'^\-+', '', re.sub(r' \-+',  ' ', ml_tune_ccargs)))
+		if ml_baselib == 'lib':
+			multilib_dirnames.append('32')
+		else:
+			multilib_dirnames.append(ml_baselib.replace('lib', ''))
+		multilib_osdirnames.append('../' + ml_baselib)
+	
+	with open(srcdir + '/' + gcc_multilib_target_config_file, 'r') as f:
+		filelines = f.read()
+		f.close()
+
+		# recreate multilib configuration variables
+
+		filelines = re.sub(r'^\s*MULTILIB_OPTIONS\s*=.*$',
+			'MULTILIB_OPTIONS = ' + '/'.join(multilib_options),
+			filelines, flags=re.MULTILINE)
+
+		filelines = re.sub(r'^\s*MULTILIB_DIRNAMES\s*=.*$',
+			'MULTILIB_DIRNAMES = ' + ' '.join(multilib_dirnames),
+			filelines, flags=re.MULTILINE)
+
+		filelines = re.sub(r'^\s*MULTILIB_OSDIRNAMES\s*=.*$',
+			'MULTILIB_OSDIRNAMES = ' + ' '.join(multilib_osdirnames),
+			filelines, flags=re.MULTILINE)
+	
+	with open(srcdir + '/' + gcc_multilib_target_config_file, 'w') as f:
+		f.write(filelines)
+		f.close()
+
+	with open(srcdir + '/' + gcc_multilib_header_config_file, 'r') as f:
+		filelines = f.read()
+		f.close()
+
+		# replace lines like
+		# #define GLIBC_DYNAMIC_LINKER32 SYSTEMLIBS_DIR "ld-linux.so.2"
+		# by
+		# #define GLIBC_DYNAMIC_LINKER32 "/lib/" "ld-linux.so.2"
+		# this is needed to put the correct dynamic loader path in the generated binaries
+
+		filelines = re.sub(r'^(#define\s*GLIBC_DYNAMIC_LINKER32\s*)(SYSTEMLIBS_DIR)(\s*\".*\")$',
+			r'\1"/' + libdir32 + r'/"\3',
+			filelines, flags=re.MULTILINE)
+
+		filelines = re.sub(r'^(#define\s*GLIBC_DYNAMIC_LINKER64\s*)(SYSTEMLIBS_DIR)(\s*\".*\")$',
+			r'\1"/' + libdir64 + r'/"\3',
+			filelines, flags=re.MULTILINE)
+
+		filelines = re.sub(r'^(#define\s*GLIBC_DYNAMIC_LINKERX32\s*)(SYSTEMLIBS_DIR)(\s*\".*\")$',
+			r'\1"/' + libdirx32 + r'/"\3',
+			filelines, flags=re.MULTILINE)
+
+		filelines = re.sub(r'^(#define\s*GLIBC_DYNAMIC_LINKERN32\s*)(SYSTEMLIBS_DIR)(\s*\".*\")$',
+			r'\1"/' + libdirn32 + r'/"\3',
+			filelines, flags=re.MULTILINE)
+
+		with open(srcdir + '/' + gcc_multilib_header_config_file, 'w') as f:
+			f.write(filelines)
+			f.close()
+}
-- 
1.7.6.4



