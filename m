Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0397F0180A
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 07:23:10 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64473.1772781789549359251
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 23:23:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=V95XmeOB;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806bf39419so72647195e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 23:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772781787; x=1773386587; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QiyjrcXhgh986I/BEIJmBuMsk/oPDapDS9ZjJMRTxl8=;
        b=V95XmeOBIX5IzQgQ1RRc0L+tjMtPa3JmCk8Nzm8T4qMZFbWT7XQhld9gQFohPMXrEy
         sm50Z+Kg1pFTXmN0DVR87eIpR5d6KfyRO06TUOtuogqh7uQ2CFY2B9BFjZfES0RTgHSt
         bMDvBW4HCOW/IGGdtg/MShTD05jVaekA0rTC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772781787; x=1773386587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QiyjrcXhgh986I/BEIJmBuMsk/oPDapDS9ZjJMRTxl8=;
        b=YmRq/Mu056jbM6PUxgwDxCFVbNP2/I7K1hnRUf2Fh270Fj979cHbh4RAEu2K3yrx85
         xAcDXgWwkAPPGoUm/aNuJKUao+LRnuRBHG7+An+g9djQ4KlFtubHgld1c+qDkkRAj79I
         tgfyjkncziKKviBQeMdXPspbyo0XMWNMApMnfW4gugnmAAF9ni2Y+VSxXuGEqG03CLwj
         qjETSKuUIfqScGsyQoYErkkMDqXafS3lTSQSA/XO3d+zX2txLVyMhQ9Fut4FxF81mRqz
         7JpP0VOByoCnqjKLy0yMi3BRZepxMvACBrf1uL67et4YQ0YTm73Tm3sZhuzFf8OEg0Ks
         DSlA==
X-Gm-Message-State: AOJu0YxL8k+3fvtm30DmatPG1FT68llOhPd6gEHGuJ7n4lXpEua9OZQ5
	HWL+zX1HOG0HbN5m3razMXnUju8hQsJI7On4Bk22bZTolQbhqrfDxsCyC6NJ8v+8Md0a9j+rbB1
	kUY+O
X-Gm-Gg: ATEYQzwXn5ac8k18972DUU/WTPogG3hNi/ioeDKy41UhLQsCsgVl3ul4P2MBk9AKVEL
	KOIhmV6JAOhnNp9rs9szb6MrTU3ZkukgiKh2nTYMly143mNrEVonB8e7yiFSBdlkM18RvQ+JA70
	5ig8VBntWBTWME+lRnLJiGrcwf2FttGy9Uld4HQ5XOJvNtCBPcLJkSKzIlSfJtcLx5ff8An52+O
	mmOJliFUbK9d2x6+B/WFi1NQyA0VbtXZX5pZINsLMxqv0Ua9QC00VttajgpBSqIC7sx3XFH1ale
	1t15vRJrIlOPJp0z/ky+5zcASNYqWtn4b+sdCdUEmWiC4xiXNj6jcTqhqXvFXdKlyKel7y2TSBf
	xwaPwrrrrCpiL7U6YUK8kgk6Ch0Gvu9ZnjG2qkvWnvS2sp/u5tecFIYLNoYpiqJ9yJKrotp0x1L
	BAkTnsbgtvzmrzew7nx/7vwFCNNEoEzs04VaL7j3PUSNZAH6qCBEOeFGnK1aEOAbigs7MuN7xdK
	pOjPjtpr+kcTmZLkYN1oGHSK4asXsaJWwHpnyY=
X-Received: by 2002:a05:600c:45d1:b0:483:7b99:131d with SMTP id 5b1f17b1804b1-4852675e55cmr16850155e9.16.1772781787636;
        Thu, 05 Mar 2026 23:23:07 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bdeac353f6fa5aa8.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bdea:c353:f6fa:5aa8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b09casm23106445e9.11.2026.03.05.23.23.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:23:07 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 14/16] avahi: Remove a reference to the rejected CVE-2021-36217
Date: Fri,  6 Mar 2026 08:22:14 +0100
Message-ID: <12683ab466b090a842765f643b00c013eff5f709.1772780989.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772780989.git.yoann.congal@smile.fr>
References: <cover.1772780989.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 07:23:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232553

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

CVE-2021-36217 is rejected, and should no longer be referenced.
CVE-2021-36217 is a duplicate of CVE-2021-3502 which is already
referenced in the local-ping.patch.

The CVE database indicates the following reason:
  ConsultIDs: CVE-2021-3502. Reason: This candidate is a duplicate of
  CVE-2021-3502. Notes: All CVE users should reference CVE-2021-3502
  instead of this candidate. All references and descriptions in this
  candidate have been removed to prevent accidental usage.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bf41240132e2efa6b46aab46290eed9c53e312e9)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-connectivity/avahi/files/local-ping.patch | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-connectivity/avahi/files/local-ping.patch b/meta/recipes-connectivity/avahi/files/local-ping.patch
index 29c192d296e..8f102815df0 100644
--- a/meta/recipes-connectivity/avahi/files/local-ping.patch
+++ b/meta/recipes-connectivity/avahi/files/local-ping.patch
@@ -1,4 +1,3 @@
-CVE: CVE-2021-36217
 CVE: CVE-2021-3502
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@arm.com>

