Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A97EC3DA63
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 11:53:41 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.42254.1721735616758056482
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 04:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N86BnU85;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: rybczynska@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4279c924ca7so39496115e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 04:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721735614; x=1722340414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlKfbcfn22MoEbFdtPuFFk+fkB0wwanH/Btl7nDIgc0=;
        b=N86BnU85mvGdEuFL1SMrwBebGKnPfuVrpudwcTwutoNtEjhNwv03F6dhr/0DFL/S/K
         h3FRjvVEOPXJp35BwXLHbqcbdDi8OHy+ci3xx1bVUw1T/vqwyjfzKDdvcHtLah6p/IUY
         KbU3zYpyQemDEpVADmuKbNddmWNU77n0WR3a6VChHkPj2QlU7FcIBvAOTzQ/uMteuYlI
         6VzLy9bsu2OhNB7TdwVE4wBZnT9FKVA0nK8nBA287B+B5TprhfHiQwp8A1y2W1/RPPf/
         QjKIeJ6XFMU7jXq10RdVDbBuuNSle95VyB2XGtjpgUAJUvV1tLemLI5mvEZwY2TsZxjQ
         oi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721735614; x=1722340414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlKfbcfn22MoEbFdtPuFFk+fkB0wwanH/Btl7nDIgc0=;
        b=JeFxR2BETE/anPFS65iRZblScTzqqs96Ufa8QvhE+K1m2aJbuKRi6XQKD8xPUs7zgv
         f5yktKX0Rnd0cv/3PRu39xacwkNSvLDdapDnA31oc4WFBFuB8w4NX8nc8Fa8oQ++zoPX
         gTHvs+c+9coXvC+0dBjgfp5kcyjrNjHrUBO4GMvhgpm/y5a2IQpdRX31kGAA19ZGyLJz
         YtD5b8w7Y/f5ME7/BftJD0JtxQpqExWKGas4CPS2Hr63UMosJx6fD/XtXreZMj8srzQB
         EnxrcUVzTOudJvceyPaIYZE4abRAmpgjInA9K2jhvb8pPx7UDfhx7NeLnjzWKEhishVq
         /BIQ==
X-Gm-Message-State: AOJu0YyUNPG06qWASE32tIHYMuCtcfwElcdcluJZXlodb08U0wSXtUrN
	yTqGtjNsXLuUdFBNiQbZ1k9e6DvcoMI8bRsrtlCflA0uU4ClvWJP3xDjvw==
X-Google-Smtp-Source: AGHT+IETmQZ5ahW9trukkF3DSBGukMCgcI4qHEyp0XVuJe0jnlkBqLBW0KjaIgAIz6EHLebgolcJHw==
X-Received: by 2002:a05:600c:3d14:b0:426:6675:a115 with SMTP id 5b1f17b1804b1-427dc5298a8mr70412785e9.22.1721735614387;
        Tue, 23 Jul 2024 04:53:34 -0700 (PDT)
Received: from localhost.localdomain ([80.215.234.192])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6900caasm168537075e9.11.2024.07.23.04.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 04:53:33 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
X-Google-Original-From: Marta Rybczynska <marta.rybczynska@syslinbit.com>
To: openembedded-core@lists.openembedded.org
Cc: Samantha Jalabert <samantha.jalabert@syslinbit.com>
Subject: [OE-core][PATCH v2 2/5] cve_check: Update selftest with new status detail
Date: Tue, 23 Jul 2024 13:53:12 +0200
Message-ID: <20240723115315.207013-2-marta.rybczynska@syslinbit.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240723115315.207013-1-marta.rybczynska@syslinbit.com>
References: <20240723115315.207013-1-marta.rybczynska@syslinbit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 11:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202337

From: Samantha Jalabert <samantha.jalabert@syslinbit.com>

Signed-off-by: Samantha Jalabert <samantha.jalabert@syslinbit.com>
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


