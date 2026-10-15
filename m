Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 540C3CCA464
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:03:52 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32437.1792040630921013945
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:03:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MEnwwoVM;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so38966215e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 22:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792040629; x=1792645429; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9DoKAtTOHn9exmU2ewuAIRxHevFkURvXOIwWX/v74B8=;
        b=MEnwwoVMUkKRE+EoU+4xvfFO/s9m17KYQdpxDHqV8RkZCbV2zFSFBByxjMAosv65v7
         E9mctDrT4jUQCHmDcnFr+rFKLo/dISX1bHfRM2V+ykJyAYbf3nOZaqOqG7/7Cj5GPQLP
         KIwKWhmVvxNMA1pVYG23yWyLfNbV/bA6u8jrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792040629; x=1792645429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9DoKAtTOHn9exmU2ewuAIRxHevFkURvXOIwWX/v74B8=;
        b=RFA9lV2A3yTpG2eDdPDYiiPg0vkfuMI92qoHuqn9tIMlnHLu0KFSn59QwDARBXQJNY
         0mrVeFhtJ9CYAJExW5fdeeFSQ0zbpfsS9SlYT4RT1vQlNfsCYthcTFOcyHwH3dds0MYk
         dpEEBEsSf2Md33TzBab7RUg3TXBu2wS07pQn8GS0iKoSdnqEQy7oGQJYroa++7183Lyq
         nIzh4qMSQtE3fPhhMY4VdOlXeIvNQ0rZhGb7koX7ykuq5k8NZ8qoRiwkqji9r9vOnwwY
         k0MK9bbzGyAErns4DMs47NudA6x6cG8B9FajMfg17YfE2G4mZ5u+e35kFxWrnNUPe96O
         CxKg==
X-Gm-Message-State: AFq9FYLyFnhlckHjJiIjFT3nLsNrIalBqmtYHcJlMGoA7OltuUCvlCJG
	sr0p/1stQxoX+/4pxd9RhB3JiNmliR3kEDbQJpyeCAxJQNOKAbjYz6Y+W+GFrM31fbwRvSZJdQy
	nF6pj7w4=
X-Gm-Gg: AYBFou2D92OWL55iXtsk7cS/VyV1gJRDiWI+YUSc9e3DTQyJ5FtbkWvfVA3CTDfy8vC
	aN6ICTib2SpBxy50mvcVQrTnw+YbaaOIXwJ0JRJpf9jS6TQ2iX2Krl7FvmtrEZ0DtlNNkRPLSKu
	4h5SfkvvJyD+ZNh9QTy9R+ucDjQiE39fmzOxAJQwFzmFHactg1OiGtd78yWYUIBWoZNlEwcBaMy
	FMH5w11pUWDnvjvsh3KfJOvnEo42IJF5bih3PUXxg/HY2HwtXMVrB2407Nk22QDXvyvZgdZ2S3s
	Ty0Vog5oQCvGc476uxYPLk5OqvpjLftSdexx24tHYI5JhH3xX+vwHb8+7SkUT3JlnsQboMEVXw8
	ntxpdZhKYHOT6CFlALJYgg1QSzbYO0j8xzXGuzTkw+/wZCA6FSRb49ulQWCmDjjJLtpNSO577WG
	SOZQqAz1SIcH+pu7mvz+2zq9feF5goeg3YEEprQDZ+eqNQZykv0naPihNYANnlAuMf1ZIp89UJo
	G6zHJJhc62Yx2Osg6JFgpQDxaWtdWkprV80Srl0sgdvXGXhgi+phI0kmS2qB+uXYdsMCT9TIw==
X-Received: by 2002:a05:600c:1d0b:b0:4a0:13ea:2ec3 with SMTP id 5b1f17b1804b1-4a18e4ddca6mr356786775e9.35.1792040629095;
        Wed, 14 Oct 2026 22:03:49 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd972aebsm46376245e9.1.2026.10.14.22.03.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:03:48 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 17/55] libxml2: Fix CVE-2026-86140
Date: Thu, 15 Oct 2026 07:02:40 +0200
Message-ID: <2c45b60e5d543bca0c1a239254d879d1ad7e3a72.1792020605.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1792020605.git.yoann.congal@smile.fr>
References: <cover.1792020605.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247815

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/GNOME/libxml2/commit/d1686f91dbda141a752200419d35639fd6b38340
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86140

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libxml/libxml2/CVE-2026-86140.patch       | 56 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86140.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86140.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86140.patch
new file mode 100644
index 00000000000..bc7e069b092
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86140.patch
@@ -0,0 +1,56 @@
+From 7d324fcfa71e8567678ad254c0e10e509ebae99b Mon Sep 17 00:00:00 2001
+From: mohammadmseet-hue <mohammadmseet@gmail.com>
+Date: Thu, 16 Apr 2026 02:54:37 +0200
+Subject: [PATCH] fix: add bounds checks to xmlSnprintfElements in valid.c
+
+CVE-2025-24928 fixed xmlSnprintfElementContent for unchecked strcat()
+writes, but the sibling function xmlSnprintfElements has the identical
+unfixed pattern. The strcat(buf, "(") before the while loop and
+strcat(buf, ")") after the loop exit have no bounds checks.
+
+Add remaining-space checks before both strcat calls, with early return
+and ellipsis when space is insufficient.
+
+CVE: CVE-2026-86140
+Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/d1686f91dbda141a752200419d35639fd6b38340]
+
+(cherry picked from commit d1686f91dbda141a752200419d35639fd6b38340)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ valid.c | 16 ++++++++++++++--
+ 1 file changed, 14 insertions(+), 2 deletions(-)
+
+diff --git a/valid.c b/valid.c
+index ae4bb822..718e6d85 100644
+--- a/valid.c
++++ b/valid.c
+@@ -5047,7 +5047,15 @@ xmlSnprintfElements(char *buf, int size, xmlNodePtr node, int glob) {
+     int len;
+ 
+     if (node == NULL) return;
+-    if (glob) strcat(buf, "(");
++    len = strlen(buf);
++    if (glob) {
++        if (size - len < 50) {
++            if ((size - len > 4) && (buf[len - 1] != '.'))
++                strcat(buf, " ...");
++            return;
++        }
++        strcat(buf, "(");
++    }
+     cur = node;
+     while (cur != NULL) {
+ 	len = strlen(buf);
+@@ -5111,7 +5119,11 @@ xmlSnprintfElements(char *buf, int size, xmlNodePtr node, int glob) {
+ 	}
+ 	cur = cur->next;
+     }
+-    if (glob) strcat(buf, ")");
++    if (glob) {
++        len = strlen(buf);
++        if (size - len > 1)
++            strcat(buf, ")");
++    }
+ }
+ 
+ /**
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 53e8660366e..98a3e3ce366 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -34,6 +34,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-11979.patch \
            file://CVE-2026-86137.patch \
            file://CVE-2026-86138.patch \
+           file://CVE-2026-86140.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"

