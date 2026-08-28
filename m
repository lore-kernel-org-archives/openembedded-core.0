Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9084C61DFD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:34 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3066.1787945914119240941
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GGilvWBN;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482ea739de2so937749f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945912; x=1788550712; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d+Yj7eVaJgHL7I2fxG6/mQ3AAWee+qHZX8rKvtq4XvM=;
        b=GGilvWBNNZySm9Dt8K4qiad5jBujulsA/3t+pGQ++ABwf942t5xCY8iWDx8PtApqiX
         7maQNpzZRO4MJTKz51reNv7R23eNaLfmpMh5Jd8I+4GxaxaXd1Sog9bTwVS/g4Y/NiPe
         scIgGA9WSB9h/yy5JPdnoOfhVg1Wxwngmd8DA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945912; x=1788550712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=d+Yj7eVaJgHL7I2fxG6/mQ3AAWee+qHZX8rKvtq4XvM=;
        b=U9HI10M5re5UJPJ4w/3u4QMDXPwpndKeMApcxqywjc2M3uyP4E5hPRptnJlFp7xx6F
         NZqwfmXQ43KixuicWeQDAy+hwsByLPn6gmfXeWilKdqo5QzWvRIX/p9IqCW5tBd1eHqR
         MpndAbziuNqh4INj9Zopi78TUYuTBuejqYqv+aa2s0SeTJjryQupI78359SwCajLBvfc
         R19GUxlECbgIeGcOkqSN1fKeVUWyamVD6qfgYu12crfXlGlSU21RQU7ppVZWFx0GPPp2
         HKkL2X+pYFB5yeqsUyjbr85JUwtoRRoP2D7WZlpmHTS79Je4qPZu8U2im3vs3YWM7zxY
         gMBw==
X-Gm-Message-State: AFuF++l0YSJFP2K5iSuFhdy+3GTAESXhTRKXM4En0TMv8eQKku0L6tvk
	iTo1AmsrPt2ZsVJbabQKygKgOqv8lr9kMUdI2J+v6YnUJCHcbhinYv73hJr51S8lmKnp2F3E/En
	59PFkml8=
X-Gm-Gg: AR+sD10C3+et9923yIF64neQSIWVT6s4JLuagQSXx+2ldS0ffKSco7JXvnCFTuliPKg
	PwezcTM1F2B2dpMnkB/zfiC4nFolEKnGtYhDwwi73chOU87bq2KTOYZL8qK0nvILV0O2n+FXqJP
	0/xRkA+zCQfc81Ry5TrNboxrbkyj8rV0yp81/iQNm0uVRTtP74GgW91U3OTolgYD3AT3aQDwlo3
	qvMhWSVzey/VNhvMKXcMZAJGClk8WqdWfsmvGaVEYWexZsiRp0TBKtS3QTH7AHlMX9xTOhzMfwP
	niHTwOndU5KDIqfdfsIj1Iln+qDYzbtCJmc23QyZc26o1cJasCMrHXyTUSD+6JR1Gfq/GRCsIdI
	ThOSakrGOME03K5vjAeJYekPQPpp2HiP96qCCX9nrJo5mlernqYJOG/rh5a0dxsJF2GjBKZR4Ni
	w+yAl4mEMLDwuE6O4NlrS0fdT85hvA3MZFjfTMk0h/5AYLLvl3vCAi6iRQ+jr0vycq8QZn2rBt/
	bI0sogxaJdIjhJyvI+lIC01J1BdBEphU/8nXOpJF4MysX1eiesERSJWVgUOe8wS
X-Received: by 2002:a05:600c:c170:b0:499:afe2:e4d0 with SMTP id 5b1f17b1804b1-49b91c2930dmr154298025e9.8.1787945912188;
        Fri, 28 Aug 2026 12:38:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 49/56] curl: set CVE_STATUS for CVE-2026-8924
Date: Fri, 28 Aug 2026 21:35:59 +0200
Message-ID: <c575be683c5a523fe1cc0a3b5bb019f879ee5837.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244610

From: Deepak Rathore <deeratho@cisco.com>

Analysis:
- CVE-2026-8924 protects cookie domain handling when public
  suffix list support is enabled in curl. [1]
- Wrynose curl 8.19.0 is configured with --without-libpsl,
  so the PSL check path is not built by the default recipe. [2]
- Hence mark this CVE as not-applicable-config for the default
  Wrynose recipe configuration.

Reference:
[1] https://curl.se/docs/CVE-2026-8924.html
[2] https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/curl/curl_8.19.0.bb?h=wrynose

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/curl/curl_8.19.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index ae57776eab8..5bec405eb76 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -35,6 +35,7 @@ SRC_URI[sha256sum] = "4eb41489790d19e190d7ac7e18e82857cdd68af8f4e66b292ced562d33
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
 CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on google cloud services causing a potential man in the middle attack"
+CVE_STATUS[CVE-2026-8924] = "not-applicable-config: public suffix list support is disabled by the recipe with --without-libpsl"
 CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2', d)}"
 
 inherit autotools pkgconfig binconfig multilib_header ptest

