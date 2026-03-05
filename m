Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46B7CF30925
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 09:31:52 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40552.1772703102237948644
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 01:31:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=PkwAMoeM;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4836f363d0dso69049725e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 01:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1772703100; x=1773307900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x6Qs1N5LPI7FogChyz+WivQ+tstVmMKry0f5pV086eU=;
        b=PkwAMoeM6mFE1qa19nNOZ4pWtch1iFhqlL9KlyXDIkeizPwC/FyU/JGRTFDYBjGqox
         OK7v+UbUeFS/AoNGLi7BJUVTa0MJBBsoqfIdOUyhOsiDw+ArsVE03tVZYR4hhUEdotA0
         D9ibmPq0sfsg77Pbftc4UOuaeI6BiZJwuOeAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772703100; x=1773307900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6Qs1N5LPI7FogChyz+WivQ+tstVmMKry0f5pV086eU=;
        b=fJSdc4vLO5M6L5ds9lIatcod1faEFl6YMfwgYQMhaBWMOz+RDcCSRJVsn9jFb8K+no
         9m+mGpDGN4lKGB3jReCX2QCqe5XfLO002rwnHlSsvFGfGy0DmArg8x2N949/VxygFMFR
         WcH/yNZTLdeASXbB0FRj0HelDxbHHW30c31nUOmimndSoAPOu3i9fL68qTReUcBpmD1P
         jIA3GHKyuihAzpUvMwMC9VWMt99mN/U8tT1whi0pf0yo5rWeTK4Cio2uyMs1ENHfzgSf
         yPJdaqu4tMSu6JTWzs4cy+Q8hkZjW47RTw1fdrgoB+A1v9e4v2p9YJuCYLANCufsp/wL
         6y1A==
X-Gm-Message-State: AOJu0Yxz7l2AD5vyasaK1laZccZbUfQlFst/in+b7aasHgpqWYUO3k4l
	bT6ZEdbMDkXJZSzsPNcuJNy5ghQ22nzJc7gLkNHCR2wnwcRoabWzW1o8rBClzt7+d4Z3zhntrgT
	QhSvl
X-Gm-Gg: ATEYQzwG3qqsPatqC43w23Do7uUEmRf55dT5YLZzawUSI6nHyJIJA/vuQixDZUS4mKM
	+zaMiCH/0sHNqJ//XQ7/sUQAFe5u4IQgDiTgGx5thlJ3Q4XGYL33+e8KfLswOQArk9ufcCEMSaE
	Q1Ulc8QLN2orVoZhoW4QFty5QpELsxM7gxDFSUiZ3+fNoKUNcLYo4at0C5eay30nXpNRxvrUx3H
	JUKWK3icHfcciUO/CHc4b5el3PsGqSXJp3cDtuXjkzq2+fXAMHDZCICpCu+aCXZ65MLp5rLMc35
	E4A0990MjkQj5T2kx85ikK2Pzq7L4SmLHvqCIq7P9LdlhMnY7AtgdiLxt22XttAQnFOOUo/wcrJ
	/YJFvLhgcIh5N46l78rOQ++l3qnfswZR+8HKRJd9lcel83CJBKM2YfmBtbLIvWW4mUogg9wI9rJ
	xyJd2GvZg4ZwlNBheMe/88axFcwyxu4HAbUYRGCq4FTrjoaoUg8tjymoIQeOz2BifQzA2ycHwrf
	0Mj/WgFV9bO9PVj0ly6ehL5SiHk
X-Received: by 2002:a05:600c:474e:b0:483:7020:864 with SMTP id 5b1f17b1804b1-4851988fcd3mr76942595e9.25.1772703100105;
        Thu, 05 Mar 2026 01:31:40 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00675b4cbd8c1678f5.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:675b:4cbd:8c16:78f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fae473bsm25102635e9.7.2026.03.05.01.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 01:31:39 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [whinlatter][PATCH 1/2] avahi: Remove a reference to the rejected CVE-2021-36217
Date: Thu,  5 Mar 2026 10:31:26 +0100
Message-ID: <20260305093127.1179651-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 09:31:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232471

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
index 29c192d296..8f102815df 100644
--- a/meta/recipes-connectivity/avahi/files/local-ping.patch
+++ b/meta/recipes-connectivity/avahi/files/local-ping.patch
@@ -1,4 +1,3 @@
-CVE: CVE-2021-36217
 CVE: CVE-2021-3502
 Upstream-Status: Backport
 Signed-off-by: Ross Burton <ross.burton@arm.com>

