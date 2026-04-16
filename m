Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A5FF88067
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:48:42 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7728.1776322120787905209
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 23:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=cYXU7KyJ;
 spf=pass (domain: smile.fr, ip: 209.85.221.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-43cfd832155so5231899f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 23:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1776322119; x=1776926919; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgzN3vRfpTmOrxp0fhFb05axKtIvQfYM/ubqTptUErs=;
        b=cYXU7KyJs6poHoM6jdHAMVcwGzrbRkZHyNAHCPB6tzLeoXzK+KVRq3NTLTEZYuFIFe
         z+GQcCKu+2SMrz6jlOMlWWJUbDJQTSQKROsrKsWrUvSIe3NNakZBZ5ba4+Ctg4e8hUX4
         38RKVBZpHmm24DWyqF6t3VvcaEtaOUdSa8nwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776322119; x=1776926919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JgzN3vRfpTmOrxp0fhFb05axKtIvQfYM/ubqTptUErs=;
        b=pW2T5ZD0g//947BVMo0O+EQaVGZiUfxQ2U+fM3n39UKn4fBjh3D8+RlAk/KJwdLAve
         NA39oFJEu8GXQXPbH3dN+JvQhoVMj8EgZDKvBF2kFcAgNEIlSSiPLaHf672xaD9xR3VA
         eQHyLWTqDXIL1H1rBamHqUILGymozzSQPSPmAz7PKxNpliGEmjVUrtfpA3WdfyeDto/l
         JFkwVaaaQHzEPdqfptjOGkHsfhqbWzjdPTECaQeVT1/dJ4+daunnjIT9abChABMVcAM3
         nuVYNWt1+LcMO5I12TXqq7aBMmtjQX2r6EDbaSmOGkwNfCZYDQwLZWdxx/bZ7DrrV5AN
         0d4g==
X-Gm-Message-State: AOJu0YyxfuOnLQWhMh60Xeu2o9CiPWJkvX9Yz5fbQPYStUdqKGvEpYo1
	h9ULXWjqkyNXRymkj5waFYvuMgQZ+q6Re7C9F4RVWnId/RDCgFyeY5/HInmHRGhLHbZPQQe52Cz
	WOO8Hny0ntTRF
X-Gm-Gg: AeBDieuqqlscyS57N5N6EQXjLqWrqVU7/t+NW0t/QLIi2Xua11E/UPX5mWSp0Wb+ei/
	qqUc03RXGykOYQ/4Myadn/d+j0la0C1bfcOdiYxR+KGe8Domcu2HIZoRZPn/Bg+W4HZkxBK//9X
	0OMIHqyrbd87f2/m7XpRVEvHaNfldVlZaq6rAWuJZDnQ/ZHbAyg59t68W6TiOXirFpp0Ror/8qv
	o6QGpKBMslW+Xs3FXuz8JDS02O0+1OpBT6M+nOOH2iM2AVbTx1fKPc5Zp13aGWcgsTCuNyrkJTq
	zy9eLMXfgtcRmF7kbsfR/BG6IcYXMSC/yQ1IsYsJH+Zc5C3fcVSZjmTaHmrQgdYuWws/WTvbYGg
	db+ytWKXtK2HqcNLI/4m9+FQKpSlU8TTi75odTuPGL8TGlfHeJjCPzLTtAuMtbyR/e4RyfXJUKr
	CllaiIXki892Pgmr9kdy8OQDn5XS+XngyxzR8bKHdetdc9OpWDgusR6OTbydbESb4LyhjNICxM8
	aoaXutXLkgFs4v46eeF/9NjtUz1qu0Sv5qUiA==
X-Received: by 2002:a5d:5d84:0:b0:43b:4136:1e76 with SMTP id ffacd0b85a97d-43d642b6a47mr40423199f8f.29.1776322118791;
        Wed, 15 Apr 2026 23:48:38 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead3d5ea9sm11200017f8f.21.2026.04.15.23.48.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 23:48:38 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 32/47] libpng: upgrade 1.6.55 -> 1.6.56
Date: Thu, 16 Apr 2026 08:47:33 +0200
Message-ID: <f610fe37751cba81cc0027f05540a8ca957b17d9.1776321810.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776321810.git.yoann.congal@smile.fr>
References: <cover.1776321810.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Apr 2026 06:48:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235374

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
 

