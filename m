Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79027C3DA7E
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 15:26:00 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.13309.1721834752561435719
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 08:25:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jtWYMkTo;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-428035c0bb2so231935e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 08:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721834750; x=1722439550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCFDlrASHkZw6WssTjjSvadGWOfkJn96f0OhZ8GIQjw=;
        b=jtWYMkToouVmw5NnlkvA7rAAxW0rlhI7UY4Xyaez2fn6MkziuE5BpzMkB8raeRYBR5
         zkMSlSIJcbfT8dMvn3aV1v5n1tRoX2NshCe6ff8cId4I5S7rPlqyW+mitcsAAP+jBhq6
         IJVZnqrHicOCY0VzFdxWNAMvfCKOOlk8+igBmlkEn6P2P2xAyZkCQrZvvB8++fVyTml3
         +iqOtdxyPLUr44Y9WZlEe2r25OuBhzadVLiLbTjpZSGaH+/3VTYVuPlMX2drPSlkHB2G
         KYB0cEXYZyrp9C/YiecewpDI0s+oOcyTVfquOdLucwpdRDWpH71s5PaMtaDSDkVnKdN2
         n+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721834750; x=1722439550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCFDlrASHkZw6WssTjjSvadGWOfkJn96f0OhZ8GIQjw=;
        b=gtaQLYEJnj+g/ei9eP4lBVNvm7omt3tjjSILf28WJprGTeP3wheR8DgqmH3YgrjzfE
         dpl6GYVTU9wVjmeszJ0NpGSOI9neTKo+oU2WFWF6NMsvBoBiNUI3ZDa7nrAqARz2VMRt
         Grrom18t6Sv7+4xAEkYp802eg4fBFepkB7vgPgYHneAu/0uJRbv/Iedg8O7ayOJ8LpCL
         e37Cq4Ncu5MpikR9bm4jIcKEGedtCJjb2D5qtP9bmEzmlSESaz5Fy6vI2qc8Y+RzeWES
         9waFIoaQERUVBQ94JNQxpllSlVyH3sEVnD1Uk12jYWn6IYN9AQURSJ14Ynwhr65QagPt
         aqOw==
X-Gm-Message-State: AOJu0YxRQN1nUO8lFyF8m0ZlEgD0T3IcRKiAICZVk1VsremPWDzcAjaY
	SbMYBu2FhxxXZg70eiKDBLAEMpcHvs5+4GSN9IBd2UC5b/nIeqJ8zRWZeg==
X-Google-Smtp-Source: AGHT+IFDkYes8d/tYRLU5IeBs8R4N8itT/fvzymp+yLTeOyolWW1l5pdUEVNOY5Aee3eODFGJ3i01w==
X-Received: by 2002:a05:600c:154a:b0:426:62a2:34fc with SMTP id 5b1f17b1804b1-427f9a0b797mr17953085e9.11.1721834749814;
        Wed, 24 Jul 2024 08:25:49 -0700 (PDT)
Received: from localhost.localdomain ([80.215.234.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f93e667bsm33636125e9.29.2024.07.24.08.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 08:25:49 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>,
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [OE-core][PATCH v3 2/5] cve_check: Update selftest with new status detail
Date: Wed, 24 Jul 2024 17:25:27 +0200
Message-ID: <20240724152530.25856-2-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
References: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 15:26:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202449

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Signed-off-by: Marta Rybczynska <marta.rybczynska@syslinbit.com>
---
 meta/lib/oeqa/selftest/cases/cve_check.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/cve_check.py b/meta/lib/oeqa/selftest/cases/cve_check.py
index 60cecd1328..a40272c919 100644
--- a/meta/lib/oeqa/selftest/cases/cve_check.py
+++ b/meta/lib/oeqa/selftest/cases/cve_check.py
@@ -217,9 +217,10 @@ CVE_CHECK_REPORT_PATCHED = "1"
             # m4 CVE should not be in logrotate
             self.assertNotIn("CVE-2008-1687", found_cves)
             # logrotate has both Patched and Ignored CVEs
+            detail = "version-not-in-range"
             self.assertIn("CVE-2011-1098", found_cves)
             self.assertEqual(found_cves["CVE-2011-1098"]["status"], "Patched")
-            self.assertEqual(len(found_cves["CVE-2011-1098"]["detail"]), 0)
+            self.assertEqual(found_cves["CVE-2011-1098"]["detail"], detail)
             self.assertEqual(len(found_cves["CVE-2011-1098"]["description"]), 0)
             detail = "not-applicable-platform"
             description = "CVE is debian, gentoo or SUSE specific on the way logrotate was installed/used"
-- 
2.43.0


