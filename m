Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E05AC3ABA5
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 03:00:37 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.8293.1745982030271788981
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Apr 2025 20:00:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=KWt4tP2Z;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-227c7e57da2so57702015ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Apr 2025 20:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1745982029; x=1746586829; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Epg38ZHRYL973+/SDMaIahcwz9V4S4EfNyDJXAf+754=;
        b=KWt4tP2Zbd7JIv8PgF1JMsW50CmsOACD6G9jb1xEVw1xrkSDiCdmhqt2V1OG95umCf
         3vTwPUsm0JLoilvASDBhaljDVqCRT1JSB2gugi2S2cOJ7/iDL0n0VoIrf5G0/4rGfhs+
         L0clCx85S9DepnDDYr1jpy054P1U7Kz1BByDoeMHSItS54Y6bsAyezSGRTR43rE2yiQk
         bvB3uWcD4Y3HTDuJIo0ZSQPPTUoXYie1WCrPtZrLfY4vA20o6Ft4ZutQOQ6g5W2SurxH
         Ybc9VcKzHqG7Fm3WPohM7+jaJwnmB82o/ato2oQi0rk2Xdn3MqV0ZFkIlwcEWTtKR7cA
         sHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745982029; x=1746586829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Epg38ZHRYL973+/SDMaIahcwz9V4S4EfNyDJXAf+754=;
        b=A8ZEVxwQzrKk/TqfhL4HUtjWRkJYk0liyusCAosYOea6ZyO+eH4GBOKbqIHahwajtT
         qbbXB2gogljQdJWRb3DcFZ49veZ0e7DtvvVQBQgk8nMJRZyjhSuJxeIdqIpfqEKwZxAp
         dfx78br+1W7Ng30tBpDQeXDbdxa6vE/Ie5fXkLZgc+IrxQSBTMppf1om68u/I6ZufvtP
         iW9dFxgUlCFCbPLWVxAMiKZmZxwgVyixSatuDH0jak4MhgYPhh+xgnblMiur/RrBTdfu
         apPJvvV6z/lstsGBoAORvL4cFzikyXY0ENcgqsr/Qkzy6dqkD5ZK9BgFd+lpYM3IJrww
         0qng==
X-Gm-Message-State: AOJu0Yydfla5AUOROPbE8GEzuNoZXTWhudL/+qXPmkAdoKJsOqlr3zKs
	izH8A3+9k+VuRcqe//KUlDAASQMoxUVHaUgtd1vzuq3kIOeEhhxbl58pLRcsB+qRB0ubzdDboiy
	s
X-Gm-Gg: ASbGnctj26zcwkmHqOnrt/mqIFh3iIBbe2EyHhzCvJsvzK0/kIKePr8cCzZO1zeaLZP
	hwMV5xFaYzDsVpEgRsWmBWRpRujZZyazNH2o3bzswIcTRv4IUomAZ6dsygjKWqCjCCsEL/+foFe
	jLjlFBdJhKJ681VC02yiYZv9rzLuGhP+jFvhGk8YnGh4c/qRkfpz9HQsHNMneXfp1sIbCMbGPkU
	8YR/rcoUskgDIrYkACP4M6pOwcaQPq9W4Jtiuh/AjGg97Tbu46RqtPk8Bj+YsKeGfncL2YgSm7K
	znXG5s4/M3+nNuOX/zFigu4nO62Aqa4=
X-Google-Smtp-Source: AGHT+IHb1zeLZ7TNWmLByDyZJ7fJf2mli+fcB65opGJ/FgCx+Gi7HMS3yJjdZrvnSocnklKbec/vBg==
X-Received: by 2002:a17:902:cecb:b0:229:1619:ab58 with SMTP id d9443c01a7336-22df5838736mr13013655ad.43.1745982029498;
        Tue, 29 Apr 2025 20:00:29 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34b:e5e0:c38a:7e03])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22de49dccd3sm30461175ad.123.2025.04.29.20.00.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 20:00:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 10/15] tzdata/tzcode-native: upgrade 2025a -> 2025b
Date: Tue, 29 Apr 2025 19:59:58 -0700
Message-ID: <0d93972dc2d67853b7ddb0d9e55522930fb51df2.1745981742.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745981742.git.steve@sakoman.com>
References: <cover.1745981742.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 03:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215716

From: Priyal Doshi <pdoshi@mvista.com>

Signed-off-by: Priyal Doshi <pdoshi@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b1ff8b45da27b533477cf6d9ace7a47f7f3a28b1)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index f1dbd7ba81..f21bedf4fc 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025a"
+PV = "2025b"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${WORKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "119679d59f76481eb5e03d3d2a47d7870d592f3999549af189dbd31f2ebf5061"
-SRC_URI[tzdata.sha256sum] = "4d5fcbc72c7c450ebfe0b659bd0f1c02fbf52fd7f517a9ea13fe71c21eb5f0d0"
+SRC_URI[tzcode.sha256sum] = "05f8fedb3525ee70d49c87d3fae78a8a0dbae4fe87aa565c65cda9948ae135ec"
+SRC_URI[tzdata.sha256sum] = "11810413345fc7805017e27ea9fa4885fd74cd61b2911711ad038f5d28d71474"
-- 
2.43.0


