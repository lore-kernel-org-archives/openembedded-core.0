Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5045FE77188
	for <webhook@archiver.kernel.org>; Tue, 31 Dec 2024 21:26:21 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.3486.1735680370715465552
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Dec 2024 13:26:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Fq78dsQx;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20241231212612e8167771c8bc9915e1-t2vpvv@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20241231212612e8167771c8bc9915e1
        for <openembedded-core@lists.openembedded.org>;
        Tue, 31 Dec 2024 22:26:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/47VQS5bR731xyl2jM+j6QTyl1hkmUahhQgd+PMkouk=;
 b=Fq78dsQxIB+mge9cBAZA9T1X9Y5E/azEhe1NBNibfyRN4EqxYM7DhPsuxYviKdkY0yJlE3
 UKGgH/9CW7OTurEiTdRFCGHI61j7tudJeQdbmWpby542YjIgpIdPk+2Ylg/ug0vEdtX/4bj1
 P3Yd+KSdcsNF/M2e0kdVUbN0LGAtZZpSo+HDaQw0F3Wk+jrfRNHTOTpScOswfp8kt8yZ5t0o
 HU4/Bs1o0HdzFPKJ3fHSq+LwnqvHih/Nq360eC6Q39NIVIJXtQ0UlILa3az4Dojkqh+D/M0f
 Ueb6DG4/XFheA8ldo/ghymUgivKCXWknr/Bx/9ehtXeiOhtVoluiTfgQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH 2/5] tiff: ignore CVE-2023-2731
Date: Tue, 31 Dec 2024 22:25:08 +0100
Message-Id: <20241231212511.3649711-3-peter.marko@siemens.com>
In-Reply-To: <20241231212511.3649711-1-peter.marko@siemens.com>
References: <20241231212511.3649711-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Dec 2024 21:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209187

From: Peter Marko <peter.marko@siemens.com>

This further tweaks fix for CVE-2022-1622/CVE-2022-1623 by adding it to
one additional goto label.

Previous fix:
https://gitlab.com/libtiff/libtiff/-/commit/b4e79bfa0c7d2d08f6f1e7ec38143fc8cb11394a

Additional fix:
https://gitlab.com/libtiff/libtiff/-/commit/9be22b639ea69e102d3847dca4c53ef025e9527b

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
index 27bb306e94..a47fc4bd34 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
@@ -65,8 +65,8 @@ UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
 # and 4.3.0 doesn't have the issue
 CVE_CHECK_IGNORE += "CVE-2015-7313"
 # These issues only affect libtiff post-4.3.0 but before 4.4.0,
-# caused by 3079627e and fixed by b4e79bfa.
-CVE_CHECK_IGNORE += "CVE-2022-1622 CVE-2022-1623"
+# caused by 3079627e and fixed by b4e79bfa and again by 9be22b63
+CVE_CHECK_IGNORE += "CVE-2022-1622 CVE-2022-1623 CVE-2023-2731"
 # Issue is in jbig which we don't enable
 CVE_CHECK_IGNORE += "CVE-2022-1210"
 
-- 
2.30.2


