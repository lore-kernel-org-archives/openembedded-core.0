Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C7BE69189
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:36 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87819.1766434115151417532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BCakIMz7;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b728a43e410so790251966b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434113; x=1767038913; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Scf6arCDjH/zx3bssdqFbrk5r6EaPzp9kxhPZXTY6v0=;
        b=BCakIMz7Zm7O8GU0d1bhbHSFtJMJr0z7F9qyP8mlgUaiT/kbdSCCOBUeX3RBp9IPlr
         lUPlX3QkG3TbHol0AYLs+7r1GnCRvxuZm/341TzhaC5EMnOrbqQDCPdKCexY8/RoslSB
         iGhT7IAv1tLm8RFZ3WSkdTz+t3/MPr/4j/K8HdmzNS7AjGjwjheKuj+tfEzuWw8gQdr6
         WiZvEc7XAQlTfakdGHek9P0KVNWVQ6MaSOkaZOZGL7XSV5cUL/Jb5DYa1aey836o40qX
         Z7MMQiFgR5IfzVJnkdbTbmzIoBnTvUItYIJ9fj8syttUclWfYPNhmGeUFP45a53hPNNk
         675w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434113; x=1767038913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Scf6arCDjH/zx3bssdqFbrk5r6EaPzp9kxhPZXTY6v0=;
        b=AvbY440RfSFO6w/QjhXpxWhMfb4iaHOfaqU7/+A4qBoUfcslYWbYtWD+HHqSSJrrnX
         iY9I+jY5/6vxgbEFTcBrYrKLx8gU4KSr6OS/rW/mEYeKIUKnbZKXWHXpG+JxrjXXuoop
         LoBt5AIcw3+v94y6hbTYnYqFHnISATXzz08PhJVTDnvrgECOraTEPMOBuAangn58a5TD
         UP/4zOLX28zvwO/+p2ZK8++pntVMuGopCcYQ4UrbduG1S0FZ5GcBfwHHCKZRS4nWJlvb
         3guO3hgBPSljJ2/FzDWevg9V3/WX1euQPsbxWIaNLwyFWBO9rk6zBtCvNaaymR/2nmSI
         HXjw==
X-Gm-Message-State: AOJu0Yy2HaZjIZqI3f92r0ULalv7CUvmGuzG31jTCBxQEjvu2pm5ciF1
	jYwYq3q6aRiSD77fnlfWJq/YCW8069cStVJqcDiB0awV/3Ka7X2O+sqAqLsd6w==
X-Gm-Gg: AY/fxX4x/psxcEliCXQN4trOMch6DGMdNkj147Z6e9Ss94CXdpnxMOnWsGEAOeBNJC8
	DXa0TsqgeWYEwErIEBCgw56I3jBehZPwFShuDcR0UpGUbaNj5o7yMgWW9vOOieFFo9dcgKG1eqp
	6qymO9MxYCvE06PVkPodouYaVH4/9GL6p+PweveaFxt/FTKo8U8pYRnqNv/gWlhd94ZA5lAGikE
	FvjYzhJMkm/v9IZb4lCfJBsv+Q96W8ZJgu5ixT1goNvmcbEUFYUsgIsZsjKTLmHoDIxWQsfWFL5
	kWkaCvMFrb4VX6uPUIiQUqW9x4gFvJ4MdvZwY9mcjb0xlUKJVcZi7zDO6Hh2aZS5Xartz390cgl
	Ww547jIYxB4co1S4bS7w9s5+tGC7XIGam2m/Vfiw/gTLH+3jCyajlr4Vi2ysUlOjMsNF04tabei
	0jg2A7rvEZPKMcrqVDEEgM+9bnzP0cFV3WCfc3o7uioskkLFhq0RlsldjHZA==
X-Google-Smtp-Source: AGHT+IHL/+xIgJMb7QxiZW196NWBwD1Z5wm1ntMABgolv5xKedzF6gTLQvEia4XUSkq0/R72pWCqJw==
X-Received: by 2002:a17:906:6a18:b0:b80:1a97:64e4 with SMTP id a640c23a62f3a-b8037051115mr1280080966b.39.1766434113375;
        Mon, 22 Dec 2025 12:08:33 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 069/114] python3-pycairo: upgrade 1.28.0 -> 1.29.0
Date: Mon, 22 Dec 2025 21:06:51 +0100
Message-ID: <20251222200739.2278706-69-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228394

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-pycairo_1.28.0.bb => python3-pycairo_1.29.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pycairo_1.28.0.bb => python3-pycairo_1.29.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pycairo_1.28.0.bb b/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pycairo_1.28.0.bb
rename to meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
index 498c4db586..20c2c332cd 100644
--- a/meta/recipes-devtools/python/python3-pycairo_1.28.0.bb
+++ b/meta/recipes-devtools/python/python3-pycairo_1.29.0.bb
@@ -13,7 +13,7 @@ DEPENDS = "cairo python3"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/pycairo-${PV}.tar.gz"
 GITHUB_BASE_URI = "https://github.com/pygobject/pycairo/releases/"
 
-SRC_URI[sha256sum] = "26ec5c6126781eb167089a123919f87baa2740da2cca9098be8b3a6b91cc5fbc"
+SRC_URI[sha256sum] = "f3f7fde97325cae80224c09f12564ef58d0d0f655da0e3b040f5807bd5bd3142"
 
 S = "${UNPACKDIR}/pycairo-${PV}"
 
-- 
2.47.3


