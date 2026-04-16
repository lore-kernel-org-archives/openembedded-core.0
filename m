Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91DEEF8808B
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:53 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7731.1776322124184819910
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=f4ErVb5W;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-488ad135063so73900645e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322122; x=1776926922; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYFTEJZe4DIV7YB1HGlxm7n6+5/dpCJAZhYQu3GUKHQ=;
        b=f4ErVb5WXsh8R7PJ5yIwDm4UOZGk7u/o1pQbr5je3Ion5qWWMi7e88llsFEYI7uxnV
         Im31m/3fKiHDRTbl4zYpOlYh+2iYQ0N2k6y8SrjTfVJVTUgWX8jBeEtSm6IgB+zyuPHM
         rTmEo+lEo89TRJfXAxfjWNJeDqmQM/9w/j1hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322122; x=1776926922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MYFTEJZe4DIV7YB1HGlxm7n6+5/dpCJAZhYQu3GUKHQ=;
        b=cg2CM0rHMXPvmYDY98ncUmkMgd0omQO9Cpd4NUCEz3s5CihaP8ejQWAL0rmHNRyYb9
         1Iko7KIZhfVGxTDbMm85fwd6JQ2HpcIcGyDqYzOvS5xCahX5D3YDLRHECXioD2zxGzXJ
         qqJdUz/dBsvg3PF+EdXV8pruwujKrvpfiQKiCF7jncYWiXD20pB2J9JhBidlfXRp3Gxq
         HHofZT1SCiQvs7N7dA7ARNcSGn2ZE6TOJSPpXGm9Rj4yXrjLIsP2TET46tCjdFzFeqBI
         qmv7+gj28Asa7b8k3uzT3kYxMb5H+KmQw5INjCgJmKzzX6T9C5uoI8NIzmatXddrLHfn
         BeZg==
X-Gm-Message-State: AOJu0YxsoMJr49udU0euNE+LIyC6xVHavUAM3Jtdow3Rqf5aeXULfBVK
	7tkc4RIXKEJQWziYq6uprmJ1PFqh7Yk8D0cHba3IBVnxSuJj5BYvqHSKRHuWsAzqOaEIXZPJFFX
	3ZfjXwEZC603m
X-Gm-Gg: AeBDievgHZHRL5bqQb+h/LzD2skx/XBD/+q4rpRgv3G73NQvmvhrMpoSq7GsMWH3OFR
	A/ujgPLPEYAjvpKDx1/F1HahS3vAd0c46Eakrv4r+GwFJeN80AYKL4C0WBLr59bQ6B1mfVkOe50
	1ayxjwaQkaf28xrGn3pFVuFYTkTW7NzBDY+f+eCTXGaKXRDgjotIbu3qMRRpQGy/v17LXHRdRqU
	ZQW9Iq9r4eqqpwEx4sus6UYZdF5wI0itn7n+lpPsx+gFM+YXPHQsFpkbeYeekAp6DcEoUFc+naF
	UxZxaIiF8tnf8lMpffCZW4RG7wTckluVNMKztJnwym4TGrN1IYMy6U1puSiB2Hk5OOJpQyzW1kp
	VQHb+URRktxrwpJcwZkOd/yMowIxdghCYHlDGp/PM2YRw12CFN7TP7Jb1M92t8Wbp7uas0g9oQu
	VwMmCWQQYs6O0y8Kntr9V5cS9oa1CEDXpgz5hletmx2VyTJx6WJXIsjYHx3TzCC9g+/1RcIjWg+
	SoRgw2qMDHUjA4lDdBtvJ9eI9NumUtts+91qm9Vl/23Qu3U
X-Received: by 2002:a05:600c:674f:b0:488:a82f:bb9b with SMTP id 5b1f17b1804b1-488d68cb47amr351437015e9.30.1776322122161;
        Wed, 15 Apr 2026 23:48:42 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:41 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 36/47] license.py: Drop visit_Str from SeenVisitor in selftest
Date: Thu, 16 Apr 2026 08:47:37 +0200
Message-ID: <4bffedef91d04e848a4a31e2618b837d2b82436a.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235378

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

