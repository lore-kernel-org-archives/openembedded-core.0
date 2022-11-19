Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42386C4321E
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 17:48:08 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.26302.1668880080260198294
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Nov 2022 09:48:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=G1fe4y6i;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 62so7621316pgb.13
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 09:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=js3G/0tv12zGoR6DvCkwN1dcGoM0A5ogYKoQHEKycus=;
        b=G1fe4y6iaFhsIAn0XM8nfC05dEy0XKejorMXzkXaLNAgRz8/Vqx6G342H5xH3Lxazi
         hcC7b1vsKJVmO3G7e3BHfQMAPstos+3Ojg5M8M79Cm4hD3UcsfWhHJ50cOmQAhlY3fuU
         JAMGsg+5kOi3s50t3xujooe9vdKt12rtk2LYJeAiEIxd49HTMzehg1dLVXylO0Bh4FGB
         l67LbMCj6SviArNXv4by8Vp6fowIUPgwNwKVsFcnEoJvvcFJFzMho0uSKr3chkZUUEij
         BLN20kUnXIDm73lWz5Bo3iAfzX36kaZfntZDE4uiY9fhmr3z4p+gzwvIRBTFXsSjvsq+
         E7+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=js3G/0tv12zGoR6DvCkwN1dcGoM0A5ogYKoQHEKycus=;
        b=olZF/0QSFFokkOXgHc6Zh3wQjQWj/7o561Q1HQ9Zv/35SiFZ8igGlE2KfEN7hzOCLe
         7R/9DIt0OSjvvBYAR0XbgPcDh0Q+KXP8tGXvoAo9PejDbjprxdNPCu8F8E12nJ52awPU
         gUnzOn0phu2rT/BQVP124wyb153L7pg658l5SlccQSSBxr7B3YC9bXZCT55hjNYfPTWd
         bRtUcnD+nZlRqXL0jHdDrJiZxanV4zonVrFY+HKj211WpuoWw5vNoTcmDCZvPG3k3c1C
         m3ZvhTK5FmWBmrNOUaSopnpb6sjsLBKuUhNR0qqXepB7NTqbFolqJvePTyY8Rg6YwJc2
         +YTA==
X-Gm-Message-State: ANoB5pmgN1rw4+aNon4x3t77eaRA15T7LAkf+lVWHfva18aKdg/z7uBa
	Vn3bze5YXiz1T5xekgwkCve3mUoOyzZtzyp4/IQ=
X-Google-Smtp-Source: AA0mqf7EHGPN8dLwN6vx/vzogWhj/Ea4hllOiKRNy1rCtKEMZCK1eY1uITxop/qunObmWkk9kH1NQQ==
X-Received: by 2002:a62:1d86:0:b0:56d:d08c:baf0 with SMTP id d128-20020a621d86000000b0056dd08cbaf0mr13399285pfd.72.1668880079206;
        Sat, 19 Nov 2022 09:47:59 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id m6-20020a17090a668600b0020d3662cc77sm7384151pjj.48.2022.11.19.09.47.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 09:47:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/21] systemd: Fix CVE-2022-3821 issue
Date: Sat, 19 Nov 2022 07:47:30 -1000
Message-Id: <fe821cbb761238159013c59d17c56193a2cc94ff.1668879817.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668879817.git.steve@sakoman.com>
References: <cover.1668879817.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Nov 2022 17:48:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173520

From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>

An off-by-one Error issue was discovered in Systemd in format_timespan()
function of time-util.c. An attacker could supply specific values for
time and accuracy that leads to buffer overrun in format_timespan(),
leading to a Denial of Service.
Add a patch to solve above CVE issue
Link: https://github.com/systemd/systemd/commit/9102c625a673a3246d7e73d8737f3494446bad4e

Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../systemd/systemd/CVE-2022-3821.patch       | 47 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_244.5.bb    |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-3821.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2022-3821.patch b/meta/recipes-core/systemd/systemd/CVE-2022-3821.patch
new file mode 100644
index 0000000000..f9c6704cfc
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2022-3821.patch
@@ -0,0 +1,47 @@
+From 9102c625a673a3246d7e73d8737f3494446bad4e Mon Sep 17 00:00:00 2001
+From: Yu Watanabe <watanabe.yu+github@gmail.com>
+Date: Thu, 7 Jul 2022 18:27:02 +0900
+Subject: [PATCH] time-util: fix buffer-over-run
+
+Fixes #23928.
+
+CVE: CVE-2022-3821
+Upstream-Status: Backport [https://github.com/systemd/systemd/commit/9102c625a673a3246d7e73d8737f3494446bad4e.patch]
+Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
+Comment: Both the hunks refreshed to backport
+
+---
+ src/basic/time-util.c     | 2 +-
+ src/test/test-time-util.c | 5 +++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/basic/time-util.c b/src/basic/time-util.c
+index abbc4ad5cd70..26d59de12348 100644
+--- a/src/basic/time-util.c
++++ b/src/basic/time-util.c
+@@ -514,7 +514,7 @@ char *format_timespan(char *buf, size_t
+                         t = b;
+                 }
+ 
+-                n = MIN((size_t) k, l);
++                n = MIN((size_t) k, l-1);
+ 
+                 l -= n;
+                 p += n;
+diff --git a/src/test/test-time-util.c b/src/test/test-time-util.c
+index e8e4e2a67bb1..58c5fa9be40c 100644
+--- a/src/test/test-time-util.c
++++ b/src/test/test-time-util.c
+@@ -501,6 +501,12 @@ int main(int argc, char *argv[]) {
+         test_format_timespan(1);
+         test_format_timespan(USEC_PER_MSEC);
+         test_format_timespan(USEC_PER_SEC);
++
++        /* See issue #23928. */
++        _cleanup_free_ char *buf;
++        assert_se(buf = new(char, 5));
++        assert_se(buf == format_timespan(buf, 5, 100005, 1000));
++
+         test_timezone_is_valid();
+         test_get_timezones();
+         test_usec_add();
diff --git a/meta/recipes-core/systemd/systemd_244.5.bb b/meta/recipes-core/systemd/systemd_244.5.bb
index f3e5395465..77ef2bc42f 100644
--- a/meta/recipes-core/systemd/systemd_244.5.bb
+++ b/meta/recipes-core/systemd/systemd_244.5.bb
@@ -33,6 +33,7 @@ SRC_URI += "file://touchscreen.rules \
            file://CVE-2021-3997-1.patch \
            file://CVE-2021-3997-2.patch \
            file://CVE-2021-3997-3.patch \
+           file://CVE-2022-3821.patch \
            "
 
 # patches needed by musl
-- 
2.25.1


