Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A02AC0219D
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 13:38:30 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web10.50302.1739192840280874008
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 05:07:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hovzZEuK;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: pio.lobacz@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab7d58aa674so25575366b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 05:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739192838; x=1739797638; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pgXvXubrYD3i9brG6daJcLZELBOOY0cfe59iAc0HJOU=;
        b=hovzZEuKc6mqDmCKDZ+3mRGk/Q+5b605WxN/kYpjqpyrdzJ5tLyJK8jJjNcq4e0A3G
         SGLqDyd+SbfADDQi9Vl/YStT43uAvjVHpVuHO0uEfammhsntrmEp/m8eoud+9PRuO11P
         J9RL+xqFzoSLrxFMwadwB12BzAs+XFm/KxlkVRieKcsBnpzbT0bHNpxoOcnPxAuXz75l
         eoANGrSRarcP00+R4q6dReTo+NsObH0yq4aNpLAQaFriSpJ963/46n7rQk5ZMogPuP9U
         VGm0e/9G9ODc6NZFpw5wypVFPouXShbNJm9532yImy0lczYg1K820e6qACCp4O1D3fip
         4ipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739192838; x=1739797638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pgXvXubrYD3i9brG6daJcLZELBOOY0cfe59iAc0HJOU=;
        b=HX3A/mj3XJknz5IJIeHv7Ye9fuXWAEdOBxPPRvJyUfv3Gz4F/5NTBtEKfBbGqP0/zN
         Uwth9mQ0V2K0SgusEh0+yV+dvNq8nEHJjdIS87Jwmeyy2056UL1GND31krMGy+ps0tj+
         FrsBpD8J4dpRmKXd7IvrHueqTzb+yRXjeXBk85nubosOS+gH8ksEa9ERsM1phunA7kN9
         f+j/y7bQvR/32JtH5GOSZr4tAxD5+QXDElzaR5JN0hXZVvMQu6mhIeqksT6MQgQOTX61
         j8G0w9D74j1f1BJNZGjOWBsizad44N70w8n3thV4aMFetiJRRyfjcy5hEmuEPFXXqPUL
         NbBg==
X-Gm-Message-State: AOJu0YyaAXzak74pHegnKpxYr5caJGl4NHq21MRxBwNsvZpYIkL6aDNb
	52ArpL125BmQMmMN0sw6mY8pPTCff9ZFNF4yxTEUHHXvc36oMOM8ihaa/A==
X-Gm-Gg: ASbGnctPK7y2sYJpyDnk5U/cNEDhh736OFDUMpdSrsH9vSzekrao7SM9PAVLxdXZoRw
	CabQci4ZIKIO0hqXCPDWt4rYjqkSsv3ZtQnSlsg/lQLeYdJFKAP+NnZgXtnssE4oIHyS0GmF4fR
	SyxshKWhiymslzQ8IFjpUccvxkgfHUUJKrZcdyMFlcJYDcl+kNMVTny180m8YuV27X0f/4Q8xlW
	hR2VYLvv10Jgd7hctqrmye9wlcy2hziLBKX8lJmzLn0t3wyyqZO3mI03YPIQGS4u+9fI5fUfsYz
	uF2nPYTq8g0qSlb6LQ==
X-Google-Smtp-Source: AGHT+IEa9cZljgBKitycftiOjMfJaxfRsZJGE+pINsj3m1JZMU6Ty8rcW6yDuIVRF27U9CHeZHAYEQ==
X-Received: by 2002:a17:907:7ea3:b0:aae:c159:9e10 with SMTP id a640c23a62f3a-ab789c3dce6mr1408156366b.42.1739192838343;
        Mon, 10 Feb 2025 05:07:18 -0800 (PST)
Received: from latitude.lan ([185.53.145.148])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7c15cad87sm221191566b.144.2025.02.10.05.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 05:07:17 -0800 (PST)
From: pio.lobacz@gmail.com
To: openembedded-core@lists.openembedded.org,
	JPEWhacker@gmail.com
Cc: =?UTF-8?q?Piotr=20=C5=81obacz?= <pio.lobacz@gmail.com>
Subject: [OE-core][scarthgap][PATCH] classes/create-spdx-2.2: Fix SPDXDIR affecting multiconfig machines
Date: Mon, 10 Feb 2025 14:07:00 +0100
Message-ID: <20250210130700.2656678-1-pio.lobacz@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 13:38:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211097

Currently SPDXDIR is pointing to `${WORKDIR}/spdx` which means that the by-id
and by-namespace SPDX files are created without differentiation between machines.
This means that for two machines using a common package architecture
(e.g. genericx86-64 and qqemux86-64), there would be overlapping files. This means
that the build of one can remove files from the other leading to build failures. An
example would be:

MACHINE=qemux86-64 bitbake core-image-minimal
MACHINE=genericx86-64 bitbake core-image-minimal
MACHINE=qemux86-64 bitbake linux-yocto -c clean
MACHINE=genericx86-64 bitbake core-image-minimal -C rootfs

To fix this, add MACHINE_ARCH to the SPDXDIR path used for the files in order
to differentiate packages' dependencies between machines.

This commit fixes issue repored by Khem [1]

[1] https://patchwork.yoctoproject.org/comment/13577/

Signed-off-by: Piotr Łobacz <pio.lobacz@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index ade1a04be3..9e228891ab 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -11,7 +11,7 @@ DEPLOY_DIR_SPDX ??= "${DEPLOY_DIR}/spdx"
 CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
-SPDXDIR ??= "${WORKDIR}/spdx"
+SPDXDIR ??= "${WORKDIR}/spdx/${MACHINE_ARCH}"
 SPDXDEPLOY = "${SPDXDIR}/deploy"
 SPDXWORK = "${SPDXDIR}/work"
 SPDXIMAGEWORK = "${SPDXDIR}/image-work"
-- 
2.48.1


