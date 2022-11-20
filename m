Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F7BDC4321E
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:15:50 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.13203.1668953744553972045
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:15:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=uyAxOcAU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d20so8407052plr.10
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5n4Vyc5pFF3zmms39LHI3WyOOhGCj7UDy5E/Dp1ZCfs=;
        b=uyAxOcAUV+k4718mAKYswPrWcJc301PyTZnrKStP4KoLzvHJyT2P6PIj3nKQiy6JLM
         R4HyCF836SYDl664/WZZtcN0qzlLwg2cWjwfG3IqNfof8H4ePsYCYSsQy+05tPENjNEy
         w87ak/7FrYCDar/iCHkdU+AQIduLHq2g8EuaEJTXi6MDn4JaDzfqcvMKJbLX4dpcFmJN
         zUy/HrbklXKgXyuxdTdIsT2UqZKAwXo2BNoZQMsXLunrWqSow/umGJ5jlyXW8i5jy0Cm
         jKl7asIIOeOG52kiwMYrjX0Umr91x3sDRLENLRihx9or+H1at7wSBDBuInRPvnuIH9vL
         gS4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5n4Vyc5pFF3zmms39LHI3WyOOhGCj7UDy5E/Dp1ZCfs=;
        b=c3Ic6RaO3jJlvVh7zgG4dfQKRIJp2byqQ9Tk+ylX0dn+vMkbg5Mp1TYKulx0YtDHcg
         AigXVqdqbAjBBJ2tpma4PHpYSeBgHgMAlEI3OIoJUImF10bmcXrZwJ8v9TOQZKf2Y+H9
         Ojv4c9lmnJor2wXS1832R9PAFzyU7FEXZ3CkDkwVXh+RZiM9nFTGez4DgZ3PffX0oKf8
         BgzVSPsrMLLrIkexWou3Jmb+b9Yi4LemDEOa5GgqdItczd2nGBw3tXW0qK1YxAxycMw0
         56zBonEgPmKiTs+D52S0XLcsizs+4qBkbbKeYBlD2jJquyis3gCcZj3o81U/6eZAo1s4
         NFyA==
X-Gm-Message-State: ANoB5pnvdmL7H3clQ/M0Tk4i/32dUAHBAay4RbvgoX2dC58NYiqdz46Z
	CZeC2dSG3R1BFaLxW4BtdYv1yA3VwiTODrcGHLc=
X-Google-Smtp-Source: AA0mqf6QeybMqip/8SeH1QkaXDZzOBKYh5rlcbK7HsseuMoerV2EfiBXt91I5dScvn93TDLocHNpWg==
X-Received: by 2002:a17:90b:360f:b0:218:ac6c:b229 with SMTP id ml15-20020a17090b360f00b00218ac6cb229mr2009047pjb.144.1668953743563;
        Sun, 20 Nov 2022 06:15:43 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.15.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:15:43 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 04/35] systemd: CVE-2022-3821 Fix buffer overrun
Date: Sun, 20 Nov 2022 04:14:53 -1000
Message-Id: <4a29ef039897e2d45e5c0b7416ce30a22b668453.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:15:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173604

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/systemd/systemd-stable/commit/72d4c15a946d20143cd4c6783c802124bc894dc7

Affects "systemd <= 251"

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../systemd/systemd/CVE-2022-3821.patch       | 45 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_250.5.bb    |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/CVE-2022-3821.patch

diff --git a/meta/recipes-core/systemd/systemd/CVE-2022-3821.patch b/meta/recipes-core/systemd/systemd/CVE-2022-3821.patch
new file mode 100644
index 0000000000..eb8b0cba12
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/CVE-2022-3821.patch
@@ -0,0 +1,45 @@
+From bff52d96598956163d73b7c7bdec7b0ad5b3c2d4 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Tue, 15 Nov 2022 16:52:03 +0530
+Subject: [PATCH] CVE-2022-3821
+
+Upstream-Status: Backport [https://github.com/systemd/systemd-stable/commit/72d4c15a946d20143cd4c6783c802124bc894dc7]
+CVE: CVE-2022-3821
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/basic/time-util.c     | 2 +-
+ src/test/test-time-util.c | 5 +++++
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/basic/time-util.c b/src/basic/time-util.c
+index b659d6905d..89dc593d44 100644
+--- a/src/basic/time-util.c
++++ b/src/basic/time-util.c
+@@ -588,7 +588,7 @@ char *format_timespan(char *buf, size_t l, usec_t t, usec_t accuracy) {
+                         t = b;
+                 }
+ 
+-                n = MIN((size_t) k, l);
++                n = MIN((size_t) k, l-1);
+ 
+                 l -= n;
+                 p += n;
+diff --git a/src/test/test-time-util.c b/src/test/test-time-util.c
+index 4d0131827e..8db6b25279 100644
+--- a/src/test/test-time-util.c
++++ b/src/test/test-time-util.c
+@@ -238,6 +238,11 @@ TEST(format_timespan) {
+         test_format_timespan_accuracy(1);
+         test_format_timespan_accuracy(USEC_PER_MSEC);
+         test_format_timespan_accuracy(USEC_PER_SEC);
++
++        /* See issue #23928. */
++        _cleanup_free_ char *buf;
++        assert_se(buf = new(char, 5));
++        assert_se(buf == format_timespan(buf, 5, 100005, 1000));
+ }
+ 
+ TEST(verify_timezone) {
+-- 
+2.25.1
+
diff --git a/meta/recipes-core/systemd/systemd_250.5.bb b/meta/recipes-core/systemd/systemd_250.5.bb
index 5d568f639e..8b6d0e8580 100644
--- a/meta/recipes-core/systemd/systemd_250.5.bb
+++ b/meta/recipes-core/systemd/systemd_250.5.bb
@@ -25,6 +25,7 @@ SRC_URI += "file://touchscreen.rules \
            file://0003-implment-systemd-sysv-install-for-OE.patch \
            file://0001-Move-sysusers.d-sysctl.d-binfmt.d-modules-load.d-to-.patch \
            file://0001-resolve-Use-sockaddr-pointer-type-for-bind.patch \
+           file://CVE-2022-3821.patch \
            "
 
 # patches needed by musl
-- 
2.25.1


