Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECEFC5321C
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:52 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43818.1785193005773887882
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ygNipWrX;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495590dde14so35718035e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785193004; x=1785797804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=58Tld4c479Yk1LoDc11qq19Ph/wtx6C/vTq24Vx5ehI=;
        b=ygNipWrXoH7H0Ew8ENS5cPv1pBLzZC9fFkuqUfbAOEeDeNgjh3TAJmXU+Mn+2t94pQ
         4ZPiJhYYRgzmDWo/Mk5Gw9J45zUia78uhpzdgJJoCcDRDp8+AjR+bkayj67j+jRfXyED
         SUE328ylu+qoZPI/Nq7D/EOH58icKXJsEHMyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785193004; x=1785797804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=58Tld4c479Yk1LoDc11qq19Ph/wtx6C/vTq24Vx5ehI=;
        b=S+XavOQk/GbIz9cDMWkonjlN7g/5EAt/2szrdanq4owPDsXJn8n5lYZtxOvLJgM2Jb
         JsECA6V9eGBaZdfuH3jrNe7+AE0RYJjLycdOm5HCG/kYv7xTm8yK1EjJDtC+a3X3T4lM
         mIrJkBl+jqWVPwaNCu5AIgphiHai89NtqgRw2pmelmqD6u+mQKDF94sBoVo4SS3NItI2
         z1nYMg1ZvgGG5aBAAzZjOZQ/I06H/Cr+AXyE26BplUJYDchIYS1/DFfwm3CTlG0e2w8x
         VVxosNB6wQURuovybH3TyVFHc+M9HmNwhwdvi1qVOz9OGVHIIk+5Hiou41xbjfA8piJ2
         sJhg==
X-Gm-Message-State: AOJu0YwqKru+QSW8UNo+uBsT/PCfwJhezWTwI62r89ENS7jYf0+GeA67
	uu3cPq7uTKEO6+HpLSPaC03VXTFwnivnq1uz6ih8V/NMh2ubHP7JmW4hi9O8VhhOpN0yfoUuFl/
	33afoB+I=
X-Gm-Gg: AR+sD12/Hpua7RXJ5/8AElNi1j3PmakrbIenXogozOsXILl6sKZrOqVBi3MdnWrqMK2
	grDaO8bTIJT9RCy8Q31J6iUjGXf9DBT78hQUv/6UF5we4x6wmDnHUppg3i/xwWCC2AGNqrXp/pR
	qbIiCJkjuYD8tYcq/r/bq27GIisCqo0cU6rHwAUX0BA2WfP7K/7dmAhhCvQ0YtbpXDpsKT8XPsm
	kPVZ1/TqRuw+5PmItlnIWZlJDGN7wZwW857jwTiFpFJyFgiBIfeJHWf4UoIGoqSb3Phc+63cBaE
	mtdjC+B62jiQsASWwtvu0c/g+9EZSfncwlNIgKMGsjpup3xB9kTXVwdOMqXOlPCWTbC6YJp+5aC
	HnULwdaIUqQYNzqCChF/tuLmCVNLLXp2HCWXpn3cQb+dhq39dEe+JjEqEpNt6PV/8PMWbPerYue
	zzncpeoSYIwdKNMp4X6S7S6cF5f12rG951/lkV/OX4MBYsyfbyn9ufzwybuUqiHhRhgvlwdota3
	/f6ew==
X-Received: by 2002:a05:600c:3b2a:b0:495:4d5c:903e with SMTP id 5b1f17b1804b1-496c4f7ecabmr8591935e9.7.1785193004037;
        Mon, 27 Jul 2026 15:56:44 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45de1a3sm31513055e9.11.2026.07.27.15.56.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 15:56:42 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 30/36] xmlto: correct srcrev to point to released version
Date: Tue, 28 Jul 2026 00:55:44 +0200
Message-ID: <202cb3b918924583c5f73b5413a9f8ad0d54f38b.1785190123.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785190123.git.yoann.congal@smile.fr>
References: <cover.1785190123.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242147

From: Daniel Turull <daniel.turull@ericsson.com>

0.0.29 released has done Jun 11, 2024, 635dcd5bc8
https://codeberg.org/xmlto/xmlto/tags

current srcrev was 1 commit ahead
https://codeberg.org/xmlto/xmlto/commit/74862a684907ada3d4ed2ce0f8111adf626e1456

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0813c7dc9f379636b9f7adf0fee082187e24b26a)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/xmlto/xmlto_0.0.29.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb
index c26cd21dd07..29652bd7d64 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.29.bb
@@ -6,8 +6,8 @@ LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-SRCREV = "74862a684907ada3d4ed2ce0f8111adf626e1456"
-SRC_URI = "git://codeberg.org/xmlto/xmlto.git;protocol=https;branch=master"
+SRCREV = "635dcd5bc84a7b67a3a2050a179d96e1d3050b15"
+SRC_URI = "git://codeberg.org/xmlto/xmlto.git;protocol=https;branch=master;tag=${PV}"
 
 inherit autotools
 

