Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 762FFC52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 04:09:51 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.38911.1723435782561702547
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Aug 2024 21:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DlrHv9xv;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3683329f787so1989985f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Aug 2024 21:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723435780; x=1724040580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCFDlrASHkZw6WssTjjSvadGWOfkJn96f0OhZ8GIQjw=;
        b=DlrHv9xvExaCmUnLbSG4uoKU7r/jAN7VDfGRuaDqfLUW1mzDsJXgcKoDn0xs03T1zO
         LyxPi8WY0OJWtOupZmT59DI0o1f3pw5ocbtYzmAFZWaFxrvOVjTZ0A+PMvK8B63N7Wur
         W0VA/cphWW8QwrxXTuVHz2EpiUSCYjEv8WkKQsQMfekc6shOhVtqWIiDO49pF2Yj3KH0
         D2nDJJnCH8J2qrS3u/dOLcklQvanu32kQbQ4JB7jGdPWkYVnPYoENCEwxNfRRHSDjMaa
         QbEt3aP7oOlPieQaGlFWiaT6aIL+DzKtczUlsg8QCawuZ7kstKlM7EAx4gfJ45EomPuv
         gD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723435780; x=1724040580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCFDlrASHkZw6WssTjjSvadGWOfkJn96f0OhZ8GIQjw=;
        b=Z+B76By5YXrRsgv+TK1Lzw0vl5GPHeaqE6xijPupWAVFV9FbaSTO6YnwFVjPesQWBn
         H1ne1HlRAhKZiLVhuXYKNJdU+w7IckyUz0FgAHH/eGeCZ4Zttcpa7fwyVfAV7DJAU9Cv
         Y7UowEyUvc9171g7lwq/Fw6DmwluakpzIeH+H7NBFvRJHhhRsseO45Yrv4ARZgLSv1PI
         3wRXoKEZ9jnKrdfQBh7A/Ynt3GDOyZqULyfbYEUc5WFgzgfgdfR/n66UagXk7+kJRnm/
         uAOSemFn8pcqbfVCEg0Vujf1bTctQ82yDljgHwxI1t2053UjwHrL+/vcx5UW2eKc6B30
         pmMA==
X-Gm-Message-State: AOJu0YwJ4NEdTesiabtjWDDwbVOtymoDEh/oEq4PhPl93jQOpHJA/INn
	+B/sYGXRQpSzc8CJK6jL84nEIYHO9O3UyZAnLn/bN6AU78ebtFwaVtCtOQ==
X-Google-Smtp-Source: AGHT+IFqVKThgjDYQz+K38/5B+YCzoOr0mnM6+NfjN739sRh4Q4SLvbCTP/jp+EP6St7EGmAq23sCg==
X-Received: by 2002:a5d:4e0d:0:b0:365:980c:d281 with SMTP id ffacd0b85a97d-36d5fd7fb1fmr4905522f8f.45.1723435780091;
        Sun, 11 Aug 2024 21:09:40 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:76:4400:56c3:4c21:1a48:89b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4290c7bc8c3sm174144655e9.47.2024.08.11.21.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 21:09:39 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>,
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [PATCH v4][OE-core 4/6] cve_check: Update selftest with new status detail
Date: Mon, 12 Aug 2024 06:09:09 +0200
Message-ID: <20240812040911.13096-4-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240812040911.13096-1-marta.rybczynska@syslinbit.com>
References: <20240812040911.13096-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 04:09:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203197

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


