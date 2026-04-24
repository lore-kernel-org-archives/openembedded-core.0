Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3EC0FF885E
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:14 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32002.1777064234439314128
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PHhwTl75;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4891b0786beso54232895e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064232; x=1777669032; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYFTEJZe4DIV7YB1HGlxm7n6+5/dpCJAZhYQu3GUKHQ=;
        b=PHhwTl75m4YQfL6Lhyi5HBKJVJW6+O8wGEVmEYXac+hmulpousmduhwFHda6QcHo2k
         hV5VBLb/eNuYatd/wnn2EnAQ/Vly51B/7GdnffEief3yqJ3vM3A2QAioouRudl1BVKXL
         MawdwDMl3yoQYB7+QIt6q860xCMTNLwplqxNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064232; x=1777669032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MYFTEJZe4DIV7YB1HGlxm7n6+5/dpCJAZhYQu3GUKHQ=;
        b=RZnfR15u/XlCkdLwfm9nFTCyMg8cGrDjyyMLIXYYGRkopaxy/W9UJ8hHHOG3RIcRRi
         KhxKaI7waY9nxiit/bhJDPSrLGmtHux3JybKXa80ffWodp9zF7qiaPJwXHvLiqRn1yO/
         sfeotrHeHJe3dVeGPjC/AoCs1v1P3IpPYlTh/s2SVNI85HOSmYg/jgPtMzUCGBRJ7xwJ
         bu479yrLLIa7Z2n3XNCAAZ4bPaYHwH1/NwbTOUy5ymJwUIQoAkVHCwsI6uDNDFd0bMmK
         M3+hrs2wDUCbnho3YuzWrQMD7+2I5W1eKSijjtzYVj8gFPmNfRW5lLqWj6clRbiiXMBG
         fB1w==
X-Gm-Message-State: AOJu0YxlGHfmXTvCMiJGSs4rnbAxTzmoYjLtJKo3Irro/vpqmLJZui0n
	HsrUFs+DFpRifKBkkEtnW5ei+6v7ruZSRmDuonwNxiliBR6skPMSNDIwu/wRecH89eRBprJeUbD
	91RjSEX9J69I8
X-Gm-Gg: AeBDieuCuYH58le8drC4iUvpuioIVwUuYfY58bOZ3o5R3RPOD38t2MRWpLf0kk9jAIX
	bYHzc5veA43pZsX4Q8HKJ2Sgux6vurYki7OKdwDWW7Si17F+F0XiCOjuDmIEHX0KAlOQD7KyuDg
	6MV+Zpdf2AFZnznq29kmtLwX/nrAEjtHBY3vm4kd9sMm1r0MtdoaaWEDQzpS5zE4vSLinyQizHO
	8eo7fdtG67SsOMQmArmJ8CjQHGBxIibL2m6VgtkDOw8tHig4YrplSf+FmuJUed0WAxErX48WOhS
	jIKqcTJzf0bDLN3jlXaZs4T4/V2ZEZ7MDWy3eFTQsyAkCMOMqkM4CL9fscY/2FLglKMOnvhwlvd
	VzylGJ40O5E8E/M6Udep1SEjpMOLsnXu1OPm81/5rHfU8f6Xx525vrv+eUuG9KlIfHuqhhi0xtG
	pmO5JbE4YOr48Gvs+4cslht7lWut9k4HrslzrvuIqZCQQmEN0YSnCYWIRXwQMFGKfYG8Udfgqto
	5p02yyrx11RSjYM55e9o8nhcDIFnNsTsSW5rQ==
X-Received: by 2002:a05:600c:620d:b0:489:1d23:4524 with SMTP id 5b1f17b1804b1-4891d23468bmr335430635e9.5.1777064232544;
        Fri, 24 Apr 2026 13:57:12 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:12 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 62/66] license.py: Drop visit_Str from SeenVisitor in selftest
Date: Fri, 24 Apr 2026 22:56:01 +0200
Message-ID: <f8ac1b567d7c09ee45cb0d23fc9dd25987a76129.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235935

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

