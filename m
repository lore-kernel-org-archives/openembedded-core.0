Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25879FF8842
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 20:57:25 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32618.1777064236068700375
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 13:57:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KNFI3k8K;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-488a14c31eeso66531545e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 13:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1777064234; x=1777669034; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOWPIm5Nse9NJC0LtJS0zbS23M8F6fTXptumUXYdkaU=;
        b=KNFI3k8KHEf1mzeXP7t1NDHO+Yi/XOCeMCVoEvKDiRsZrO4j2H29RScYpH/a/Izxmc
         xuHJ9AC4MBTv0+GO57JEKa5+rLbEL4SS2mAJJ0xed+nyYmM9+blupbDoHJxdjY8cSZKS
         YGvswnrYeMaK5NJeHnHmqb+MsnL9GNmzqng1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777064234; x=1777669034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WOWPIm5Nse9NJC0LtJS0zbS23M8F6fTXptumUXYdkaU=;
        b=QMAsosvJgj96hD5LEo7ceVq0l+dYMncyaI2BF2zXqtfT+bC8fenm2HBRsNZO2WcaMW
         xDXgMNs0mGHF+zMgp+9JvqYvNN4o07mBVLnHo95LH2xXHj0WLLYFUualhK1UgykD5MRC
         +tTBj0sMsyGn1Su8T2NGm+k5kfO1Vf4OZY2GSi7Okf0o92oUZZA7QmMLlIyQz/hs08U1
         QfN4JKIIIRaGAeOHJgo0QAcodNeEhGrpQnOW15TBadTEzzvghtXYuJy1YQaVBRaAS4LQ
         K4mAFUpbB3v7+Zx0vZIAajOWyXXNzpq5NqQqQtKZs72zgrGhKdYGFF5Aqi5i51K+pBxy
         8x3w==
X-Gm-Message-State: AOJu0YyIDJ49SOaYtDizeqI+Oom0pyuQKBPDCgg5KIRVGf5PGlghDX55
	TGLHrzAAH1uIkeF1eucIRf9LKzcCDW6UtVvozI1J4hJi55PpxQsivt2orq3wtZkRI2b94TLk5pe
	GYLL3hwDrP+yA
X-Gm-Gg: AeBDieti5o7/D2UYLXjtxvG6mUkQa2cEi9+i6Y77GUUitxpAj13TclsoZSAWkAfTI6i
	VhzmoX6EYdO5OJIIN+j6U7JUXSxmB4cBjTxQ5R3U6WH/LP/XSFX+A5+ZY3deDXOMTv6OpabUKg8
	b5fU9SZnpnHlL8NtYnq30zTn2QEVbV0QIMkzz/RC9lGGQQYpOzcIlmiekwdOGOWRAUMoR+22LIp
	E68V9DIhJ3AxCJ4YfDpHS+mpwJjoaDHL8jJxyDd1Mjv9Bdmx8XP0RG5PHAxkOIxLPP4tu8K4G5J
	iACC+6zt5a+JVg1uEA22ckJYOw3PxTiuWBlh41tN+McOOCMZdaZ0sf1m/aa7imrDx5LIidLNnZj
	iPQOBPcmT4Q4nthZRRou1afEaGLsjL4qIH2tLwasN+eqbgdOvaSFPvAdbhOb/HVbgvsKsSLe7Yi
	WGU5J/Uo2FFEoVH84ykPDxBFvRxj3m4bGCJyOZyYMiADreRECDYI/tb3BKfDytc0UgSaeswXU7+
	slphBC6tudj5g7eTJaujSFBGTGwuUCsZW6MSA==
X-Received: by 2002:a05:600d:8454:b0:48a:5970:2003 with SMTP id 5b1f17b1804b1-48a59702216mr148867305e9.3.1777064234201;
        Fri, 24 Apr 2026 13:57:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891cca5743sm394841005e9.9.2026.04.24.13.57.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 13:57:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 65/66] libatomic-ops: upgrade 7.8.2 -> 7.8.4
Date: Fri, 24 Apr 2026 22:56:04 +0200
Message-ID: <189ecdff01a9c2c47b809d153b04ea6080f74e4f.1777064068.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1777064068.git.yoann.congal@smile.fr>
References: <cover.1777064068.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 20:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235937

From: Daniel Turull <daniel.turull@ericsson.com>

Changelog for libatomic-ops: 7.8.2 -> 7.8.4
============================================================

== [7.8.4] 2025-09-05 ==

* Document Win32-specific AO_NO_ASM_XADD macro in README
* Eliminate 'atomic_thread_fence is unsupported with tsan' gcc-11 warning
* Eliminate 'munmap argument 1 from incompatible pointer type' gcc warning
* Eliminate 'uninitialized memory use' gcc-13 warning in test_atomic
* Fix all broken URLs in comments
* Fix atomic_ops_sysdeps.S compilation for SunPro compiler in CMake script
* Update URLs after repository transfer to bdwgc organization
* Update CMake minimum required version to 3.10

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
(cherry picked from commit 02d66279071cbd043474dc44f44d348ec3228583)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../{libatomic-ops_7.8.2.bb => libatomic-ops_7.8.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libatomic-ops/{libatomic-ops_7.8.2.bb => libatomic-ops_7.8.4.bb} (89%)

diff --git a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb b/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb
similarity index 89%
rename from meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
rename to meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb
index 62691334087..d0bb11eb5d7 100644
--- a/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.2.bb
+++ b/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libatomic_ops-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/bdwgc/libatomic_ops/releases"
 
-SRC_URI[sha256sum] = "d305207fe207f2b3fb5cb4c019da12b44ce3fcbc593dfd5080d867b1a2419b51"
+SRC_URI[sha256sum] = "2356e002e80ef695875e971d6a4fd8c61ca5c6fa4fd1bf31cce54a269c8bfcd5"
 
 S = "${WORKDIR}/libatomic_ops-${PV}"
 

