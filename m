Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 934B3C43217
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:13 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.7347.1651727156894581490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CyG+4HYB;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id be20so3875053edb.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KZyS0Ui6bFfdjDE7cIOChjdQtMTKUfkkJ0rwvu6dX/M=;
        b=CyG+4HYBbIFMtypsYni4iaJSdQ4hnLUJdq3GK9a0lhiuJczIWGRM/xW7IowBGkpljG
         NmQeDlhfqDu01LxzsDRQiuSZ/YdYVdC8gPGoP+cTYgZ91ztRMEzaBx0RTt0Tz9n7V+6V
         61ZspCycZQC63ph9klJ0j1kUSaDhtky7EEePWSJCz8sGlZ1yRc/+uVLaXe14jaeyzNlN
         lcIh3VpwCZ/Xdv3rIGPRkyMAGc/6nPQ95QNeaK+4Uy8P8YdmNxDRaivyNi8NRrnVEEIf
         fYo7+jLtOHSPFa94FwYYTt1q93Lel6O7pSSqDSB1mCzhSJjZw2/3W8SCimOd0kwPvRBi
         4XVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KZyS0Ui6bFfdjDE7cIOChjdQtMTKUfkkJ0rwvu6dX/M=;
        b=GULtfcxsOM+KkdiVa4A2vu10VxlUqtXTgoAiGQ0FksqeJzyR2F3SUH+SyWtPFOvTbj
         FsRJTkcmj7n5yswVwPnrEY/91MHpTVkRr/38UzZ2sFAcyvmEDtPQKysYTvWSCzh0A5ze
         E8c2lWX17v+tF/xC2vtn9qdBrXafFhTfUFvfkXCmUcSTS1UsjehnQw0aP6DGFWjJfMms
         9yn2z6r2jrMuLVwsDPaSfKydFx+bw+twOoBEtJqzx3Nha7mdwmjxehlqbP1sOT97Yz7l
         tLW9bzMSZtu3/AiYgDJCbhWAf7n9RU+zv5sP/Qs67+Xurcx8hTZktvSCFkkrsPGyGPAP
         OvRg==
X-Gm-Message-State: AOAM533kZ+PUafRa7OPZdzae3rRn7vhxmFi3UboCIRHDOuy7X9hBg+OG
	baSkLgVChWzg5MazGwmAnjYmRsEw5cI=
X-Google-Smtp-Source: 
 ABdhPJyGdI9hY0bWztSDk7hro6w90wGQnG3Do4wq4O+OdfEjM6cv9nbCELBnKBLbSFALOyje+UjW3Q==
X-Received: by 2002:a05:6402:4301:b0:427:c8e4:4acd with SMTP id
 m1-20020a056402430100b00427c8e44acdmr19512757edc.230.1651727167443;
        Wed, 04 May 2022 22:06:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/61] libpipeline: upgrade 1.5.5 -> 1.5.6
Date: Thu,  5 May 2022 07:05:09 +0200
Message-Id: <20220505050544.651895-26-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165254

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../libpipeline/{libpipeline_1.5.5.bb => libpipeline_1.5.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/libpipeline/{libpipeline_1.5.5.bb => libpipeline_1.5.6.bb} (85%)

diff --git a/meta/recipes-extended/libpipeline/libpipeline_1.5.5.bb b/meta/recipes-extended/libpipeline/libpipeline_1.5.6.bb
similarity index 85%
rename from meta/recipes-extended/libpipeline/libpipeline_1.5.5.bb
rename to meta/recipes-extended/libpipeline/libpipeline_1.5.6.bb
index 67072e8c99..7007608a39 100644
--- a/meta/recipes-extended/libpipeline/libpipeline_1.5.5.bb
+++ b/meta/recipes-extended/libpipeline/libpipeline_1.5.6.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/libpipeline/libpipeline-${PV}.tar.gz"
-SRC_URI[sha256sum] = "0c8367f8b82bb721b50647a647115b6e62a37e3b2e954a9685e4d933f30c00cc"
+SRC_URI[sha256sum] = "60fbb9e7dc398528e5f3a776af57bb28ca3fe5d9f0cd8a961ac6cebfe6e9b797"
 
 inherit pkgconfig autotools
 
-- 
2.30.2


