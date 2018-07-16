Return-Path: <andrej.valek@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id BB067607AD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 11:41:05 +0000 (UTC)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id w6GBf5fe002659
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 13:41:05 +0200
Received: from dev.vm6.ccp.siemens.com ([163.242.57.90])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id w6GBf50h030556;
	Mon, 16 Jul 2018 13:41:05 +0200
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 23533969B09;
	Mon, 16 Jul 2018 13:41:05 +0200 (CEST)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 13:40:58 +0200
Message-Id: <20180716114058.18831-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] perl: update to 5.24.4
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
X-List-Received-Date: Mon, 16 Jul 2018 11:41:06 -0000

 - fix CVE-2018-6797, CVE-2018-6798, CVE-2018-6913
 - remove patches, which are now included in update
 - refresh patches

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 ...perl-native_5.24.1.bb => perl-native_5.24.4.bb} |  4 +-
 ...depends_5.24.1.inc => perl-rdepends_5.24.4.inc} |  0
 .../perl/perl/CVE-2017-12837.patch                 | 32 ------------
 .../perl/perl/CVE-2017-12883.patch                 | 44 ----------------
 meta/recipes-devtools/perl/perl/Makefile.SH.patch  | 12 ++---
 meta/recipes-devtools/perl/perl/config.sh          | 60 +++++++++++-----------
 .../perl/{perl_5.24.1.bb => perl_5.24.4.bb}        |  6 +--
 7 files changed, 40 insertions(+), 118 deletions(-)
 rename meta/recipes-devtools/perl/{perl-native_5.24.1.bb => perl-native_5.24.4.bb} (96%)
 rename meta/recipes-devtools/perl/{perl-rdepends_5.24.1.inc => perl-rdepends_5.24.4.inc} (100%)
 delete mode 100644 meta/recipes-devtools/perl/perl/CVE-2017-12837.patch
 delete mode 100644 meta/recipes-devtools/perl/perl/CVE-2017-12883.patch
 rename meta/recipes-devtools/perl/{perl_5.24.1.bb => perl_5.24.4.bb} (98%)

diff --git a/meta/recipes-devtools/perl/perl-native_5.24.1.bb b/meta/recipes-devtools/perl/perl-native_5.24.4.bb
similarity index 96%
rename from meta/recipes-devtools/perl/perl-native_5.24.1.bb
rename to meta/recipes-devtools/perl/perl-native_5.24.4.bb
index 71f45890b0..90a1615551 100644
--- a/meta/recipes-devtools/perl/perl-native_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl-native_5.24.4.bb
@@ -18,8 +18,8 @@ SRC_URI += "\
            file://perl-5.26.1-guard_old_libcrypt_fix.patch \
           "
 
-SRC_URI[md5sum] = "af6a84c7c3e2b8b269c105a5db2f6d53"
-SRC_URI[sha256sum] = "03a77bac4505c270f1890ece75afc7d4b555090b41aa41ea478747e23b2afb3f"
+SRC_URI[md5sum] = "04622bc4d3941dc7eb571c52b7c02993"
+SRC_URI[sha256sum] = "7f080287ff64750270689843ae945f02159a33cb8f2fc910248c15befba5db84"
 
 inherit native
 
