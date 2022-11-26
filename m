Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10CBEC4321E
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 14:16:06 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.70846.1669472160797625654
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Nov 2022 06:16:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=y8NthEyy;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id x13-20020a17090a46cd00b00218f611b6e9so6477093pjg.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 06:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IS7cFmxeuB1Uu0Xdv3I9iQgX4H4SgVgq36HnP/AmyfI=;
        b=y8NthEyy2W2dpCjUr9uUYcvMm/gWNTr/PsvmZcSH92VcOPmEPZ0lyli98NiAO/wlC6
         75bBDdCP04wgjXB/GOTp3ZgCzj5BSZvhO8fHFnOr+8r9966wc4qadkpTjqoyWXVZVwhk
         3tX8ZV2qi8xqkbzyGc7gNsCw/faLNk06yA6k0h3dC7RBcGDy8FbE1yA7cX2WbKGcpdj3
         XyqZwam3dMVTkuAwfOR3K1GorVmp1j0kbU+of58IOvN3gLn6CFL8hi8suAx5h5ecUduM
         zJU3YbM3a6LWGsuLmlSKA0hIYg4pihsoHId7Vv+Nd79jeZ1+rdqJlDbxX30n0x9QS83g
         xulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IS7cFmxeuB1Uu0Xdv3I9iQgX4H4SgVgq36HnP/AmyfI=;
        b=ywOV1gO7xdKsRPthoEF9XXOJKVeiGyBvELxIghX1eWgCza9Brj5DGiHAFK2pIxSuGz
         gVUxXe0ndU4dp2nE6Hn5iThUZe+TV6HotxOIKjwhKuEVh+PlFMtmSnC1ajl8rPDD/IwG
         fm1MIFxnkCOYzf/VlHe01Fsgkw6uCluU68kxT0HTDt2KsYyRW3bhJbJAKRpOdZh+66QZ
         tkI5SNNrGhY+j/MGDhGA+Pqf87Zoo7h6FZEjuASIvAV/M+i6K0Mg5dEXTAOpupOafnbU
         YsjDchrE1zoeg/9MzSbrR0XQX8Z9AekGMeXV/g9XEH4WTUAz7yc6tE1dioLdTz+uBOZd
         hciA==
X-Gm-Message-State: ANoB5pmShSz6kPgIuhe8yo54aDvrfmbkJnzDl6TACshCSia/+twsn4sm
	CLtdQbcYdXH/krYUtzLsYn+CztDCSBWi3NX7I3o=
X-Google-Smtp-Source: AA0mqf6AJO34TF3+j9VHLcfrLNuaGNHqIr5TlPTxmiuDJvRHnB+vFlmYqn+r+PSPq3azI/zlNY2qwA==
X-Received: by 2002:a17:90a:5911:b0:218:7b32:d353 with SMTP id k17-20020a17090a591100b002187b32d353mr43194181pji.100.1669472161755;
        Sat, 26 Nov 2022 06:16:01 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id im22-20020a170902bb1600b001895f7c8a71sm4649177plb.97.2022.11.26.06.16.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 06:16:01 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 27/37] linux-firmware: don't put the firmware into the sysroot
Date: Sat, 26 Nov 2022 04:14:31 -1000
Message-Id: <a433b65b18b413775a54a5ef2aba5e73cfcbca50.1669471990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669471990.git.steve@sakoman.com>
References: <cover.1669471990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Nov 2022 14:16:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173820

From: Ross Burton <ross.burton@arm.com>

There's no need to have linux-firmware in the sysroot. The sysroot won't
ever be used anyway as nothing needs the firmware at build-time, but this
saves us building a ~900MB sysroot (~300MB sstate tarball).

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 26ed998c4f201c5cacf330f52e51e416afbd300c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
index 6ba59a34c2..c7ecee0d9a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20221012.bb
@@ -1121,3 +1121,6 @@ INSANE_SKIP = "arch"
 
 # Don't warn about already stripped files
 INSANE_SKIP:${PN} = "already-stripped"
+
+# No need to put firmware into the sysroot
+SYSROOT_DIRS_IGNORE += "${nonarch_base_libdir}/firmware"
-- 
2.25.1


