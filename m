Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEA7C64EC5
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 07:22:25 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.3128.1675840911843332213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 23:22:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F5DMN3In;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so731725wmb.2
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 23:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNpbCf1U+TM4NxPi2lt2kF2SLdYHhqRddwhEnVegcQY=;
        b=F5DMN3Ino2c4D7PHEF3TdbHGfXo+2b7z8jlUtRz/3j4NHO0o4d0EcJbU1EH3jU9nX0
         IUH7BjSuKFQ1BdEFo19pXislgtG7R5kjFmTZj5OvaHU+IslduGwH/kk8iu4OEVPJREZk
         LIAEuzT7oK6vJn/SULdAX7JbdQbk/+BdoLmo1DQMD6zQwUDcevFD04O+PXPHvVuKR4QR
         PUUPOyCkmA9bEKOxBjVMGHcDiq9v4Kz/VwrwfGxmTK1e/i05Kb++RF0pKSgfMFUmYUBs
         myPr8rHnMd94pnPUPviD/gfntAgT2ZoCTD5LnEjitsyw/AFm/abKkPq+eoERiaxUP5rJ
         bTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oNpbCf1U+TM4NxPi2lt2kF2SLdYHhqRddwhEnVegcQY=;
        b=K8sw3w7sW0yfInE18cn+VR5gt1z/PPUrHCNzNKNGOHlN+nj++CEtqC6AcaGKp8Qjkr
         fS5o/mHJEQt1q4aOr6eFeBogzBYzDTIuuZaq6yWt43tSYi58kmAlP982eck5jQY3iTJQ
         iizILjSqnLz5L2SVzpGS0WVrqLFwdSNGnxo+kp1iFNoREn/4bNik1XFpYYudM0vadEgb
         xK5HtScmBKddL6+el64hSTUNLmv2VdsvLmObRzsj4I97K28Phgmq2P/GskLDejIgwTu5
         Z6T/QiU/TPOAcuDlQbJN03EPOB9Bm2hfBFI1wuTbIdwBEC3u5rLvhY1wKAmL8zPhFFdJ
         HaDw==
X-Gm-Message-State: AO0yUKVoe2j6q71a7aMYFP6Q3AKBwy8yJ/rQLx5P3DGAqc6ZTGk235Uy
	YBFHTkyFCY09SomRNF1hOGdZM8+q+Bg=
X-Google-Smtp-Source: AK7set8SDYYbG9A8pHNL09SsUFjGaZAZD4VSmqP31x7GmdkSSzSpPomYg5+mSdlvjum9p1ZpsiXDLA==
X-Received: by 2002:a05:600c:90f:b0:3de:e8c5:d82c with SMTP id m15-20020a05600c090f00b003dee8c5d82cmr6041737wmp.29.1675840935982;
        Tue, 07 Feb 2023 23:22:15 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id l16-20020a05600c2cd000b003daffc2ecdesm1087926wmc.13.2023.02.07.23.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 23:22:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 49/52] texinfo: upgrade 7.0.1 -> 7.0.2
Date: Wed,  8 Feb 2023 08:21:40 +0100
Message-Id: <20230208072143.2930292-49-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208072143.2930292-1-alex@linutronix.de>
References: <20230208072143.2930292-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Feb 2023 07:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176889

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../texinfo/{texinfo_7.0.1.bb => texinfo_7.0.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/texinfo/{texinfo_7.0.1.bb => texinfo_7.0.2.bb} (97%)

diff --git a/meta/recipes-extended/texinfo/texinfo_7.0.1.bb b/meta/recipes-extended/texinfo/texinfo_7.0.2.bb
similarity index 97%
rename from meta/recipes-extended/texinfo/texinfo_7.0.1.bb
rename to meta/recipes-extended/texinfo/texinfo_7.0.2.bb
index f0f9211594..da455df4bb 100644
--- a/meta/recipes-extended/texinfo/texinfo_7.0.1.bb
+++ b/meta/recipes-extended/texinfo/texinfo_7.0.2.bb
@@ -35,7 +35,7 @@ SRC_URI = "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
            ${TARGET_PATCH} \
            "
 
-SRC_URI[sha256sum] = "53c01dd34c9bf116866d03aabd38c5cd9ee95ac10043d61aa33dec0d27825d8d"
+SRC_URI[sha256sum] = "a9c646bc4f6bb31843f129f8408a3a627334575faf7b22ebc416be5cb1570553"
 
 tex_texinfo = "texmf/tex/texinfo"
 
-- 
2.30.2


