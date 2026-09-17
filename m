Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A845BC982D0
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:56:41 +0000 (UTC)
Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2378.1789685786139782571
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=en6QLln8;
 spf=pass (domain: gmail.com, ip: 74.125.231.204, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-7f4f0d37f9dso35069a34.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789685785; x=1790290585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S557CXAWkGOC9I7tjfhve1JBQU6ErQPzFBingm9IBpo=;
        b=en6QLln87wRZXhcamoR1uqwaicB7DTo/L7TFYXOD5H/dYrG19/u92YSNpJt+5nH1ty
         Uezk5XVf9RWJ506zAfb8qeMiRqBbxWF8+0Ozn6ZTWHkBop3GWQ9YWPYIPboSLqm7/Tjp
         ogyW8o8wqV1TpNdsXFM3QeXNueLW5c2KIUGBRnb4bZshpUW+4GsGjUJHABiv6ZT61B3q
         mF9ctIkLGGdGwExzFM7hW6SDmawoVBacaD9NzECbdc2AUBgTlXj8d5X35kC7ZdCJe06N
         oSSNQxHN/0DEbGeaj5LNvIVEhTax4CWNCGvXxJWz6N+EcsTR28dVpKjeRqTrtNpQQCaG
         IApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789685785; x=1790290585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S557CXAWkGOC9I7tjfhve1JBQU6ErQPzFBingm9IBpo=;
        b=VK72kBt5JLCZOPcpJCKMXKTqOpsH0ZO3+/aOQohoEZpoF5qaPxG7VNa3zgY19iayNJ
         Wl3ep/OAoGdJTm5w4CmobQNqCL9ix2SELjdXKnC6YQzmXGZ33CCBLzxqNZfzG9EwT2mS
         TAtoChBWuXFgfTAmvl3tArsqLuwSeMAn/7YHvG6mIZg29hQAUkFiWrAxYDQfvfeEcQyi
         7IEEHyZvez8gBsJqTG7jcMxbXMphKmkKkTbUGf4kbEjGS+SCqIYzp/qr+ZIFOAhIw02s
         P7Yhu2bzRrAR+lGJpvtlJt1HKB0hnxxnQwvLvQMxbR3JPxhT69iiBiPzJbJ36xE6B6Cx
         LXTw==
X-Gm-Message-State: AFuF++ma6cmWneAg54GKzn837Zxpdtxzofg80ICNFIqJ2D4wVm6mfVSB
	SkjmcBCO994+pVlH+2NABaTPmNwdGVxPP1KIlhCVnWOZm4AcriEujQZ583FixA==
X-Gm-Gg: AYBFou01JiuCwRw/wDfJQqxJUFDAEFraNQyJAS0NfrKN4lsrBiuOewlFkgulNV6KC53
	t9GbhiYchzqJPXXKpRQnNXT5JuN3a+O1SLTkh3AUzHMrIVkuZJP0sFiPhF+j17ajxweUrO92Bcf
	6zsolI2sV2hnta1TPVpZ3tHPzoXhkM2xZyk0ETgJgRGIYynq9LUUdIQdOhLshsfubeGdyrmpX7j
	H6N6jZ2uCRSFSY3iz7z8olydXQU3BNyFR2Eu/CcD2iLPSI8QWDycrlaIxlSL/w9aBWotnG7tu7Z
	UmUnrA1svV5OIRXlRPsnFKUzhXe4rcPGqypZUGlqkqhz6N8g1hLnYgh8HW4UcDirjbSPKOnMX5k
	FQA6GXL3azZRu0+3o/Zd9zFjZvPNKF1PNmUhY9zqgdSgGcaLnFgD2qtMs/SzjP5xEp/SbwU+G4e
	hXj/mdg0QzwxmiMSoYFA89446AwpXuU6BreqUvVKkaXhWoV9G8W82RgoW0mHWTilHTkd5X
X-Received: by 2002:a05:6830:81f7:b0:800:a53f:707c with SMTP id 46e09a7af769-80de0a51640mr825888a34.2.1789685785267;
        Thu, 17 Sep 2026 15:56:25 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b01:ba50::a0b3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80c466a2e63sm4265018a34.15.2026.09.17.15.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:56:24 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] lib/oe/spdx30_tasks: Fix missing license text
Date: Thu, 17 Sep 2026 16:56:15 -0600
Message-ID: <20260917225615.826318-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246175

When the license were switched to be SPDX License Expressions parsed
into ASTs, the code to add the text for LicenseRefs was re-written.
However, the initial call to start walking the tree was accidentally
omitted meaning this was never called.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sbom30.py       | 2 +-
 meta/lib/oe/spdx30_tasks.py | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index e02382c3cc..b33860e4aa 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -615,7 +615,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
 
         for key, value in license_text:
             lic.simplelicensing_customIdToUri.append(
-                oe.spdx30.DictionaryEntry(key=key, value=value)
+                oe.spdx30.DictionaryEntry(key=key, value=value._id)
             )
 
         return lic
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 9978ae731c..b6456a214a 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -84,6 +84,8 @@ def add_license_expression(
     if s is None:
         return None
 
+    walk_license(s)
+
     o = objset.new_license_expression(s.to_string(), license_data, license_text_map)
     objset.set_element_alias(o)
     return o
-- 
2.55.0


