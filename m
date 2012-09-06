Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T9kps-0003b1-He
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 00:46:09 +0200
Received: by iebc11 with SMTP id c11so4142080ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 15:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=djGLFdDJCZ/H6NsFsuJnel/5+GYVlqVZMsl1AdZBQEI=;
	b=c+7Dwde1yvEdIiZSrG3I/6O5QmLu/PiiKXCL6qir7rgn2hDFQTJZ2cDw6ia4ag3w2K
	zXZgk5/DPPHHtVDMKio0FkWAuTBPL7uoQq+grZRMBvpvstVqZD/wuyYAGRWVhNYKb+ue
	oSHj8uCAQWCA96zaUtE09bUai2PbboEhEkeVsuLVhBKlKiABWOET1sOVxONYNHrL1YLY
	56rStRY2jqNT7WdUcpLvyr3xxRoRyUy8KEEFXr+LKkL3K/lXC44Ds2GXD2BQI/Xq0VM1
	xE6NL20LiuFnALu5KNr9UzUKOxuG6R0iIqIfaZBjN+Jr/hPgiZh3QtVuCu+kQ65AIgs1
	zgyw==
Received: by 10.50.57.194 with SMTP id k2mr5385919igq.32.1346970823136;
	Thu, 06 Sep 2012 15:33:43 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id n5sm8157066igw.13.2012.09.06.15.33.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 15:33:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2012 15:32:43 -0700
Message-Id: <78bc20e7fc534e4452c6a17c6c5d9020ac014eff.1346970617.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346970617.git.raj.khem@gmail.com>
References: <cover.1346970617.git.raj.khem@gmail.com>
Subject: [PATCH 1/6] eglibc-2.16: Add kconfig infrastructure
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
X-List-Received-Date: Thu, 06 Sep 2012 22:46:09 -0000

This will let eglibc use kernel like option
management through kconfig

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-eglibc-menuconfig-support.patch           | 1007 ++++++++++++++++++++
 ...0002-eglibc-menuconfig-hex-string-options.patch |  169 ++++
 ...0003-eglibc-menuconfig-build-instructions.patch |  176 ++++
 meta/recipes-core/eglibc/eglibc_2.16.bb            |    5 +-
 4 files changed, 1356 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0001-eglibc-menuconfig-support.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0002-eglibc-menuconfig-hex-string-options.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.16/0003-eglibc-menuconfig-build-instructions.patch

