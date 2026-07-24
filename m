Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B447C53209
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 09:02:07 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15481.1784883725758280309
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 02:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=B6/np8zG;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92e5b048375so11205785a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 02:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784883725; x=1785488525; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1WqN6l8M4H6lOjvY7wB/rKjkgS7YLTq6vxS99nEqrOA=;
        b=B6/np8zG9iSD6roCXz88aMDjGhY2Zd4xYyCgn/5kEeQjDNuyIkYsADtL0uQN7HpMI9
         cA2CjulQGOU2ZFQkmyuqm/tlR4ttZMdP1ZO7Wlpt6gUOiRj5WSWCbTRseaTHVkHsQMRx
         QwRukHsuRmsP82S0zhLESFcRVW6dcuKSWCF/s6sdZS/A3MSHdDFxFVysnZX/jCDKF11f
         uP7EFpXzgHMg0yMjx9saiSGbBXh6+kkHVbBsOPpw+ly/6Z8O7+nOqF+/RhE3vFJ7xbj8
         evIujtYxcPbwko81eyIJ/zwyxZdq5YOmc8QO+H2t5/C0a0+OOu3dB39zsLdeqp4rTJpq
         i2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883725; x=1785488525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1WqN6l8M4H6lOjvY7wB/rKjkgS7YLTq6vxS99nEqrOA=;
        b=cw7XOqvFyY6B2am4EgR3A+j4sUhoraVSEUNgCK+Ik/v22snCKWt9d7sBAZvXywsUht
         P/gz4fGImu30CWl6GqmoIdH53TzJE+MK48HYCNwJ2cg0s/kKq0ZupkY0MU1yo2Yr48Zd
         Qh5OK2+aBV5DatZT0DHU4EUVgx1+R+XMW6yv2kFgtHOhbJ4A1p4ofywfEBvNQEYybHoR
         h6xl1nr5s7PNfs23+tac56Li6xaXFmpMaeOiQfzHLutrmdO1bF/CI4CBhWIyXdaExAfv
         MOM2k8w7b+2+T9q4MWdQk86UAGaoRtXFdYAs7Wuw8CHRUwSwuUtilKBIOsfOZkTOElp7
         1z2g==
X-Gm-Message-State: AOJu0YwRvLGOypCABgiaVF830tlVeBIsdzmPqQTARekoJZwMpvjltHIp
	Bl5+LILVkoQ9uZ2jloUevm0Ffv9tHUEfTZJkzSjLt7wKxIt1wIj4nc36YCyVFg==
X-Gm-Gg: AR+sD113Kty9hkYTiBt61D1zpsPiNdQ2HDatqJxbi2FYrZlM6qxOmWTdyKqSuyQe2rm
	wFLVNbYmPZ/i6zn+S9gN2GIHcrUYmT0T3AXUshV4REjjVGAWgZ12ldo3VEPw7B0a3tge5qA8KXe
	rK7IZMVgs8s8vQ6bIjnHYKUimP3X541JUBHBcO7V6YN7ZVBwPA8QrAJoiGgDMmCQIliApSfLILq
	0d3bzz9+OWg/0v0ZY+TksNgO/1X+c0kyRE08kGhSwCoyfhe7HhjQOMcLSSFpnT7Uk/KXi6jZkUi
	aeo87+LPlBfgsaq2vio+2KuIXZyFkxk5FKqK9a6kH2jUKfxR/7SzOKmzXfEEZQSF8nK7034dTHz
	Rstu5LFlqJtMmTGs8g7XLR4Dp/wHGxcTMZyV++zYMYWsOX8IWc5ShMbTsKJ2u6V45a3ZxhVs3pz
	BhqKzh3jCJMhcl5LjULLxLuDLBFyuIuJfjgQJEjk9rGfRU
X-Received: by 2002:a05:620a:458a:b0:92e:ef09:f8f2 with SMTP id af79cd13be357-9310376389bmr621577485a.66.1784883724664;
        Fri, 24 Jul 2026 02:02:04 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907baa27cf1sm63968326d6.46.2026.07.24.02.02.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:02:03 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 03/10] oeqa/selftest/wic: drop dead COREBASE/scripts wic lookup
Date: Fri, 24 Jul 2026 05:01:39 -0400
Message-ID: <20260724090146.19924-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260724090146.19924-1-twoerner@gmail.com>
References: <20260724090146.19924-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241913

_get_wic_path() searches for the wic binary in two locations: the
in-tree scripts directory and the wic-tools native sysroot. wic was
moved to a standalone repository and is no longer shipped in
scripts/, so scripts/wic never exists and the first search path can
never match.

Look for wic only in the wic-tools native sysroot, where the wic
recipe installs it, and fail with that path if it is missing.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v4:
- new in v4
---
 meta/lib/oeqa/selftest/cases/wic.py | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index c4a1c7241bbc..6a2706fc2c8f 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -107,18 +107,11 @@ class WicTestCase(OESelftestTestCase):
 
     def _get_wic_path(self):
         if WicTestCase.wic_bindir is None:
-            search_paths = [
-                os.path.join(self.td['COREBASE'], 'scripts'),
-                os.path.join(get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools'), 'usr', 'bin'),
-            ]
-
-            for bindir in search_paths:
-                if os.path.exists(os.path.join(bindir, 'wic')):
-                    WicTestCase.wic_bindir = bindir
-                    break
-
-            if WicTestCase.wic_bindir is None:
-                self.fail("Unable to find the wic binary in %s" % ', '.join(search_paths))
+            bindir = os.path.join(get_bb_var('RECIPE_SYSROOT_NATIVE', 'wic-tools'),
+                                  'usr', 'bin')
+            if not os.path.exists(os.path.join(bindir, 'wic')):
+                self.fail("Unable to find the wic binary in %s" % bindir)
+            WicTestCase.wic_bindir = bindir
 
         path_entries = []
         for path_group in (
-- 
2.50.0.173.g8b6f19ccfc3a


