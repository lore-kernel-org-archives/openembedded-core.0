Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.2847.1623983599234953708
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jun 2021 19:33:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 15I2XEGc012823
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Jun 2021 19:33:14 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 17 Jun 2021 19:33:14 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Thu, 17 Jun 2021 19:33:13 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <alex.kanavin@gmail.com>
Subject: [PATCH] perl: avoid the source file patched twice
Date: Fri, 18 Jun 2021 10:30:36 +0800
Message-ID: <20210618023036.26144-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

After the commit(60dcb230f6 perl: split perl-cross into its own recipe)
introduced, the source files mainly come from two parts, one is from
SRI_URI during do_fetch and the other with below means during do_configure.
do_configure_prepend() {
    cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${S}
}

And the source files will be changed during do_compile with below
logic in Makefile.
$(CROSSPATCHED): %.applied: %.patch
        patch -p1 -i $< && touch $@

And there comes build failure with below steps:
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
 | NOTE: make -j 48
 | make crosspatch
 | make[1]: Entering directory '/buildarea1/myu2/wr_build/wr1021_20210616_perl/build/tmp-glibc/work/x86_64-linux/perl-native/5.34.0-r0/perl-5.34.0'
 | patch -p1 -i cnf/diffs/perl5-5.34.0/time-hires.patch && touch cnf/diffs/perl5-5.34.0/time-hires.applied
 | patch -p1 -i cnf/diffs/perl5-5.34.0/xconfig.patch && touch cnf/diffs/perl5-5.34.0/xconfig.applied
 | patch -p1 -i cnf/diffs/perl5-5.34.0/posix-makefile.patch && touch cnf/diffs/perl5-5.34.0/posix-makefile.applied
 | File dist/Time-HiRes/Makefile.PL is read-only; trying to patch anyway
 | patching file dist/Time-HiRes/Makefile.PL
 | Reversed (or previously applied) patch detected!  Assume -R? [n]
 | Apply anyway? [n]
 | Skipping patch.
 | 4 out of 4 hunks ignored -- saving rejects to file dist/Time-HiRes/Makefile.PL.rej
 | patch -p1 -i cnf/diffs/perl5-5.34.0/test-commonsense.patch && touch cnf/diffs/perl5-5.34.0/test-commonsense.applied
 | File perl.h is read-only; trying to patch anyway
 | patching file perl.h
 | Reversed (or previously applied) patch detected!  Assume -R? [n]
 | Apply anyway? [n]
 | Skipping patch.
 | 1 out of 1 hunk ignored -- saving rejects to file perl.h.rej
 | make[1]: *** [Makefile:64: cnf/diffs/perl5-5.34.0/time-hires.applied] Error 1
 [snip]

It's because the source files patched twice, so let do_fetch always
executed to make sure the source files which come from SRC_URI brand
new in each build to avoid the source files patched twice to fix the
build failure as above.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/perl/perl_5.34.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
index 7935a58723..2e48110d2b 100644
--- a/meta/recipes-devtools/perl/perl_5.34.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -382,3 +382,5 @@ EOF
        chmod 0755 ${SYSROOT_DESTDIR}${bindir}/nativeperl
        cat ${SYSROOT_DESTDIR}${bindir}/nativeperl
 }
+
+do_fetch[nostamp] = "1"
-- 
2.17.1