diff --git a/meta/recipes-devtools/perl/perl-rdepends_5.24.1.inc b/meta/recipes-devtools/perl/perl-rdepends_5.24.4.inc
similarity index 100%
rename from meta/recipes-devtools/perl/perl-rdepends_5.24.1.inc
rename to meta/recipes-devtools/perl/perl-rdepends_5.24.4.inc
diff --git a/meta/recipes-devtools/perl/perl/CVE-2017-12837.patch b/meta/recipes-devtools/perl/perl/CVE-2017-12837.patch
deleted file mode 100644
index 0b59fcda3e..0000000000
--- a/meta/recipes-devtools/perl/perl/CVE-2017-12837.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 73d7247ecab863ef26b5687a37ccc75d6144ad0f Mon Sep 17 00:00:00 2001
-From: Karl Williamson <khw@cpan.org>
-Date: Tue, 17 Oct 2017 13:49:14 +0800
-Subject: [PATCH] fix CVE-2017-12837
-
-Signed-off-by: Karl Williamson <khw@cpan.org>
-Signed-off-by: Steve Hay <steve.m.hay@googlemail.com>
-
-CVE: CVE-2017-12837
-Upstream-Status: Backport
-https://perl5.git.perl.org/perl.git/commitdiff/96c83ed78aeea1a0496dd2b2d935869a822dc8a5
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- regcomp.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/regcomp.c b/regcomp.c
-index 5498d14..31ec383 100644
---- a/regcomp.c
-+++ b/regcomp.c
-@@ -13021,6 +13021,7 @@ S_regatom(pTHX_ RExC_state_t *pRExC_state, I32 *flagp, U32 depth)
-                             goto loopdone;
-                         }
-                         p = RExC_parse;
-+                        RExC_parse = parse_start;
-                         if (ender > 0xff) {
-                             REQUIRE_UTF8(flagp);
-                         }
--- 
-1.8.3.1
-
diff --git a/meta/recipes-devtools/perl/perl/CVE-2017-12883.patch b/meta/recipes-devtools/perl/perl/CVE-2017-12883.patch
deleted file mode 100644
index 5c1805f9e7..0000000000
--- a/meta/recipes-devtools/perl/perl/CVE-2017-12883.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 40b3cdad3649334585cee8f4630ec9a025e62be6 Mon Sep 17 00:00:00 2001
-From: Karl Williamson <khw@cpan.org>
-Date: Fri, 25 Aug 2017 11:33:58 -0600
-Subject: [PATCH] PATCH: [perl #131598]
-
-The cause of this is that the vFAIL macro uses RExC_parse, and that
-variable has just been changed in preparation for code after the vFAIL.
-The solution is to not change RExC_parse until after the vFAIL.
-
-This is a case where the macro hides stuff that can bite you.
-
-(cherry picked from commit 2be4edede4ae226e2eebd4eff28cedd2041f300f)
-
-Upstream-Status: Backport
-CVE: CVE-2017-12833
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- regcomp.c | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-Index: perl-5.24.1/regcomp.c
-===================================================================
---- perl-5.24.1.orig/regcomp.c
-+++ perl-5.24.1/regcomp.c
-@@ -11918,14 +11918,16 @@ S_grok_bslash_N(pTHX_ RExC_state_t *pREx
- 	}
-         sv_catpv(substitute_parse, ")");
- 
--        RExC_parse = RExC_start = RExC_adjusted_start = SvPV(substitute_parse,
--                                                             len);
-+        len = SvCUR(substitute_parse);
- 
- 	/* Don't allow empty number */
- 	if (len < (STRLEN) 8) {
-             RExC_parse = endbrace;
- 	    vFAIL("Invalid hexadecimal number in \\N{U+...}");
- 	}
-+
-+        RExC_parse = RExC_start = RExC_adjusted_start
-+                                              = SvPV_nolen(substitute_parse);
- 	RExC_end = RExC_parse + len;
- 
-         /* The values are Unicode, and therefore not subject to recoding, but
diff --git a/meta/recipes-devtools/perl/perl/Makefile.SH.patch b/meta/recipes-devtools/perl/perl/Makefile.SH.patch
index c1db335e0d..e4c3426b7f 100644
--- a/meta/recipes-devtools/perl/perl/Makefile.SH.patch
+++ b/meta/recipes-devtools/perl/perl/Makefile.SH.patch
@@ -12,10 +12,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  Makefile.SH | 147 ++++++++++++++++++++++++++++--------------------------------
  1 file changed, 68 insertions(+), 79 deletions(-)
 
-Index: perl-5.24.1/Makefile.SH
+Index: perl-5.24.4/Makefile.SH
 ===================================================================
---- perl-5.24.1.orig/Makefile.SH
-+++ perl-5.24.1/Makefile.SH
+--- perl-5.24.4.orig/Makefile.SH
++++ perl-5.24.4/Makefile.SH
 @@ -48,10 +48,10 @@ case "$useshrplib" in
  true)
  	# Prefix all runs of 'miniperl' and 'perl' with
@@ -271,9 +271,9 @@ Index: perl-5.24.1/Makefile.SH
  	$(MINIPERL) autodoc.pl
  
  pod/perlmodlib.pod: $(MINIPERL_EXE) pod/perlmodlib.PL MANIFEST
-@@ -1089,7 +1099,7 @@ pod/perl5241delta.pod: pod/perldelta.pod
- 	$(RMS) pod/perl5241delta.pod
- 	$(LNS) perldelta.pod pod/perl5241delta.pod
+@@ -1089,7 +1099,7 @@ pod/perl5244delta.pod: pod/perldelta.pod
+ 	$(RMS) pod/perl5244delta.pod
+ 	$(LNS) perldelta.pod pod/perl5244delta.pod
  
 -extra.pods: $(MINIPERL_EXE)
 +extra.pods:
diff --git a/meta/recipes-devtools/perl/perl/config.sh b/meta/recipes-devtools/perl/perl/config.sh
index ac0484ca64..b1b5834c71 100644
--- a/meta/recipes-devtools/perl/perl/config.sh
+++ b/meta/recipes-devtools/perl/perl/config.sh
@@ -14,7 +14,7 @@
 
 : Configure command line arguments.
 config_arg0='Configure'
-config_args='-des -Doptimize=-O2 -Dmyhostname=localhost -Dperladmin=root@localhost -Dcc=gcc -Dcf_by=Open Embedded -Dinstallprefix=@EXECPREFIX@ -Dprefix=@EXECPREFIX@ -Dvendorprefix=@EXECPREFIX@ -Dsiteprefix=@EXECPREFIX@ -Dotherlibdirs=@LIBDIR@/perl/5.24.1 -Duseshrplib -Dusethreads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_ndbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3pm -Duseperlio -Dinstallusrbinperl -Ubincompat5005 -Uversiononly -Dpager=@USRBIN@/less -isr'
+config_args='-des -Doptimize=-O2 -Dmyhostname=localhost -Dperladmin=root@localhost -Dcc=gcc -Dcf_by=Open Embedded -Dinstallprefix=@EXECPREFIX@ -Dprefix=@EXECPREFIX@ -Dvendorprefix=@EXECPREFIX@ -Dsiteprefix=@EXECPREFIX@ -Dotherlibdirs=@LIBDIR@/perl/5.24.4 -Duseshrplib -Dusethreads -Duseithreads -Duselargefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_ndbm -Ui_gdbm -Di_shadow -Di_syslog -Dman3ext=3pm -Duseperlio -Dinstallusrbinperl -Ubincompat5005 -Uversiononly -Dpager=@USRBIN@/less -isr'
 config_argc=28
 config_arg1='-des'
 config_arg2='-Doptimize=-O2'
@@ -26,7 +26,7 @@ config_arg7='-Dinstallprefix=@EXECPREFIX@'
 config_arg8='-Dprefix=@EXECPREFIX@'
 config_arg9='-Dvendorprefix=@EXECPREFIX@'
 config_arg10='-Dsiteprefix=@EXECPREFIX@'
-config_arg11='-Dotherlibdirs=@LIBDIR@/perl/5.24.1'
+config_arg11='-Dotherlibdirs=@LIBDIR@/perl/5.24.4'
 config_arg12='-Duseshrplib'
 config_arg13='-Dusethreads'
 config_arg14='-Duseithreads'
@@ -64,13 +64,13 @@ alignbytes='8'
 ansi2knr=''
 aphostname=''
 api_revision='5'
-api_subversion='1'
+api_subversion='4'
 api_version='24'
-api_versionstring='5.24.1'
+api_versionstring='5.24.4'
 ar='ar'
-archlib='@LIBDIR@/perl/5.24.1/@ARCH@-thread-multi'
-archlibexp='@STAGINGDIR@@LIBDIR@/perl/5.24.1/@ARCH@-thread-multi'
-archlib_exp='@LIBDIR@/perl/5.24.1/@ARCH@-thread-multi'
+archlib='@LIBDIR@/perl/5.24.4/@ARCH@-thread-multi'
+archlibexp='@STAGINGDIR@@LIBDIR@/perl/5.24.4/@ARCH@-thread-multi'
+archlib_exp='@LIBDIR@/perl/5.24.4/@ARCH@-thread-multi'
 archname64=''
 archname='@ARCH@-thread-multi'
 archobjs=''
@@ -88,7 +88,7 @@ castflags='0'
 cat='cat'
 cc='gcc'
 cccdlflags='-fPIC'
-ccdlflags='-Wl,-E -Wl,-rpath,@LIBDIR@/perl/5.24.1/@ARCH@-thread-multi/CORE'
+ccdlflags='-Wl,-E -Wl,-rpath,@LIBDIR@/perl/5.24.4/@ARCH@-thread-multi/CORE'
 ccflags='-D_REENTRANT -D_GNU_SOURCE -fwrapv -fno-strict-aliasing -pipe -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -D_FORTIFY_SOURCE=2'
 ccflags_uselargefiles='-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64'
 ccname='gcc'
@@ -838,7 +838,7 @@ inc_version_list_init='0'
 incpath=''
 inews=''
 initialinstalllocation='@USRBIN@'
-installarchlib='@LIBDIR@/perl/5.24.1/@ARCH@-thread-multi'
+installarchlib='@LIBDIR@/perl/5.24.4/@ARCH@-thread-multi'
 installbin='@USRBIN@'
 installhtml1dir=''
 installhtml3dir=''
@@ -846,23 +846,23 @@ installman1dir=''
 installman3dir=''
 installprefix='@EXECPREFIX@'
 installprefixexp='@EXECPREFIX@'
-installprivlib='@LIBDIR@/perl/5.24.1'
+installprivlib='@LIBDIR@/perl/5.24.4'
 installscript='@USRBIN@'
-installsitearch='@LIBDIR@/perl/site_perl/5.24.1/@ARCH@-thread-multi'
+installsitearch='@LIBDIR@/perl/site_perl/5.24.4/@ARCH@-thread-multi'
 installsitebin='@USRBIN@'
 installsitehtml1dir=''
 installsitehtml3dir=''
-installsitelib='@LIBDIR@/perl/site_perl/5.24.1'
+installsitelib='@LIBDIR@/perl/site_perl/5.24.4'
 installsiteman1dir=''
 installsiteman3dir=''
 installsitescript='@USRBIN@'
 installstyle='lib/perl'
 installusrbinperl='define'
-installvendorarch='@LIBDIR@/perl/vendor_perl/5.24.1/@ARCH@-thread-multi'
+installvendorarch='@LIBDIR@/perl/vendor_perl/5.24.4/@ARCH@-thread-multi'
 installvendorbin='@USRBIN@'
 installvendorhtml1dir=''
 installvendorhtml3dir=''
-installvendorlib='@LIBDIR@/perl/vendor_perl/5.24.1'
+installvendorlib='@LIBDIR@/perl/vendor_perl/5.24.4'
 installvendorman1dir=''
 installvendorman3dir=''
 installvendorscript='@USRBIN@'
@@ -965,7 +965,7 @@ optimize='-O2'
 orderlib='false'
 osname='linux'
 osvers='3.19.5-yocto-standard'
-otherlibdirs='@LIBDIR@/perl/5.24.1'
+otherlibdirs='@LIBDIR@/perl/5.24.4'
 package='perl'
 pager='/usr/bin/less -isr'
 passcat='cat /etc/passwd'
@@ -986,8 +986,8 @@ pmake=''
 pr=''
 prefix='@EXECPREFIX@'
 prefixexp='@EXECPREFIX@'
-privlib='@LIBDIR@/perl/5.24.1'
-privlibexp='@LIBDIR@/perl/5.24.1'
+privlib='@LIBDIR@/perl/5.24.4'
+privlibexp='@LIBDIR@/perl/5.24.4'
 procselfexe='"/proc/self/exe"'
 prototype='define'
 ptrsize='8'
@@ -1053,17 +1053,17 @@ sig_num='0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26
 sig_num_init='0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 6, 17, 29, 31, 0'
 sig_size='69'
 signal_t='void'
-sitearch='@LIBDIR@/perl/site_perl/5.24.1/@ARCH@-thread-multi'
-sitearchexp='@LIBDIR@/perl/site_perl/5.24.1/@ARCH@-thread-multi'
+sitearch='@LIBDIR@/perl/site_perl/5.24.4/@ARCH@-thread-multi'
+sitearchexp='@LIBDIR@/perl/site_perl/5.24.4/@ARCH@-thread-multi'
 sitebin='@USRBIN@'
 sitebinexp='@USRBIN@'
 sitehtml1dir=''
 sitehtml1direxp=''
 sitehtml3dir=''
 sitehtml3direxp=''
-sitelib='@LIBDIR@/perl/site_perl/5.24.1'
+sitelib='@LIBDIR@/perl/site_perl/5.24.4'
 sitelib_stem='@LIBDIR@/perl/site_perl'
-sitelibexp='@LIBDIR@/perl/site_perl/5.24.1'
+sitelibexp='@LIBDIR@/perl/site_perl/5.24.4'
 siteman1dir=''
 siteman1direxp=''
 siteman3dir=''
@@ -1102,7 +1102,7 @@ stdio_stream_array=''
 strerror_r_proto='REENTRANT_PROTO_B_IBW'
 strings='@INCLUDEDIR@/string.h'
 submit=''
-subversion='1'
+subversion='4'
 sysman='@EXECPREFIX@/share/man/man1'
 sysroot=''
 tail=''
@@ -1182,17 +1182,17 @@ uvtype='unsigned long'
 uvuformat='"lu"'
 uvxformat='"lx"'
 vaproto='define'
-vendorarch='@LIBDIR@/perl/vendor_perl/5.24.1/@ARCH@-thread-multi'
-vendorarchexp='@LIBDIR@/perl/vendor_perl/5.24.1/@ARCH@-thread-multi'
+vendorarch='@LIBDIR@/perl/vendor_perl/5.24.4/@ARCH@-thread-multi'
+vendorarchexp='@LIBDIR@/perl/vendor_perl/5.24.4/@ARCH@-thread-multi'
 vendorbin='@USRBIN@'
 vendorbinexp='@USRBIN@'
 vendorhtml1dir=' '
 vendorhtml1direxp=''
 vendorhtml3dir=' '
 vendorhtml3direxp=''
-vendorlib='@LIBDIR@/perl/vendor_perl/5.24.1'
+vendorlib='@LIBDIR@/perl/vendor_perl/5.24.4'
 vendorlib_stem='@LIBDIR@/perl/vendor_perl'
-vendorlibexp='@LIBDIR@/perl/vendor_perl/5.24.1'
+vendorlibexp='@LIBDIR@/perl/vendor_perl/5.24.4'
 vendorman1dir=' '
 vendorman1direxp=''
 vendorman3dir=' '
@@ -1201,8 +1201,8 @@ vendorprefix='@EXECPREFIX@'
 vendorprefixexp='@EXECPREFIX@'
 vendorscript='@USRBIN@'
 vendorscriptexp='@USRBIN@'
-version='5.24.1'
-version_patchlevel_string='version 24 subversion 1'
+version='5.24.4'
+version_patchlevel_string='version 24 subversion 4'
 versiononly='undef'
 vi=''
 xlibpth='@LIBDIR@/386 @BASELIBDIR@386'
@@ -1212,10 +1212,10 @@ zcat=''
 zip='zip'
 PERL_REVISION=5
 PERL_VERSION=24
-PERL_SUBVERSION=1
+PERL_SUBVERSION=4
 PERL_API_REVISION=5
 PERL_API_VERSION=24
-PERL_API_SUBVERSION=1
+PERL_API_SUBVERSION=4
 PERL_PATCHLEVEL=''
 PERL_CONFIG_SH=true
 : Variables propagated from previous config.sh file.
diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.4.bb
similarity index 98%
rename from meta/recipes-devtools/perl/perl_5.24.1.bb
rename to meta/recipes-devtools/perl/perl_5.24.4.bb
index 1329a72240..4709d3e785 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.4.bb
@@ -64,8 +64,6 @@ SRC_URI += " \
         file://perl-fix-conflict-between-skip_all-and-END.patch \
         file://perl-test-customized.patch \
         file://perl-5.26.1-guard_old_libcrypt_fix.patch \
-        file://CVE-2017-12883.patch \
-        file://CVE-2017-12837.patch \
 "
 
 # Fix test case issues
@@ -74,8 +72,8 @@ SRC_URI_append_class-target = " \
             file://test/ext-DynaLoader-t-DynaLoader.t-fix-calling-dl_findfil.patch \
            "
 
-SRC_URI[md5sum] = "af6a84c7c3e2b8b269c105a5db2f6d53"
-SRC_URI[sha256sum] = "03a77bac4505c270f1890ece75afc7d4b555090b41aa41ea478747e23b2afb3f"
+SRC_URI[md5sum] = "04622bc4d3941dc7eb571c52b7c02993"
+SRC_URI[sha256sum] = "7f080287ff64750270689843ae945f02159a33cb8f2fc910248c15befba5db84"
 
 inherit perlnative siteinfo
 
-- 
2.11.0


