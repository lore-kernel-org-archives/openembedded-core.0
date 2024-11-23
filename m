Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A88E6ADEF
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 10:13:42 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.44911.1732356815886048227
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Nov 2024 02:13:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DSQpQ4/F;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-382378f359dso1991670f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 02:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732356814; x=1732961614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3WlMhB8pMhXPlV5LTuRy0RfWWhcuHWh6iQtXSBnQGdk=;
        b=DSQpQ4/FU4gQMoxIj+AdFwegNbqmdlae5qlgrAGZPw3V7Y2WfAWm2TF+aedLZaZHcx
         mmio373Pe3MTZ26mPmEgHHeBeWkFPfK9KV67+6CSjINlK7wrydm5T3oBzKyHgRUTLdGU
         pHDXLQejEnewDoXgP2C79qyZ1m6niLeoOF0r1H4uNErJxGSTIi9oAuGxFm15MTy1WUh5
         j1KPRE4NQCKzuhfpkzCPsYOVz8gchqvC3/LGOw2ZP2OLKBkLxvI6Be1HkEeWgL88SY1d
         2+/pMFwr+gWHNz+i5IcDGqlWxl/EiBDfIc6UkyTJBpT6p3g64pMgz8CRezuv6DwcEPev
         Ghig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732356814; x=1732961614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3WlMhB8pMhXPlV5LTuRy0RfWWhcuHWh6iQtXSBnQGdk=;
        b=e3jUrm+WXmUK7qvs+rA1kGoCS7YnJlfua9tdUMWxm9jGlgo0xdyOJ6yRloNsOfeoj1
         MXb98Nou2QhScUsuse8p/J5RX+TKN6EpYyRw61FT8RapJVsze+jNPfQEj0vkEo2nyFBs
         Ju4OCP4XHPUOWWio7rQwYe56iSNUGuoVI3S8nScPmTY3sZzw+bgRGH/v9JYy47a8yqLD
         BBm+t6S7Nv5RqI34c2MK7HgfZSON67gxpoNcvGxL+s0bXYtEpygjpqitjhMlHSauquSr
         GWVwz1dAqNdfivxEJ5KFQhNmDnAOKg/ZDIsqCodNV5Y/r7FyMuir12jZflVTIhpbblRl
         +LIA==
X-Gm-Message-State: AOJu0YwL03UrfOvC5C+gbSijwG0PVK5dq2iuAeMJm6UM1XcR0L0UECmS
	LBB25/7GU77mhbWLpXlTuPyiEyBkHEUEGkjm43hWye1KV9oDTWq1zsX6SA==
X-Gm-Gg: ASbGncu2k4WoRAHZdDTpHoOAm2uWfuKvK2M0CjtY6EkUl6err3beCODiCM4J8sK4TCq
	BULNxWi4XOhW2D8cWDP5Eo0taLzDx4/BecjTJWJV6otX8RjHwTyU/hQQ4nj15B45+IVvg2saGoI
	LK5LATDTnqfi1KQKhq18UGTdWK1gLwImtELLqdw2J28LbrTNeQZvVsLwUyjKbeCPxe118zWVnG4
	K04KeRWP1actZPwg4S/JTGn8zcjuAow4OLFn1HwLZyU9/aXEGffbGgVBkiifMtCQ8BnqPMC4+J2
	jNMYE37moAM=
X-Google-Smtp-Source: AGHT+IFQX2Q+hLlAr8CmJcX4bAqmqOlv+/sTMeU6xclDbzC6WYVPzXde0gxyrVTfE5YFJ0SSf2tAsA==
X-Received: by 2002:a05:6000:18ac:b0:37c:d1bc:2666 with SMTP id ffacd0b85a97d-38260b502dcmr5110768f8f.4.1732356813116;
        Sat, 23 Nov 2024 02:13:33 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3a3asm4789868f8f.66.2024.11.23.02.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 02:13:32 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [kirkstone][PATCH v2 1/2] package_rpm: use zstd's default compression level
Date: Sat, 23 Nov 2024 11:13:27 +0100
Message-Id: <20241123101328.2516665-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Nov 2024 10:13:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207673

From: Alexander Kanavin <alex@linutronix.de>

zstd uses 3 by default, while 19 is the highest and slowest.
It's not clear why 19 was picked to begin with, possibly
I copy-pasted it from rpm's examples without thinking:
https://git.yoctoproject.org/poky/commit/?h=master-next&id=4a4d5f78a6962dda5f63e9891825c80a8a87bf66

This brings significant speedups in rpm's compression step:
for example compressing webkitgtk takes 11s instead of 36s.

The rpm size increases from 175648k to 234860k. I think it's
a worthy default tradeoff.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/package_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index f403af53439..198a6d0afda 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -4,7 +4,7 @@ IMAGE_PKGTYPE ?= "rpm"
 
 RPM="rpm"
 RPMBUILD="rpmbuild"
-RPMBUILD_COMPMODE ?= "${@'w19T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))}"
+RPMBUILD_COMPMODE ?= "${@'w3T%d.zstdio' % int(d.getVar('ZSTD_THREADS'))}"
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 
-- 
2.39.5


