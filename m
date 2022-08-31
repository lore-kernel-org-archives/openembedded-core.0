Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B75BECAAD1
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 09:19:20 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.23423.1661937556127577897
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 02:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gIRxKo4h;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id c7so10738638wrp.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 02:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=d0bCP5g1fO1jwQS2W+3aGZzvOmmWTskcnBXi2LG6U7k=;
        b=gIRxKo4hd4hvMTCO4xM0w8QnJsQ7Estbl19lJNEFW3WwBLZYrMtM3YPqf0WPP+cdh5
         p6Nginq3J9M9IvJIMv2VlbJ4etUeIgkwdJQAdTJIsEC/pDyYwphvHM8HhL0Dw/DXgfZ2
         +8lAO8iGXROGZxZa8NMI7TNZW9ZzjjdlLEl9wwCH8ir52d7Nz8RFRtMdtcBB2A8TIQSd
         LNEmLMdYObfuEkkL/CnWBGZZSrBLa5QLGEDtQepdD0w3rHaTrV6W+yx9I+0ShpiBOvX5
         PWPSa2kvn2rvLFcS1QFOtxX7FGbCeZIXOJJrgz9b4XSRyzOazCNCsv5ooHZDM1Y53xeQ
         YfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=d0bCP5g1fO1jwQS2W+3aGZzvOmmWTskcnBXi2LG6U7k=;
        b=7QpHmexucHf5FAOYW+T10aqmNeZghkr5YW/ItsxZuW3JQx+d6tLYj8zvlDQny1uyZm
         YICLhYwCjWrwNh9hnBVMCeFXoWtJaClfrybTDHLE857ZBhre/cjVZY3sRPLCFiSLhA3c
         ueKwQ0gJ+tSv5jm2PfCiqsMGi0Mo9cGJVg/yS3cf7B44u7ZNEPhDSBDlHfy1VjmrorVl
         pLFulR2RD7svXmhsAQ1fdjuErsmwQ2qQsSJizQrRbp2FzTCmKm7gk+PmSQTt+dhP/z71
         wSLEQ1QntYl8KzAFNrJmnNQ1QJePxf6NsNvYEr6XQM5QbbGxGOWeOU+lV3NiYPM407Ht
         TuZA==
X-Gm-Message-State: ACgBeo2udit+RG5hdVShBgvSAWVTMoVNKYonujiYjWxAs+ujMt9I+4bx
	YNlRogq+txWEs89YBXsLPYl/3AuWVpo=
X-Google-Smtp-Source: 
 AA6agR4pOQVoF9RV1W3aNAa8zOcJPlCOa/GvVNgJuptcitxIZtRZ9eB1bqViDWP/b9yN25Q7br2z8g==
X-Received: by 2002:a5d:6904:0:b0:226:cff0:6bea with SMTP id
 t4-20020a5d6904000000b00226cff06beamr11663388wru.94.1661937554016;
        Wed, 31 Aug 2022 02:19:14 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 f14-20020adff98e000000b002252ec781f7sm11556410wrr.8.2022.08.31.02.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 02:19:12 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] perl: run builds from a pristine source tree
Date: Wed, 31 Aug 2022 11:19:06 +0200
Message-Id: <20220831091906.3310501-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 09:19:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170095

Running builds from a previously used directory relies on correctness of
'make clean' or incremental 'make', and sadly perl (or perl-cross) does not have either.

The particularly nasty problem, currently occurring, is that sometimes, when reusing
a previous build, we arrive at a combination of timestamps in the tree,
where make becomes very confused, gets lost in its own rules and enters an infinite loop,
never figuring out what needs to be rebuild in what order. Worse, there is no reliable
trigger for this that was found, and any attempts to 'isolate the issue' haven't produced one.

Let's simply add a clean S/B separation for builds, and always run a build from a reproducible
set of files.

