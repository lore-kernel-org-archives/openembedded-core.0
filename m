Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58CFC433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 18:21:34 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.15345.1638555694093014505
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=r2GucODK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id n26so3667740pff.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 10:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7Y5MFRm2HuLO9rEpW05ADO3gCtjuokcn31XGIFgx82c=;
        b=r2GucODKAsWUkh6JWC36q/tUX8grF/75peDxKbPfaECvu5D8JFH+aMieeWwOCaHO2j
         RGv5lgMyETajTRAITzHlkCb+CQsZk9sgBztMGHm5VfczzQpStWJOzvP8srCbhz5QWVDb
         Ql09LaM4w/DFNJOH/E1PZqIGkUi091QaDKFXlgAh1wZvccFB/bq877VUv00xMdxiZrNL
         K9BoGUQ7q+sIXv6Sl9TxEUEGRVYtjJoYvEmW2qAol3a3lfre+n45CRBbvIjnmJs9pwrQ
         dtfZz6L6VNGZ9n7+t5PIrTTc0QWaQmXsI2ZgYP11MffQuo6akCVw7OxbjaoOOrw530LR
         hzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Y5MFRm2HuLO9rEpW05ADO3gCtjuokcn31XGIFgx82c=;
        b=7YwFkc+SCgVm1ZyWuydgSzCFbW1QdApl+wF63U+jiVA3W/m+pGmjlsSCvdQv5H2euv
         SxsQwySip3ESAGTe6u35pBAqbWLaC4zKtvpvi8rOb7AF+e+HlSE2udiYQ1y9FT9gvE/X
         MRx5I/bEm1yscvNn237ImDo14qzinBoZlIyUb3JD8Dtck9ucEZhytE2oS4FZ/kqqJ8LA
         RElmSk2FID4yL67+rUVvN2SDYU15ij2kDE3hS/zbEH0S8O7GQDbRB49NZ2lNEduqPxix
         jh48jM8dBVcYuE2n4jVYqdFLcbRXDwa71BRaJQqrpWd40scx11lg1hVQxGQ7pBMndxCc
         UNSw==
X-Gm-Message-State: AOAM530Nle/Cn6A8V6B2dcTo2AiCgx1eQHtMWCCGc9QeZeYdBURax3BK
	GGz4mAg/iLlP86ZZlbbtjtSugrx4IjTmyZtgw00=
X-Google-Smtp-Source: 
 ABdhPJxrVro0w4ZFr7uDI6FcsAf8tb6+EBtoZgYc0wEujYsfEQZeHv8/PJiQLJZl8GWpgQEgEASlUg==
X-Received: by 2002:a05:6a00:230d:b0:49f:b8ad:ae23 with SMTP id
 h13-20020a056a00230d00b0049fb8adae23mr20643165pfh.80.1638555693070;
        Fri, 03 Dec 2021 10:21:33 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 130sm3959753pfu.13.2021.12.03.10.21.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 10:21:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/18] busybox: Fix for CVE-2021-42376
Date: Fri,  3 Dec 2021 08:18:51 -1000
Message-Id: 
 <ad3a9cbec2454c356a10567466916bdf4b72f65d.1638555254.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638555254.git.steve@sakoman.com>
References: <cover.1638555254.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Dec 2021 18:21:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159131

From: Pavel Zhukov <pavel.zhukov@huawei.com>

A NULL pointer dereference in Busybox's hush applet leads to denial of service
when processing a crafted shell command, due to missing validation after
a \x03 delimiter character.
This may be used for DoS under very rare conditions of filtered command input.

Reference: https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42376

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../busybox/busybox/CVE-2021-42376.patch      | 138 ++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.31.1.bb   |   1 +
 2 files changed, 139 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/CVE-2021-42376.patch

