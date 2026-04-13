Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B672F531D7
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 21:16:28 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3553.1776114984393734272
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 14:16:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=RADfGxXL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20260413211622fbea9ae96600020748-gkclnu@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20260413211622fbea9ae96600020748
        for <openembedded-core@lists.openembedded.org>;
        Mon, 13 Apr 2026 23:16:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=VCshL7PyVqgN+6+1fSbt1KryBt83juIyzsp0vNz/GJE=;
 b=RADfGxXL8rdWGGgYmSLjb9Tg2FWtwEbGs/QMWPl+XWCeFOZf6VZ9Ec6rGb/pf2Qj+igZ9x
 TbEXok87WH702104JAR/5nc52uayCFyEEbHiKcCQL7kR3ir7lACVS7JN+B6vDZcwsQVqqejo
 jSSwJWAek2M8VBvfzij5VT1BnJALy8uQKTmur7Me0JjJwmkRp2hjlHI0lTXnayDNFYS4G66i
 T08nF3NcM3yEnpUNoRlkU2zr6ikdF2d84YegS0Y3qyj7zV4oCrg637V3I1+jpsLJ2SijE60K
 EbpgflyPrHgjRprjwFlfnQimpn++FHcxYDbMqiYBvKmEdC2sHfzLp9jg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 6/6] mpg123: set status for CVE-2006-3355
Date: Mon, 13 Apr 2026 23:14:47 +0200
Message-ID: <20260413211447.564257-6-peter.marko@siemens.com>
In-Reply-To: <20260413211447.564257-1-peter.marko@siemens.com>
References: <20260413211447.564257-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 21:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235128

From: Peter Marko <peter.marko@siemens.com>

This seems to be a bug in sbom-cve-check.
I could get a clean report with following fkie change:

           "cpeMatch": [
+            {
+              "vulnerable": true,
+              "criteria": "cpe:2.3:a:mpg123:mpg123:0.59r:*:*:*:*:*:*:*",
+              "matchCriteriaId": "1F8EEF7E-C6BB-4669-81D2-68AABF8A7686"
+            },
             {
               "vulnerable": true,
               "criteria": "cpe:2.3:a:mpg123:mpg123:pre0.59s_r11:*:*:*:*:*:*:*",
               "matchCriteriaId": "9765C6AD-E1F0-421C-B7B1-C09AD83A3DB7"
             }
           ]

However I'm not sure why adding another vulnerable version should switch
the vulnerability flag from true to false...

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb b/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb
index 648eb21500..dd5f8a53f5 100644
--- a/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb
+++ b/meta/recipes-multimedia/mpg123/mpg123_1.33.4.bb
@@ -53,3 +53,5 @@ EXTRA_OECONF = " \
 #| make[3]: *** [equalizer.lo] Error 1
 ARM_INSTRUCTION_SET:armv4 = "arm"
 ARM_INSTRUCTION_SET:armv5 = "arm"
+
+CVE_STATUS[CVE-2006-3355] = "fixed-version: fixed since pre0.59s_r11"

