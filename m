Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B0FF8D75C
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 22:33:27 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28584.1776378801161593758
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Apr 2026 15:33:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eiA7VnIq;
 spf=pass (domain: smile.fr, ip: 209.85.128.67, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4887f49ec5aso621285e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 15:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776378799; x=1776983599; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgzN3vRfpTmOrxp0fhFb05axKtIvQfYM/ubqTptUErs=;
        b=eiA7VnIqmil7jaFhSxfaLh5XH856X1nkmKqo+LEbdekPkzjAlwKKodiznlabe4nQoq
         eciiZWsV4amWcR5TDYgOb9kmbF6FoDDUXH05m+GnaKGGOMCkK+yjXto14mOoXRp5c+hv
         Z8mjLsHSar5QKZmryLkWT3w3HaM/XVNQ9uLp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776378799; x=1776983599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JgzN3vRfpTmOrxp0fhFb05axKtIvQfYM/ubqTptUErs=;
        b=k4yi8O4HAkWrbGZDbgoIRZRv77FASmJlml1nFR3rguMvE1dd+7lQhhzoVsi1QMnSs3
         Q5Web9FEdu+a6RRJySCrJjP3x9I3YNNxlqRcGrhTYZA6BXJJvuw0ufIO2b7T7eBdyiRc
         K76rGaMrd1Uf+A3c9ud1s6oa6G7kwyBi+n/HJu2whn/Up7+sarlAO66S/pg04ki/BO/6
         QVPQa8mBxY+Wox1bX6mflkMv/UwUacuqDnLYumxq/GUapCvsF08bjO6HvOateHHzuUGE
         nu01oVV8qygzwt56fhdhiZWWvdEtwkVgx2HaWjF/+rzz4C7upPkv7byJzaJ+Pt7cjxm3
         h67A==
X-Gm-Message-State: AOJu0YytgAZjXjZKjs3Whl0Dps5nW0ad+sL4fm5xKvUUtRPPDLG3Kjif
	Y6LsY2jyTxGV6792jy41ATu4O0mYWGEl3MV4qqZN6BItVPiZqq8IPIc4urYV2nqKw23diMFA2GY
	KEcSuSer8nYln
X-Gm-Gg: AeBDies21n2UANTWManHzxnmwDaFsWeUn/O/Q1ARPCjLwkC8FkXJg3EACnTLhiuevI5
	CQMpDXqI2n2WGSX3WrzIBQOF//WUwDkM5yanL9KOkcRfRGCcGfiE+uBpF0IURGDJhGNBllpWi8a
	4KPcQ68t+jr3qZF6sgx7mMMSeGaZXCfG0NPtTKGSI9jb/uZnQjbxVo5Wa7U5seC6/Q8aTmxzaZd
	hJjLFVYq+Gw3WJFWb36EzQbSsmEupkw/Y0hVTXzz+eUeZGof4SLR59G755taXtLeArPt88XAOv1
	n+5qG8VK5oGqHi05bTzKCk4pZoSpyM+NUcs22rchNhUEJRzo3D9J9Je0f+qjBro3GEZbfB14mlI
	mz4vMR5RaUe6L4//8hvlecoxh3MEzCluwlNiyHGQC2FbEjw/Nxjr/FtVPPEKXoqzMjnD5BYOGVP
	4YfHlzDOZRxTVc1t74Tt6iJvwmdW+cbw2S7hHt6anb4OEt9YCgilM3i2IyVi/7qXJo83jPW2oj3
	o8ulSOj78zqp0cYzkg9gK28YQUO3Qc8/XrQnQ==
X-Received: by 2002:a05:600c:33aa:b0:488:ae6c:42c0 with SMTP id 5b1f17b1804b1-488fb742e7fmr3333935e9.7.1776378799089;
        Thu, 16 Apr 2026 15:33:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488f57da2aesm141885005e9.0.2026.04.16.15.33.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 15:33:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter v2 32/51] libpng: upgrade 1.6.55 -> 1.6.56
Date: Fri, 17 Apr 2026 00:30:15 +0200
Message-ID: <f610fe37751cba81cc0027f05540a8ca957b17d9.1776377993.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776377993.git.yoann.congal@smile.fr>
References: <cover.1776377993.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 22:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235461

From: Peter Marko <peter.marko@siemens.com>

Release notes [1]:
 * Fixed CVE-2026-33416 (high severity):
   Use-after-free via pointer aliasing in `png_set_tRNS` and `png_set_PLTE`.
   (Reported by Halil Oktay and Ryo Shimada;
   fixed by Halil Oktay and Cosmin Truta.)
 * Fixed CVE-2026-33636 (high severity):
   Out-of-bounds read/write in the palette expansion on ARM Neon.
   (Reported by Taegu Ha; fixed by Taegu Ha and Cosmin Truta.)
 * Fixed uninitialized reads beyond `num_trans` in `trans_alpha` buffers.
   (Contributed by Halil Oktay.)
 * Fixed stale `info_ptr->palette` after in-place gamma and background
   transforms.
 * Fixed wrong channel indices in `png_image_read_and_map` RGB_ALPHA path.
   (Contributed by Yuelin Wang.)
 * Fixed wrong background color in colormap read.
   (Contributed by Yuelin Wang.)
 * Fixed dead loop in sPLT write.
   (Contributed by Yuelin Wang.)
 * Added missing null pointer checks in four public API functions.
   (Contributed by Yuelin Wang.)
 * Validated shift bit depths in `png_set_shift` to prevent infinite loop.
   (Contributed by Yuelin Wang.)
 * Avoided undefined behavior in library and tests.
 * Deprecated the hardly-ever-tested POINTER_INDEXING config option.
 * Added negative-stride test coverage for the simplified API.
 * Fixed memory leaks and API misuse in oss-fuzz.
   (Contributed by Owen Sanzas.)
 * Implemented various fixes and improvements in oss-fuzz.
   (Contributed by Bob Friesenhahn and Philippe Antoine.)
 * Performed various refactorings and cleanups.

[1] https://github.com/pnggroup/libpng/blob/v1.6.56/ANNOUNCE

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 987cf163b4a4beaa540ad4f91b1a31bcfbd71b4c)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpng/{libpng_1.6.55.bb => libpng_1.6.56.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.55.bb => libpng_1.6.56.bb} (97%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.55.bb b/meta/recipes-multimedia/libpng/libpng_1.6.56.bb
similarity index 97%
rename from meta/recipes-multimedia/libpng/libpng_1.6.55.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.56.bb
index 18ecc9d855a..6ae500ca92b 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.55.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.56.bb
@@ -14,7 +14,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz \
            file://run-ptest \
 "
 
-SRC_URI[sha256sum] = "d925722864837ad5ae2a82070d4b2e0603dc72af44bd457c3962298258b8e82d"
+SRC_URI[sha256sum] = "f7d8bf1601b7804f583a254ab343a6549ca6cf27d255c302c47af2d9d36a6f18"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 

