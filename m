Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36748CA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:08:15 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.3387.1755634087799922534
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:08:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pw/5mlwn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e2ea94c7dso6323776b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 13:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755634087; x=1756238887; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=89j2EQOqpL4YmxeOw19daWNZtK52ZUV1s2Iv6gozWoU=;
        b=pw/5mlwnVljEbz1APv3cm/rcmxiSQgxF/JefethaSaLltZazJxfk39pXTbR4Is+I5l
         ES64MiUt1Lu+GBzllopCpe3e5clNP7gcuSsyTYZDRDOj1WzEnRXbVHc0Vmttbg0McWJp
         JgLJkg39hiePRNORIEZaBv6+A4WKvOPkGdXC4MIbiyKwtcesldtIwf7oriF0pucBrcPj
         h02M1vKUUGxLr5lL/XMTxUQJEld7dgB7lXsdLjuk2QEqbAAGI9FjZgKjwa2djlCGLj5N
         LG+ykH/P54jt2BjNuxFo9dy1eobmryicZhtZpinqb3j4G2yODv5sovR3UAK2Df+ngCJe
         c3iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755634087; x=1756238887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89j2EQOqpL4YmxeOw19daWNZtK52ZUV1s2Iv6gozWoU=;
        b=jfQhaEaiAGVVJYeNjYWRJ2456MzwC4ISdku8aJKH+WJFzhrTgBJ1SKVqLynWN0wGVq
         I2lKy1ktm65pa5+98LXplhu/QFFtDkFR6I/iFOIQ7CnN7t7hu0Hd1Mwb2sMkyjn/gfZC
         dhjWZXmbVeOgAvV1eRNKhCLP7Zu/vSrUoLlLjyjxCifPImIO869SsbjMxlOChu8jnDKr
         CUSbDVlfXUswugZAGvd9h6Ywk1HxtqQuiY3ClXKFKDY2+BSMZGGef0bYNOOjS6EYIldo
         JwiUF1Q0Zl6q/YGFfT399vCXerqQcnOnbXvRLYjMMrlBF4JHx9uE6GkhWSIyv8DN/1JF
         LqDA==
X-Gm-Message-State: AOJu0YwecuJgedfqqkRqT6NaLhRtmtB1agifGNad9IiiPOrMaDvl+Jxo
	AMSzT2Pe0dv79lKe2zcMA76rvMi6CPWIswQCphluRy5dH1/vIJkO6CmuGkFmuRwL+RHrJ1gc70d
	bICfE
X-Gm-Gg: ASbGncsQxbDVugDwPXS07nhtIvHo3dWmwbq72XHiVm1/zvX8sqP0hG6NLtqJ/Bnv5ex
	gYjVbDZ44mfyePeCHv77EilfpRTrFdjHot8g8E9tUaopPmoIB3iTM6hqKRG40FVEA+wg12C38Yc
	kXU81WaI+tswdAkeGQjgFmA0z28fXw6a0YOxn53P+vTgePoTKjXKOTDPH1mTb33fQ8npJUNGpeI
	4lGB6w9/1bHKE5wZuUC+PQmtCQfCg3rofFKWGtW0H/fsOvMx2nGcdCBcBibEAM2+PXaVdlx75ih
	Ys+EmO8wWlKmFLzLZP3m6O1oRSrvTkRanMw5T6urlkgxxqehkxIlgHscdak5rGpR77O55i4h2Z7
	eOcENd+NM34gUUQ==
X-Google-Smtp-Source: AGHT+IEtOrYSRSLoGrru8T3LGIyoY5yuNGbsr65L9Oe4KYRmYd6QjCaQ1iKi/enqdjLyGclGuPh3zA==
X-Received: by 2002:a05:6a00:2288:b0:736:6043:69f9 with SMTP id d2e1a72fcca58-76e8dd85f6fmr500611b3a.19.1755634086841;
        Tue, 19 Aug 2025 13:08:06 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:f07e:6fcf:4f52:4db2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d10fdd6sm3348855b3a.29.2025.08.19.13.08.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 13:08:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/10] xz: ignore CVE-2024-47611
Date: Tue, 19 Aug 2025 13:07:46 -0700
Message-ID: <04ce4704e603cd66f30ffc001541c6497d84050e.1755633925.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755633925.git.steve@sakoman.com>
References: <cover.1755633925.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 20:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222130

From: Daniel Turull <daniel.turull@ericsson.com>

According to the NVD entry, it is only applicable when built
for native Windows (MinGW-w64 or MSVC).

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/xz/xz_5.4.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/xz/xz_5.4.7.bb b/meta/recipes-extended/xz/xz_5.4.7.bb
index 563643d4d9..30a4c8e88c 100644
--- a/meta/recipes-extended/xz/xz_5.4.7.bb
+++ b/meta/recipes-extended/xz/xz_5.4.7.bb
@@ -35,6 +35,8 @@ SRC_URI[sha256sum] = "8db6664c48ca07908b92baedcfe7f3ba23f49ef2476864518ab5db6723
 UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
 UPSTREAM_CHECK_URI = "https://github.com/tukaani-project/xz/releases/"
 
+CVE_STATUS[CVE-2024-47611] = "not-applicable-platform: Issue only applies on Windows"
+
 CACHED_CONFIGUREVARS += "gl_cv_posix_shell=/bin/sh"
 
 inherit autotools gettext ptest
-- 
2.43.0