diff --git a/meta/recipes-core/eglibc/eglibc-2.16/0001-eglibc-menuconfig-support.patch b/meta/recipes-core/eglibc/eglibc-2.16/0001-eglibc-menuconfig-support.patch
new file mode 100644
index 0000000..6243926
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/0001-eglibc-menuconfig-support.patch
@@ -0,0 +1,1007 @@
+Pulled from
+http://www.eglibc.org/archives/patches/msg01042.html
+
+Upstream-Status: Pending
+Signed-off-by: Khem
+
+Hi,
+
+This patch adds 'make menuconfig' support to EGLIBC.
+
+
+EGLIBC can re-use the Linux kernel kconfig host tools ('conf' and 'mconf') unmodified, by passing appropriate environment variables and with some pre- and post-processing on the input/output config files.
+
+There are three new make targets supported, which all are defined in the new libc/options-config/Makefile, which is included by the top-level libc/Makefile:
+
+- 'make defconfig'. This passes 'libc/option-groups.defaults' to 'conf' as a default config, and outputs 'option-groups.config' to the top-level build directory, which will be the same as the default config.
+
+- 'make config'. This is the same line-oriented interface as in the Linux kernel. Input and output is 'option-groups.config' in the top-level build directory.
+
+- 'make menuconfig'. This is the same menu-based interface as in the Linux kernel. Input and output is 'option-groups.config' in the top-level build directory.
+
+
+Pre-Processing:
+
+
+The Linux kernel kconfig tools expect a prefix of "CONFIG_" on all config option names, but EGLIBC expects a prefix of "OPTION_". The pre-processing script, libc/options-config/config-preproc.pl, simply replaces "CONFIG_ with "OPTION_" in the given config file. The libc/options-config/Makefile passes the script output to a temporary config file, which is then passed to 'conf' or 'mconf'.
+
+Post-Processing (libc/options-config/config-postproc.pl):
+
+
+- Disabled options are output as a comment line of the form "# CONFIG_FOO is not set". This needs to be changed to an explicit "CONFIG_FOO=n" in order to be compatible with 'option-groups.awk' which generates the option-groups.h header.
+
+- "CONFIG_" prefix is changed back to "OPTION_".
+
+
+- The kconfig tools will not output anything for options that depend on a parent option, when the parent option is disabled. This implicit disable must be converted to an explicit "CONFIG_FOO=n" in order to be compatible with the way EGLIBC overrides the default option settings in 'libc/option-groups.defaults' with those in 'option-groups.config'.
+
+
+A new configure option, '--with-kconfig=<PATH>', tells EGLIBC where to find the pre-built 'conf' and 'mconf' host tools from Linux kernel builds.
+
+libc/EGLIBC.cross-building is updated to include instructions for using '--with-kconfig' for the final EGLIBC build, and shows how and when to run 'make *config'.
+
+libc/EGLIBC.option-groups is updated to include new information on the menuconfig support.
+
+Thanks,
+
+attached is the updated patch to address above issues.
+
+Steve
+
+--
+Steve Longerbeam | Senior Embedded Engineer, ESD Services
+Mentor Embedded(tm) | 46871 Bayside Parkway, Fremont, CA 94538
+P 510.354.5838 | M 408.410.2735
+Nucleus(r) | Linux(r) | Android(tm) | Services | UI | Multi-OS
+
+
+Index: libc/EGLIBC.cross-building
+===================================================================
+--- libc.orig/EGLIBC.cross-building	2012-08-21 22:25:49.000000000 -0700
++++ libc/EGLIBC.cross-building	2012-09-05 21:44:09.749577576 -0700
+@@ -243,9 +243,29 @@
+     > $src/libc/configure \
+     >     --prefix=/usr \
+     >     --with-headers=$sysroot/usr/include \
++    >     --with-kconfig=$obj/linux/scripts/kconfig \
+     >     --build=$build \
+     >     --host=$target \
+     >     --disable-profile --without-gd --without-cvs --enable-add-ons
++
++Note the additional '--with-kconfig' option. This tells EGLIBC where to
++find the host config tools used by the kernel 'make config' and 'make
++menuconfig'.  These tools can be re-used by EGLIBC for its own 'make
++*config' support, which will create 'option-groups.config' for you.
++But first make sure those tools have been built by running some
++dummy 'make *config' calls in the kernel directory:
++
++    $ cd $obj/linux
++    $ PATH=$tools/bin:$PATH make config \
++    >      ARCH=$linux_arch CROSS_COMPILE=$target- \
++    $ PATH=$tools/bin:$PATH make menuconfig \
++    >      ARCH=$linux_arch CROSS_COMPILE=$target- \
++
++Now we can configure and build the full EGLIBC:
++
++    $ cd $obj/eglibc
++    $ PATH=$tools/bin:$PATH make defconfig
++    $ PATH=$tools/bin:$PATH make menuconfig
+     $ PATH=$tools/bin:$PATH make
+     $ PATH=$tools/bin:$PATH make install install_root=$sysroot
+ 
+Index: libc/configure.in
+===================================================================
+--- libc.orig/configure.in	2012-09-05 21:40:19.000000000 -0700
++++ libc/configure.in	2012-09-05 21:44:09.769577577 -0700
+@@ -96,6 +96,16 @@
+ 	    [sysheaders=$withval],
+ 	    [sysheaders=''])
+ 
++AC_ARG_WITH([kconfig],
++	    AC_HELP_STRING([--with-kconfig=PATH],
++			   [location of kconfig tools to use (from Linux
++			    kernel builds) to re-use for configuring EGLIBC
++			    option groups]),
++	    [KCONFIG_TOOLS=$withval],
++	    [KCONFIG_TOOLS=''])
++AC_SUBST(KCONFIG_TOOLS)
++
++
+ AC_SUBST(use_default_link)
+ AC_ARG_WITH([default-link],
+ 	    AC_HELP_STRING([--with-default-link],
+Index: libc/config.make.in
+===================================================================
+--- libc.orig/config.make.in	2012-08-21 22:25:55.000000000 -0700
++++ libc/config.make.in	2012-09-05 21:45:16.253579810 -0700
+@@ -48,6 +48,8 @@
+ c++-sysincludes = @CXX_SYSINCLUDES@
+ all-warnings = @all_warnings@
+ 
++kconfig_tools = @KCONFIG_TOOLS@
++
+ have-z-combreloc = @libc_cv_z_combreloc@
+ have-z-execstack = @libc_cv_z_execstack@
+ have-Bgroup = @libc_cv_Bgroup@
+Index: libc/options-config/config-postproc.pl
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ libc/options-config/config-postproc.pl	2012-09-05 21:44:09.769577577 -0700
+@@ -0,0 +1,54 @@
++#!/usr/bin/perl
++
++$usage = "usage: $0 <default config file> <config file>\n";
++
++die "$usage" unless @ARGV;
++$defaults = shift @ARGV;
++die "$usage" unless @ARGV;
++die "Could not open $ARGV[0]" unless -T $ARGV[0];
++
++sub yank {
++    @option = grep($_ ne $_[0], @option);
++}
++
++open(DEFAULTS, $defaults) || die "Could not open $defaults\n";
++
++# get the full list of available options using the default config file
++$i = 0;
++while (<DEFAULTS>) {
++    if (/^\s*OPTION_(\w+)\s*=/) {
++	$option[$i++] = $1;
++    }
++}
++
++# now go through the config file, making the necessary changes
++while (<>) {
++    if (/Linux Kernel Configuration/) {
++	# change title
++	s/Linux Kernel/Option Groups/;
++	print;
++    } elsif (/^\s*CONFIG_(\w+)\s*=/) {
++	# this is an explicit option set line, change CONFIG_ to OPTION_
++	# before printing and remove this option from option list
++	$opt = $1;
++	yank($opt);
++	s/CONFIG_/OPTION_/g;
++	print;
++    } elsif (/^\s*#\s+CONFIG_(\w+) is not set/) {
++	# this is a comment line, change CONFIG_ to OPTION_, remove this
++	# option from option list, and convert to explicit OPTION_FOO=n
++	$opt = $1;
++	yank($opt);
++	s/CONFIG_/OPTION_/g;
++	print "OPTION_$opt=n\n";
++    } else {
++	print;
++    }
++}
++
++# any options left in @options, are options that were not mentioned in
++# the config file, and implicitly that means the option must be set =n,
++# so do that here.
++foreach $opt (@option) {
++    print "OPTION_$opt=n\n";
++}
+Index: libc/options-config/config-preproc.pl
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ libc/options-config/config-preproc.pl	2012-09-05 21:44:09.769577577 -0700
+@@ -0,0 +1,8 @@
++#!/usr/bin/perl
++
++if (@ARGV) {
++    while (<>) {
++	s/OPTION_/CONFIG_/g;
++	print;
++    }
++}
+Index: libc/options-config/Makefile
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ libc/options-config/Makefile	2012-09-05 21:44:09.769577577 -0700
+@@ -0,0 +1,55 @@
++# ===========================================================================
++# EGLIBC option-groups configuration targets
++# These targets are included from top-level makefile
++
++ifneq ($(kconfig_tools),)
++ifneq (no,$(PERL))
++
++ocdir := options-config
++
++OconfigDefaults     := option-groups.defaults
++OconfigDefaults_tmp := $(common-objpfx).tmp.defconfig
++OconfigDef          := option-groups.def
++Oconfig             := $(common-objpfx)option-groups.config
++Oconfig_tmp         := $(common-objpfx).tmp.config
++
++conf  := $(kconfig_tools)/conf
++mconf := $(kconfig_tools)/mconf
++
++preproc  := $(PERL) $(ocdir)/config-preproc.pl
++postproc := $(PERL) $(ocdir)/config-postproc.pl
++
++PHONY += defconfig config menuconfig
++
++defconfig: $(conf) $(OconfigDefaults) $(OconfigDef)
++	rm -f $(OconfigDefaults_tmp)
++	rm -f $(Oconfig_tmp)
++	$(preproc) $(OconfigDefaults) > $(OconfigDefaults_tmp)
++	KCONFIG_CONFIG=$(Oconfig_tmp) $< --defconfig=$(OconfigDefaults_tmp) \
++				$(OconfigDef)
++	$(postproc) $(OconfigDefaults) $(Oconfig_tmp) > $(Oconfig)
++	rm $(Oconfig_tmp)
++	rm $(OconfigDefaults_tmp)
++
++config: $(conf) $(OconfigDefaults) $(OconfigDef)
++	rm -f $(Oconfig_tmp)
++	$(preproc) $(wildcard $(Oconfig)) > $(Oconfig_tmp)
++	KCONFIG_CONFIG=$(Oconfig_tmp) $< --oldaskconfig $(OconfigDef)
++	$(postproc) $(OconfigDefaults) $(Oconfig_tmp) > $(Oconfig)
++	rm $(Oconfig_tmp)
++
++menuconfig: $(mconf) $(OconfigDefaults) $(OconfigDef)
++	rm -f $(Oconfig_tmp)
++	$(preproc) $(wildcard $(Oconfig)) > $(Oconfig_tmp)
++	KCONFIG_CONFIG=$(Oconfig_tmp) $< $(OconfigDef)
++	$(postproc) $(OconfigDefaults) $(Oconfig_tmp) > $(Oconfig)
++	rm $(Oconfig_tmp)
++
++# Help text used by make help
++help:
++	@echo  '  defconfig	  - New config with default from default config'
++	@echo  '  config	  - Update current config utilising a line-oriented program'
++	@echo  '  menuconfig	  - Update current config utilising a menu based program'
++
++endif
++endif
+Index: libc/option-groups.defaults
+===================================================================
+--- libc.orig/option-groups.defaults	2012-08-21 22:26:18.000000000 -0700
++++ libc/option-groups.defaults	2012-09-05 21:44:09.769577577 -0700
+@@ -8,41 +8,41 @@
+ # are to be changed.
+ #
+ # By default, all option groups are enabled.
+-OPTION_EGLIBC_ADVANCED_INET6 = y
+-OPTION_EGLIBC_BACKTRACE = y
+-OPTION_EGLIBC_BIG_MACROS = y
+-OPTION_EGLIBC_BSD = y
+-OPTION_EGLIBC_CXX_TESTS = y
+-OPTION_EGLIBC_CATGETS = y
+-OPTION_EGLIBC_CHARSETS = y
+-OPTION_EGLIBC_CRYPT = y
+-OPTION_EGLIBC_CRYPT_UFC = y
+-OPTION_EGLIBC_DB_ALIASES = y
+-OPTION_EGLIBC_ENVZ = y
+-OPTION_EGLIBC_FCVT = y
+-OPTION_EGLIBC_FMTMSG = y
+-OPTION_EGLIBC_FSTAB = y
+-OPTION_EGLIBC_FTRAVERSE = y
+-OPTION_EGLIBC_GETLOGIN = y
+-OPTION_EGLIBC_IDN = y
+-OPTION_EGLIBC_INET = y
+-OPTION_EGLIBC_INET_ANL = y
+-OPTION_EGLIBC_LIBM = y
+-OPTION_EGLIBC_LIBM_BIG = y
+-OPTION_EGLIBC_LOCALES = y
+-OPTION_EGLIBC_LOCALE_CODE = y
+-OPTION_EGLIBC_MEMUSAGE = y
+-OPTION_EGLIBC_NIS = y
+-OPTION_EGLIBC_NSSWITCH = y
+-OPTION_EGLIBC_RCMD = y
+-OPTION_EGLIBC_RTLD_DEBUG = y
+-OPTION_EGLIBC_SPAWN = y
+-OPTION_EGLIBC_STREAMS = y
+-OPTION_EGLIBC_SUNRPC = y
+-OPTION_EGLIBC_UTMP = y
+-OPTION_EGLIBC_UTMPX = y
+-OPTION_EGLIBC_WORDEXP = y
+-OPTION_POSIX_C_LANG_WIDE_CHAR = y
+-OPTION_POSIX_REGEXP = y
+-OPTION_POSIX_REGEXP_GLIBC = y
+-OPTION_POSIX_WIDE_CHAR_DEVICE_IO = y
++OPTION_EGLIBC_ADVANCED_INET6=y
++OPTION_EGLIBC_BACKTRACE=y
++OPTION_EGLIBC_BIG_MACROS=y
++OPTION_EGLIBC_BSD=y
++OPTION_EGLIBC_CXX_TESTS=y
++OPTION_EGLIBC_CATGETS=y
++OPTION_EGLIBC_CHARSETS=y
++OPTION_EGLIBC_CRYPT=y
++OPTION_EGLIBC_CRYPT_UFC=y
++OPTION_EGLIBC_DB_ALIASES=y
++OPTION_EGLIBC_ENVZ=y
++OPTION_EGLIBC_FCVT=y
++OPTION_EGLIBC_FMTMSG=y
++OPTION_EGLIBC_FSTAB=y
++OPTION_EGLIBC_FTRAVERSE=y
++OPTION_EGLIBC_GETLOGIN=y
++OPTION_EGLIBC_IDN=y
++OPTION_EGLIBC_INET=y
++OPTION_EGLIBC_INET_ANL=y
++OPTION_EGLIBC_LIBM=y
++OPTION_EGLIBC_LIBM_BIG=y
++OPTION_EGLIBC_LOCALES=y
++OPTION_EGLIBC_LOCALE_CODE=y
++OPTION_EGLIBC_MEMUSAGE=y
++OPTION_EGLIBC_NIS=y
++OPTION_EGLIBC_NSSWITCH=y
++OPTION_EGLIBC_RCMD=y
++OPTION_EGLIBC_RTLD_DEBUG=y
++OPTION_EGLIBC_SPAWN=y
++OPTION_EGLIBC_STREAMS=y
++OPTION_EGLIBC_SUNRPC=y
++OPTION_EGLIBC_UTMP=y
++OPTION_EGLIBC_UTMPX=y
++OPTION_EGLIBC_WORDEXP=y
++OPTION_POSIX_C_LANG_WIDE_CHAR=y
++OPTION_POSIX_REGEXP=y
++OPTION_POSIX_REGEXP_GLIBC=y
++OPTION_POSIX_WIDE_CHAR_DEVICE_IO=y
+Index: libc/option-groups.def
+===================================================================
+--- libc.orig/option-groups.def	2012-08-21 22:25:45.000000000 -0700
++++ libc/option-groups.def	2012-09-05 21:44:09.773577578 -0700
+@@ -4,19 +4,19 @@
+ #
+ # An entry of the form:
+ #
+-#   config OPTION_GROUP_NAME
++#   config GROUP_NAME
+ #       bool "one-line explanation of what this option group controls"
+ #       help
+ #           Multi-line help explaining the option group's meaning in
+ #           some detail, terminated by indentation level.
+ #
+-# defines an option group whose variable is OPTION_GROUP_NAME, with
++# defines an option group whose variable is GROUP_NAME, with
+ # meaningful values 'y' (enabled) and 'n' (disabled).  The
+ # documentation is formatted to be consumed by some sort of
+ # interactive configuration interface, but EGLIBC doesn't have such an
+ # interface yet.
+ #
+-# An option may have a 'depends' line, indicating which other options
++# An option may have a 'depends on' line, indicating which other options
+ # must also be enabled if this option is.  At present, EGLIBC doesn't
+ # check that these dependencies are satisfied.
+ # 
+@@ -41,9 +41,9 @@
+ # although this simply reestablishes the value already set by
+ # 'option-groups.defaults'.
+ 
+-config OPTION_EGLIBC_ADVANCED_INET6
++config EGLIBC_ADVANCED_INET6
+    bool "IPv6 Advanced Sockets API support (RFC3542)"
+-   depends OPTION_EGLIBC_INET
++   depends on EGLIBC_INET
+    help
+        This option group includes the functions specified by RFC 3542,
+        "Advanced Sockets Application Program Interface (API) for
+@@ -71,7 +71,7 @@
+          inet6_rth_segments
+          inet6_rth_space
+ 
+-config OPTION_EGLIBC_BACKTRACE
++config EGLIBC_BACKTRACE
+    bool "Functions for producing backtraces"
+    help
+        This option group includes functions for producing a list of
+@@ -85,7 +85,7 @@
+          backtrace_symbols
+          backtrace_symbols_fd
+ 
+-config OPTION_EGLIBC_BIG_MACROS
++config EGLIBC_BIG_MACROS
+    bool "Use extensive inline code"
+    help
+        This option group specifies whether certain pieces of code
+@@ -93,7 +93,7 @@
+        group is not selected, function calls will be used instead,
+        hence reducing the library footprint.
+ 
+-config OPTION_EGLIBC_BSD
++config EGLIBC_BSD
+    bool "BSD-specific functions, and their compatibility stubs"
+    help
+        This option group includes functions specific to BSD kernels.
+@@ -109,10 +109,9 @@
+          revoke
+          setlogin
+ 
+-config OPTION_EGLIBC_CXX_TESTS
++config EGLIBC_CXX_TESTS
+    bool "Tests that link against the standard C++ library."
+-   depends OPTION_POSIX_WIDE_CHAR_DEVICE_IO
+-   depends OPTION_EGLIBC_LIBM
++   depends on POSIX_WIDE_CHAR_DEVICE_IO && EGLIBC_LIBM
+    help
+        This option group does not include any C library functions;
+        instead, it controls which EGLIBC tests an ordinary 'make
+@@ -121,23 +120,22 @@
+        run.
+ 
+        The standard C++ library depends on the math library 'libm' and
+-       the wide character I/O functions included in EGLIBC.  If those
+-       option groups are disabled, this test must also be disabled.
++       the wide character I/O functions included in EGLIBC.  So those
++       option groups must be enabled if this test is enabled.
+ 
+-config OPTION_EGLIBC_CATGETS
++config EGLIBC_CATGETS
+    bool "Functions for accessing message catalogs"
+-   depends OPTION_EGLIBC_LOCALE_CODE
++   depends on EGLIBC_LOCALE_CODE
+    help
+        This option group includes functions for accessing message
+        catalogs: catopen, catclose, and catgets.
+ 
+-       This option group depends on the OPTION_EGLIBC_LOCALE_CODE
+-       option group; if you disable that, you must also disable this.
++       This option group depends on the EGLIBC_LOCALE_CODE
++       option group.
+ 
+-config OPTION_EGLIBC_CHARSETS
++config EGLIBC_CHARSETS
+    bool "iconv/gconv character set conversion libraries"
+    help
+-
+        This option group includes support for character sets other
+        than ASCII (ANSI_X3.4-1968) and Unicode and ISO-10646 in their
+        various encodings.  This affects both the character sets
+@@ -198,16 +196,16 @@
+           WCHAR_T           - EGLIBC's internal form (target-endian,
+                               32-bit ISO 10646)
+ 
+-config OPTION_EGLIBC_CRYPT
++config EGLIBC_CRYPT
+    bool "Encryption library"
+    help
+        This option group includes the `libcrypt' library which
+        provides functions for one-way encryption.  Supported
+        encryption algorithms include MD5, SHA-256, SHA-512 and DES.
+ 
+-config OPTION_EGLIBC_CRYPT_UFC
++config EGLIBC_CRYPT_UFC
+    bool "Ultra fast `crypt' implementation"
+-   depends OPTION_EGLIBC_CRYPT
++   depends on EGLIBC_CRYPT
+    help
+        This option group provides ultra fast DES-based implementation of
+        the `crypt' function.  When this option group is disabled,
+@@ -216,7 +214,7 @@
+        errno to ENOSYS if /salt/ passed does not correspond to either MD5,
+        SHA-256 or SHA-512 algorithm.
+ 
+-config OPTION_EGLIBC_DB_ALIASES
++config EGLIBC_DB_ALIASES
+    bool "Functions for accessing the mail aliases database"
+    help
+        This option group includues functions for looking up mail
+@@ -233,7 +231,7 @@
+        When this option group is disabled, the NSS service libraries
+        also lack support for querying their mail alias tables.
+ 
+-config OPTION_EGLIBC_ENVZ
++config EGLIBC_ENVZ
+    bool "Functions for handling envz-style environment vectors."
+    help
+        This option group contains functions for creating and operating
+@@ -248,7 +246,7 @@
+         envz_entry      envz_remove
+         envz_get        envz_strip 
+ 
+-config OPTION_EGLIBC_FCVT
++config EGLIBC_FCVT
+    bool "Functions for converting floating-point numbers to strings"
+    help
+        This option group includes functions for converting
+@@ -262,14 +260,14 @@
+ 	 fcvt_r		qfcvt_r
+          gcvt		qgcvt
+ 
+-config OPTION_EGLIBC_FMTMSG
++config EGLIBC_FMTMSG
+    bool "Functions for formatting messages"
+    help
+        This option group includes the following functions:
+ 
+          addseverity    fmtmsg
+ 
+-config OPTION_EGLIBC_FSTAB
++config EGLIBC_FSTAB
+    bool "Access functions for 'fstab'"
+    help
+        This option group includes functions for reading the mount
+@@ -283,7 +281,7 @@
+          getfsent       setfsent
+          getfsfile
+ 
+-config OPTION_EGLIBC_FTRAVERSE
++config EGLIBC_FTRAVERSE
+    bool "Functions for traversing file hierarchies"
+    help
+        This option group includes functions for traversing file
+@@ -297,9 +295,9 @@
+ 	 fts_set	nftw64
+          fts_close
+ 
+-config OPTION_EGLIBC_GETLOGIN
++config EGLIBC_GETLOGIN
+    bool "The getlogin function"
+-   depends OPTION_EGLIBC_UTMP
++   depends on EGLIBC_UTMP
+    help
+        This function group includes the 'getlogin' and 'getlogin_r'
+        functions, which return the user name associated by the login
+@@ -309,17 +307,17 @@
+        fall back on 'getlogin' to find the user's login name for tilde
+        expansion when the 'HOME' environment variable is not set.
+ 
+-config OPTION_EGLIBC_IDN
++config EGLIBC_IDN
+    bool "International domain names support"
+    help
+        This option group includes the `libcidn' library which
+        provides support for international domain names.
+ 
+-config OPTION_EGLIBC_INET
++config EGLIBC_INET
+    bool "Networking support"
+    help
+        This option group includes networking-specific functions and
+-       data.  With OPTION_EGLIBC_INET disabled, the EGLIBC
++       data.  With EGLIBC_INET disabled, the EGLIBC
+        installation and API changes as follows:
+ 
+        - The following libraries are not installed:
+@@ -439,14 +437,14 @@
+        use Unix-domain sockets to communicate with the syslog daemon;
+        syslog is valuable in non-networked contexts.
+ 
+-config OPTION_EGLIBC_INET_ANL
++config EGLIBC_INET_ANL
+    bool "Asynchronous name lookup"
+-   depends OPTION_EGLIBC_INET
++   depends on EGLIBC_INET
+    help
+        This option group includes the `libanl' library which
+        provides support for asynchronous name lookup.
+ 
+-config OPTION_EGLIBC_LIBM
++config EGLIBC_LIBM
+    bool "libm (math library)"
+    help
+        This option group includes the 'libm' library, containing
+@@ -464,8 +462,9 @@
+        group, you will not be able to build 'libstdc++' against the
+        resulting EGLIBC installation.
+ 
+-config OPTION_EGLIBC_LIBM_BIG
++config EGLIBC_LIBM_BIG
+    bool "Math library size"
++   depends on EGLIBC_LIBM
+    help
+        This option group enables default configuration of the math library.
+        Not selecting this option group removes most of the extended and
+@@ -477,7 +476,7 @@
+        This option group is useful for systems that do not rely on precise
+        floating point math.
+ 
+-config OPTION_EGLIBC_LOCALES
++config EGLIBC_LOCALES
+    bool "Locale definitions"
+    help
+        This option group includes all locale definitions other than
+@@ -485,17 +484,17 @@
+        only the "C" locale is supported.
+ 
+ 
+-config OPTION_EGLIBC_LOCALE_CODE
++config EGLIBC_LOCALE_CODE
+    bool "Locale functions"
+-   depends OPTION_POSIX_C_LANG_WIDE_CHAR
++   depends on POSIX_C_LANG_WIDE_CHAR
+    help
+        This option group includes locale support functions, programs,
+-       and libraries.  With OPTION_EGLIBC_LOCALE_FUNCTIONS disabled,
++       and libraries.  With EGLIBC_LOCALE_CODE disabled,
+        EGLIBC supports only the 'C' locale (also known as 'POSIX'),
+        and ignores the settings of the 'LANG' and 'LC_*' environment
+        variables.
+ 
+-       With OPTION_EGLIBC_LOCALE_CODE disabled, the following
++       With EGLIBC_LOCALE_CODE disabled, the following
+        functions are omitted from libc:
+ 
+          duplocale   localeconv  nl_langinfo    rpmatch  strfmon_l
+@@ -504,46 +503,43 @@
+        Furthermore, only the LC_CTYPE and LC_TIME categories of the
+        standard "C" locale are available.
+ 
+-       The OPTION_EGLIBC_CATGETS option group depends on this option
+-       group; if you disable OPTION_EGLIBC_LOCALE_CODE, you must also
+-       disable OPTION_EGLIBC_CATGETS.
++       The EGLIBC_CATGETS option group depends on this option group.
++
+ 
+-config OPTION_EGLIBC_MEMUSAGE
++config EGLIBC_MEMUSAGE
+    bool "Memory profiling library"
+    help
+        This option group includes the `libmemusage' library and
+        the `memusage' and `memusagestat' utilities.
+        These components provide memory profiling functions.
+ 
+-     OPTION_EGLIBC_MEMUSAGE_DEFAULT_BUFFER_SIZE
++       EGLIBC_MEMUSAGE_DEFAULT_BUFFER_SIZE
+ 
+        Libmemusage library buffers the profiling data in memory
+        before writing it out to disk.  By default, the library
+        allocates 1.5M buffer, which can be substantial for some
+-       systems.  OPTION_EGLIBC_MEMUSAGE_DEFAULT_BUFFER_SIZE option
++       systems.  EGLIBC_MEMUSAGE_DEFAULT_BUFFER_SIZE option
+        allows to change the default buffer size.  It specifies
+        the number of entries the buffer should have.
+        On most architectures one buffer entry amounts to 48 bytes,
+        so setting this option to the value of 512 will reduce the size of
+        the memory buffer to 24K.
+ 
+-config OPTION_EGLIBC_NIS
++config EGLIBC_NIS
+    bool "Support for NIS, NIS+, and the special 'compat' services."
+-   depends OPTION_EGLIBC_INET
+-   depends OPTION_EGLIBC_SUNRPC
++   depends on EGLIBC_INET && EGLIBC_SUNRPC
+    help
+        This option group includes the NIS, NIS+, and 'compat' Name
+        Service Switch service libraries.  When it is disabled, those
+        services libraries are not installed; you should remove any
+        references to them from your 'nsswitch.conf' file.
+ 
+-       This option group depends on the OPTION_EGLIBC_INET option
++       This option group depends on the EGLIBC_INET option
+        group; you must enable that to enable this option group.
+ 
+-config OPTION_EGLIBC_NSSWITCH
++config EGLIBC_NSSWITCH
+    bool "Name service switch (nsswitch) support"
+    help
+-
+        This option group includes support for the 'nsswitch' facility.
+        With this option group enabled, all EGLIBC functions for
+        accessing various system databases (passwords and groups;
+@@ -557,12 +553,12 @@
+        'option-groups.config' file must set the following two
+        variables:
+ 
+-       OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG
++       EGLIBC_NSSWITCH_FIXED_CONFIG
+ 
+           Set this to the name of a file whose contents observe the
+           same syntax as an ordinary '/etc/nsswitch.conf' file.  The
+           EGLIBC build process parses this file just as EGLIBC would
+-          at run time if OPTION_EGLIBC_NSSWITCH were enabled, and
++          at run time if EGLIBC_NSSWITCH were enabled, and
+           produces a C library that uses the nsswitch service
+           libraries to search for database entries as this file
+           specifies, instead of consulting '/etc/nsswitch.conf' at run
+@@ -580,7 +576,7 @@
+           you will probably want to delete references to databases not
+           needed on your system.
+ 
+-       OPTION_EGLIBC_NSSWITCH_FIXED_FUNCTIONS
++       EGLIBC_NSSWITCH_FIXED_FUNCTIONS
+ 
+           The EGLIBC build process uses this file to decide which
+           functions to make available from which service libraries.
+@@ -598,28 +594,28 @@
+           Be sure to mention each function in each service you wish to
+           use.  If you do not mention a service's function here, the
+           EGLIBC database access functions will not find it, even if
+-          it is listed in the OPTION_EGLIBC_NSSWITCH_FIXED_CONFIG
++          it is listed in the EGLIBC_NSSWITCH_FIXED_CONFIG
+           file.
+ 
+-       In this arrangement, EGLIBC will not use the 'dlopen' and
+-       'dlsym' functions to find database access functions.  Instead,
+-       libc hard-codes references to the service libraries' database
+-       access functions.  You must explicitly link your program
+-       against the name service libraries (those whose names start
+-       with 'libnss_', in the sysroot's '/lib' directory) whose
+-       functions you intend to use.  This arrangement helps
+-       system-wide static analysis tools decide which functions a
+-       system actually uses.
+-
+-       Note that some nsswitch service libraries require other option
+-       groups to be enabled; for example, the OPTION_EGLIBC_INET
+-       option group must be enabled to use the 'libnss_dns.so.2'
+-       service library, which uses the Domain Name System network
+-       protocol to answer queries.
++          In this arrangement, EGLIBC will not use the 'dlopen' and
++          'dlsym' functions to find database access functions.  Instead,
++          libc hard-codes references to the service libraries' database
++          access functions.  You must explicitly link your program
++          against the name service libraries (those whose names start
++          with 'libnss_', in the sysroot's '/lib' directory) whose
++          functions you intend to use.  This arrangement helps
++          system-wide static analysis tools decide which functions a
++          system actually uses.
++
++          Note that some nsswitch service libraries require other option
++          groups to be enabled; for example, the EGLIBC_INET
++          option group must be enabled to use the 'libnss_dns.so.2'
++          service library, which uses the Domain Name System network
++          protocol to answer queries.
+ 
+-config OPTION_EGLIBC_RCMD
++config EGLIBC_RCMD
+    bool "Support for 'rcmd' and related library functions"
+-   depends OPTION_EGLIBC_INET
++   depends on EGLIBC_INET
+    help
+       This option group includes functions for running commands on
+       remote machines via the 'rsh' protocol, and doing authentication
+@@ -635,7 +631,7 @@
+         rresvport       ruserpass
+         rresvport_af
+         
+-config OPTION_EGLIBC_RTLD_DEBUG
++config EGLIBC_RTLD_DEBUG
+    bool "Runtime linker debug print outs"
+    help
+       This option group enables debug output of the runtime linker
+@@ -646,7 +642,7 @@
+       the `ldd' utility which may also be used by the prelinker.
+       In particular, the `--unused' ldd option will not work correctly.
+ 
+-config OPTION_EGLIBC_SPAWN
++config EGLIBC_SPAWN
+    bool "Support for POSIX posix_spawn functions"
+    help
+       This option group includes the POSIX functions for executing
+@@ -682,7 +678,7 @@
+       disabled, those programs will only operate on uncompressed
+       charmap files.
+ 
+-config OPTION_EGLIBC_STREAMS
++config EGLIBC_STREAMS
+    bool "Support for accessing STREAMS."
+    help
+       This option group includes functions for reading and writing
+@@ -698,14 +694,14 @@
+         isastream       fdetach
+         putmsg
+ 
+-config OPTION_EGLIBC_SUNRPC
++config EGLIBC_SUNRPC
+    bool "Support for the Sun 'RPC' protocol."
+-   depends OPTION_EGLIBC_INET
++   depends on EGLIBC_INET
+    help
+       This option group includes support for the Sun RPC protocols,
+       including the 'rpcgen' and 'rpcinfo' programs.
+ 
+-config OPTION_EGLIBC_UTMP
++config EGLIBC_UTMP
+     bool "Older access functions for 'utmp' login records"
+     help
+        This option group includes the older 'utent' family of
+@@ -732,9 +728,9 @@
+ 
+          libutil.so (and libutil.a)
+ 
+-config OPTION_EGLIBC_UTMPX
++config EGLIBC_UTMPX
+     bool "POSIX access functions for 'utmp' login records"
+-    depends OPTION_EGLIBC_UTMP    
++    depends on EGLIBC_UTMP
+     help
+        This option group includes the POSIX functions for reading and
+        writing user login records in the 'utmp' file (usually
+@@ -755,21 +751,21 @@
+          updwtmpx
+          utmpxname
+ 
+-config OPTION_EGLIBC_WORDEXP
++config EGLIBC_WORDEXP
+     bool "Shell-style word expansion"
+     help
+         This option group includes the 'wordexp' function for
+         performing word expansion in the manner of the shell, and the
+         accompanying 'wordfree' function.
+ 
+-config OPTION_POSIX_C_LANG_WIDE_CHAR
++config POSIX_C_LANG_WIDE_CHAR
+     bool "ISO C library wide character functions, excluding I/O"
+     help
+         This option group includes the functions defined by the ISO C
+         standard for working with wide and multibyte characters in
+         memory.  Functions for reading and writing wide and multibyte
+         characters from and to files call in the
+-        OPTION_POSIX_WIDE_CHAR_DEVICE_IO option group.
++        POSIX_WIDE_CHAR_DEVICE_IO option group.
+ 
+         This option group includes the following functions:
+ 
+@@ -791,14 +787,14 @@
+           mbrlen        wcscoll       wcstol
+           mbrtowc       wcscpy        wcstold
+ 
+-config OPTION_POSIX_REGEXP
++config POSIX_REGEXP
+     bool "Regular expressions"
+     help
+         This option group includes the POSIX regular expression
+         functions, and the associated non-POSIX extensions and
+         compatibility functions.
+ 
+-        With OPTION_POSIX_REGEXP disabled, the following functions are
++        With POSIX_REGEXP disabled, the following functions are
+         omitted from libc:
+ 
+           re_comp                 re_max_failures         regcomp
+@@ -812,9 +808,9 @@
+         <regexp.h> header file, 'compile', 'step', and 'advance', is
+         omitted.
+ 
+-config OPTION_POSIX_REGEXP_GLIBC
++config POSIX_REGEXP_GLIBC
+     bool "Regular expressions from GLIBC"
+-    depends OPTION_POSIX_REGEXP
++    depends on POSIX_REGEXP
+     help
+ 	This option group specifies which regular expression
+         library to use.  The choice is between regex
+@@ -823,9 +819,9 @@
+         optimized for speed; regex from libiberty is more than twice
+         as small while still is enough for most practical purposes.
+ 
+-config OPTION_POSIX_WIDE_CHAR_DEVICE_IO
++config POSIX_WIDE_CHAR_DEVICE_IO
+     bool "Input and output functions for wide characters"
+-    depends OPTION_POSIX_C_LANG_WIDE_CHAR
++    depends on POSIX_C_LANG_WIDE_CHAR
+     help
+         This option group includes functions for reading and writing
+         wide characters to and from <stdio.h> streams.
+Index: libc/Makefile
+===================================================================
+--- libc.orig/Makefile	2012-08-21 22:25:54.000000000 -0700
++++ libc/Makefile	2012-09-05 21:44:09.773577578 -0700
+@@ -24,6 +24,7 @@
+ 
+ include Makeconfig
+ 
++include options-config/Makefile
+ 
+ # This is the default target; it makes everything except the tests.
+ .PHONY: all
+Index: libc/configure
+===================================================================
+--- libc.orig/configure	2012-09-05 21:40:19.000000000 -0700
++++ libc/configure	2012-09-05 21:44:09.777577578 -0700
+@@ -628,6 +628,7 @@
+ libc_cv_have_bash2
+ BASH_SHELL
+ libc_cv_gcc_static_libgcc
++KCONFIG_TOOLS
+ CXX_SYSINCLUDES
+ SYSINCLUDES
+ AUTOCONF
+@@ -735,6 +736,7 @@
+ with_binutils
+ with_selinux
+ with_headers
++with_kconfig
+ with_default_link
+ enable_sanity_checks
+ enable_shared
+@@ -1425,6 +1427,9 @@
+   --with-selinux          if building with SELinux support
+   --with-headers=PATH     location of system headers to use (for example
+                           /usr/src/linux/include) [default=compiler default]
++  --with-kconfig=PATH     location of kconfig tools to use (from Linux kernel
++                          builds) to re-use for configuring EGLIBC option
++                          groups
+   --with-default-link     do not use explicit linker scripts
+   --with-pkgversion=PKG   Use PKG in the version string in place of "EGLIBC"
+   --with-bugurl=URL       Direct users to URL to report a bug
+@@ -3485,6 +3490,14 @@
+ 
+ 
+ 
++# Check whether --with-kconfig was given.
++if test "${with_kconfig+set}" = set; then
++  withval=$with_kconfig; KCONFIG_TOOLS=$withval
++else
++  KCONFIG_TOOLS=''
++fi
++
++
+ 
+ # Check whether --with-default-link was given.
+ if test "${with_default_link+set}" = set; then :
+Index: libc/EGLIBC.option-groups
+===================================================================
+--- libc.orig/EGLIBC.option-groups	2012-08-21 22:26:20.000000000 -0700
++++ libc/EGLIBC.option-groups	2012-09-05 21:44:09.777577578 -0700
+@@ -56,33 +56,9 @@
+ 
+ The Option Groups
+ 
+-EGLIBC currently implements the following option groups, also
+-documented in the file 'option-groups.def':
+-
+-OPTION_EGLIBC_CATGETS
+-       This option group includes functions for accessing message
+-       catalogs: catopen, catclose, and catgets.
+-
+-OPTION_EGLIBC_LOCALES
+-       This option group includes all locale definitions other than
+-       those for the "C" locale.  If this option group is omitted, then
+-       only the "C" locale is supported.
+-
+-OPTION_EGLIBC_LIBM
+-       This option group includes the 'libm' library, containing
+-       mathematical functions.  If this option group is omitted, then
+-       an EGLIBC installation does not include shared or unshared versions
+-       of the math library.
+-
+-       Note that this does not remove all floating-point related
+-       functionality from EGLIBC; for example, 'printf' and 'scanf'
+-       can still print and read floating-point values with this option
+-       group disabled.
+-
+-       Note that the ISO Standard C++ library 'libstdc++' depends on
+-       EGLIBC's math library 'libm'.  If you disable this option
+-       group, you will not be able to build 'libstdc++' against the
+-       resulting EGLIBC installation.
++To see the current full list of implemented option groups, refer to the
++file 'option-groups.def' at the top of the source tree, or run
++'make menuconfig' from the top-level build directory.
+ 
+ The POSIX.1-2001 specification includes a suggested partition of all
+ the functions in the POSIX C API into option groups: math functions
+@@ -110,6 +86,18 @@
+    OPTION_EGLIBC_LOCALES = n
+    OPTION_EGLIBC_LIBM = y
+ 
++Like the Linux kernel, EGLIBC supports a similar set of '*config' make
++targets to make it easier to create 'option-groups.config', with all
++dependencies between option groups automatically satisfied.  Run
++'make help' to see the list of supported make config targets.  For
++example, 'make menuconfig' will update the current config utilising a
++menu based program.
++
++The option group names and their type (boolean, int, hex, string), help
++description, and dependencies with other option groups, are described by
++'option-groups.def' at the top of the source tree, analogous to the
++'Kconfig' files in the Linux kernel.
++
+ In general, each option group variable controls whether a given set of
+ object files in EGLIBC is compiled and included in the final
+ libraries, or omitted from the build.
+@@ -132,22 +120,3 @@
+ 
+ We have used the system to subset some portions of EGLIBC's
+ functionality.  It needs to be extended to cover more of the library.
+-
+-At the moment, EGLIBC performs no sanity checks on the contents of
+-'option-groups.config'; if an option group's name is mistyped, the
+-option group is silently included in the build.  EGLIBC should check
+-that all variables set in 'option-groups.config' are proper option
+-group names, and that their values are appropriate.
+-
+-Some portions of EGLIBC depend on others; for example, the Sun Remote
+-Procedure Call functions in 'sunrpc' depend on the networking
+-functions in 'inet'.  The sanity checking described above should check
+-that the selection configuration satisfies dependencies within EGLIBC,
+-and produce a legible error message if it does not.  At the moment,
+-inconsistent configurations produce link errors late in the build
+-process.
+-
+-The Linux kernel's configuration system provides interactive
+-interfaces for creating and modifying configuration files (which also
+-perform the sanity checking and dependency tracking described above).
+-EGLIBC should provide similar interfaces.
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/0002-eglibc-menuconfig-hex-string-options.patch b/meta/recipes-core/eglibc/eglibc-2.16/0002-eglibc-menuconfig-hex-string-options.patch
new file mode 100644
index 0000000..7caba48
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/0002-eglibc-menuconfig-hex-string-options.patch
@@ -0,0 +1,169 @@
+pulled from
+
+http://www.eglibc.org/archives/patches/msg01043.html
+
+
+Upstream-Status: Pending
+Signed-off-by: Khem
+
+
+This patch builds on the menuconfig patch for EGLIBC.
+
+
+There are a few options that have non-boolean types, that would benefit from the new 'make *config' support:
+
+EGLIBC_MEMUSAGE_DEFAULT_BUFFER_SIZE (int)
+EGLIBC_NSSWITCH_FIXED_CONFIG (string)
+EGLIBC_NSSWITCH_FIXED_FUNCTIONS (string)
+
+
+The patch converts these to real options in libc/option-groups.def. Also, libc/scripts/option-groups.awk is modified to output a '#define' line for int, hex, or string options encountered in the config file.
+
+In the post-processing script config-postproc.pl, a small change is needed: for any boolean option FOO that is implicitly disabled in the kconfig output, make sure that option is indeed a boolean before printing the explicit OPTION_FOO=n.
+
+Finally, libc/malloc/Makefile passes __OPTION_EGLIBC_MEMUSAGE_DEFAULT_BUFFER_SIZE as a CPPFLAGS, which is not necessary anymore because this macro will now be present in the generated header.
+
+attached is the updated patch to address above issues.
+
+Steve
+
+--
+Steve Longerbeam | Senior Embedded Engineer, ESD Services
+Mentor Embedded(tm) | 46871 Bayside Parkway, Fremont, CA 94538
+P 510.354.5838 | M 408.410.2735
+Nucleus(r) | Linux(r) | Android(tm) | Services | UI | Multi-OS
+
+
+Index: libc/malloc/Makefile
+===================================================================
+--- libc.orig/malloc/Makefile	2012-01-04 22:06:18.000000000 -0800
++++ libc/malloc/Makefile	2012-05-09 19:35:28.598682105 -0700
+@@ -48,10 +48,6 @@
+ ifeq ($(OPTION_EGLIBC_MEMUSAGE),y)
+ extra-libs = libmemusage
+ extra-libs-others = $(extra-libs)
+-
+-ifdef OPTION_EGLIBC_MEMUSAGE_DEFAULT_BUFFER_SIZE
+-CPPFLAGS-memusage += -D__OPTION_EGLIBC_MEMUSAGE_DEFAULT_BUFFER_SIZE=$(OPTION_EGLIBC_MEMUSAGE_DEFAULT_BUFFER_SIZE)
+-endif
+ endif
+ 
+ libmemusage-routines = memusage
+Index: libc/option-groups.def
+===================================================================
+--- libc.orig/option-groups.def	2012-05-09 19:33:48.398677256 -0700
++++ libc/option-groups.def	2012-05-09 19:35:28.610682107 -0700
+@@ -513,8 +513,11 @@
+        the `memusage' and `memusagestat' utilities.
+        These components provide memory profiling functions.
+ 
+-       EGLIBC_MEMUSAGE_DEFAULT_BUFFER_SIZE
+-
++config EGLIBC_MEMUSAGE_DEFAULT_BUFFER_SIZE
++   int "Memory profiling library buffer size"
++   depends on EGLIBC_MEMUSAGE
++   default "32768"
++   help
+        Libmemusage library buffers the profiling data in memory
+        before writing it out to disk.  By default, the library
+        allocates 1.5M buffer, which can be substantial for some
+@@ -553,8 +556,11 @@
+        'option-groups.config' file must set the following two
+        variables:
+ 
+-       EGLIBC_NSSWITCH_FIXED_CONFIG
+-
++config EGLIBC_NSSWITCH_FIXED_CONFIG
++   string "Nsswitch fixed config filename"
++   depends on !EGLIBC_NSSWITCH
++   default ""
++   help
+           Set this to the name of a file whose contents observe the
+           same syntax as an ordinary '/etc/nsswitch.conf' file.  The
+           EGLIBC build process parses this file just as EGLIBC would
+@@ -576,8 +582,11 @@
+           you will probably want to delete references to databases not
+           needed on your system.
+ 
+-       EGLIBC_NSSWITCH_FIXED_FUNCTIONS
+-
++config EGLIBC_NSSWITCH_FIXED_FUNCTIONS
++   string "Nsswitch fixed functions filename"
++   depends on !EGLIBC_NSSWITCH
++   default ""
++   help
+           The EGLIBC build process uses this file to decide which
+           functions to make available from which service libraries.
+           The file 'nss/fixed-nsswitch.functions' serves as a sample
+Index: libc/options-config/config-postproc.pl
+===================================================================
+--- libc.orig/options-config/config-postproc.pl	2012-05-09 19:33:36.530676681 -0700
++++ libc/options-config/config-postproc.pl	2012-05-09 19:35:28.610682107 -0700
+@@ -8,7 +8,7 @@
+ die "Could not open $ARGV[0]" unless -T $ARGV[0];
+ 
+ sub yank {
+-    @option = grep($_ ne $_[0], @option);
++    @option = grep(!($_ =~ /$_[0]\s*=/), @option);
+ }
+ 
+ open(DEFAULTS, $defaults) || die "Could not open $defaults\n";
+@@ -16,7 +16,7 @@
+ # get the full list of available options using the default config file
+ $i = 0;
+ while (<DEFAULTS>) {
+-    if (/^\s*OPTION_(\w+)\s*=/) {
++    if (/^\s*OPTION_(\w+\s*=.*$)/) {
+ 	$option[$i++] = $1;
+     }
+ }
+@@ -35,8 +35,9 @@
+ 	s/CONFIG_/OPTION_/g;
+ 	print;
+     } elsif (/^\s*#\s+CONFIG_(\w+) is not set/) {
+-	# this is a comment line, change CONFIG_ to OPTION_, remove this
+-	# option from option list, and convert to explicit OPTION_FOO=n
++	# this is a comment line for an unset boolean option, change CONFIG_
++	# to OPTION_, remove this option from option list, and convert to
++	# explicit OPTION_FOO=n
+ 	$opt = $1;
+ 	yank($opt);
+ 	s/CONFIG_/OPTION_/g;
+@@ -46,9 +47,12 @@
+     }
+ }
+ 
+-# any options left in @options, are options that were not mentioned in
++# any boolean options left in @options, are options that were not mentioned in
+ # the config file, and implicitly that means the option must be set =n,
+ # so do that here.
+ foreach $opt (@option) {
+-    print "OPTION_$opt=n\n";
++    if ($opt =~ /=\s*[yn]/) {
++	$opt =~ s/=\s*[yn]/=n/;
++	print "OPTION_$opt\n";
++    }
+ }
+Index: libc/scripts/option-groups.awk
+===================================================================
+--- libc.orig/scripts/option-groups.awk	2012-01-04 22:06:00.000000000 -0800
++++ libc/scripts/option-groups.awk	2012-05-09 19:35:28.610682107 -0700
+@@ -46,9 +46,15 @@
+                 print "#define __" var " 1"
+             else if (vars[var] == "n")
+                 print "/* #undef __" var " */"
+-            # Ignore variables that don't have boolean values.
+-            # Ideally, this would be driven by the types given in
+-            # option-groups.def.
++	    else if (vars[var] ~ /^[0-9]+/ ||
++		     vars[var] ~ /^0x[0-9aAbBcCdDeEfF]+/ ||
++		     vars[var] ~ /^\"/)
++		 print "#define __" var " " vars[var]
++	    else
++		print "/* #undef __" var " */"
++            # Ignore variables that don't have boolean, int, hex, or
++	    # string values. Ideally, this would be driven by the types
++	    # given in option-groups.def.
+         }
+     }
+ 
diff --git a/meta/recipes-core/eglibc/eglibc-2.16/0003-eglibc-menuconfig-build-instructions.patch b/meta/recipes-core/eglibc/eglibc-2.16/0003-eglibc-menuconfig-build-instructions.patch
new file mode 100644
index 0000000..d137f5b
--- /dev/null
+++ b/meta/recipes-core/eglibc/eglibc-2.16/0003-eglibc-menuconfig-build-instructions.patch
@@ -0,0 +1,176 @@
+Pulled from
+
+http://www.eglibc.org/archives/patches/msg01035.html
+
+Upstream-Status: Pending
+Signed-off-by: Khem
+
+As part of the menuconfig development, I encountered some outdated information in the cross-build instructions, libc/EGLIBC.cross-building. This patch updates the file with new (and tested) instructions. It is unrelated to the menuconfig support, but applies after.
+
+My testing was done with an ARM target, and an x86_64 Linux host, so I converted the instructions to use those host/target types from the original i686/powerpc. Hope that's ok.
+
+
+Thanks,
+
+--
+Steve Longerbeam | Senior Embedded Engineer, ESD Services
+Mentor Embedded(tm) | 46871 Bayside Parkway, Fremont, CA 94538
+P 510.354.5838 | M 408.410.2735
+Nucleus(r) | Linux(r) | Android(tm) | Services | UI | Multi-OS
+
+
+ EGLIBC.cross-building |   59 +++++++++++++++++++++++++++++---------------------
+ 1 file changed, 35 insertions(+), 24 deletions(-)
+
+Index: libc/EGLIBC.cross-building
+===================================================================
+--- libc.orig/EGLIBC.cross-building	2012-05-09 19:33:36.522676681 -0700
++++ libc/EGLIBC.cross-building	2012-05-09 19:36:13.918684298 -0700
+@@ -47,31 +47,34 @@
+ EGLIBC requires recent versions of the GNU binutils, GCC, and the
+ Linux kernel.  The web page <http://www.eglibc.org/prerequisites>
+ documents the current requirements, and lists patches needed for
+-certain target architectures.  As of this writing, EGLIBC required
+-binutils 2.17, GCC 4.1, and Linux 2.6.19.1.
++certain target architectures.  As of this writing, these build
++instructions have been tested with binutils 2.22.51, GCC 4.6.2,
++and Linux 3.1.
+ 
+ First, let's set some variables, to simplify later commands.  We'll
+-build EGLIBC and GCC for a PowerPC target, known to the Linux kernel
+-as 'powerpc', and we'll do the build on an Intel Linux box:
++build EGLIBC and GCC for an ARM target, known to the Linux kernel
++as 'arm', and we'll do the build on an Intel x86_64 Linux box:
+ 
+-    $ build=i686-pc-linux-gnu
++    $ build=x86_64-pc-linux-gnu
+     $ host=$build
+-    $ target=powerpc-none-linux-gnu
+-    $ linux_arch=powerpc
++    $ target=arm-none-linux-gnueabi
++    $ linux_arch=arm
+ 
+ We're using the aforementioned versions of Binutils, GCC, and Linux:
+ 
+-    $ binutilsv=binutils-2.17
+-    $ gccv=gcc-4.1.1
+-    $ linuxv=linux-2.6.20
++    $ binutilsv=binutils-2.22.51
++    $ gccv=gcc-4.6.2
++    $ linuxv=linux-3.1
+ 
+ We're carrying out the entire process under '~/cross-build', which
+-contains unpacked source trees:
++contains unpacked source trees for binutils, gcc, and linux kernel,
++along with EGLIBC svn trunk (which can be checked-out with
++'svn co http://www.eglibc.org/svn/trunk eglibc'):
+ 
+-    $ top=$HOME/cross-build/ppc
++    $ top=$HOME/cross-build/$target
+     $ src=$HOME/cross-build/src
+     $ ls $src
+-    binutils-2.17  gcc-4.1.1  libc  linux-2.6.20
++    binutils-2.22.51  eglibc  gcc-4.6.2  linux-3.1
+ 
+ We're going to place our build directories in a subdirectory 'obj',
+ we'll install the cross-development toolchain in 'tools', and we'll
+@@ -99,7 +102,7 @@
+ 
+ The First GCC
+ 
+-For our work, we need a cross-compiler targeting a PowerPC Linux
++For our work, we need a cross-compiler targeting an ARM Linux
+ system.  However, that configuration includes the shared library
+ 'libgcc_s.so', which is compiled against the EGLIBC headers (which we
+ haven't installed yet) and linked against 'libc.so' (which we haven't
+@@ -125,7 +128,8 @@
+     >     --prefix=$tools \
+     >     --without-headers --with-newlib \
+     >     --disable-shared --disable-threads --disable-libssp \
+-    >     --disable-libgomp --disable-libmudflap \
++    >     --disable-libgomp --disable-libmudflap --disable-libquadmath \
++    >     --disable-decimal-float --disable-libffi \
+     >     --enable-languages=c
+     $ PATH=$tools/bin:$PATH make
+     $ PATH=$tools/bin:$PATH make install
+@@ -162,12 +166,13 @@
+     > CXX=$tools/bin/$target-g++ \
+     > AR=$tools/bin/$target-ar \
+     > RANLIB=$tools/bin/$target-ranlib \
+-    > $src/libc/configure \
++    > $src/eglibc/libc/configure \
+     >     --prefix=/usr \
+     >     --with-headers=$sysroot/usr/include \
+     >     --build=$build \
+     >     --host=$target \
+-    >     --disable-profile --without-gd --without-cvs --enable-add-ons
++    >     --disable-profile --without-gd --without-cvs \
++    >     --enable-add-ons=nptl,libidn,../ports
+ 
+ The option '--prefix=/usr' may look strange, but you should never
+ configure EGLIBC with a prefix other than '/usr': in various places,
+@@ -181,6 +186,11 @@
+ The '--with-headers' option tells EGLIBC where the Linux headers have
+ been installed.  
+ 
++The '--enable-add-ons=nptl,libidn,../ports' option tells EGLIBC to look
++for the listed glibc add-ons. Most notably the ports add-on (located
++just above the libc sources in the EGLIBC svn tree) is required to
++support ARM targets.
++
+ We can now use the 'install-headers' makefile target to install the
+ headers:
+ 
+@@ -223,6 +233,7 @@
+     >     --prefix=$tools \
+     >     --with-sysroot=$sysroot \
+     >     --disable-libssp --disable-libgomp --disable-libmudflap \
++    >     --disable-libffi --disable-libquadmath \
+     >     --enable-languages=c
+     $ PATH=$tools/bin:$PATH make
+     $ PATH=$tools/bin:$PATH make install
+@@ -240,13 +251,14 @@
+     > CXX=$tools/bin/$target-g++ \
+     > AR=$tools/bin/$target-ar \
+     > RANLIB=$tools/bin/$target-ranlib \
+-    > $src/libc/configure \
++    > $src/eglibc/libc/configure \
+     >     --prefix=/usr \
+     >     --with-headers=$sysroot/usr/include \
+     >     --with-kconfig=$obj/linux/scripts/kconfig \
+     >     --build=$build \
+     >     --host=$target \
+-    >     --disable-profile --without-gd --without-cvs --enable-add-ons
++    >     --disable-profile --without-gd --without-cvs \
++    >     --enable-add-ons=nptl,libidn,../ports
+ 
+ Note the additional '--with-kconfig' option. This tells EGLIBC where to
+ find the host config tools used by the kernel 'make config' and 'make
+@@ -337,15 +349,15 @@
+     ELF Header:
+     ...
+       Type:                              EXEC (Executable file)
+-      Machine:                           PowerPC
++      Machine:                           ARM
+ 
+     ...
+     Program Headers:
+       Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
+       PHDR           0x000034 0x10000034 0x10000034 0x00100 0x00100 R E 0x4
+-      INTERP         0x000134 0x10000134 0x10000134 0x0000d 0x0000d R   0x1
+-          [Requesting program interpreter: /lib/ld.so.1]
+-      LOAD           0x000000 0x10000000 0x10000000 0x008f0 0x008f0 R E 0x10000
++      INTERP         0x000134 0x00008134 0x00008134 0x00013 0x00013 R   0x1
++          [Requesting program interpreter: /lib/ld-linux.so.3]
++      LOAD           0x000000 0x00008000 0x00008000 0x0042c 0x0042c R E 0x8000
+     ...
+ 
+ Looking at the dynamic section of the installed 'libgcc_s.so', we see
+@@ -357,7 +369,6 @@
+     Dynamic section at offset 0x1083c contains 24 entries:
+       Tag        Type                         Name/Value
+      0x00000001 (NEEDED)                     Shared library: [libc.so.6]
+-     0x00000001 (NEEDED)                     Shared library: [ld.so.1]
+      0x0000000e (SONAME)                     Library soname: [libgcc_s.so.1]
+     ...
+ 
diff --git a/meta/recipes-core/eglibc/eglibc_2.16.bb b/meta/recipes-core/eglibc/eglibc_2.16.bb
index c4bc18c..5a10387 100644
--- a/meta/recipes-core/eglibc/eglibc_2.16.bb
+++ b/meta/recipes-core/eglibc/eglibc_2.16.bb
@@ -3,7 +3,7 @@ require eglibc.inc
 SRCREV = "20393"
 
 DEPENDS += "gperf-native"
-PR = "r7"
+PR = "r8"
 PR_append = "+svnr${SRCPV}"
 
 EGLIBC_BRANCH="eglibc-2_16"
@@ -26,6 +26,9 @@ SRC_URI = "svn://www.eglibc.org/svn/branches/;module=${EGLIBC_BRANCH};protocol=h
            file://add_resource_h_to_wait_h.patch \
            file://0001-Avoid-use-of-libgcc_s-and-libgcc_eh-when-building-gl.patch \
            file://0001-Add-ARM-specific-static-stubs.c.patch \
+           file://0001-eglibc-menuconfig-support.patch \
+           file://0002-eglibc-menuconfig-hex-string-options.patch \
+           file://0003-eglibc-menuconfig-build-instructions.patch \
           "
 LIC_FILES_CHKSUM = "file://LICENSES;md5=98a1128c4b58120182cbea3b1752d8b9 \
       file://COPYING;md5=393a5ca445f6965873eca0259a17f833 \
-- 
1.7.9.5



