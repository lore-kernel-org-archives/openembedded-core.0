Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7765EC5DF97
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 13:27:29 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14374.1787491643231878503
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Aug 2026 06:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=mDdT3EKD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202608231327242a3e70678e000207e4-zuftea@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202608231327242a3e70678e000207e4
        for <openembedded-core@lists.openembedded.org>;
        Sun, 23 Aug 2026 15:27:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=qfn8liWFFtAB93q5dS2DiEWRC/5pwzEj/eTEeWRBN/U=;
 b=mDdT3EKD7rSMzl92t9MwOHF9Oq0LUb5dUjsKYQaoP/87A4tnh+ULLDS4AGYP7yitYEVMye
 y88wE4z7Cx/ZOELM9QmgGevwiCfschX83CtuDRv27qQNKoEhlyGzP0I7WHmwTq49oDu/LiL7
 N2+PRRFAdq82wnz8iH4AQPtb5K++XLJRtW1s+bOdPeadAIW+DLRJ63ODMRestfXfKxsKm6QX
 6WJCANNzgBVDij7S++WzAnZDLz6vXDadkEIHgBrJJBKVy2Gr+pEdTgJPtofxq31mmECFa5o9
 XR+PMi5pln2RSAegnD5pG2LHK4eOIoE6scpmu6vAi72Mlx0vse2uqmGA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [scarthgap][PATCH 2/4] libevent: merge inherit statements
Date: Sun, 23 Aug 2026 15:27:02 +0200
Message-ID: <20260823132704.2029247-2-peter.marko@siemens.com>
In-Reply-To: <20260823132704.2029247-1-peter.marko@siemens.com>
References: <20260823132704.2029247-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Aug 2026 13:27:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244033

From: Pratik Farkase <pratik.farkase@est.tech>

Merge the separate inherit statements into a single one for
improved readability and consistency with OE style.

No functional change intended.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 99792ab6ba188a7623804e587edf8de23690ad3f)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-support/libevent/libevent_2.1.12.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-support/libevent/libevent_2.1.12.bb b/meta/recipes-support/libevent/libevent_2.1.12.bb
index be690fe94e9..32c61768d93 100644
--- a/meta/recipes-support/libevent/libevent_2.1.12.bb
+++ b/meta/recipes-support/libevent/libevent_2.1.12.bb
@@ -28,13 +28,11 @@ S = "${WORKDIR}/${BPN}-${PV}-stable"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[openssl] = "--enable-openssl,--disable-openssl,openssl"
 
-inherit autotools github-releases
+inherit autotools github-releases ptest multilib_header
 
 # Needed for Debian packaging
 LEAD_SONAME = "libevent-2.1.so"
 
-inherit ptest multilib_header
-
 DEPENDS = "zlib"
 
 PACKAGES_DYNAMIC = "^${PN}-.*$"

