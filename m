Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC808C0219C
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 16:42:21 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.92324.1738600936663297136
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 08:42:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VHhJ62uV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385deda28b3so2417889f8f.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 08:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738600935; x=1739205735; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IJBc+H5dohbpxZhRcIZz9wmBSMA65OzfAM0ZDx03bAA=;
        b=VHhJ62uVArigAq5ONNniNALsa56aN2m723UmJ/97f7rwanaq6QHSxjL3G+1s7szHsi
         7hnBfngfQasWHDVdRlys1zp1Uck8cvd5N3PuvsGPq/m45NNd+5jgdUc4bE+xlUQSWBok
         ji5OanU8+7LLawwtpqFh936f95ufh1ukm9TSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738600935; x=1739205735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IJBc+H5dohbpxZhRcIZz9wmBSMA65OzfAM0ZDx03bAA=;
        b=soibyv85KuhunhJF2lshvxETGk3U7Rw9y/+YYaXk/XM4KlhKTxgs8gTaU26tr6xX50
         5mM3JZaeq9uJiSfvbZnpC7RoAl/aEjWZQSnDOVEC01Fekr3TYowR9H6iw5tWzVufSkor
         zKQnSXRSl46SQ0Jee02Aif9xpXUHa4JXn6oa/DXHNXYPzVheBw1tpad/ilmUmRyEh7Pm
         BPJ3Vp0L4f1a98F+PmUaLXARWTnEwDhZTUrBY8sR8ds6/KJ5Aa5pxn/lNgwalsZQe7G2
         hgiw1aYVUGAVcB/Oh0Cr3n0Ppeia+SJFwS5MFcz+JzINULVleRqFFj9zhzdgNTUN2ZVz
         7LjA==
X-Gm-Message-State: AOJu0Ywz2RaZVkQfD9YGugl1j5SPR3lTV8AxfAc/vO4FUkJk6/nMIdTT
	XbCPwlhfAEmM/77r0wHcKoh4PY1JifxjYA25y2RcqD9kDr9d16ob9FHBjL2tumWDudlaV+Gynhx
	9
X-Gm-Gg: ASbGnctgmNNPgqWsmDNzQ0yYgbskwXjJtQy1eI9tfP/+vfA4fUu4v9/uoQ2szRztXI3
	c6HLEJcGkDhA8jCKEz26qEG4KN9LFRhuj4ew/ikie6HP/hC0Jy1mDI0FCHH12wLL+HawkzsRMms
	eSTkbea1ws7bG7l+6Fg8dqpUfKW5oJzN3lyxJfkmzLZC820BgyH+2CUZYt+rVEDANqafriuT7d0
	4wMqpCket5bfl2LRDTWFlZlNUPMiMKuSM8a/qzoeiC1Z27ZNj56VOY9nioFT8jJTUoVvCybeJax
	HxkMu9T4ghxv54/1QBmlYpZYI9+076fy31SiBP4RRYAb
X-Google-Smtp-Source: AGHT+IFbagWZx+pM5xmY3oAaF2M46nQ0ZUAxQYyY3IGg8VTB0zStX9MNIRGEOhyxkrjxmQJKWGQyxQ==
X-Received: by 2002:a5d:64e4:0:b0:38a:88b8:99af with SMTP id ffacd0b85a97d-38c51951c62mr18630493f8f.22.1738600934751;
        Mon, 03 Feb 2025 08:42:14 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:41c1:3919:865f:692c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ec886sm13122395f8f.1.2025.02.03.08.42.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 08:42:14 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 41/46] python3-websockets: upgrade 14.1 -> 14.2
Date: Mon,  3 Feb 2025 16:41:25 +0000
Message-ID: <20250203164130.3403325-41-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
References: <20250203164130.3403325-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 16:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210714

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-websockets_14.1.bb => python3-websockets_14.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-websockets_14.1.bb => python3-websockets_14.2.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-websockets_14.1.bb b/meta/recipes-devtools/python/python3-websockets_14.2.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-websockets_14.1.bb
rename to meta/recipes-devtools/python/python3-websockets_14.2.bb
index ead833a2ac2..0c7b7d24700 100644
--- a/meta/recipes-devtools/python/python3-websockets_14.1.bb
+++ b/meta/recipes-devtools/python/python3-websockets_14.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=51924a6af4495b8cfaee1b1da869b6f4"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "398b10c77d471c0aab20a845e7a60076b6390bfdaac7a6d2edb0d2c59d75e8d8"
+SRC_URI[sha256sum] = "5059ed9c54945efb321f097084b4c7e52c246f2c869815876a69d1efc4ad6eb5"
 
 BBCLASSEXTEND = "native nativesdk"
 

