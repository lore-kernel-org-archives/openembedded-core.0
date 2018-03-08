Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AD23A78A55
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 18:25:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2018 10:25:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,441,1515484800"; d="scan'208";a="24054129"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga006.jf.intel.com with ESMTP; 08 Mar 2018 10:25:45 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2018 20:18:03 +0200
Message-Id: <20180308181804.31261-41-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
References: <20180308181804.31261-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 41/42] perl: refresh patches
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
X-List-Received-Date: Thu, 08 Mar 2018 18:25:45 -0000

From: Ross Burton <ross.burton@intel.com>

The patch tool will apply patches by default with "fuzz", which is where if the
hunk context isn't present but what is there is close enough, it will force the
patch in.

Whilst this is useful when there's just whitespace changes, when applied to
source it is possible for a patch applied with fuzz to produce broken code which
still compiles (see #10450).  This is obviously bad.

We'd like to eventually have do_patch() rejecting any fuzz on these grounds. For
that to be realistic the existing patches with fuzz need to be rebased and
reviewed.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-devtools/perl/perl/Makefile.SH.patch  | 44 +++++++++++-----------
 .../perl/perl/cross-generate_uudmap.patch          | 14 +++----
 .../recipes-devtools/perl/perl/fix_bad_rpath.patch | 12 +++---
 meta/recipes-devtools/perl/perl/installperl.patch  | 12 +++---
 ...-fix-regenerate-makefile-failed-while-cc-.patch | 13 +++----
 .../perl/perl/perl-archlib-exp.patch               | 12 +++---
 .../perl/perl/perl-dynloader.patch                 | 14 +++----
 .../perl/perl/perl-enable-gdbm.patch               | 10 ++---
 8 files changed, 63 insertions(+), 68 deletions(-)

diff --git a/meta/recipes-devtools/perl/perl/Makefile.SH.patch b/meta/recipes-devtools/perl/perl/Makefile.SH.patch
index fd8237fe796..c1db335e0d6 100644
--- a/meta/recipes-devtools/perl/perl/Makefile.SH.patch
+++ b/meta/recipes-devtools/perl/perl/Makefile.SH.patch
@@ -12,10 +12,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  Makefile.SH | 147 ++++++++++++++++++++++++++++--------------------------------
  1 file changed, 68 insertions(+), 79 deletions(-)
 
-diff --git a/Makefile.SH b/Makefile.SH
-index 916b332..b143d46 100755
---- a/Makefile.SH
-+++ b/Makefile.SH
+Index: perl-5.24.1/Makefile.SH
+===================================================================
+--- perl-5.24.1.orig/Makefile.SH
++++ perl-5.24.1/Makefile.SH
 @@ -48,10 +48,10 @@ case "$useshrplib" in
  true)
  	# Prefix all runs of 'miniperl' and 'perl' with
@@ -74,6 +74,10 @@ index 916b332..b143d46 100755
 -all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods) $(private) $(unidatafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make $(MANIFEST_SRT)
 -	@echo " ";
 -	@echo "	Everything is up to date. Type '$(MAKE) test' to run test suite."
+-
+-$(MANIFEST_SRT):	MANIFEST $(PERL_EXE)
+-	@$(RUN_PERL) Porting/manisort -q || (echo "WARNING: re-sorting MANIFEST"; \
+-	    $(RUN_PERL) Porting/manisort -q -o MANIFEST; sh -c true)
 +#all: $(FIRSTMAKEFILE) $(MINIPERL_EXE) $(generated_pods) $(private) $(unidatafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make $(MANIFEST_SRT)
 +#	@echo " ";
 +#	@echo "	Everything is up to date. Type '$(MAKE) test' to run test suite."
@@ -83,10 +87,7 @@ index 916b332..b143d46 100755
 +more: $(generated_pods) $(private) $(public)
 +
 +more2: $(dynamic_ext)
- 
--$(MANIFEST_SRT):	MANIFEST $(PERL_EXE)
--	@$(RUN_PERL) Porting/manisort -q || (echo "WARNING: re-sorting MANIFEST"; \
--	    $(RUN_PERL) Porting/manisort -q -o MANIFEST; sh -c true)
++
 +more3: $(nonxs_ext)
 +
 +more4: extras.make $(MANIFEST_SRT)
@@ -151,7 +152,7 @@ index 916b332..b143d46 100755
  	./$(MINIPERLEXP) makedef.pl PLATFORM=os2 -DPERL_DLL=$(PERL_DLL) CC_FLAGS="$(OPTIMIZE)" > perl5.def
  
  !NO!SUBS!
-@@ -878,7 +878,7 @@ $(LIBPERL): $& $(perllib_objs) $(DYNALOADER) $(LIBPERLEXPORT)
+@@ -878,7 +878,7 @@ $(LIBPERL): $& $(perllib_objs) $(DYNALOA
  	true)
  		$spitshell >>$Makefile <<'!NO!SUBS!'
  	rm -f $@
@@ -160,7 +161,7 @@ index 916b332..b143d46 100755
  !NO!SUBS!
  		case "$osname" in
  		aix)
