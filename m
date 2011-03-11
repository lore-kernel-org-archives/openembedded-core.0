Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Py8sl-0007qz-4n
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Mar 2011 21:24:20 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Mar 2011 12:22:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,304,1297065600"; d="scan'208";a="719235585"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by orsmga001.jf.intel.com with ESMTP; 11 Mar 2011 12:22:40 -0800
Message-Id: <94a9a8d5df955ef3d7cecba72778998b725c6198.1299874717.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1299874717.git.nitin.a.kamble@intel.com>
References: <cover.1299874717.git.nitin.a.kamble@intel.com>
Old-Date: Fri, 11 Mar 2011 10:08:01 -0800
Date: Fri, 11 Mar 2011 12:22:40 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] perl: another set of parallel build fixes
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
X-List-Received-Date: Fri, 11 Mar 2011 20:24:20 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

[YOCTO #784]

Imported more commits from the perl upstream tree

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../perl/perl-5.12.2/Makefile.SH.patch             |   44 +-
 .../perl/perl-5.12.2/parallel_build_fix_4.patch    |   55 +++
 .../perl/perl-5.12.2/parallel_build_fix_5.patch    |  428 ++++++++++++++++++++
 .../perl/perl-5.12.2/parallel_build_fix_6.patch    |  156 +++++++
 meta/recipes-devtools/perl/perl-native_5.12.2.bb   |    5 +-
 meta/recipes-devtools/perl/perl_5.12.2.bb          |    5 +-
 6 files changed, 669 insertions(+), 24 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_4.patch
 create mode 100644 meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_5.patch
 create mode 100644 meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_6.patch

diff --git a/meta/recipes-devtools/perl/perl-5.12.2/Makefile.SH.patch b/meta/recipes-devtools/perl/perl-5.12.2/Makefile.SH.patch
index 103fe97..39e5fee 100644
--- a/meta/recipes-devtools/perl/perl-5.12.2/Makefile.SH.patch
+++ b/meta/recipes-devtools/perl/perl-5.12.2/Makefile.SH.patch
@@ -166,12 +166,12 @@ Index: perl-5.12.2/Makefile.SH
  	$(MINIPERL) $(Icwd) mkppport
  
  !NO!SUBS!
-@@ -970,30 +979,30 @@ esac
+@@ -970,29 +979,29 @@ esac
  $spitshell >>$Makefile <<'!NO!SUBS!'
  
  .PHONY: preplibrary
--preplibrary: $(MINIPERL_EXE) $(CONFIGPM) lib/re.pm $(PREPLIBRARY_LIBPERL)
-+preplibrary: $(CONFIGPM) lib/re.pm $(PREPLIBRARY_LIBPERL)
+-preplibrary: $(MINIPERL_EXE) $(CONFIGPM) $(PREPLIBRARY_LIBPERL)
++preplibrary: $(CONFIGPM) $(PREPLIBRARY_LIBPERL)
  
  $(CONFIGPM_FROM_CONFIG_SH): $(CONFIGPOD)
  
@@ -183,10 +183,6 @@ Index: perl-5.12.2/Makefile.SH
 +lib/ExtUtils/Miniperl.pm: miniperlmain.c minimod.pl $(CONFIGPM)
  	$(MINIPERL) minimod.pl > lib/ExtUtils/Miniperl.pm
  
- lib/re.pm: ext/re/re.pm
- 	@-rm -f $@
- 	cp ext/re/re.pm lib/re.pm
- 
 -$(plextract):	$(MINIPERL_EXE) $(CONFIGPM) x2p/s2p $(dynamic_ext)
 +$(plextract):	$(CONFIGPM) x2p/s2p $(dynamic_ext)
  	@-rm -f $@
@@ -196,6 +192,10 @@ Index: perl-5.12.2/Makefile.SH
 +x2p/s2p: $(CONFIGPM) $(dynamic_ext) x2p/s2p.PL
  	cd x2p; $(LDLIBPTH) $(MAKE) s2p
  
+-lib/buildcustomize.pl: $(MINIPERL_EXE) write_buildcustomize.pl
++lib/buildcustomize.pl: write_buildcustomize.pl
+ 	$(MINIPERL) write_buildcustomize.pl >lib/buildcustomize.pl
+ 
  unidatafiles $(unidatafiles) pod/perluniprops.pod: uni.data
  
 -uni.data: $(MINIPERL_EXE) $(CONFIGPM) lib/unicore/mktables $(nonxs_ext)
@@ -203,7 +203,7 @@ Index: perl-5.12.2/Makefile.SH
  	$(MINIPERL) $(Icwd) lib/unicore/mktables -C lib/unicore -P pod -maketest -makelist -p
  #	Commented out so always runs, mktables looks at far more files than we
  #	can in this makefile to decide if needs to run or not
-@@ -1002,21 +1011,21 @@ uni.data: $(MINIPERL_EXE) $(CONFIGPM) li
+@@ -1001,21 +1010,21 @@ uni.data: $(MINIPERL_EXE) $(CONFIGPM) li
  # $(PERL_EXE) and ext because buildtoc uses Text::Wrap uses re
  # But also this ensures that all extensions are built before we try to scan
  # them, which picks up Devel::PPPort's documentation.
@@ -230,7 +230,7 @@ Index: perl-5.12.2/Makefile.SH
  	-@test ! -f extra.pods || rm -f `cat extra.pods`
  	-@rm -f extra.pods
  	-@for x in `grep -l '^=[a-z]' README.* | grep -v README.vms` ; do \
-@@ -1059,11 +1068,7 @@ no-install:
+@@ -1058,11 +1067,7 @@ no-install:
  INSTALL_DEPENDENCE = all
  
  install.perl:	$(INSTALL_DEPENDENCE) installperl
@@ -243,28 +243,28 @@ Index: perl-5.12.2/Makefile.SH
  
  # XXX Experimental. Hardwired values, but useful for testing.
  # Eventually Configure could ask for some of these values.
-@@ -1160,16 +1165,16 @@ manicheck:	FORCE
+@@ -1159,16 +1164,16 @@ manicheck:	FORCE
  #
  # DynaLoader may be needed for extensions that use Makefile.PL.
  
--$(DYNALOADER):	$(MINIPERL_EXE) preplibrary FORCE $(nonxs_ext)
-+$(DYNALOADER):	preplibrary FORCE $(nonxs_ext)
+-$(DYNALOADER):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary FORCE $(nonxs_ext)
++$(DYNALOADER):	lib/buildcustomize.pl preplibrary FORCE $(nonxs_ext)
  	$(MINIPERL) make_ext.pl $@ MAKE=$(MAKE) LIBPERL_A=$(LIBPERL) LINKTYPE=static $(STATIC_LDFLAGS)
  
--d_dummy $(dynamic_ext):	$(MINIPERL_EXE) preplibrary makeppport $(DYNALOADER) FORCE $(PERLEXPORT)
-+d_dummy $(dynamic_ext):	preplibrary makeppport $(DYNALOADER) FORCE $(PERLEXPORT)
+-d_dummy $(dynamic_ext):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary makeppport $(DYNALOADER) FORCE $(PERLEXPORT)
++d_dummy $(dynamic_ext):	lib/buildcustomize.pl preplibrary makeppport $(DYNALOADER) FORCE $(PERLEXPORT)
  	$(MINIPERL) make_ext.pl $@ MAKE=$(MAKE) LIBPERL_A=$(LIBPERL) LINKTYPE=dynamic
  
--s_dummy $(static_ext):	$(MINIPERL_EXE) preplibrary makeppport $(DYNALOADER) FORCE
-+s_dummy $(static_ext):	preplibrary makeppport $(DYNALOADER) FORCE
+-s_dummy $(static_ext):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary makeppport $(DYNALOADER) FORCE
++s_dummy $(static_ext):	lib/buildcustomize.pl preplibrary makeppport $(DYNALOADER) FORCE
  	$(MINIPERL) make_ext.pl $@ MAKE=$(MAKE) LIBPERL_A=$(LIBPERL) LINKTYPE=static $(STATIC_LDFLAGS)
  
--n_dummy $(nonxs_ext):	$(MINIPERL_EXE) preplibrary FORCE
-+n_dummy $(nonxs_ext):	preplibrary FORCE
+-n_dummy $(nonxs_ext):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary FORCE
++n_dummy $(nonxs_ext):	lib/buildcustomize.pl preplibrary FORCE
  	$(MINIPERL) make_ext.pl $@ MAKE=$(MAKE) LIBPERL_A=$(LIBPERL)
  !NO!SUBS!
  
-@@ -1367,10 +1372,10 @@ _test:
+@@ -1366,10 +1371,10 @@ _test:
  
  test_prep_pre: preplibrary utilities $(nonxs_ext)
  
@@ -277,12 +277,12 @@ Index: perl-5.12.2/Makefile.SH
  	$(MINIPERL) make_ext.pl $(dynamic_ext_re) MAKE=$(MAKE) LIBPERL_A=$(LIBPERL) LINKTYPE=dynamic
  	cd t && (rm -f $(PERL_EXE); $(LNS) ../$(PERL_EXE) $(PERL_EXE))
  
-@@ -1461,7 +1466,7 @@ minitest.prep:
+@@ -1460,7 +1465,7 @@ minitest.prep:
  
  # Can't depend on lib/Config.pm because that might be where miniperl
  # is crashing.
--minitest: $(MINIPERL_EXE) lib/re.pm minitest.prep
-+minitest: lib/re.pm minitest.prep
+-minitest: $(MINIPERL_EXE) minitest.prep
++minitest: minitest.prep
  	- cd t && (rm -f $(PERL_EXE); $(LNS) ../$(MINIPERL_EXE) $(PERL_EXE)) \
  		&& $(RUN_PERL) TEST -minitest base/*.t comp/*.t cmd/*.t run/*.t io/*.t re/*.t op/*.t uni/*.t </dev/tty
  
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_4.patch b/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_4.patch
new file mode 100644
index 0000000..1a047bc
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_4.patch
@@ -0,0 +1,55 @@
+commit 43c0c913165d6abe1bc0cb45a784eb1c32c3700b
+Author: Nicholas Clark <nick@ccl4.org>
+Date:   Mon Feb 14 09:06:42 2011 +0000
+
+    For miniperl, use the USE_SITECUSTOMIZE feature to load the build-time @INC
+    
+    For miniperl (only), always enable USE_SITECUSTOMIZE, but change it to load
+    a buildcustomize.pl file from $INC[0], if present. The default @INC for
+    miniperl is '.', so by default this does nothing.
+
+diff --git a/perl.c b/perl.c
+index 8f8565d..6bb9f46 100644
+--- a/perl.c
++++ b/perl.c
+@@ -24,6 +24,10 @@
+  * function of the interpreter; that can be found in perlmain.c
+  */
+ 
++#ifdef PERL_IS_MINIPERL
++#  define USE_SITECUSTOMIZE
++#endif
++
+ #include "EXTERN.h"
+ #define PERL_IN_PERL_C
+ #include "perl.h"
+@@ -1973,15 +1977,26 @@ S_parse_body(pTHX_ char **env, XSINIT_t xsinit)
+     }
+     }
+ 
+-#if defined(USE_SITECUSTOMIZE) && !defined(PERL_IS_MINIPERL)
++#if defined(USE_SITECUSTOMIZE)
+     if (!minus_f) {
+-	/* SITELIB_EXP is a function call on Win32.
+-	   The games with local $! are to avoid setting errno if there is no
++	/* The games with local $! are to avoid setting errno if there is no
+ 	   sitecustomize script.  */
++#  ifdef PERL_IS_MINIPERL
++	AV *const inc = GvAV(PL_incgv);
++	SV **const inc0 = inc ? av_fetch(inc, 0, FALSE) : NULL;
++
++	if (inc0) {
++	    (void)Perl_av_create_and_unshift_one(aTHX_ &PL_preambleav,
++						 Perl_newSVpvf(aTHX_
++							       "BEGIN { do {local $!; -f '%"SVf"/buildcustomize.pl'} && do '%"SVf"/buildcustomize.pl' }", *inc0, *inc0));
++	}
++#  else
++	/* SITELIB_EXP is a function call on Win32.  */
+ 	const char *const sitelib = SITELIB_EXP;
+ 	(void)Perl_av_create_and_unshift_one(aTHX_ &PL_preambleav,
+ 					     Perl_newSVpvf(aTHX_
+ 							   "BEGIN { do {local $!; -f '%s/sitecustomize.pl'} && do '%s/sitecustomize.pl' }", sitelib, sitelib));
++#  endif
+     }
+ #endif
+ 
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_5.patch b/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_5.patch
new file mode 100644
index 0000000..abc1922
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_5.patch
@@ -0,0 +1,428 @@
+Rebased by Nitin A Kamble <nitin.a.kamble@intel.com> on 3/11/2011
+
+commit 5e4c4c91bd52a48de59520d5e9b4e3478e49c613
+Author: Nicholas Clark <nick@ccl4.org>
+Date:   Mon Feb 14 10:14:18 2011 +0000
+
+    Use a buildcustomize.pl to set @INC in miniperl when building extensions.
+    
+    With the build tools now shipped in various subdirectories of cpan/ and dist/
+    we need to add several paths to @INC when invoking MakeMaker (etc) to build
+    extensions.
+    
+    The previous approach of using $ENV{PERL5LIB} was fragile, because:
+    a: It was hitting the length limit for %ENV variables on VMS
+    b: It was running the risk of race conditions in a parallel build -
+       ExtUtils::Makemaker "knows" to add -I../..lib, which puts lib at the *front*
+       of @INC, but if one parallel process happens to copy a module into lib/
+       whilst another is searching for it, the second may get a partial read
+    c: Overwriting $ENV{PERL5LIB} breaks any system where any of the installed
+       build tools are actually implemented in Perl, if they are relying on
+       $ENV{PERL5LIB} for setup
+    
+    This approach
+    
+    a: Doesn't have %ENV length limits
+    b: Ensures that lib/ is last, so copy targets are always shadowing copy
+       sources
+    c: Only affects miniperl, and doesn't touch $ENV{PERL5LIB}
+    
+    Approaches that turned out to have fatal flaws:
+    
+    1: Using $ENV{PERL5OPT} with a module fails because ExtUtils::MakeMaker
+       searches for the build perl without setting lib, and treats the error
+       caused by a failed -M as "not a valid perl 5 binary"
+    2: Refactoring ExtUtils::MakeMaker to *not* use -I for lib, and instead rely
+       on $ENV{PERL5LIB} [which includes "../../lib"] fails because:
+       some extensions have subdirectories, and on these EU::MM correctly uses
+       -I../../../lib, where as $ENV{PERL5LIB} only has space for relative paths,
+       and only with two levels.
+    
+    This approach actually takes advantage of ExtUtils::MakeMaker setting an -I
+    option correct for the depth of directory being built.
+
+Index: perl-5.12.2/Cross/Makefile-cross-SH
+===================================================================
+--- perl-5.12.2.orig/Cross/Makefile-cross-SH
++++ perl-5.12.2/Cross/Makefile-cross-SH
+@@ -324,7 +324,7 @@ $spitshell >>$Makefile <<'!NO!SUBS!'
+ 
+ CONFIGPM = xlib/$(CROSS_NAME)/Config.pm
+ 
+-private = preplibrary $(CONFIGPM) $(CROSS_LIB)/Config.pod
++private = preplibrary $(CONFIGPM) $(CROSS_LIB)/Config.pod lib/buildcustomize.pl
+ 
+ shextract = Makefile cflags config.h makeaperl makedepend \
+ 	makedir myconfig writemain pod/Makefile
+@@ -752,6 +752,9 @@ lib/lib.pm:	miniperl $(CONFIGPM)
+ 	@-rm -f $@
+ 	$(LDLIBPTH) ./miniperl -Ilib -MCross lib/lib_pm.PL
+ 
++lib/buildcustomize.pl: $(MINIPERL_EXE) write_buildcustomize.pl
++	$(MINIPERL) write_buildcustomize.pl >lib/buildcustomize.pl
++
+ unidatafiles $(unidatafiles): uni.data
+ 
+ uni.data: miniperl$(EXE_EXT) $(CONFIGPM) lib/unicore/mktables
+@@ -922,16 +925,16 @@ manicheck:	FORCE
+ 
+ 
+ 
+-$(DYNALOADER):	preplibrary FORCE
++$(DYNALOADER): lib/buildcustomize.pl preplibrary FORCE
+ 	@$(LDLIBPTH) $(RUN) ./miniperl$(EXE_EXT) -Ilib make_ext.pl --cross $@ MAKE=$(MAKE) LIBPERL_A=$(LIBPERL) LINKTYPE=static $(STATIC_LDFLAGS)
+ 
+-d_dummy $(dynamic_ext):	miniperl$(EXE_EXT) preplibrary makeppport $(DYNALOADER) FORCE
++d_dummy $(dynamic_ext):	miniperl$(EXE_EXT) lib/buildcustomize.pl preplibrary makeppport $(DYNALOADER) FORCE
+ 	@$(LDLIBPTH) $(RUN) ./miniperl$(EXE_EXT) -Ilib make_ext.pl --cross $@ MAKE=$(MAKE) LIBPERL_A=$(LIBPERL) LINKTYPE=dynamic
+ 
+-s_dummy $(static_ext):	miniperl$(EXE_EXT) preplibrary makeppport $(DYNALOADER) FORCE
++s_dummy $(static_ext):	miniperl$(EXE_EXT) lib/buildcustomize.pl preplibrary makeppport $(DYNALOADER) FORCE
+ 	@$(LDLIBPTH) $(RUN) ./miniperl$(EXE_EXT) -Ilib make_ext.pl --cross $@ MAKE=$(MAKE) LIBPERL_A=$(LIBPERL) LINKTYPE=static $(STATIC_LDFLAGS)
+ 
+-n_dummy $(nonxs_ext):	miniperl$(EXE_EXT) preplibrary $(DYNALOADER) FORCE
++n_dummy $(nonxs_ext):	miniperl$(EXE_EXT) lib/buildcustomize.pl preplibrary $(DYNALOADER) FORCE
+ 	@$(LDLIBPTH) $(RUN) ./miniperl$(EXE_EXT) -Ilib make_ext.pl --cross $@ MAKE=$(MAKE) LIBPERL_A=$(LIBPERL)
+ !NO!SUBS!
+ 
+Index: perl-5.12.2/MANIFEST
+===================================================================
+--- perl-5.12.2.orig/MANIFEST
++++ perl-5.12.2/MANIFEST
+@@ -4747,6 +4747,7 @@ win32/wince.c			WinCE port
+ win32/wince.h			WinCE port
+ win32/wincesck.c		WinCE port
+ writemain.SH			Generate perlmain.c from miniperlmain.c+extensions
++write_buildcustomize.pl		Generate lib/buildcustomize.pl
+ x2p/a2p.c			Output of a2p.y run through byacc
+ x2p/a2p.h			Global declarations
+ x2p/a2p.pod			Pod for awk to perl translator
+Index: perl-5.12.2/Makefile.SH
+===================================================================
+--- perl-5.12.2.orig/Makefile.SH
++++ perl-5.12.2/Makefile.SH
+@@ -428,7 +428,7 @@ esac
+ ## In the following dollars and backticks do not need the extra backslash.
+ $spitshell >>$Makefile <<'!NO!SUBS!'
+ 
+-private = preplibrary $(CONFIGPM) $(CONFIGPOD) lib/ExtUtils/Miniperl.pm git_version.h
++private = preplibrary $(CONFIGPM) $(CONFIGPOD) lib/ExtUtils/Miniperl.pm git_version.h lib/buildcustomize.pl
+ 
+ # Files to be built with variable substitution before miniperl
+ # is available.
+@@ -991,6 +991,9 @@ $(plextract):	$(MINIPERL_EXE) $(CONFIGPM
+ x2p/s2p: $(MINIPERL_EXE) $(CONFIGPM) $(dynamic_ext) x2p/s2p.PL
+ 	cd x2p; $(LDLIBPTH) $(MAKE) s2p
+ 
++lib/buildcustomize.pl: $(MINIPERL_EXE) write_buildcustomize.pl
++	$(MINIPERL) write_buildcustomize.pl >lib/buildcustomize.pl
++
+ unidatafiles $(unidatafiles) pod/perluniprops.pod: uni.data
+ 
+ uni.data: $(MINIPERL_EXE) $(CONFIGPM) lib/unicore/mktables $(nonxs_ext)
+@@ -1160,16 +1163,16 @@ manicheck:	FORCE
+ #
+ # DynaLoader may be needed for extensions that use Makefile.PL.
+ 
+-$(DYNALOADER):	$(MINIPERL_EXE) preplibrary FORCE $(nonxs_ext)
++$(DYNALOADER):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary FORCE $(nonxs_ext)
+ 	$(MINIPERL) make_ext.pl $@ MAKE=$(MAKE) LIBPERL_A=$(LIBPERL) LINKTYPE=static $(STATIC_LDFLAGS)
+ 
+-d_dummy $(dynamic_ext):	$(MINIPERL_EXE) preplibrary makeppport $(DYNALOADER) FORCE $(PERLEXPORT)
++d_dummy $(dynamic_ext):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary makeppport $(DYNALOADER) FORCE $(PERLEXPORT)
+ 	$(MINIPERL) make_ext.pl $@ MAKE=$(MAKE) LIBPERL_A=$(LIBPERL) LINKTYPE=dynamic
+ 
+-s_dummy $(static_ext):	$(MINIPERL_EXE) preplibrary makeppport $(DYNALOADER) FORCE
++s_dummy $(static_ext):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary makeppport $(DYNALOADER) FORCE
+ 	$(MINIPERL) make_ext.pl $@ MAKE=$(MAKE) LIBPERL_A=$(LIBPERL) LINKTYPE=static $(STATIC_LDFLAGS)
+ 
+-n_dummy $(nonxs_ext):	$(MINIPERL_EXE) preplibrary FORCE
++n_dummy $(nonxs_ext):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary FORCE
+ 	$(MINIPERL) make_ext.pl $@ MAKE=$(MAKE) LIBPERL_A=$(LIBPERL)
+ !NO!SUBS!
+ 
+Index: perl-5.12.2/installperl
+===================================================================
+--- perl-5.12.2.orig/installperl
++++ perl-5.12.2/installperl
+@@ -714,6 +714,8 @@ sub installlib {
+     # ignore the test extensions
+     return if $dir =~ m{\bXS/(?:APItest|Typemap)\b};
+     return if $name =~ m{\b(?:APItest|Typemap)\.pm$};
++    # ignore the build support code
++    return if $name =~ /\bbuildcustomize\.pl$/;
+     # ignore the demo files
+     return if $dir =~ /\b(?:demos?|eg)\b/;
+ 
+Index: perl-5.12.2/make_ext.pl
+===================================================================
+--- perl-5.12.2.orig/make_ext.pl
++++ perl-5.12.2/make_ext.pl
+@@ -4,11 +4,9 @@ use warnings;
+ use Config;
+ BEGIN {
+     if ($^O eq 'MSWin32') {
+-	unshift @INC, ('../cpan/Cwd', '../cpan/Cwd/lib');
+-	require File::Spec::Functions;
++	unshift @INC, '../cpan/Cwd';
+ 	require FindExt;
+-    }
+-    else {
++    } else {
+ 	unshift @INC, 'cpan/Cwd';
+     }
+ }
+@@ -18,27 +16,6 @@ my $is_Win32 = $^O eq 'MSWin32';
+ my $is_VMS = $^O eq 'VMS';
+ my $is_Unix = !$is_Win32 && !$is_VMS;
+ 
+-# To clarify, this isn't the entire suite of modules considered "toolchain"
+-# It's not even all modules needed to build ext/
+-# It's just the source paths of the (minimum complete set of) modules in ext/
+-# needed to build the nonxs modules
+-# After which, all nonxs modules are in lib, which was always sufficient to
+-# allow miniperl to build everything else.
+-
+-# This list cannot get any longer without overflowing the length limit for
+-# environment variables on VMS
+-my @toolchain = qw(cpan/AutoLoader/lib
+-		   cpan/Cwd cpan/Cwd/lib
+-		   cpan/ExtUtils-Command/lib
+-		   dist/ExtUtils-Install/lib
+-		   cpan/ExtUtils-MakeMaker/lib
+-		   cpan/ExtUtils-Manifest/lib
+-		   cpan/File-Path/lib
+-		   );
+-
+-# Used only in ExtUtils::Liblist::Kid::_win32_ext()
+-push @toolchain, 'cpan/Text-ParseWords/lib' if $is_Win32;
+-
+ my @ext_dirs = qw(cpan dist ext);
+ my $ext_dirs_re = '(?:' . join('|', @ext_dirs) . ')';
+ 
+@@ -295,16 +272,7 @@ sub build_extension {
+     $perl ||= "$up/miniperl";
+     my $return_dir = $up;
+     my $lib_dir = "$up/lib";
+-    # $lib_dir must be last, as we're copying files into it, and in a parallel
+-    # make there's a race condition if one process tries to open a module that
+-    # another process has half-written.
+-    my @new_inc = ((map {"$up/$_"} @toolchain), $lib_dir);
+-    if ($is_Win32) {
+-	@new_inc = map {File::Spec::Functions::rel2abs($_)} @new_inc;
+-    }
+-    $ENV{PERL5LIB} = join $Config{path_sep}, @new_inc;
+     $ENV{PERL_CORE} = 1;
+-    # warn $ENV{PERL5LIB};
+ 
+     my $makefile;
+     if ($is_VMS) {
+@@ -375,7 +343,7 @@ EOM
+ 	    @cross = '-MCross';
+ 	}
+ 	    
+-	my @args = (@cross, 'Makefile.PL');
++	my @args = ("-I$lib_dir", @cross, 'Makefile.PL');
+ 	if ($is_VMS) {
+ 	    my $libd = VMS::Filespec::vmspath($lib_dir);
+ 	    push @args, "INST_LIB=$libd", "INST_ARCHLIB=$libd";
+Index: perl-5.12.2/vms/descrip_mms.template
+===================================================================
+--- perl-5.12.2.orig/vms/descrip_mms.template
++++ perl-5.12.2/vms/descrip_mms.template
+@@ -360,7 +360,7 @@ CRTLOPTS =,$(CRTL)/Options
+ unidatadirs = lib/unicore/To lib/unicore/lib
+ 
+ # Modules which must be installed before we can build extensions
+-LIBPREREQ = $(ARCHDIR)Config.pm $(ARCHDIR)Config_heavy.pl [.lib.VMS]Filespec.pm $(ARCHDIR)vmspipe.com [.lib]re.pm
++LIBPREREQ = $(ARCHDIR)Config.pm $(ARCHDIR)Config_heavy.pl [.lib.VMS]Filespec.pm $(ARCHDIR)vmspipe.com [.lib]re.pm [.lib]buildcustomize.pl
+ 
+ utils1 = [.lib.pods]perldoc.com [.lib.ExtUtils]Miniperl.pm [.utils]c2ph.com [.utils]h2ph.com 
+ utils2 = [.utils]h2xs.com [.utils]libnetcfg.com [.lib]perlbug.com [.utils]dprofpp.com 
+@@ -458,6 +458,9 @@ archcorefiles : $(ac) $(ARCHAUTO)time.st
+ [.lib]re.pm  : [.ext.re]re.pm
+ 	Copy/NoConfirm/Log $(MMS$SOURCE) [.lib]
+ 
++[.lib]buildcustomize.pl : write_buildcustomize.pl $(MINIPERL_EXE)
++       $(MINIPERL) write_buildcustomize.pl > [.lib]buildcustomize.pl
++
+ vmspipe.com : [.vms]vmspipe.com
+ 	Copy/NoConfirm/Log $(MMS$SOURCE) []
+ 
+@@ -561,7 +564,7 @@ unidatafiles.ts : $(MINIPERL_EXE) [.lib]
+ 	@ If F$Search("$(MMS$TARGET)").nes."" Then Delete/NoLog/NoConfirm $(MMS$TARGET);*
+ 	@ Copy/NoConfirm _NLA0: $(MMS$TARGET)
+  
+-DynaLoader$(O) : $(ARCHDIR)Config.pm $(MINIPERL_EXE) [.lib.VMS]Filespec.pm 
++DynaLoader$(O) : [.lib]buildcustomize.pl $(ARCHDIR)Config.pm $(MINIPERL_EXE) [.lib.VMS]Filespec.pm
+ 	$(MINIPERL) make_ext.pl "MAKE=$(MMS)" "DynaLoader"
+ 
+ dynext : $(LIBPREREQ) $(DBG)perlshr$(E) unidatafiles.ts DynaLoader$(O) preplibrary makeppport $(MINIPERL_EXE)
+@@ -1856,6 +1859,7 @@ tidy : cleanlis
+ 	- If F$Search("[.utils]*.com;-1").nes."" Then Purge/NoConfirm/Log [.utils]*.com
+ 	- If F$Search("[.x2p]*.com;-1").nes."" Then Purge/NoConfirm/Log [.x2p]*.com
+ 	- If F$Search("[.lib.pods]*.com;-1").nes."" Then Purge/NoConfirm/Log [.lib.pods]*.com
++	- If F$Search("[.lib]buildcustomize.pl;-1").nes."" Then Purge/NoConfirm/Log [.lib]buildcustomize.pl
+ 
+ clean : tidy cleantest
+       	- $(MINIPERL) make_ext.pl "MAKE=$(MMS)" "--all" "--target=clean"
+Index: perl-5.12.2/win32/Makefile
+===================================================================
+--- perl-5.12.2.orig/win32/Makefile
++++ perl-5.12.2/win32/Makefile
+@@ -923,6 +923,9 @@ $(CONFIGPM) : $(MINIPERL) ..\config.sh c
+ 	-$(MINIPERL) -I..\lib $(ICWD) config_h.PL "INST_VER=$(INST_VER)"
+ 	if errorlevel 1 $(MAKE) /$(MAKEFLAGS) $(CONFIGPM)
+ 
++..\lib\buildcustomize.pl: $(MINIPERL) ..\write_buildcustomize.pl
++	$(MINIPERL) -I..\lib ..\write_buildcustomize.pl .. >..\lib\buildcustomize.pl
++
+ $(MINIPERL) : $(MINIDIR) $(MINI_OBJ)
+ 	$(LINK32) -subsystem:console -out:$@ @<<
+ 	$(LINK_FLAGS) $(LIBFILES) $(MINI_OBJ)
+@@ -1045,24 +1048,24 @@ MakePPPort: $(MINIPERL) $(CONFIGPM) Exte
+ #-------------------------------------------------------------------------------
+ # There's no direct way to mark a dependency on
+ # DynaLoader.pm, so this will have to do
+-Extensions: ..\make_ext.pl $(PERLDEP) $(CONFIGPM) $(DYNALOADER)
++Extensions: ..\make_ext.pl ..\lib\buildcustomize.pl $(PERLDEP) $(CONFIGPM) $(DYNALOADER)
+ 	$(XCOPY) ..\*.h $(COREDIR)\*.*
+ 	$(MINIPERL) -I..\lib ..\make_ext.pl "MAKE=$(MAKE)" --dir=$(CPANDIR) --dir=$(DISTDIR) --dir=$(EXTDIR) --dynamic
+ 
+-Extensions_reonly: ..\make_ext.pl $(PERLDEP) $(CONFIGPM) $(DYNALOADER)
++Extensions_reonly: ..\make_ext.pl ..\lib\buildcustomize.pl $(PERLDEP) $(CONFIGPM) $(DYNALOADER)
+ 	$(XCOPY) ..\*.h $(COREDIR)\*.*
+ 	$(MINIPERL) -I..\lib ..\make_ext.pl "MAKE=$(MAKE)" --dir=$(CPANDIR) --dir=$(DISTDIR) --dir=$(EXTDIR) --dynamic +re
+ 
+-Extensions_static : ..\make_ext.pl list_static_libs.pl $(PERLDEP) $(CONFIGPM)
++Extensions_static : ..\make_ext.pl ..\lib\buildcustomize.pl list_static_libs.pl $(PERLDEP) $(CONFIGPM)
+ 	$(XCOPY) ..\*.h $(COREDIR)\*.*
+ 	$(MINIPERL) -I..\lib ..\make_ext.pl "MAKE=$(MAKE)" --dir=$(CPANDIR) --dir=$(DISTDIR) --dir=$(EXTDIR) --static
+ 	$(MINIPERL) -I..\lib list_static_libs.pl > Extensions_static
+ 
+-Extensions_nonxs: ..\make_ext.pl $(PERLDEP) $(CONFIGPM)
++Extensions_nonxs: ..\make_ext.pl ..\lib\buildcustomize.pl $(PERLDEP) $(CONFIGPM)
+ 	$(XCOPY) ..\*.h $(COREDIR)\*.*
+ 	$(MINIPERL) -I..\lib ..\make_ext.pl "MAKE=$(MAKE)" --dir=$(CPANDIR) --dir=$(DISTDIR) --dir=$(EXTDIR) --nonxs
+ 
+-$(DYNALOADER) : ..\make_ext.pl $(PERLDEP) $(CONFIGPM) Extensions_nonxs
++$(DYNALOADER) : ..\make_ext.pl ..\lib\buildcustomize.pl $(PERLDEP) $(CONFIGPM) Extensions_nonxs
+ 	$(XCOPY) ..\*.h $(COREDIR)\*.*
+ 	$(MINIPERL) -I..\lib ..\make_ext.pl "MAKE=$(MAKE)" --dir=$(EXTDIR) --dynaloader
+ 
+@@ -1159,6 +1162,7 @@ distclean: realclean
+ 	-del /f $(LIBDIR)\Win32CORE.pm
+ 	-del /f $(LIBDIR)\Win32API\File.pm
+ 	-del /f $(LIBDIR)\Win32API\File\cFile.pc
++	-del /f $(LIBDIR)\buildcustomize.pl
+ 	-del /f $(DISTDIR)\XSLoader\XSLoader.pm
+ 	-if exist $(LIBDIR)\App rmdir /s /q $(LIBDIR)\App
+ 	-if exist $(LIBDIR)\Archive rmdir /s /q $(LIBDIR)\Archive
+Index: perl-5.12.2/win32/makefile.mk
+===================================================================
+--- perl-5.12.2.orig/win32/makefile.mk
++++ perl-5.12.2/win32/makefile.mk
+@@ -1215,6 +1215,10 @@ $(CONFIGPM) : $(MINIPERL) ..\config.sh c
+ 	$(MINIPERL) -I..\lib $(ICWD) config_h.PL "INST_VER=$(INST_VER)" \
+ 	    || $(MAKE) $(MAKEMACROS) $(CONFIGPM) $(MAKEFILE)
+ 
++..\lib\buildcustomize.pl: $(MINIPERL) ..\write_buildcustomize.pl
++	$(MINIPERL) -I..\lib ..\write_buildcustomize.pl .. >..\lib\buildcustomize.pl
++
++
+ $(MINIPERL) : $(MINIDIR) $(MINI_OBJ) $(CRTIPMLIBS)
+ .IF "$(CCTYPE)" == "BORLAND"
+ 	if not exist $(CCLIBDIR)\PSDK\odbccp32.lib \
+@@ -1423,24 +1427,24 @@ MakePPPort: $(MINIPERL) $(CONFIGPM) Exte
+ #-------------------------------------------------------------------------------
+ # There's no direct way to mark a dependency on
+ # DynaLoader.pm, so this will have to do
+-Extensions : ..\make_ext.pl $(PERLDEP) $(CONFIGPM) $(DYNALOADER)
++Extensions : ..\make_ext.pl ..\lib\buildcustomize.pl $(PERLDEP) $(CONFIGPM) $(DYNALOADER)
+ 	$(XCOPY) ..\*.h $(COREDIR)\*.*
+ 	$(MINIPERL) -I..\lib ..\make_ext.pl "MAKE=$(MAKE)" --dir=$(CPANDIR) --dir=$(DISTDIR) --dir=$(EXTDIR) --dynamic
+ 
+-Extensions_reonly : ..\make_ext.pl $(PERLDEP) $(CONFIGPM) $(DYNALOADER)
++Extensions_reonly : ..\make_ext.pl ..\lib\buildcustomize.pl $(PERLDEP) $(CONFIGPM) $(DYNALOADER)
+ 	$(XCOPY) ..\*.h $(COREDIR)\*.*
+ 	$(MINIPERL) -I..\lib ..\make_ext.pl "MAKE=$(MAKE)" --dir=$(CPANDIR) --dir=$(DISTDIR) --dir=$(EXTDIR) --dynamic +re
+ 
+-Extensions_static : ..\make_ext.pl list_static_libs.pl $(PERLDEP) $(CONFIGPM)
++Extensions_static : ..\make_ext.pl ..\lib\buildcustomize.pl list_static_libs.pl $(PERLDEP) $(CONFIGPM)
+ 	$(XCOPY) ..\*.h $(COREDIR)\*.*
+ 	$(MINIPERL) -I..\lib ..\make_ext.pl "MAKE=$(MAKE)" --dir=$(CPANDIR) --dir=$(DISTDIR) --dir=$(EXTDIR) --static
+ 	$(MINIPERL) -I..\lib list_static_libs.pl > Extensions_static
+ 
+-Extensions_nonxs : ..\make_ext.pl $(PERLDEP) $(CONFIGPM)
++Extensions_nonxs : ..\make_ext.pl ..\lib\buildcustomize.pl $(PERLDEP) $(CONFIGPM)
+ 	$(XCOPY) ..\*.h $(COREDIR)\*.*
+ 	$(MINIPERL) -I..\lib ..\make_ext.pl "MAKE=$(MAKE)" --dir=$(CPANDIR) --dir=$(DISTDIR) --dir=$(EXTDIR) --nonxs
+ 
+-$(DYNALOADER) : ..\make_ext.pl $(PERLDEP) $(CONFIGPM) Extensions_nonxs
++$(DYNALOADER) : ..\make_ext.pl ..\lib\buildcustomize.pl $(PERLDEP) $(CONFIGPM) Extensions_nonxs
+ 	$(XCOPY) ..\*.h $(COREDIR)\*.*
+ 	$(MINIPERL) -I..\lib ..\make_ext.pl "MAKE=$(MAKE)" --dir=$(EXTDIR) --dynaloader
+ 
+@@ -1534,6 +1538,7 @@ distclean: realclean
+ 	-del /f $(LIBDIR)\Win32CORE.pm
+ 	-del /f $(LIBDIR)\Win32API\File.pm
+ 	-del /f $(LIBDIR)\Win32API\File\cFile.pc
++	-del /f $(LIBDIR)\buildcustomize.pl
+ 	-del /f $(DISTDIR)\XSLoader\XSLoader.pm
+ 	-if exist $(LIBDIR)\App rmdir /s /q $(LIBDIR)\App
+ 	-if exist $(LIBDIR)\Archive rmdir /s /q $(LIBDIR)\Archive
+Index: perl-5.12.2/write_buildcustomize.pl
+===================================================================
+--- /dev/null
++++ perl-5.12.2/write_buildcustomize.pl
+@@ -0,0 +1,50 @@
++#!./miniperl -w
++
++use strict;
++if (@ARGV) {
++    my $dir = shift;
++    chdir $dir or die "Can't chdir '$dir': $!";
++    unshift @INC, 'lib';
++}
++
++unshift @INC, ('cpan/Cwd', 'cpan/Cwd/lib');
++require File::Spec::Functions;
++
++# To clarify, this isn't the entire suite of modules considered "toolchain"
++# It's not even all modules needed to build ext/
++# It's just the source paths of the (minimum complete set of) modules in ext/
++# needed to build the nonxs modules
++# After which, all nonxs modules are in lib, which was always sufficient to
++# allow miniperl to build everything else.
++
++my @toolchain = qw(cpan/AutoLoader/lib
++		   cpan/Cwd cpan/Cwd/lib
++		   cpan/ExtUtils-Command/lib
++		   dist/ExtUtils-Install/lib
++		   cpan/ExtUtils-MakeMaker/lib
++		   cpan/ExtUtils-Manifest/lib
++		   cpan/File-Path/lib
++		   );
++
++# Used only in ExtUtils::Liblist::Kid::_win32_ext()
++push @toolchain, 'cpan/Text-ParseWords/lib' if $^O eq 'MSWin32';
++
++# lib must be last, as the the toolchain modules write themselves into it
++# as they build, and it's important that @INC order ensures that the partially
++# written files are always masked by the complete versions.
++
++my $inc = join ",\n        ",
++    map { "q\0$_\0" }
++    (map {File::Spec::Functions::rel2abs($_)} @toolchain, 'lib'), '.';
++
++# If any of the system's build tools are written in Perl, then this module
++# may well be loaded by a much older version than we are building. So keep it
++# as backwards compatible as is easy.
++print <<"EOT";
++#!perl
++
++# We are miniperl, building extensions
++# Reset \@INC completely, adding the directories we need, and removing the
++# installed directories (which we don't need to read, and may confuse us)
++\@INC = ($inc);
++EOT
diff --git a/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_6.patch b/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_6.patch
new file mode 100644
index 0000000..0520c30
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl-5.12.2/parallel_build_fix_6.patch
@@ -0,0 +1,156 @@
+Rebased by Nitin A Kamble <nitin.a.kamble@intel.com> on 3/11/2011
+
+commit 7353f64c5bca6e7102582a1e0017c850930249c3
+Author: Nicholas Clark <nick@ccl4.org>
+Date:   Mon Feb 14 20:36:36 2011 +0000
+
+    Add ext/re/re.pm to the @INC set for miniperl by lib/buildcustomize.pl
+    
+    This avoids a build-time race condition where lib/re.pm might be read midway
+    through the *second* copy of it (when ext/re/Makefile is being run). It also
+    simplifies many [Mm]akefile* rules, which previously had a special case to
+    copy it early.
+
+Index: perl-5.12.2/Cross/Makefile-cross-SH
+===================================================================
+--- perl-5.12.2.orig/Cross/Makefile-cross-SH
++++ perl-5.12.2/Cross/Makefile-cross-SH
+@@ -727,7 +727,7 @@ fi
+ $spitshell >>$Makefile <<'!NO!SUBS!'
+ 
+ .PHONY: preplibrary
+-preplibrary: miniperl $(CONFIGPM) lib/lib.pm lib/re.pm $(PREPLIBRARY_LIBPERL)
++preplibrary: miniperl $(CONFIGPM) lib/lib.pm $(PREPLIBRARY_LIBPERL)
+ 
+ .PHONY: makeppport
+ makeppport: miniperl$(EXE_EXT) $(CONFIGPM)
+@@ -748,10 +748,6 @@ $(plextract):	miniperl $(CONFIGPM) x2p/s
+ 	@-rm -f $@
+ 	$(LDLIBPTH) ./miniperl -I`pwd`/lib $@.PL
+ 
+-lib/lib.pm:	miniperl $(CONFIGPM)
+-	@-rm -f $@
+-	$(LDLIBPTH) ./miniperl -Ilib -MCross lib/lib_pm.PL
+-
+ lib/buildcustomize.pl: $(MINIPERL_EXE) write_buildcustomize.pl
+ 	$(MINIPERL) write_buildcustomize.pl >lib/buildcustomize.pl
+ 
+@@ -1212,7 +1208,7 @@ minitest.prep:
+ 
+ # Can't depend on lib/Config.pm because that might be where miniperl
+ # is crashing.
+-minitest: miniperl$(EXE_EXT) lib/re.pm minitest.prep
++minitest: miniperl$(EXE_EXT) minitest.prep
+ 	- cd t && (rm -f perl$(EXE_EXT); $(LNS) ../miniperl$(EXE_EXT) perl$(EXE_EXT)) \
+ 		&& $(LDLIBPTH) ./perl TEST -minitest base/*.t comp/*.t cmd/*.t run/*.t io/*.t op/*.t uni/*.t </dev/tty
+ 
+Index: perl-5.12.2/Makefile.SH
+===================================================================
+--- perl-5.12.2.orig/Makefile.SH
++++ perl-5.12.2/Makefile.SH
+@@ -970,7 +970,7 @@ esac
+ $spitshell >>$Makefile <<'!NO!SUBS!'
+ 
+ .PHONY: preplibrary
+-preplibrary: $(MINIPERL_EXE) $(CONFIGPM) lib/re.pm $(PREPLIBRARY_LIBPERL)
++preplibrary: $(MINIPERL_EXE) $(CONFIGPM) $(PREPLIBRARY_LIBPERL)
+ 
+ $(CONFIGPM_FROM_CONFIG_SH): $(CONFIGPOD)
+ 
+@@ -980,10 +980,6 @@ $(CONFIGPOD): config.sh $(MINIPERL_EXE) 
+ lib/ExtUtils/Miniperl.pm: miniperlmain.c $(MINIPERL_EXE) minimod.pl $(CONFIGPM)
+ 	$(MINIPERL) minimod.pl > lib/ExtUtils/Miniperl.pm
+ 
+-lib/re.pm: ext/re/re.pm
+-	@-rm -f $@
+-	cp ext/re/re.pm lib/re.pm
+-
+ $(plextract):	$(MINIPERL_EXE) $(CONFIGPM) x2p/s2p $(dynamic_ext)
+ 	@-rm -f $@
+ 	$(MINIPERL) $@.PL
+@@ -1267,7 +1263,7 @@ _cleaner2:
+ 	rm -f lib/.exists lib/*/.exists lib/*/*/.exists
+ 	rm -f h2ph.man pstruct
+ 	rm -rf .config
+-	rm -f preload lib/re.pm
++	rm -f preload
+ 	rm -rf lib/Encode lib/Compress lib/Hash lib/re
+ 	rm -rf lib/TAP lib/Module/Pluggable lib/App
+ 	rm -rf lib/mro
+@@ -1464,7 +1460,7 @@ minitest.prep:
+ 
+ # Can't depend on lib/Config.pm because that might be where miniperl
+ # is crashing.
+-minitest: $(MINIPERL_EXE) lib/re.pm minitest.prep
++minitest: $(MINIPERL_EXE) minitest.prep
+ 	- cd t && (rm -f $(PERL_EXE); $(LNS) ../$(MINIPERL_EXE) $(PERL_EXE)) \
+ 		&& $(RUN_PERL) TEST -minitest base/*.t comp/*.t cmd/*.t run/*.t io/*.t re/*.t op/*.t uni/*.t </dev/tty
+ 
+Index: perl-5.12.2/vms/descrip_mms.template
+===================================================================
+--- perl-5.12.2.orig/vms/descrip_mms.template
++++ perl-5.12.2/vms/descrip_mms.template
+@@ -360,7 +360,7 @@ CRTLOPTS =,$(CRTL)/Options
+ unidatadirs = lib/unicore/To lib/unicore/lib
+ 
+ # Modules which must be installed before we can build extensions
+-LIBPREREQ = $(ARCHDIR)Config.pm $(ARCHDIR)Config_heavy.pl [.lib.VMS]Filespec.pm $(ARCHDIR)vmspipe.com [.lib]re.pm [.lib]buildcustomize.pl
++LIBPREREQ = $(ARCHDIR)Config.pm $(ARCHDIR)Config_heavy.pl [.lib.VMS]Filespec.pm $(ARCHDIR)vmspipe.com [.lib]buildcustomize.pl
+ 
+ utils1 = [.lib.pods]perldoc.com [.lib.ExtUtils]Miniperl.pm [.utils]c2ph.com [.utils]h2ph.com 
+ utils2 = [.utils]h2xs.com [.utils]libnetcfg.com [.lib]perlbug.com [.utils]dprofpp.com 
+@@ -455,9 +455,6 @@ pod = $(pod0) $(pod1) $(pod2) $(pod3) $(
+ archcorefiles : $(ac) $(ARCHAUTO)time.stamp
+ 	@ $(NOOP)
+ 
+-[.lib]re.pm  : [.ext.re]re.pm
+-	Copy/NoConfirm/Log $(MMS$SOURCE) [.lib]
+-
+ [.lib]buildcustomize.pl : write_buildcustomize.pl $(MINIPERL_EXE)
+        $(MINIPERL) write_buildcustomize.pl > [.lib]buildcustomize.pl
+ 
+@@ -1487,7 +1484,7 @@ test_harness : all [.t.lib]vmsfspec.t
+ 	- @[.vms]test.com "$(E)" "$(__DEBUG__)"
+ 	@ $(MINIPERL) -e "print ""Ran tests"";" > [.t]rantests.
+ 
+-minitest : $(MINITEST_EXE) [.lib]re.pm [.lib.VMS]Filespec.pm unidatafiles.ts
++minitest : $(MINITEST_EXE) [.lib.VMS]Filespec.pm unidatafiles.ts
+ 	@ PERL_TEST_DRIVER == "minitest"
+ 	- @[.vms]test.com "$(E)" "$(__DEBUG__)"
+ 
+Index: perl-5.12.2/win32/Makefile
+===================================================================
+--- perl-5.12.2.orig/win32/Makefile
++++ perl-5.12.2/win32/Makefile
+@@ -918,7 +918,6 @@ $(CONFIGPM) : $(MINIPERL) ..\config.sh c
+ 	if exist lib\* $(RCOPY) lib\*.* ..\lib\$(NULL)
+ 	$(XCOPY) ..\*.h $(COREDIR)\*.*
+ 	$(XCOPY) *.h $(COREDIR)\*.*
+-	$(XCOPY) ..\ext\re\re.pm $(LIBDIR)\*.*
+ 	$(RCOPY) include $(COREDIR)\*.*
+ 	-$(MINIPERL) -I..\lib $(ICWD) config_h.PL "INST_VER=$(INST_VER)"
+ 	if errorlevel 1 $(MAKE) /$(MAKEFLAGS) $(CONFIGPM)
+Index: perl-5.12.2/win32/makefile.mk
+===================================================================
+--- perl-5.12.2.orig/win32/makefile.mk
++++ perl-5.12.2/win32/makefile.mk
+@@ -1210,7 +1210,6 @@ $(CONFIGPM) : $(MINIPERL) ..\config.sh c
+ 	if exist lib\* $(RCOPY) lib\*.* ..\lib\$(NULL)
+ 	$(XCOPY) ..\*.h $(COREDIR)\*.*
+ 	$(XCOPY) *.h $(COREDIR)\*.*
+-	$(XCOPY) ..\ext\re\re.pm $(LIBDIR)\*.*
+ 	$(RCOPY) include $(COREDIR)\*.*
+ 	$(MINIPERL) -I..\lib $(ICWD) config_h.PL "INST_VER=$(INST_VER)" \
+ 	    || $(MAKE) $(MAKEMACROS) $(CONFIGPM) $(MAKEFILE)
+Index: perl-5.12.2/write_buildcustomize.pl
+===================================================================
+--- perl-5.12.2.orig/write_buildcustomize.pl
++++ perl-5.12.2/write_buildcustomize.pl
+@@ -24,6 +24,7 @@ my @toolchain = qw(cpan/AutoLoader/lib
+ 		   cpan/ExtUtils-MakeMaker/lib
+ 		   dist/ExtUtils-Manifest/lib
+ 		   cpan/File-Path/lib
++		   ext/re
+ 		   );
+ 
+ # Used only in ExtUtils::Liblist::Kid::_win32_ext()
diff --git a/meta/recipes-devtools/perl/perl-native_5.12.2.bb b/meta/recipes-devtools/perl/perl-native_5.12.2.bb
index cd21e9e..9af7b06 100644
--- a/meta/recipes-devtools/perl/perl-native_5.12.2.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.12.2.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "Artistic|GPL"
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
 		    file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
-PR = "r6"
+PR = "r7"
 
 LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
                     file://Artistic;md5=f921793d03cc6d63ec4b15e9be8fd3f8"
@@ -15,6 +15,9 @@ SRC_URI = "http://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz \
            file://parallel_build_fix_1.patch \
            file://parallel_build_fix_2.patch \
            file://parallel_build_fix_3.patch \
+           file://parallel_build_fix_4.patch \
+           file://parallel_build_fix_5.patch \
+           file://parallel_build_fix_6.patch \
            file://native-nopacklist.patch;patch=1 \
            file://native-perlinc.patch;patch=1"
 
diff --git a/meta/recipes-devtools/perl/perl_5.12.2.bb b/meta/recipes-devtools/perl/perl_5.12.2.bb
index 18fad18..184e1e7 100644
--- a/meta/recipes-devtools/perl/perl_5.12.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.12.2.bb
@@ -8,7 +8,7 @@ PRIORITY = "optional"
 # We need gnugrep (for -I)
 DEPENDS = "virtual/db perl-native-${PV} grep-native"
 DEPENDS += "gdbm zlib"
-PR = "r2"
+PR = "r3"
 
 # 5.10.1 has Module::Build built-in
 PROVIDES += "libmodule-build-perl"
@@ -21,6 +21,9 @@ SRC_URI = "ftp://ftp.funet.fi/pub/CPAN/src/perl-${PV}.tar.gz \
         file://parallel_build_fix_1.patch \
         file://parallel_build_fix_2.patch \
         file://parallel_build_fix_3.patch \
+        file://parallel_build_fix_4.patch \
+        file://parallel_build_fix_5.patch \
+        file://parallel_build_fix_6.patch \
         file://Makefile.SH.patch;patch=1 \
         file://installperl.patch;patch=1 \
         file://perl-dynloader.patch;patch=1 \
-- 
1.7.3.4



