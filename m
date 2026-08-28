Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF5D1C61DDA
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 19:38:44 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3069.1787945917596459289
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 12:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=S/B6ryc1;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so10538045e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 12:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787945916; x=1788550716; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eubPDYB6PeRARVK7GLQ4/PhoiriX8teS8sohYxflsK4=;
        b=S/B6ryc1wqJtnuYYDeN9Tpsk5dV5Zu6k6MeC6lcN1gvZWEkOBghYBrjf0sqw/QABrr
         VUHUytOtrJ5VSwP7tlHYePtT/BBaBKKoWzU6DtgX1NgtYjmx3pCxb4vTG4QURjGG+z7Q
         tYaWKAQjH/3d3AXiWCHmuoLwqbQvfmlimEa4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787945916; x=1788550716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eubPDYB6PeRARVK7GLQ4/PhoiriX8teS8sohYxflsK4=;
        b=oSP0S3IexIcRVBGMTLqFOdXAQ4pzD/LcrPeP2wqdVOVHcKJdBoHbXwqeqwEvT0Y+Ej
         0eHMOsGDRh2zWky6KqRDh4XXgh97phvQXU2az/aaxoPcO1IVcE36KEseIgYwjHYgr826
         Da6kW5UBmBX2rAHxHNnepImofFKaqahe7slRWj+mcP1eLifbINSpFBoD0W0xkoiGAR4l
         eLeEKnLlH1BEjOCAOUR2N1uKffG287jg8ZJNdXp+zBGidqF72TvV1bs6SWztOX+fZBGv
         I7I/ulVZ3Mo2rszqYB+/hddSVppXr9g89jvHmoz6MQky30dbP9oywwxQh7/as2rRcOz7
         RFfg==
X-Gm-Message-State: AFuF++nx4SReLtTPpcgn8TRgmyRm50XOKe1FF0826WT5ZHJ9h3SpSLhy
	N64sd8OKnyvgdHFR87tCXMNNfXtQzY7zK2JydkLNe2SEtP53zUJSapKYsQM8vewhfMIbxFEc5Jb
	R9NwX1Q0=
X-Gm-Gg: AR+sD10ysGTJOh0AplDZlxNeIMYZAcMjqRJEfaeB4mxuuMY2lgDegHIX2wqtehyX6JY
	GzBo785v9N8LKr6mffDtWNLc7LtkBDRfo9uRbKJmiO5GU4oC29FbP70g81GXT55UTJuHpuqYe6i
	gskLjVhoMVahPuVfcbLd5c5Pkf1HCKsoCYFxgyacHlaJPpV7vEtTP7rKYiKylH8X5PhJco/oiHC
	L4AUzk6do6tlcHp3HKsH4sqOGmAClml0wcvDkvcEJP52Q89YdMap4Sb/gkHSMWrYCmC81Br3ZJK
	leBvwKr2O0iNArwHepvQdtX/t+2wWCrjAOewTM9HApYRntLaESkvz7/GUPVBA4K8B33ZMljXNx/
	0I1hxc4Cz+vu1aiED8EwxOGJzKtC5qAcUjSjTSDyRLVGECfb9A+OsYDcVTI9dGA7x8LSLvswHfz
	VgYrfUSC71PYGcE2f40yxcvpxeerZtT9CzlcrJCQ5Iv2QdgR8HoYPP2zE+xHBrQdJ3AZp+0/Y4S
	xPI39g6y/pfkbh7LeelSee3lEY4dT8jNWa0Ons7pgO3LKKfMxuCb80olmD2ep0VFd9mC7Cqvoc=
X-Received: by 2002:a05:600c:8885:b0:49b:909e:922e with SMTP id 5b1f17b1804b1-49b91c4884amr122327575e9.10.1787945915819;
        Fri, 28 Aug 2026 12:38:35 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm147703115e9.4.2026.08.28.12.38.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 12:38:35 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 53/56] curl: set CVE_STATUS for CVE-2026-12064
Date: Fri, 28 Aug 2026 21:36:03 +0200
Message-ID: <82e6789bf2762f2388f98c45552729977862243e.1787945536.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787945536.git.yoann.congal@smile.fr>
References: <cover.1787945536.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 19:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244614

From: Deepak Rathore <deeratho@cisco.com>

Analysis:
- CVE-2026-12064 affects the curl command-line tool when
  SCP/SFTP protocol support is available. [1]
- Wrynose exposes SCP/SFTP only through the optional libssh2
  PACKAGECONFIG, which is disabled by default. [2]
- Hence mark this CVE as not-applicable-config for the default
  Wrynose recipe configuration, while reporting unpatched if
  libssh2 is explicitly enabled.

Reference:
[1] https://curl.se/docs/CVE-2026-12064.html
[2] https://git.openembedded.org/openembedded-core/tree/meta/recipes-support/curl/curl_8.19.0.bb?h=wrynose

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-support/curl/curl_8.19.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 72ea2298ea3..7497337cb95 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -41,6 +41,7 @@ CVE_STATUS[CVE-2024-32928] = "ignored: CURLOPT_SSL_VERIFYPEER was disabled on go
 CVE_STATUS[CVE-2026-8924] = "not-applicable-config: public suffix list support is disabled by the recipe with --without-libpsl"
 CVE_STATUS[CVE-2026-10536] = "${@bb.utils.contains('PACKAGECONFIG', 'nghttp2', 'unpatched', 'not-applicable-config: applicable only with HTTP/2', d)}"
 CVE_STATUS[CVE-2026-9547] = "not-applicable-config: vulnerable libssh backend is not enabled by the recipe"
+CVE_STATUS[CVE-2026-12064] = "${@bb.utils.contains('PACKAGECONFIG', 'libssh2', 'unpatched', 'not-applicable-config: SCP/SFTP support is not enabled in PACKAGECONFIG', d)}"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 

