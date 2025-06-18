Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AF1BC7115B
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 08:57:05 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.2734.1750237020468804838
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 01:57:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UGDLIaGf;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4533a53a6efso1976695e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 01:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750237019; x=1750841819; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zj8sfQfYknH/UgoS1B8yaJLQBq0aR6Wa9ckgiGOjNuM=;
        b=UGDLIaGfoC7AlQUYW8oiB6AJ6nk5oOuYIgdsUXQXSg7nxS2wivxP35tXntiyrHHLoB
         LVSMh7Bnl/KCKFykJr+u+SWKozctxMv5zhoVhFB+TGnwS7tudBLnjT5T+RIWIZuHeR0X
         6QD+i9jbuuEh+jFGHNocfhgV0BHJzTV3v9jYMnO+UKwI3QofZAUM0N9opGAdUX5v7T5c
         HNj6hb3mwc/HYR0dTN5CfntZ/y/X6ikVZGNTg/euMeCoiXZMV1mdp1ZDka+uAF7VORPZ
         v3PzJzb7b9vLFNJvnxRjvNNgjU+OD39vxslQPUpCsXB8dVkMz4eOKmKj0O1tArz/VfwH
         g+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750237019; x=1750841819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zj8sfQfYknH/UgoS1B8yaJLQBq0aR6Wa9ckgiGOjNuM=;
        b=d2FSIi79Z513hTNvoBxJHsptlGIOxbYRP5Cr3Tl42SOMH7NjTWpKfOS3dWEl514T9n
         w9AN9y6taRyMc0NyHBrD4LsjDl+Oz79np6urxwId6l8020Y+jE1+Spjed9t7o3TpRSic
         w84ZN7rscIZsNmsrSfXt3+8sAXE/XC7xnpueFxRwQXfN7FiV1dy5i58AZVXMIRwXy1fI
         Y0UbrBqiHMj+jKApQSOEzaPUUB8HdsIGsu+eNz7n+ZSUcIgq2e+f7/QChgKyw6KqACzQ
         qpO0Mg2v7Ho+dxTF5BEDnQbnA3eTOx6Ze6c6cSb56b/0NsgJJ/NPRuAM3LMUzOyJ9Koy
         OVtA==
X-Gm-Message-State: AOJu0Yyg9V+DDgDVoEZwUXA0U3Eg1Sp7LO8cQQ9gF0H0iYW5ILpU2oVo
	Wtfe92Odm/0dUleiFFoG2XBVUUL7zWYv1HZXFk+HZkZ7Cb88PP/1VeFhJU+4MQ==
X-Gm-Gg: ASbGncvAdT4jyhyNFnBM5D7anJ7kKSMq26nNFAzXipfXdSwR8Dagl8vw738Bi4fOW8a
	giOkzEAzBAQrObCiX/GQCEmruyZtNsScinVkxyJd0LUYBJYT4r9kCpMsdWa7vw/pbup3TMPP4fs
	hlEO7sTby/OUznT/yUPkUrilRmwryxuHUz8PfareyVD3XXYNv2JGFry4gjDRsuwfr0/6s0J6Q6g
	x0UAtdzcwG/p24fNCVLjhlOsd3GizvMKV9QhJ0UEo9l3Txeyl0JPjgeChUhdl+//kUP+QKxFkGJ
	B6/bYap/3j/Hr6h5XIBeQqANHm8rRHythhSzxHvth9cAVpodTLac9XoNZcPvnjTeOvlU92yAivk
	W3JfPMhGdZLm+EcDEGh/S040=
X-Google-Smtp-Source: AGHT+IFlqHf3VltB1AqGH8lhxf8J8vl144zXo8+MzyIBW9lrlF6XLDesVMO6p0Yqr75iOHNN63X71Q==
X-Received: by 2002:a05:600c:3583:b0:43b:c6a7:ac60 with SMTP id 5b1f17b1804b1-453599960bfmr14926235e9.10.1750237018652;
        Wed, 18 Jun 2025 01:56:58 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b28240sm16395153f8f.72.2025.06.18.01.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 01:56:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] gst-examples: correct upstream version check
Date: Wed, 18 Jun 2025 10:56:53 +0200
Message-Id: <20250618085653.4126301-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 08:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218982

From: Alexander Kanavin <alex@linutronix.de>

If start-of-line is not enforced, then bogus tag 'gstreamer-sharp-1.13.0.1' would
match as 13.0.1.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-multimedia/gstreamer/gst-examples_1.26.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.2.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.2.bb
index bc043f81c79..8974b9ac0ba 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.2.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/git/subprojects/gst-examples"
 
 inherit meson pkgconfig features_check
 
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-- 
2.39.5