-@@ -936,15 +936,19 @@ lib/buildcustomize.pl: $& $(miniperl_objs) write_buildcustomize.pl
+@@ -936,15 +936,19 @@ lib/buildcustomize.pl: $& $(miniperl_obj
  		$spitshell >>$Makefile <<'!NO!SUBS!'
  lib/buildcustomize.pl: $& $(miniperl_objs)
  	$(CC) -o $(MINIPERL_EXE) $(CLDFLAGS) $(miniperl_objs) $(libs)
@@ -183,7 +184,7 @@ index 916b332..b143d46 100755
  	$(MINIPERL) -f write_buildcustomize.pl    
  !NO!SUBS!
  		;;
-@@ -966,7 +970,9 @@ lib/buildcustomize.pl: $& $(miniperl_objs) write_buildcustomize.pl
+@@ -966,7 +970,9 @@ lib/buildcustomize.pl: $& $(miniperl_obj
  	-@rm -f miniperl.xok
  	$(CC) $(CLDFLAGS) $(NAMESPACEFLAGS) -o $(MINIPERL_EXE) \
  	    $(miniperl_objs) $(libs)
@@ -194,7 +195,7 @@ index 916b332..b143d46 100755
  	$(MINIPERL) -f write_buildcustomize.pl
  !NO!SUBS!
  		;;
-@@ -977,7 +983,9 @@ lib/buildcustomize.pl: \$& \$(miniperl_objs) write_buildcustomize.pl
+@@ -977,7 +983,9 @@ lib/buildcustomize.pl: \$& \$(miniperl_o
  	-@rm -f miniperl.xok
  	-@rm \$(MINIPERL_EXE)
  	\$(LNS) \$(HOST_PERL) \$(MINIPERL_EXE)
@@ -205,7 +206,7 @@ index 916b332..b143d46 100755
  	\$(MINIPERL) -f write_buildcustomize.pl 'osname' "$osname"
  !GROK!THIS!
  		else
-@@ -986,7 +994,9 @@ lib/buildcustomize.pl: $& $(miniperl_objs) write_buildcustomize.pl
+@@ -986,7 +994,9 @@ lib/buildcustomize.pl: $& $(miniperl_obj
  	-@rm -f miniperl.xok
  	$(CC) $(CLDFLAGS) -o $(MINIPERL_EXE) \
  	    $(miniperl_objs) $(libs)
@@ -225,7 +226,7 @@ index 916b332..b143d46 100755
  	-@for f in Makefile.PL PPPort_pm.PL PPPort_xs.PL ppport_h.PL; do \
  	(cd ext/Devel-PPPort && `pwd`/run.sh ../../$(MINIPERL_EXE) -I../../lib \$\$f); \
  	done
-@@ -1046,7 +1056,7 @@ makeppport: \$(MINIPERL_EXE) \$(CONFIGPM)
+@@ -1046,7 +1056,7 @@ makeppport: \$(MINIPERL_EXE) \$(CONFIGPM
  *)
  $spitshell >>$Makefile <<'!NO!SUBS!'
  .PHONY: makeppport
@@ -254,7 +255,7 @@ index 916b332..b143d46 100755
  	$(MINIPERL) lib/unicore/mktables -C lib/unicore -P pod -maketest -makelist -p
  #	Commented out so always runs, mktables looks at far more files than we
  #	can in this makefile to decide if needs to run or not
-@@ -1074,12 +1084,12 @@ uni.data: $(MINIPERL_EXE) $(CONFIGPM) lib/unicore/mktables $(nonxs_ext)
+@@ -1074,12 +1084,12 @@ uni.data: $(MINIPERL_EXE) $(CONFIGPM) li
  # $(PERL_EXE) and ext because pod_lib.pl needs Digest::MD5
  # But also this ensures that all extensions are built before we try to scan
  # them, which picks up Devel::PPPort's documentation.
@@ -270,9 +271,9 @@ index 916b332..b143d46 100755
  	$(MINIPERL) autodoc.pl
  
  pod/perlmodlib.pod: $(MINIPERL_EXE) pod/perlmodlib.PL MANIFEST
-@@ -1089,7 +1099,7 @@ pod/perl5240delta.pod: pod/perldelta.pod
- 	$(RMS) pod/perl5240delta.pod
- 	$(LNS) perldelta.pod pod/perl5240delta.pod
+@@ -1089,7 +1099,7 @@ pod/perl5241delta.pod: pod/perldelta.pod
+ 	$(RMS) pod/perl5241delta.pod
+ 	$(LNS) perldelta.pod pod/perl5241delta.pod
  
 -extra.pods: $(MINIPERL_EXE)
 +extra.pods:
@@ -345,7 +346,7 @@ index 916b332..b143d46 100755
  	$(MINIPERL) make_ext.pl $@ $(MAKE_EXT_ARGS) MAKE="$(MAKE)" LIBPERL_A=$(LIBPERL) LINKTYPE=static $(STATIC_LDFLAGS)
  
  n_dummy $(nonxs_ext):	$(MINIPERL_EXE) lib/buildcustomize.pl preplibrary FORCE
-@@ -1479,14 +1468,14 @@ test_prep_pre: preplibrary utilities $(nonxs_ext)
+@@ -1479,14 +1468,14 @@ test_prep_pre: preplibrary utilities $(n
  
  case "$targethost" in
  '') $spitshell >>$Makefile <<'!NO!SUBS!'
@@ -362,7 +363,7 @@ index 916b332..b143d46 100755
  	\$(dynamic_ext) \$(TEST_PERL_DLL) runtests \
  	\$(generated_pods)
  	$to libperl.*
-@@ -1539,7 +1528,7 @@ test_prep test-prep: test_prep_pre \$(MINIPERL_EXE) \$(unidatafiles) \$(PERL_EXE
+@@ -1539,7 +1528,7 @@ test_prep test-prep: test_prep_pre \$(MI
  esac
  
  $spitshell >>$Makefile <<'!NO!SUBS!'
@@ -380,6 +381,3 @@ index 916b332..b143d46 100755
  	- cd t && $(RUN_PERL) TEST $(MINITEST_TESTS) <$(devtty)
  
  minitest-notty minitest_notty: $(MINIPERL_EXE) minitest_prep
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/perl/perl/cross-generate_uudmap.patch b/meta/recipes-devtools/perl/perl/cross-generate_uudmap.patch
index a00ad61d901..33e222259f7 100644
--- a/meta/recipes-devtools/perl/perl/cross-generate_uudmap.patch
+++ b/meta/recipes-devtools/perl/perl/cross-generate_uudmap.patch
@@ -1,15 +1,15 @@
 Upstream-Status:Inappropriate [embedded specific]
 
-Index: perl-5.14.2/Makefile.SH
+Index: perl-5.24.1/Makefile.SH
 ===================================================================
---- perl-5.14.2.orig/Makefile.SH
-+++ perl-5.14.2/Makefile.SH
-@@ -622,7 +622,7 @@ bitcount.h: generate_uudmap$(HOST_EXE_EX
- 	$(RUN) ./generate_uudmap$(HOST_EXE_EXT) uudmap.h bitcount.h
+--- perl-5.24.1.orig/Makefile.SH
++++ perl-5.24.1/Makefile.SH
+@@ -710,7 +710,7 @@ bitcount.h: generate_uudmap\$(HOST_EXE_E
  
+ $spitshell >>$Makefile <<'!NO!SUBS!'
  generate_uudmap$(HOST_EXE_EXT): generate_uudmap$(OBJ_EXT)
 -	$(CC) -o generate_uudmap$(EXE_EXT) $(LDFLAGS) generate_uudmap$(OBJ_EXT) $(libs)
 +	$(BUILD_CC) -o generate_uudmap$(EXE_EXT) generate_uudmap.c
  
- miniperlmain$(OBJ_EXT): miniperlmain.c patchlevel.h
- 	$(CCCMD) $(PLDLFLAGS) $*.c
+ !NO!SUBS!
+ ;;
diff --git a/meta/recipes-devtools/perl/perl/fix_bad_rpath.patch b/meta/recipes-devtools/perl/perl/fix_bad_rpath.patch
index 76501283ed4..49efcbeefcd 100644
--- a/meta/recipes-devtools/perl/perl/fix_bad_rpath.patch
+++ b/meta/recipes-devtools/perl/perl/fix_bad_rpath.patch
@@ -10,15 +10,15 @@ This fixes this warning for perl recipe as well as libxml-parser-perl recipe.
 It is a fix to MakeMaker within perl, so all such perl recipes will get 
 fixed with this perl fix.
 
-Index: perl-5.14.2/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
+Index: perl-5.24.1/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
 ===================================================================
---- perl-5.14.2.orig/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
-+++ perl-5.14.2/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
-@@ -55,6 +55,7 @@ sub _unix_os2_ext {
-     my($found) = 0;
+--- perl-5.24.1.orig/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
++++ perl-5.24.1/cpan/ExtUtils-MakeMaker/lib/ExtUtils/Liblist/Kid.pm
+@@ -57,6 +57,7 @@ sub _unix_os2_ext {
+     my ( $found ) = 0;
  
      # Debian-specific: don't use LD_RUN_PATH for standard dirs
 +    push(@libpath, "SYSROOTLIB");
      $ld_run_path_seen{$_}++ for @libpath;
  
-     foreach my $thislib (split ' ', $potential_libs) {
+     foreach my $thislib ( split ' ', $potential_libs ) {
diff --git a/meta/recipes-devtools/perl/perl/installperl.patch b/meta/recipes-devtools/perl/perl/installperl.patch
index 456012376e6..7fd1f50144e 100644
--- a/meta/recipes-devtools/perl/perl/installperl.patch
+++ b/meta/recipes-devtools/perl/perl/installperl.patch
@@ -1,12 +1,12 @@
 Upstream-Status:Inappropriate [embedded specific]
 
-Index: perl-5.12.3/installperl
+Index: perl-5.24.1/installperl
 ===================================================================
---- perl-5.12.3.orig/installperl
-+++ perl-5.12.3/installperl
-@@ -3,8 +3,8 @@
+--- perl-5.24.1.orig/installperl
++++ perl-5.24.1/installperl
+@@ -2,8 +2,8 @@
+ 
  BEGIN {
-     require 5.004;
      chdir '..' if !-d 'lib' and -d '../lib';
 -    @INC = 'lib';
 -    $ENV{PERL5LIB} = 'lib';
@@ -14,4 +14,4 @@ Index: perl-5.12.3/installperl
 +#    $ENV{PERL5LIB} = 'lib';
  
      # This needs to be at BEGIN time, before any use of Config
-     require './install_lib.pl';
+     # install_lib itself loads and imports Config into main::
diff --git a/meta/recipes-devtools/perl/perl/make_ext.pl-fix-regenerate-makefile-failed-while-cc-.patch b/meta/recipes-devtools/perl/perl/make_ext.pl-fix-regenerate-makefile-failed-while-cc-.patch
index de6f65294cc..b2c597974e2 100644
--- a/meta/recipes-devtools/perl/perl/make_ext.pl-fix-regenerate-makefile-failed-while-cc-.patch
+++ b/meta/recipes-devtools/perl/perl/make_ext.pl-fix-regenerate-makefile-failed-while-cc-.patch
@@ -10,10 +10,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  make_ext.pl | 4 ++++
  1 file changed, 4 insertions(+)
 
-diff --git a/make_ext.pl b/make_ext.pl
-index b433762..9fc1a36 100644
---- a/make_ext.pl
-+++ b/make_ext.pl
+Index: perl-5.24.1/make_ext.pl
+===================================================================
+--- perl-5.24.1.orig/make_ext.pl
++++ perl-5.24.1/make_ext.pl
 @@ -335,6 +335,10 @@ sub build_extension {
                  print "Deleting non-Cross makefile\n";
                  close $mfh or die "close $makefile: $!";
@@ -24,7 +24,4 @@ index b433762..9fc1a36 100644
 +                }
              }
          }
-     }
--- 
-1.8.1.2
-
+     } else {
diff --git a/meta/recipes-devtools/perl/perl/perl-archlib-exp.patch b/meta/recipes-devtools/perl/perl/perl-archlib-exp.patch
index d912d0031e4..37bf5233571 100644
--- a/meta/recipes-devtools/perl/perl/perl-archlib-exp.patch
+++ b/meta/recipes-devtools/perl/perl/perl-archlib-exp.patch
@@ -25,16 +25,16 @@ Upstream-Status:Inappropriate [embedded specific]
 
 Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
 
-Index: perl-5.14.2/config_h.SH
+Index: perl-5.24.1/config_h.SH
 ===================================================================
---- perl-5.14.2.orig/config_h.SH
-+++ perl-5.14.2/config_h.SH
-@@ -996,7 +996,7 @@ sed <<!GROK!THIS! >$CONFIG_H -e 's!^#und
+--- perl-5.24.1.orig/config_h.SH
++++ perl-5.24.1/config_h.SH
+@@ -1434,7 +1434,7 @@ sed <<!GROK!THIS! >$CONFIG_H -e 's!^#und
   *	in programs that are not prepared to deal with ~ expansion at run-time.
   */
  #$d_archlib ARCHLIB "$archlib"		/**/
 -#$d_archlib ARCHLIB_EXP "$archlibexp"		/**/
 +#$d_archlib ARCHLIB_EXP "$archlib_exp"		/**/
  
- /* ARCHNAME:
-  *	This symbol holds a string representing the architecture name.
+ /* BIN:
+  *	This symbol holds the path of the bin directory where the package will
diff --git a/meta/recipes-devtools/perl/perl/perl-dynloader.patch b/meta/recipes-devtools/perl/perl/perl-dynloader.patch
index 035beba66ac..2572067a6e1 100644
--- a/meta/recipes-devtools/perl/perl/perl-dynloader.patch
+++ b/meta/recipes-devtools/perl/perl/perl-dynloader.patch
@@ -7,13 +7,13 @@ system.
 
 Update by Nitin A Kamble <nitin.a.kamble@intel.com> 2011/04/21
 
-Index: perl-5.14.2/dist/XSLoader/XSLoader_pm.PL
+Index: perl-5.24.1/dist/XSLoader/XSLoader_pm.PL
 ===================================================================
---- perl-5.14.2.orig/dist/XSLoader/XSLoader_pm.PL
-+++ perl-5.14.2/dist/XSLoader/XSLoader_pm.PL
-@@ -28,6 +28,20 @@ sub load {
- 
-     my ($module, $modlibname) = caller();
+--- perl-5.24.1.orig/dist/XSLoader/XSLoader_pm.PL
++++ perl-5.24.1/dist/XSLoader/XSLoader_pm.PL
+@@ -52,6 +52,20 @@ sub load {
+     my ($caller, $modlibname) = caller();
+     my $module = $caller;
  
 +    # OE: Allow env to form dynamic loader to look in a different place
 +    # This is so it finds the host .so files, not the targets
@@ -30,5 +30,5 @@ Index: perl-5.14.2/dist/XSLoader/XSLoader_pm.PL
 +    }
 +
      if (@_) {
- 	$module = $_[0];
+         $module = $_[0];
      } else {
diff --git a/meta/recipes-devtools/perl/perl/perl-enable-gdbm.patch b/meta/recipes-devtools/perl/perl/perl-enable-gdbm.patch
index aa83fca5ae8..bad3373fd40 100644
--- a/meta/recipes-devtools/perl/perl/perl-enable-gdbm.patch
+++ b/meta/recipes-devtools/perl/perl/perl-enable-gdbm.patch
@@ -1,12 +1,12 @@
 Upstream-Status:Inappropriate [embedded specific]
 
-Index: perl-5.8.8/config_h.SH
+Index: perl-5.24.1/config_h.SH
 ===================================================================
---- perl-5.8.8.orig/config_h.SH	2005-11-01 02:13:05.000000000 +0800
-+++ perl-5.8.8/config_h.SH	2010-11-01 17:06:07.215219738 +0800
-@@ -709,6 +709,12 @@
+--- perl-5.24.1.orig/config_h.SH
++++ perl-5.24.1/config_h.SH
+@@ -726,6 +726,12 @@ sed <<!GROK!THIS! >$CONFIG_H -e 's!^#und
   */
- #$i_float I_FLOAT		/**/
+ #$i_gdbm I_GDBM	/**/
  
 +/* I_GDBM:
 + *      This symbol, if defined, indicates that <gdbm.h> exists and should
-- 
2.16.1


