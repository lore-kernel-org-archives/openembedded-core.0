Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E55C433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 20:01:37 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web10.29332.1638648096469862874
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Dec 2021 12:01:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BgpMcqfI;
 spf=pass (domain: gmail.com, ip: 209.85.167.179,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id 7so13048976oip.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Dec 2021 12:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ISU8f56clueoZqQIqGAEm4DwCS7w8kU05LfZFBxnilE=;
        b=BgpMcqfIEhUpOQgb53T8+U/mL5hD/PsVTvq1+Uny1DUgULRcfFmA5PTb2gfjCiHc0F
         7HIwN3l+moWEdgJ2a0Vr7sYa7cvewuyfGSfruUChkNBQbDclC81EE0kPcMj4MWV+Vc1Q
         YVnaP9vdFZC0jT6G4WRRb7ihyzkC45inLi0up3Nq+LAPkRq2y1/35AZOvpnXEtYv97Kx
         iRKr6eA7hCQ81B1hn5wfMWs/s7RkHf7V8G9sWX9fDEkmj1fK5b4wB2/vSSVpX7YgWnO2
         Qe1x3/j+SodN3ZGcSIv9tqKYSAozXt+It4NcZQcujrD0/BAg/IIU2LHdlfmLkv4GzdeP
         oAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ISU8f56clueoZqQIqGAEm4DwCS7w8kU05LfZFBxnilE=;
        b=2I0p00J//Q6Luus2d/f5WK8Ze3oKFsMKRuhqzlbnP1ob8uZU2BQcHZnzpfGTt2SjwH
         iceCtzA8Iob69wRVgs3w232SjB4Tl+ad7uAxylzbQ59iAH7c1XzlEoAIRPgALTnfm0N8
         JX5HQyXk+UkyHiCK2EbMlDtB15tS7lk/NluedDc9XR7U2suiZAh6mtcAGiWFsQti7sti
         AnEO3I8gc8xvr9EqzDQPaGX49GyeCEqdBC5JsjelGtsUDlj6rgvBb797DMqmNkzCoruf
         6nrzgO78ozrVFPvTqVduhB0VJjFalNz/DiOJjdRYcXeftm0SE8gfDJvA31gvFjtSLnwt
         bTBQ==
X-Gm-Message-State: AOAM533/sLz7b9i7HO5KnuOX36JrB4ziYYAFwzZ2VHAwYLmIiDh8WV5N
	PusZhKoUnyu9JLHxyY4bPAHmt+D7o4c=
X-Google-Smtp-Source: 
 ABdhPJw4NuM2cy9afOTmv+2Iq+GpBkEueNRgbpfqjF4Ho01xjVqcIJXM1cdITBfX1AN7J7Yc7rlEOw==
X-Received: by 2002:aca:130e:: with SMTP id e14mr16617138oii.51.1638648095522;
        Sat, 04 Dec 2021 12:01:35 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 bf17sm1722383oib.27.2021.12.04.12.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Dec 2021 12:01:35 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH] yocto-check-layer: Relax README case checks
Date: Sat,  4 Dec 2021 14:01:29 -0600
Message-Id: <20211204200129.1573277-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 20:01:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159180

Relaxes the case requirements for checks in the README file so that word
like "Maintainer" and "Patch" are allowed

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 scripts/lib/checklayer/cases/common.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/checklayer/cases/common.py b/scripts/lib/checklayer/cases/common.py
index 52c786f77b..8bdc5ce20f 100644
--- a/scripts/lib/checklayer/cases/common.py
+++ b/scripts/lib/checklayer/cases/common.py
@@ -26,8 +26,8 @@ class CommonCheckLayer(OECheckLayerTestCase):
             data = f.read()
         self.assertTrue(data,
                 msg="Layer contains a README file but it is empty.")
-        self.assertIn('maintainer',data)
-        self.assertIn('patch',data)
+        self.assertIn('maintainer', data.lower())
+        self.assertIn('patch', data.lower())
         # Check that there is an email address in the README
         email_regex = re.compile(r"[^@]+@[^@]+")
         self.assertTrue(email_regex.match(data))
-- 
2.33.0


