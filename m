Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B5BEF8E484
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:27 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28586.1776378803728865105
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tjspvLG+;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-488b8efed61so689465e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378802; x=1776983602; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYFTEJZe4DIV7YB1HGlxm7n6+5/dpCJAZhYQu3GUKHQ=;
        b=tjspvLG+M+/UFYPDot7VZdjh/UhMLiLUtmiQ+3CxZMEPLcxmu0uVEnjnhdZjyTRy2j
         5Eg4rrDeVV5M7moX8JA0Jj9wvczzO4KNYRdWaXjfKW7FdkJFyv5HUnOhu/iArhWO3i7R
         sLYMbA7ShpxV2Yhzizjgnx3aAd2dHoqV6LY00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378802; x=1776983602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MYFTEJZe4DIV7YB1HGlxm7n6+5/dpCJAZhYQu3GUKHQ=;
        b=gPJJll7Luzx63L/86fEKD2VVUO7ZzowbLDYKvClwpVy3R0SFtk+SkyHhCXm8P3eSXk
         HlkL41GOz3VgIfL2NZgsUTuCJTOibH1sV7KkFcxAMxQWh7MsjZNte1eTqYTGOEUSvPVr
         qjwG1L6JR+HCYYAIw44IWLjM/ZgKpX906tIL6ph05CvQIzIO5oK45nPqmYJJbL+ehJ+K
         HeElZRmLMnalg3IlzvENKy2qq6O25fsZTd+uMzshyTLOI25LfaDfXaeBUQ8WbYX+ZMFq
         AcatIPQa1Y4C8f+c1x1OZdGNJyv1k9VU3n4t+4PBb2fXfZNQe0f+t22BSuFjf9HInsJ3
         WOqA==
X-Gm-Message-State: AOJu0YwnRkLcSmlPV63DMCRCgUsg3F51wsd/z4Quzwz8N3XIW9jA/bGu
	ikGLvR0u/pdPeH5eS80ak8xW3hEUDUptsscbaKT9zQprKhOISxYTH7SK7MxGrfcr00OOif0o6MZ
	bbFsypvPkG17Y
X-Gm-Gg: AeBDieu3zMhV7Y3Hxh3xLT21ADeQmxaYxUpWyi7lLbMGLyW67WVGl3DAUVjsxQF7qiB
	FLmzUr0t9YJLwQZYSQwLTrGg8wYALoP5ordCigxceLboITZDkypGl3k34d91xrhIW4ZXtcAD4uL
	ECamWG0GSH+wNRvWwfD+YiJo78jtsk4e80bAFwGLikduLgfegHLKphyaY8Fy2IT0AiRlf+q43/H
	+fpIgLFw9eFfGBuvYFvImElW9E8nL885isCHTjyBsRJrXXJFklm+qGflCSC4f6v1jHWD8gKSdnN
	h6Hyyiaxf7mmsO7rOju1zehE/pJPKeKe5VtD7XXa9M+MYz+8p0zPXU2tCNp59Fl0N9cVID5NmFJ
	4Cd48NbIy0KLyigiVHtC8r+hD9x6IS5VYVwydhQzr3pte1YHCB/ewQr4B0bVbYzJtPpfbablweP
	gnqZoX4tMXKh73nA2cE/9TxxV4R899PNllzK1tsIHKyLdMIfK5ZuY3N4H6hFMq4qz9DxHTyzjMC
	JhOPpElAU4qkaxQrAObNJ90OtmUYKhJmZer0Q==
X-Received: by 2002:a05:600c:3150:b0:485:3cef:d6ea with SMTP id 5b1f17b1804b1-488fb8b9deamr2696325e9.13.1776378801807;
        Thu, 16 Apr 2026 15:33:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 36/51] license.py: Drop visit_Str from SeenVisitor in selftest
Date: Fri, 17 Apr 2026 00:30:19 +0200
Message-ID: <4bffedef91d04e848a4a31e2618b837d2b82436a.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235465

From: Sunil Dora <sunilkumar.dora@windriver.com>

ast.Str was deprecated in Python 3.8 and removed in Python 3.14.
In [1], visit_Str was already removed from the LicenseVisitor
subclasses (FlattenVisitor, ListVisitor) in oe/license.py since
bitbake now requires Python 3.8+.

However, the test-only SeenVisitor class in the selftest was
missed at that time and still uses visit_Str/node.s. On Python
3.14, ast.Str is fully removed so visit_Str is never called,
causing test_single_licenses to return [] instead of the
expected license list.

Replace visit_Str/node.s with visit_Constant/node.value in
SeenVisitor.

[1] https://git.openembedded.org/openembedded-core/commit/meta/lib/oe/license.py?id=6d3da37adbcaf5a7a3dade08f9d052571b195249

Fixes [YOCTO #16220]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8a5b019eec72676893507d018e7609745d2e3f49)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oeqa/selftest/cases/oelib/license.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/oelib/license.py b/meta/lib/oeqa/selftest/cases/oelib/license.py
index 5eea12e7619..49b28951f76 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/license.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/license.py
@@ -12,8 +12,8 @@ class SeenVisitor(oe.license.LicenseVisitor):
         self.seen = []
         oe.license.LicenseVisitor.__init__(self)
 
-    def visit_Str(self, node):
-        self.seen.append(node.s)
+    def visit_Constant(self, node):
+        self.seen.append(node.value)
 
 class TestSingleLicense(TestCase):
     licenses = [

