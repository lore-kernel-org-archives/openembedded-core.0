Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F66BCD3427
	for <webhook@archiver.kernel.org>; Sat,  2 May 2026 16:30:09 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9370.1777739406519287136
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 May 2026 09:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fvhN2LTE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-44261378651so2345700f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 09:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1777739404; x=1778344204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+3XZqaSy9fMR6x3O7n3XjU3b07uRRyPqcXsWED68ADc=;
        b=fvhN2LTETQ0p+c7vAuW0HECKPv4y83p5Jx93jx1RIGR831UXZhe8RF4SRFMdPAATjb
         IGvqM02Xx0YqsIeQT3u7ECQ4x9p5c/F3LDzuDTummSuNjK4KrDKzmobB00QcqPd/ECYL
         AnbAvpIYlD+l3y/OnocHKVJ3RYTqPDN+CtY9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777739404; x=1778344204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+3XZqaSy9fMR6x3O7n3XjU3b07uRRyPqcXsWED68ADc=;
        b=N8qE42BQRE3RK8Y9U10sgKWtt42DjCoYYh1lFGIiYPq3kPV0Ef5EZjzFYXV635eFL1
         0SV/5W7YZVrVXMrysAB64z+QZDT7HMzyNaFgL2ceXXg4p8t6tDgDNCik8Jjm9xscXCOE
         +zwbbEjL5hC1jUW+EQtlO+wfrMZ/uPDl6Ynujl8AcnkDGr1sel0qJfDfjGT3ADMozbiv
         rnkPrUOG3+rDtQNjEZ6hSPX8996aPWcVeffi7sqB8qph3JO+wY0/JtPeBBhMDuGE45ds
         IdREj1v2437R3kug17VDg6BoGZJzbpzpa3XZMD4UGTZnjEQKMgCCpM/SDWrGQS/RvlAR
         ja/w==
X-Gm-Message-State: AOJu0Yx5RW77KKscN+oyf9bboW1h+cyeB4bVeJtDCMb0FjstcFKlCuX0
	jCrU2BauGVXHsiu1Hsj4AXTdK4hmYXafDOtjwwzJR21F+8LCCBjQwZ3tCi5Y2/sKCkBBERvCUb7
	kehDt48NFvJbF69muCkp/6vreOInTt3Ys2BtsleIu04EEEnWwe9LXtZ+jThlENRrksgzQvDkhAO
	mjLoY3qHCORJIbV4Y=
X-Gm-Gg: AeBDiesBxOp4/embKi4tRRbYG1orRnxVJdi6bP8t6NBFlRv04apMp2042Mny9EFMxU+
	r8hbQm7yi1T74YiL+IVHK+nj0kvo0ySp7N0d7fgPK5UOs8IBeca2SgpJwAKIHnac5T1u7507sey
	4NAT4vZSuv1lo/+SWm3tbbEkzlbADBaepE7/Nna25ripZIhDZ5Eg2xoZsSJB23kpM3dMFSCZShy
	4OdhQTYSqN5NgQfaAr4I7XN0neJzANWPOXgMgyhaNDnqsRejChZLqFRH0WwYC24p2X4YlXXfqlg
	S7QYFh7K17CZOaotAdQJLRxl1Gxy6le2hZlYIHKirpiWeOQzpnEnPqXIMVDbZChJmKgwj6wC/tc
	QQlnwDdVOCBjxpjiK3Y6JI7w31kg3iohdAKiVL87d13j4Jsux647zSHn3+QzGheuhUJlmhHfr+z
	/xG7+RMP3KAl6X8TLkCNsqAhLw+g3p1+6GaBDdKGAk3puTiz0wEUgzXJTlFwV9PKbzIEJbysR8g
	A==
X-Received: by 2002:a05:600c:14c2:b0:489:1e5e:2cc with SMTP id 5b1f17b1804b1-48a860699bdmr121424435e9.9.1777739404414;
        Sat, 02 May 2026 09:30:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:8635:4fc6:d16e:90be])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a986aac01sm11971926f8f.31.2026.05.02.09.30.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 09:30:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 19/62] libmpc: upgrade 1.4.0 -> 1.4.1
Date: Sat,  2 May 2026 17:28:39 +0100
Message-ID: <20260502162929.1377831-19-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
References: <20260502162929.1377831-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 May 2026 16:30:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236328

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../recipes-support/libmpc/{libmpc_1.4.0.bb => libmpc_1.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libmpc/{libmpc_1.4.0.bb => libmpc_1.4.1.bb} (72%)

diff --git a/meta/recipes-support/libmpc/libmpc_1.4.0.bb b/meta/recipes-support/libmpc/libmpc_1.4.1.bb
similarity index 72%
rename from meta/recipes-support/libmpc/libmpc_1.4.0.bb
rename to meta/recipes-support/libmpc/libmpc_1.4.1.bb
index 78ce0bfe881..fca6bc2cc7c 100644
--- a/meta/recipes-support/libmpc/libmpc_1.4.0.bb
+++ b/meta/recipes-support/libmpc/libmpc_1.4.1.bb
@@ -5,7 +5,7 @@ DEPENDS = "gmp mpfr"
 LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=e6a600fd5e1d9cbde2d983680233ad02"
 SRC_URI = "${GNU_MIRROR}/mpc/mpc-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "3210b3a546b1cb00c296ca360891d7740ee6ff06deb02a27a35b20cd3c0bb1a5"
+SRC_URI[sha256sum] = "91204cd32f164bd3b7c992d4a6a8ce6519511aadab30f78b6982d0bf8d73e931"
 
 S = "${UNPACKDIR}/mpc-${PV}"
 BBCLASSEXTEND = "native nativesdk"

