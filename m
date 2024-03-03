Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9C3C48BF6
	for <webhook@archiver.kernel.org>; Sun,  3 Mar 2024 16:34:23 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.76564.1709483659325662625
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 08:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V/LERkt0;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7881f80b2aeso24727585a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 08:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709483658; x=1710088458; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ow7+BOX52hq2aWHZ35J11MAxIAjnABFMOdwh5O30M0=;
        b=V/LERkt0RXBOmU8ApbRnyLZeYdiICkmhuElkyGHs74/yxeHZO0l4G8uoiJ3rkCqFcZ
         isarVOzh7Hhw8INO6bh8kYmlMjRrhDtTo/ak/hYWammAyU5XoTxiyvTAtWCFqXBT2SWb
         JK9sfGSdCyPD7hmGZKTLWl8Jt5nFQkbPPSKBTG9mSFEhFYcP4Mv7iOnsgJhs5RrcApbf
         dySO7ETjYLCUYXEIiBkp/Q4SAQi+k/3/kZ/u7JjHJgMr9tlScU4mPA06W6/SRrfYNYpn
         RJISRNo/qnpqagdtucTh0UV3Xd4Y8LnTbeMfxX8fMQwg9jhdXcw8+Wi99FjwsezqgX2W
         4i9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709483658; x=1710088458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Ow7+BOX52hq2aWHZ35J11MAxIAjnABFMOdwh5O30M0=;
        b=JfERJKYxmyzRwxPUvg/CTW2cO7Fowdevbvx4hcmcoQeQyRrn4w5TVq1YfvYRC8SqGp
         XJdZMgeo2jjSQ6P090N4CVvD/B4P0zrgi+VVJmRdBnPMj2lM0RxOJPs+ZyTx0YkUzTDc
         ZLHK1W8a2VDCtL1iHbUMDYDaA+ZCICrOwktD/a129V0GYEpu8xJM1NyeQfScuiREu4VW
         DS508wiT1zr5BYzWPsuOUo0Jk6b/V/efHI5+kcWe9Tm/MFxZruVdUFBfm6cng3XtN94X
         +ecUQ8At+oXX6xOSGPVsMjxowFWD8goYH1SyGtxpoVjrfupCCZ+5wQwlg59JSSQWVOjO
         fPRA==
X-Gm-Message-State: AOJu0YywPGOvUugRQtWAGy4USImcJqhmOzzUvdDKNgIF22lcVnGQNfRJ
	Pa+l1JAmkZLYxZa9OeIpgwaI0oPua3wn7uQmI1sK5i6BPrieyQO1
X-Google-Smtp-Source: AGHT+IE5RyGuyEN36VrQsHxh+PtCRaAfa7NBcW35B2WzPDOZp/Tq6XTWrUiHxjkummC4FXKkesnRkg==
X-Received: by 2002:ae9:f118:0:b0:788:ec0:26f6 with SMTP id k24-20020ae9f118000000b007880ec026f6mr6969057qkg.8.1709483658232;
        Sun, 03 Mar 2024 08:34:18 -0800 (PST)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id t20-20020a05620a0b1400b007881ed0f87dsm1146313qkg.65.2024.03.03.08.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 08:34:17 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] linux-yocto/cfg/6.6: drop CONFIG_DEBUG_CREDENTIALS
Date: Sun,  3 Mar 2024 11:34:14 -0500
Message-Id: <20240303163416.11875-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 03 Mar 2024 16:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196569

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: cfg/debug: drop DEBUG_CREDENTIALS
    Date: Tue, 27 Feb 2024 11:57:58 -0500

    The upstream commit (which was also backported to -stable
    for some reason):

      commit 207f135d819344c03333246f784f6666e652e081
      Author: Jens Axboe <axboe@kernel.dk>
      Date:   Fri Dec 15 13:40:57 2023 -0700

          cred: get rid of CONFIG_DEBUG_CREDENTIALS

          commit ae1914174a63a558113e80d24ccac2773f9f7b2b upstream.

          This code is rarely (never?) enabled by distros, and it hasn't caught
          anything in decades. Let's kill off this legacy debug code.

          Suggested-by: Linus Torvalds <torvalds@linuxfoundation.org>
          Signed-off-by: Jens Axboe <axboe@kernel.dk>
          Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
          Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

    Means that we can drop our use of CONFIG_DEBUG_CREDENTIALS.

    It does leave an emptry .cfg file, but to keep any external includes
    around, we'll leave the file for a while.

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.6.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 6eca6de5da..cde9c48a84 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "3c1e1f6195b25babe903679416ed839a53c8b3e8"
-SRCREV_meta ?= "c97276cdc9d89cceef61184e296e5c837a265ed1"
+SRCREV_meta ?= "229dc6171461800d7b4ab16f9c8b35a47a48897f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index c6ba2a8d59..9d206430c3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "e064a7d658a30b027b999183e21cd37305caff2a"
-SRCREV_meta ?= "c97276cdc9d89cceef61184e296e5c837a265ed1"
+SRCREV_meta ?= "229dc6171461800d7b4ab16f9c8b35a47a48897f"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 2d218692e2..beb2628121 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "e064a7d658a30b027b999183e21cd37305caff2a"
 SRCREV_machine:qemux86-64 ?= "e064a7d658a30b027b999183e21cd37305caff2a"
 SRCREV_machine:qemumips64 ?= "52456b6cb3393c1848da3ccdae37727c31896f1c"
 SRCREV_machine ?= "e064a7d658a30b027b999183e21cd37305caff2a"
-SRCREV_meta ?= "c97276cdc9d89cceef61184e296e5c837a265ed1"
+SRCREV_meta ?= "229dc6171461800d7b4ab16f9c8b35a47a48897f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