[YOCTO #14902]

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ctly-list-modules-when-cleaning-them.patch | 24 ----------------
 ...file-do-not-clean-config.h-xconfig.h.patch | 28 -------------------
 .../perl-cross/perlcross_1.4.bb               |  2 --
 meta/recipes-devtools/perl/perl_5.36.0.bb     |  8 ++++--
 4 files changed, 5 insertions(+), 57 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-Makefile-correctly-list-modules-when-cleaning-them.patch
 delete mode 100644 meta/recipes-devtools/perl-cross/files/0001-Makefile-do-not-clean-config.h-xconfig.h.patch

diff --git a/meta/recipes-devtools/perl-cross/files/0001-Makefile-correctly-list-modules-when-cleaning-them.patch b/meta/recipes-devtools/perl-cross/files/0001-Makefile-correctly-list-modules-when-cleaning-them.patch
deleted file mode 100644
index 80388fa9b0..0000000000
--- a/meta/recipes-devtools/perl-cross/files/0001-Makefile-correctly-list-modules-when-cleaning-them.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 7b8d819e012c24df228a313beb86e1942611c904 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Sat, 4 Jun 2022 13:00:12 +0200
-Subject: [PATCH] Makefile: correctly list modules when cleaning them
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/133]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 6b35fb0..9ef9324 100644
---- a/Makefile
-+++ b/Makefile
-@@ -462,7 +462,7 @@ clean-subdirs:
- 
- # assuming modules w/o Makefiles were never built and need no cleaning
- clean-modules: config.h
--	@for i in $(modules disabled); do \
-+	@for i in $(modules) $(disabled); do \
- 		test -f $$i/Makefile && \
- 		touch $$i/Makefile && \
- 		$(MAKE) -C $$i clean \
diff --git a/meta/recipes-devtools/perl-cross/files/0001-Makefile-do-not-clean-config.h-xconfig.h.patch b/meta/recipes-devtools/perl-cross/files/0001-Makefile-do-not-clean-config.h-xconfig.h.patch
deleted file mode 100644
index cbb935c71b..0000000000
--- a/meta/recipes-devtools/perl-cross/files/0001-Makefile-do-not-clean-config.h-xconfig.h.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From ade4a70308d3b9d79cc3db841c0f60385780fe1a Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Sat, 4 Jun 2022 13:45:20 +0200
-Subject: [PATCH] Makefile: do not clean config.h/xconfig.h
-
-These are generated by ./configure and not by make.
-
-Upstream-Status: Submitted [https://github.com/arsv/perl-cross/pull/134]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- Makefile | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 9ef9324..3de2c2e 100644
---- a/Makefile
-+++ b/Makefile
-@@ -473,7 +473,6 @@ clean-generated-files:
- 	-rm -f uudmap.h opmini.c generate_uudmap$X bitcount.h $(CONFIGPM)
- 	-rm -f git_version.h lib/re.pm lib/Config_git.pl
- 	-rm -f perlmini.c perlmain.c
--	-rm -f config.h xconfig.h
- 	-rm -f pod/perlmodlib.pod
- 	-rm -f ext.libs static.list
- 	-rm -f $(patsubst %,%/ppport.h,$(mkppport_lst))
--- 
-2.30.2
-
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.4.bb b/meta/recipes-devtools/perl-cross/perlcross_1.4.bb
index 9b2889647f..17ce901646 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.4.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.4.bb
@@ -15,8 +15,6 @@ SRC_URI = "https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cross
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://determinism.patch \
            file://0001-Makefile-check-the-file-if-patched-or-not.patch \
-           file://0001-Makefile-correctly-list-modules-when-cleaning-them.patch \
-           file://0001-Makefile-do-not-clean-config.h-xconfig.h.patch \
            file://0001-configure_func.sh-Add-_GNU_SOURCE-define-and-functio.patch \
            "
 UPSTREAM_CHECK_URI = "https://github.com/arsv/perl-cross/releases/"
diff --git a/meta/recipes-devtools/perl/perl_5.36.0.bb b/meta/recipes-devtools/perl/perl_5.36.0.bb
index ead7dace16..2dc558aaa5 100644
--- a/meta/recipes-devtools/perl/perl_5.36.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.36.0.bb
@@ -28,7 +28,7 @@ SRC_URI:append:class-target = " \
 
 SRC_URI[perl.sha256sum] = "e26085af8ac396f62add8a533c3a0ea8c8497d836f0689347ac5abd7b7a4e00a"
 
-S = "${WORKDIR}/perl-${PV}"
+B = "${WORKDIR}/perl-${PV}-build"
 
 inherit upstream-version-is-even update-alternatives
 
@@ -48,7 +48,10 @@ export ENC2XS_NO_COMMENTS = "1"
 CFLAGS += "-D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
 
 do_configure:prepend() {
-    cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${S}
+    rm -rf ${B}
+    cp -rfp ${S} ${B}
+    cp -rfp ${STAGING_DATADIR_NATIVE}/perl-cross/* ${B}
+    cd ${B}
 }
 
 do_configure:class-target() {
@@ -116,7 +119,6 @@ print(datetime.fromtimestamp($SOURCE_DATE_EPOCH, timezone.utc).strftime('%a %b %
             ")"
         echo "#define PERL_BUILD_DATE \"$PERL_BUILD_DATE\"" >> config.h
     fi
-    oe_runmake clean
 }
 
 do_compile() {
-- 
2.30.2


