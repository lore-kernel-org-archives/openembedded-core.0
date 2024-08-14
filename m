Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 709B3C52D7D
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 05:31:18 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.91317.1723613469043482384
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 22:31:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nAxEpa1G;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52f025ab3a7so3130602e87.2
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 22:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723613467; x=1724218267; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bCFDlrASHkZw6WssTjjSvadGWOfkJn96f0OhZ8GIQjw=;
        b=nAxEpa1GKmA0b+9S9JXghBW5mfOe6F9uWNUM6tMvKruhF8h+P8ItHN2ydA56e1U3zO
         BcA9UGXHDB0lpIFm4EjLMOF+cdEC6tkQyF0c7m1cCCqACRQRFZ/SSLy+VkkkGlESLbcG
         gpp+rrjyUUhumpF08++6U/fET8LKzDz9PxKKpzcsUa+raHIb840zCyF/Eok8R7v4NdYY
         l926DHiD3R2FY7k8dakdaATpCfYMphLD1nrSvNZuN+EUMZ2F1lVdVt5laeUoMTYLPPLy
         CQVxQWkKgtln+lF53sOiSVsl025XUZxGe4Lr5+HP7XtqyS83PzgcrZVq1yNx38Kv5TDi
         5bhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723613467; x=1724218267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCFDlrASHkZw6WssTjjSvadGWOfkJn96f0OhZ8GIQjw=;
        b=KG/ataTaTobWN5teyhA4fItVO1TNsjSHGKfvH9/F1G05dob24Lk49s5qnEws6cQZNa
         hT8nCZ9OIfwXTOMG4TxYU04rvs2b3BGOqNXNMsBoN7xAX6GN8gqyLQVPo8oCTPFfRKwT
         lb/LqUYuVPXbyQN0oA8vWHB2wbbAhj40kmzM7FR4IUIBPI8mUCvuB6i0uEqGHXA9pPWs
         QlfNZMg8cQnxRmssK0L589gwXeLWLtwbYSAmcyVMVpzUwRBnQKesBXMMMlSO5LwxiX2y
         csq5YFxZyG3/bBR46KZpu91CiFUFu0R+Tf40eb+ZfWJS7o0X2LMrL0h2iFujYjXeZFnq
         sHXw==
X-Gm-Message-State: AOJu0Yxv/RiqlJGyT5pv5d6Eq+OvcOPNtCKc7cKr9SVxooJsHM3HQbRc
	l184Q30EYo0uODSmcPWx9nexbRNsfBkiJNllCgeS5mvrcK35FbGD8LpqMg==
X-Google-Smtp-Source: AGHT+IFICCCmawR+wizzJxE+34B9B38SYHEeEjCb0okhVvLBxn9sn3FbkeKhGJCcvdQh3m5FHRCxDA==
X-Received: by 2002:a05:6512:2821:b0:52f:1a0:b49 with SMTP id 2adb3069b0e04-532eda81b09mr919121e87.31.1723613466095;
        Tue, 13 Aug 2024 22:31:06 -0700 (PDT)
Received: from voyage.lan ([2a0d:3344:2311:d410:8c63:2ebf:4fe1:9568])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded4db0bsm8885525e9.32.2024.08.13.22.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 22:31:05 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>,
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Subject: [PATCH v5][OE-core 4/7] cve_check: Update selftest with new status detail
Date: Wed, 14 Aug 2024 07:30:38 +0200
Message-ID: <20240814053041.4991-4-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814053041.4991-1-marta.rybczynska@syslinbit.com>
References: <20240814053041.4991-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 05:31:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203305

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


