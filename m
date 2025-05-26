Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDB4C5B542
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 08:36:20 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.24706.1748248576574305309
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 01:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=QB4lvAyG;
 spf=pass (domain: linaro.org, ip: 209.85.208.180, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-327fcd87a3cso17597501fa.0
        for <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 01:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748248575; x=1748853375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6udH1gsUuHFnWeChKLZB5QywiKbC3CCIz5+pVqZBwo4=;
        b=QB4lvAyGo1QREY48gdFdnp27TNB4eBPwSWzuP4qHeWH6YLGvIugMJGN/OtdD4U4Q3a
         jK/QtZ9wHuwG1g6+dagDVqffM/kHMjfyKAXJyu20g7+tMwpKGxWsMcRvEtj1ge6EjzUh
         7VOWxpiiLVWqGQU3Br4bYb909aEd01Y+WsDccG66Hb9LiwyhsdkVuS6FMLP8fC86ooM7
         olN8368Ij0mnZ13OmaadQFtaFA4/SsY9s33deWtQFviY05guXun+Mgkr8xUZNAH0qv6P
         oQfx+1gxlIJfveGCeWESFOHNgE3U114+YBQ5WbQo6ixMiMCxflwtAVjIxAsafQNofKLP
         FoHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748248575; x=1748853375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6udH1gsUuHFnWeChKLZB5QywiKbC3CCIz5+pVqZBwo4=;
        b=nbAxoveE1pL1AtZtmuQ4Fa8wHLS5UarQKUF43xC6ciGLuI8xy6VYV8Ut8q8Zv79mls
         QLiax8HhEdgv6k2nqTnXA+TMEiK/EFCJFwXoWfqJOOXYcc+UlhpgfTOLFG3yOSSXhn+y
         RR+auHMIrHRQXwd00Eo2m10Cl27PI7xjAco7hEyz3Aah3xA1roXB+zTB4M+1dwlVX9fP
         fDxojYlVTmak5gIhiRX97f/IfyWyJfCmQnXxdeaPCVP5wIwViS8p+5kxsl1gJBJ3M294
         mwxGY3kyJaeDUrTaX/CaQcF9ZMwd5wA/2fXkWs+L6VZn/3N8QEZzpr6RIBX39g5HiPRG
         TZ2A==
X-Gm-Message-State: AOJu0YwTR3TZtzqdKTp0am5Hj319sbfjU5hArwokbyO9JXthnCpDkU8A
	eWidqqHY/BmfOwsXxHDik0Y1Vy7xadC7n3hTMIIXeISmTOB4bIX7/ElsW9JuYBknjq4n4SJpS4a
	2OSL38yQ=
X-Gm-Gg: ASbGncvHK78kov+3Rqt5Nr3uERfrPRGm4G+akuRyFfpyb49WNLdgmQDXyKLBIICZZAD
	+w/Z3ROO7VKG9UYzIZ+yQ4oKtX46i8l2Mw48M53nKz8X1TWQi23YHrPGdLKEE1WKA+G2Ou2Ppya
	fI5KQTdr84h1o/G8NkGG71sqa77EJTSIBoatBnZstBCZ2MSlzYCdpx/oTJHneNkFYqh5kLutyV8
	2fLDYo3Qu2mebcd8zlKXbot7V2cAzdmiSZBxnfWclzm0eMhgkBkeJKf3BMSXUMC5XcCysQ2LsW4
	+51zEcHl3UL3h/Lf/3ZBsYtms+XJvasP+lPT7shuXgVQjRcumhWSjNrAfLIFoazfxKH9i1pYp0U
	W3jSM1MgSPjU00kAq+uplRYhYS6gFBhfXMAFpvgE=
X-Google-Smtp-Source: AGHT+IH6J9ciuaccqKpGQttTdCYOJpGUwq8BOKka5PFrTar/pAnLhWPVHltYaXseiWnZozYTMvU0YA==
X-Received: by 2002:a05:651c:50b:b0:32a:66f7:8a15 with SMTP id 38308e7fff4ca-32a66f78ac7mr1999411fa.39.1748248574668;
        Mon, 26 May 2025 01:36:14 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a6502c667sm1271651fa.101.2025.05.26.01.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 01:36:14 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v4 3/4] oeqa decorator/data.py: add skipIfNotBuildArch decorator
Date: Mon, 26 May 2025 11:35:46 +0300
Message-ID: <20250526083548.413834-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250526083548.413834-1-mikko.rapeli@linaro.org>
References: <20250526083548.413834-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 08:36:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217259

To limit tests to specific build host architectures.
For example KVM testing will only work if target and
build architectures are the same.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/core/decorator/data.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
index 5444b2cb75..0daf46334f 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -228,3 +228,15 @@ class skipIfNotArch(OETestDecorator):
         arch = self.case.td['HOST_ARCH']
         if arch not in self.archs:
              self.case.skipTest('Test skipped on %s' % arch)
+
+@registerDecorator
+class skipIfNotBuildArch(OETestDecorator):
+    """
+    Skip test if BUILD_ARCH is not present in the tuple specified.
+    """
+
+    attrs = ('archs',)
+    def setUpDecorator(self):
+        arch = self.case.td['BUILD_ARCH']
+        if arch not in self.archs:
+             self.case.skipTest('Test skipped on %s' % arch)
-- 
2.43.0