diff --git a/meta/recipes-core/busybox/busybox/CVE-2021-42376.patch b/meta/recipes-core/busybox/busybox/CVE-2021-42376.patch
new file mode 100644
index 0000000000..c913eaee9c
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/CVE-2021-42376.patch
@@ -0,0 +1,138 @@
+From 56a335378ac100d51c30b21eee499a2effa37fba Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Tue, 15 Jun 2021 16:05:57 +0200
+Subject: hush: fix handling of \^C and "^C"
+
+function                                             old     new   delta
+parse_stream                                        2238    2252     +14
+encode_string                                        243     256     +13
+------------------------------------------------------------------------------
+(add/remove: 0/0 grow/shrink: 2/0 up/down: 27/0)               Total: 27 bytes
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+(cherry picked from commit 1b7a9b68d0e9aa19147d7fda16eb9a6b54156985)
+
+Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
+
+CVE: CVE-2021-42376
+Upstream-Status: Backport [https://git.busybox.net/busybox/patch/?id=56a335378ac100d51c30b21eee499a2effa37fba]
+Comment: No changes in any hunk
+---
+ shell/ash_test/ash-misc/control_char3.right   |  1 +
+ shell/ash_test/ash-misc/control_char3.tests   |  2 ++
+ shell/ash_test/ash-misc/control_char4.right   |  1 +
+ shell/ash_test/ash-misc/control_char4.tests   |  2 ++
+ shell/hush.c                                  | 11 +++++++++++
+ shell/hush_test/hush-misc/control_char3.right |  1 +
+ shell/hush_test/hush-misc/control_char3.tests |  2 ++
+ shell/hush_test/hush-misc/control_char4.right |  1 +
+ shell/hush_test/hush-misc/control_char4.tests |  2 ++
+ 9 files changed, 23 insertions(+)
+ create mode 100644 shell/ash_test/ash-misc/control_char3.right
+ create mode 100755 shell/ash_test/ash-misc/control_char3.tests
+ create mode 100644 shell/ash_test/ash-misc/control_char4.right
+ create mode 100755 shell/ash_test/ash-misc/control_char4.tests
+ create mode 100644 shell/hush_test/hush-misc/control_char3.right
+ create mode 100755 shell/hush_test/hush-misc/control_char3.tests
+ create mode 100644 shell/hush_test/hush-misc/control_char4.right
+ create mode 100755 shell/hush_test/hush-misc/control_char4.tests
+
+diff --git a/shell/ash_test/ash-misc/control_char3.right b/shell/ash_test/ash-misc/control_char3.right
+new file mode 100644
+index 000000000..283e02cbb
+--- /dev/null
++++ b/shell/ash_test/ash-misc/control_char3.right
+@@ -0,0 +1 @@
++SHELL: line 1: : not found
+diff --git a/shell/ash_test/ash-misc/control_char3.tests b/shell/ash_test/ash-misc/control_char3.tests
+new file mode 100755
+index 000000000..4359db3f3
+--- /dev/null
++++ b/shell/ash_test/ash-misc/control_char3.tests
+@@ -0,0 +1,2 @@
++# (set argv0 to "SHELL" to avoid "/path/to/shell: blah" in error messages)
++$THIS_SH -c '\' SHELL
+diff --git a/shell/ash_test/ash-misc/control_char4.right b/shell/ash_test/ash-misc/control_char4.right
+new file mode 100644
+index 000000000..2bf18e684
+--- /dev/null
++++ b/shell/ash_test/ash-misc/control_char4.right
+@@ -0,0 +1 @@
++SHELL: line 1: -: not found
+diff --git a/shell/ash_test/ash-misc/control_char4.tests b/shell/ash_test/ash-misc/control_char4.tests
+new file mode 100755
+index 000000000..48010f154
+--- /dev/null
++++ b/shell/ash_test/ash-misc/control_char4.tests
+@@ -0,0 +1,2 @@
++# (set argv0 to "SHELL" to avoid "/path/to/shell: blah" in error messages)
++$THIS_SH -c '"-"' SHELL
+diff --git a/shell/hush.c b/shell/hush.c
+index 9fead37da..249728b9d 100644
+--- a/shell/hush.c
++++ b/shell/hush.c
+@@ -5235,6 +5235,11 @@ static int encode_string(o_string *as_string,
+ 	}
+ #endif
+ 	o_addQchr(dest, ch);
++	if (ch == SPECIAL_VAR_SYMBOL) {
++		/* Convert "^C" to corresponding special variable reference */
++		o_addchr(dest, SPECIAL_VAR_QUOTED_SVS);
++		o_addchr(dest, SPECIAL_VAR_SYMBOL);
++	}
+ 	goto again;
+ #undef as_string
+ }
+@@ -5346,6 +5351,11 @@ static struct pipe *parse_stream(char **pstring,
+ 			if (ch == '\n')
+ 				continue; /* drop \<newline>, get next char */
+ 			nommu_addchr(&ctx.as_string, '\\');
++			if (ch == SPECIAL_VAR_SYMBOL) {
++				nommu_addchr(&ctx.as_string, ch);
++				/* Convert \^C to corresponding special variable reference */
++				goto case_SPECIAL_VAR_SYMBOL;
++			}
+ 			o_addchr(&ctx.word, '\\');
+ 			if (ch == EOF) {
+ 				/* Testcase: eval 'echo Ok\' */
+@@ -5670,6 +5680,7 @@ static struct pipe *parse_stream(char **pstring,
+ 		/* Note: nommu_addchr(&ctx.as_string, ch) is already done */
+ 
+ 		switch (ch) {
++		case_SPECIAL_VAR_SYMBOL:
+ 		case SPECIAL_VAR_SYMBOL:
+ 			/* Convert raw ^C to corresponding special variable reference */
+ 			o_addchr(&ctx.word, SPECIAL_VAR_SYMBOL);
+diff --git a/shell/hush_test/hush-misc/control_char3.right b/shell/hush_test/hush-misc/control_char3.right
+new file mode 100644
+index 000000000..94b4f8699
+--- /dev/null
++++ b/shell/hush_test/hush-misc/control_char3.right
+@@ -0,0 +1 @@
++hush: can't execute '': No such file or directory
+diff --git a/shell/hush_test/hush-misc/control_char3.tests b/shell/hush_test/hush-misc/control_char3.tests
+new file mode 100755
+index 000000000..4359db3f3
+--- /dev/null
++++ b/shell/hush_test/hush-misc/control_char3.tests
+@@ -0,0 +1,2 @@
++# (set argv0 to "SHELL" to avoid "/path/to/shell: blah" in error messages)
++$THIS_SH -c '\' SHELL
+diff --git a/shell/hush_test/hush-misc/control_char4.right b/shell/hush_test/hush-misc/control_char4.right
+new file mode 100644
+index 000000000..698e21427
+--- /dev/null
++++ b/shell/hush_test/hush-misc/control_char4.right
+@@ -0,0 +1 @@
++hush: can't execute '-': No such file or directory
+diff --git a/shell/hush_test/hush-misc/control_char4.tests b/shell/hush_test/hush-misc/control_char4.tests
+new file mode 100755
+index 000000000..48010f154
+--- /dev/null
++++ b/shell/hush_test/hush-misc/control_char4.tests
+@@ -0,0 +1,2 @@
++# (set argv0 to "SHELL" to avoid "/path/to/shell: blah" in error messages)
++$THIS_SH -c '"-"' SHELL
+-- 
+cgit v1.2.3
+
diff --git a/meta/recipes-core/busybox/busybox_1.31.1.bb b/meta/recipes-core/busybox/busybox_1.31.1.bb
index 55c00eb483..14ac710f3b 100644
--- a/meta/recipes-core/busybox/busybox_1.31.1.bb
+++ b/meta/recipes-core/busybox/busybox_1.31.1.bb
@@ -53,6 +53,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch \
            file://0001-mktemp-add-tmpdir-option.patch \
            file://CVE-2021-42374.patch \
+           file://CVE-2021-42376.patch \
            "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.25.1


