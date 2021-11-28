Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3A2C433EF
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 09:46:23 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web10.46446.1638092781841245751
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 01:46:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XuseIsjt;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id v15so28526404ljc.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 01:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=rEJEqubHd6tNzlKMRJOn7X04wA6BcHnRHEPH8tc3H7E=;
        b=XuseIsjtE8utJPejTHHTsRRJWhmETWxvF1CIsP2zfqCURBBIehRMgBt7M4/kK71wdG
         9pa+iQEfhZsRwXxS/ALWENKY7OaD8HiH6PZ5og20tm9qbl4938yczIoRXVal7P0QQi+t
         Zn3JhWagB0cFN+PdHBHITFtU5ITN1g1CLsCSnl5/3legwJfLgta8PUY8PI+/xprD1G+U
         QDtjpAhtYQFL3peWlWu3XBA6ChLJBAKFRfRW3WIIZ752HyUmX7HOqliVslu72G6lZX+0
         +OaNK7NPl19PfYURNh3roKU+kQhBq4iQ3OhE5cA7drSkPDYgq+o7tFStWaGLF3dE1mls
         R7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rEJEqubHd6tNzlKMRJOn7X04wA6BcHnRHEPH8tc3H7E=;
        b=SMynotfWd0tdykO5beL4O30fXK0Ap4N6htTYHzu59mfryB6vZSnsGKWonhnXfLHgjO
         6EPUp4uw/A/Rm6S2LhLjifaYSMOiUyVWv4TYewOVm3cwoTBbi1xR6i9EKC+3nJTjZtQd
         i/P7qtoGqpt2+xv9N/AjZ8KmaVO9jU6t696wuGPQeRAivD6sqNSBIQGGKlQ54eBfW1AT
         40fii0Dv7ak7zT3rbF0PJH5/1apZURgH3Bciya1OhsIlkTh8+xMNnUiIeZS9sED+ME4m
         UOAeF7CCy+jTT308srTMXpRCu/IsIyOhq0u3H218ef6WLfgbY8BqVPXHPLxpMHYWu3FD
         cpnw==
X-Gm-Message-State: AOAM533h3vPJDze9y3z/UY8caS48ysANSdnpJJMnuG79Q+feN88cg/VU
	YGuHCSvH2IpkGcx14BkMErqJJGJuUgf41w==
X-Google-Smtp-Source: 
 ABdhPJzedWDs5YjmkPDMXAbG/2d1JI5A7YWnheiWj1ScjmgjwoS2xehF9VNDep5c/+WyJIxV4GSS2Q==
X-Received: by 2002:a2e:8686:: with SMTP id l6mr44582966lji.520.1638092779930;
        Sun, 28 Nov 2021 01:46:19 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 k15sm1031749ljg.123.2021.11.28.01.46.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 01:46:19 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC PATCH 4/9] perl/perlcross: Improve native reproducability
Date: Sun, 28 Nov 2021 10:45:27 +0100
Message-Id: <20211128094532.1145820-5-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211128094532.1145820-1-jacob.kroon@gmail.com>
References: <20211128094532.1145820-1-jacob.kroon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 09:46:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158871

In order to make perlcross-native independent of build path we need to follow
the symlinks when copying the patches, otherwise they will point to whereever
oe-core is checked out for that particular build.

Doing this reveals an issue in perl-native, where it copies the patches
from perlcross-native's sysroot, but both perlcross and perl have a
patch called "determinism.patch", so one of them gets overridden. Rename
the patch in perlcross so that this doesn't happen.

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 .../{determinism.patch => perl-cross-determinism.patch}      | 0
 meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb          | 4 ++--
 meta/recipes-devtools/perl/perl_5.34.0.bb                    | 5 +++++
 3 files changed, 7 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/perl-cross/files/{determinism.patch => perl-cross-determinism.patch} (100%)

diff --git a/meta/recipes-devtools/perl-cross/files/determinism.patch b/meta/recipes-devtools/perl-cross/files/perl-cross-determinism.patch
similarity index 100%
rename from meta/recipes-devtools/perl-cross/files/determinism.patch
rename to meta/recipes-devtools/perl-cross/files/perl-cross-determinism.patch
diff --git a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
index 2759ef8a53..dab7f4558f 100644
--- a/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
+++ b/meta/recipes-devtools/perl-cross/perlcross_1.3.6.bb
@@ -15,7 +15,7 @@ SRC_URI = "https://github.com/arsv/perl-cross/releases/download/${PV}/perl-cross
            file://0001-configure_tool.sh-do-not-quote-the-argument-to-comma.patch \
            file://0001-perl-cross-add-LDFLAGS-when-linking-libperl.patch \
            file://0001-configure_path.sh-do-not-hardcode-prefix-lib-as-libr.patch \
-           file://determinism.patch \
+           file://perl-cross-determinism.patch \
            file://0001-cnf-configure_func_sel.sh-disable-thread_safe_nl_lan.patch \
            file://0001-Makefile-check-the-file-if-patched-or-not.patch \
            "
@@ -33,7 +33,7 @@ do_compile () {
 
 do_install:class-native() {
     mkdir -p ${D}/${datadir}/perl-cross/
-    cp -rf ${S}/* ${D}/${datadir}/perl-cross/
+    cp -rfL ${S}/* ${D}/${datadir}/perl-cross/
 }
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
index 16d45ccff3..0b74d5f072 100644
--- a/meta/recipes-devtools/perl/perl_5.34.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -97,6 +97,9 @@ do_configure:class-native() {
     -Dvendorprefix=${prefix} \
     -Ui_xlocale \
     ${PACKAGECONFIG_CONFARGS}
+
+    # See the comment above
+    sed -i -e "s,${STAGING_DIR_NATIVE},/non/existent,g" config.h
 }
 
 do_configure:append() {
@@ -395,3 +398,5 @@ SSTATE_HASHEQUIV_FILEMAP = " \
     populate_sysroot:*/lib*/perl5/config.sh:${TMPDIR} \
     populate_sysroot:*/lib*/perl5/config.sh:${COREBASE} \
     "
+
+EXTRA_STAGING_FIXMES:append:class-native = " RPATH_PADDING"

