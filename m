Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2182D2AB2B
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 12:01:21 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.17534.1730203271675593183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 05:01:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hU9bQHF+;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43158625112so53773745e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 05:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730203270; x=1730808070; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dE3HtDYM9A3g7zPO0186VtD7FvgpOzrzEBhTBreHUUQ=;
        b=hU9bQHF+Slbg6VTMp7OLRbvbG8IiJ6Ds6scV5JQ2p7Vb3oHnp4Yx7rpVcXCj8lCwYi
         /XJYmZKMWu1Hfo7M1FfyH8Dv/DlE08aN1hwBBVj0JUhRBj9HnHWOCXz5WowWh/jcfr1Y
         fkVIXyQUGJotRMs7t1z7ylbM6IDU9Oz53EiL11v0e0svAT9Oc1GIKUDPxjyTkNvOd9A8
         PVGr1H6D2/wOaAkBEuVzohd+vFBwZFSl85DzRXPpl49/bxIWnWEAQJmiyBO/q2EPCmZe
         BbxlcB/xmu7VCZIrKjYjuniIxqdcK/HNPt8c+Yr2+TjMFj0MQ/PZymRI+udvMCNW+lbo
         Oueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730203270; x=1730808070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dE3HtDYM9A3g7zPO0186VtD7FvgpOzrzEBhTBreHUUQ=;
        b=ujbdza7e/t2rRZQux12NMWksiFb52STPT/O6EVXZUJipZwvXRP5GDBXPK1UDK3DEga
         twa2gy9eG1LiF6U5NpuoNt3dE2VZYrG2trEVdYZTdvKdD0kgrCdte8oeIfmL04LRoyys
         a2GBus+D+p9Os4OiW61XUWbbt8SNFhSHJ8iy4M9x/dGYuKvWvxnYCO65yRZV14PX2vFI
         k2BNWiV3MxVxb3KD14RwmfUehQi74nRQcHf9zo9LV/WUgpj5tfY7fmceVoARDvkKftt9
         Yvsh7fIwzr2Eo1H4LBnBYwHYuICujbsZj4ceQzA/McY9M9QbRANrsdeZ3i71hOuPnj/5
         MXBg==
X-Gm-Message-State: AOJu0YxuxUpizLhIq2cNpk+KUsEXS4aDs8KIr2sOjdoEoyUyvkhkPhmU
	S/s5p97naLyohgAyp3Mc8F+pt974rB1be+glhyn4a2vUY6EHF/TGXiWshw==
X-Google-Smtp-Source: AGHT+IFaMEZnC/Xw2rIvf9k7XPUGG4g0TbW4T4bmRuyigAdkyUwAlElUwURuEOrGuyaP3v0eUAwiJA==
X-Received: by 2002:a5d:6083:0:b0:37d:48ee:d6fc with SMTP id ffacd0b85a97d-380610f43f7mr8114151f8f.7.1730203269690;
        Tue, 29 Oct 2024 05:01:09 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b4806fsm12257838f8f.56.2024.10.29.05.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 05:01:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] ptest-runner: correct PV from 2.5.1 to 2.4.5.1
Date: Tue, 29 Oct 2024 13:01:07 +0100
Message-Id: <20241029120107.754412-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 12:01:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206495

From: Alexander Kanavin <alex@linutronix.de>

2.4.5.1 is an actual version, 2.5.1 was a typo mistake.
That merged less than an hour ago, so no one should
trip over version going backwards hopefully.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{ptest-runner_2.5.1.bb => ptest-runner_2.4.5.1.bb}           | 1 -
 1 file changed, 1 deletion(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.5.1.bb => ptest-runner_2.4.5.1.bb} (98%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
similarity index 98%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
index e07f5d444b4..9f6bb399b40 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb
@@ -8,7 +8,6 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
 SRCREV = "c99e8c2737ff802f110612cc2d90c60233c33255"
-PV .= "+git"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
 "
-- 
2.39.5


