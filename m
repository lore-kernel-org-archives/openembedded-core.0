Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.7375.1625218220516338160
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 02:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 1629UG3p029139
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Jul 2021 02:30:16 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 2 Jul 2021 02:30:15 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Fri, 2 Jul 2021 02:30:14 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <richard.purdie@linuxfoundation.org>, <alex.kanavin@gmail.com>
Subject: [PATCH v2] perlcross: check the file if patched or not
Date: Fri, 2 Jul 2021 17:29:21 +0800
Message-ID: <20210702092921.17572-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <168B66A0894A0B49.14658@lists.openembedded.org>
References: <168B66A0894A0B49.14658@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

It's because the source files patched twice, so check the file if patched
or not to avoid the source files patched more than one time to fix the
build failure as above.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ile-check-the-file-if-patched-or-not.patch | 31 +++++++++++++++++++
 .../perl-cross/perlcross_1.3.6.bb             |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch

diff --git a/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch b/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
new file mode 100644
index 0000000000..fb7b287599
--- /dev/null
+++ b/meta/recipes-devtools/perl-cross/files/0001-Makefile-check-the-file-if-patched-or-not.patch
@@ -0,0 +1,31 @@
+From 24a3e0c48f9ebe473b5f1078663e275c27d0537f Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Fri, 2 Jul 2021 09:08:21 +0000
+Subject: [PATCH] Makefile: check the file if patched or not
+
+Check the file if patched or not to avoid patched more than
+one time.
+
+Upstream-Status: Inappropriate (OE-specific)
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index f4a26f5..7bc748e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -61,7 +61,7 @@ miniperlmain$O: $(CROSSPATCHED)
+ # Original versions are not saved anymore; patch generally takes care of this,
+ # and if that fails, reaching for the source tarball is the safest option.
+ $(CROSSPATCHED): %.applied: %.patch
+-	patch -p1 -i $< && touch $@
++	test ! -f $@ && (patch -p1 -i $< && touch $@)
+ 
+ # ---[ common ]-----------------------------------------------------------------
+ 
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
index b77bbd1fd4..b19692b2f3 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cross
            file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
            file://determinism.patch \
            file://0001-cnf-configure_func_sel.sh-disable-thread_safe_nl_lan.patch \
+           file://0001-Makefile-check-the-file-if-patched-or-not.patch \
            "
 UPSTREAM_CHECK_URI = "https://github.com/arsv/perl-cross/releases/"
 
-- 
2.29.2

