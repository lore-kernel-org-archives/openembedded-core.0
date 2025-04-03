Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BDDC3600C
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 10:53:20 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.10571.1743677596863841219
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 03:53:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FUp9tyn4;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43948021a45so6774225e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 03:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743677595; x=1744282395; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P5bF+fYFKwfiX0xZLU99gbhSGjmBzx/avz7t1eKdXUg=;
        b=FUp9tyn4BU9ZusPQgeRfZMV7Z3URrDW/o7zNDXkJbF/eq3zGKzfhfcWqP/2N6VEBYX
         o0Vs6fa+gw7kjwydyVSdzFmfudKQJivePCCrrE3uwQgNiMytcNGyGKkFq6es3Lsb81xs
         MzrPRy+OmwtwDDGrwcevCBbFciu2niyv16uA9ji6d8MkLFUd9PMHqT7BPjxycOX7unSx
         B6apg85hH0R7kQbzPkL3DJgPfXagG+x3dbKPEnvsYnSKCK09OVZKAiYI+8dO1yWNw0ek
         wk7UTvgSbTaLRuGm62lQx3LlOVAWCfSi2SCUG25VLdzDgD0/DpwMENywS/fjTC9U3I1l
         8qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743677595; x=1744282395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P5bF+fYFKwfiX0xZLU99gbhSGjmBzx/avz7t1eKdXUg=;
        b=fJuIcnbtvgP40tR1BVluMBYT7m9kW18h9W2S1aEyTKcUOWXPQPOYJKQ5PRmkfj52LM
         pl6wOBbMirWRHMIatmZXCRv+PNBoX+u1fjLVv72y5VvuONwdQ0YZiTSyXSjlf+IEF3wv
         HF8vWMt/23dKGhiLBuUElf3N4kbF6DrScDInNFTViaDJM1vvkaGo4r93xDdqSR+xBjsD
         S98MQzIt0Au1vS2T5prub5kazNU4sZm0ZgEOSCNyT1XNnYxojJYrJ9cEOrWhb7hyhiez
         MOsqpL6aK/voh8IQbgzjKXHxotZPpOlq0mQVhZ2zeRPRoKBoAiqOri/PJUAEOENBHtoh
         JJqA==
X-Gm-Message-State: AOJu0YxyXf7LuqzTRoo7iU+8jYWrkSZxcNeTNbJwD1HfoCADcc0M/uHY
	9QXYVANC57VNb5BbXLB+8KwxBJcxepYdrmB5AdCLb/ZSU72xDanHldM2cUKO
X-Gm-Gg: ASbGnctWmkyQ27Ze8CtvuTvc5VzyknAyUzrsdOusSPNBVAMGQw53WlbPy00C/oHeZW9
	vSNbzaidLOnd2ryej+3GkohQ0pVZk182vFh4llwUwyN0ALBM+08O5x1Pjju4ZVBSscmbClx+oU2
	ayyCFUR3GGHUdJlsNHAGVUbn4uqHxvpVxOHYxk1qLGS5/e2MW+X2hHo5J1GDmncJs2FjTDdlHrP
	BB8SI/GtOAEB5CqlE+U5ABhlKU1tsNRzyfvi3PAE/pH78YvYuk+v6upEbxXa3f+mzFjXSPCG20J
	2HrEj8/u6u7rEHRV72oFisLrJnByV1pjw4EnNFZeSahlyY/QOIRHcJhTLQ2AyVOc7liE43sETSo
	ZY6tYeHsTNv8=
X-Google-Smtp-Source: AGHT+IGSRRJu5lH2+ZvGeR9tC5piVOx92OtA8ul9u5tV+S9tHh7EpCfcANmTT4iptwoid6PuXHCJXg==
X-Received: by 2002:a05:600c:1ca9:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-43db62bf861mr227029865e9.30.1743677594580;
        Thu, 03 Apr 2025 03:53:14 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630ddesm18346865e9.5.2025.04.03.03.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 03:53:12 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 03 Apr 2025 10:52:58 +0000
Subject: [PATCH OE-Core v2 5/6] build-appliance-image: Drop
 connman-plugin-ethernet
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-connman-v2-5-8bb637312ba8@gmail.com>
References: <20250403-connman-v2-0-8bb637312ba8@gmail.com>
In-Reply-To: <20250403-connman-v2-0-8bb637312ba8@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 10:53:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214316

connman-plugin-ethernet is just a legacy alias for connman. Ethernet support,
if built, is always part of core connman.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 03f02d14ae87fad9c3c11938c29b9bb35ab823e3..c5ddea79005ea0464201a6ab70cd75bc541e0ebb 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -6,7 +6,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-ssh-openssh packagegroup-self-hosted \
-                 kernel-dev kernel-devsrc connman connman-plugin-ethernet dhcpcd \
+                 kernel-dev kernel-devsrc connman dhcpcd \
                  tzdata python3-pip perl-misc"
 
 IMAGE_FEATURES += "x11-base package-management splash"

-- 
2.46.1


