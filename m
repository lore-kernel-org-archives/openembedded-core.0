Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.1159.1627450929856969828
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 22:42:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 16S5g7XY014768
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jul 2021 22:42:08 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 27 Jul 2021 22:42:07 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 27 Jul 2021 22:42:06 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] perlcross: not break build if already patched
Date: Wed, 28 Jul 2021 13:39:59 +0800
Message-ID: <20210728053959.39040-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Currently the build will break if the patch already applied
as the return value of "test ! -f $@" is not 0, so make sure
to return 0 if the patch already applied.

Fixes:
 $ bitbake perl-native

 Make a change as below
 $ git diff
 diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
 index b77bbd1fd4..4c5e35ab80 100644
 --- a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
 +++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
 @@ -33,6 +33,7 @@ do_compile () {
  do_install_class-native() {
      mkdir -p ${D}/${datadir}/perl-cross/
      cp -rf ${S}/* ${D}/${datadir}/perl-cross/
 +    echo "test" > ${D}/${datadir}/perl-cross/testfile
 }

 $ bitbake perl-native
NOTE: make -j 40
make crosspatch
make[1]: Entering directory '/build/tmp-glibc/work/x86_64-linux/perl-native/5.34.0-r0/perl-5.34.0'
test ! -f cnf/diffs/perl5-5.34.0/posix-makefile.applied && (patch -p1 -i cnf/diffs/perl5-5.34.0/posix-makefile.patch && touch cnf/diffs/perl5-5.34.0/posix-makefile.applied)
test ! -f cnf/diffs/perl5-5.34.0/dynaloader.applied && (patch -p1 -i cnf/diffs/perl5-5.34.0/dynaloader.patch && touch cnf/diffs/perl5-5.34.0/dynaloader.applied)
make[1]: *** [Makefile:64: cnf/diffs/perl5-5.34.0/posix-makefile.applied] Error 1
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [Makefile:64: cnf/diffs/perl5-5.34.0/dynaloader.applied] Error 1
make[1]: Leaving directory '/build/tmp-glibc/work/x86_64-linux/perl-native/5.34.0-r0/perl-5.34.0'
make: *** [Makefile:78: all] Error 2

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../files/0001-Makefile-check-the-file-if-patched-or-not.patch  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch b/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
index fb7b287599..8c8f3b717c 100644
--- a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
+++ b/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
@@ -22,7 +22,7 @@ index f4a26f5..7bc748e 100644
  # and if that fails, reaching for the source tarball is the safest option.
  $(CROSSPATCHED): %.applied: %.patch
 -	patch -p1 -i $< && touch $@
-+	test ! -f $@ && (patch -p1 -i $< && touch $@)
++	test ! -f $@ && (patch -p1 -i $< && touch $@) || echo "$@ exist"
  
  # ---[ common ]-----------------------------------------------------------------
  
-- 
2.17.1

