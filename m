Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D50C46467
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 16:45:14 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web11.22432.1672418711091565250
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Dec 2022 08:45:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=aGfkvief;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id e21so5191809pfl.1
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 08:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMCAJwi+sI0njtoMQRZsAMxGbXp48erpw8P0nWxAqoE=;
        b=aGfkviefFngqkEJF0PWlN+m8Ch+7DkIroEK79Dw18+KWz2EoVXeZvB20MzCb3+v0dp
         /EZWDmpaAQhtSDYNIT6QQ1UiTfNu734CbZg+Twz22N1Jm+ZJomsdk2ml4CQ2AqVNqHtJ
         FYxwQnLibyJmIt11IR3tmV6+V+1lVmm5L5ngY8/S2ctritECSxv0X6Mw1LlFJ49JeZMV
         U4WzuP9LVyYIflNMiwscs5/f85y+dbx7lF2KHOxLDAfP9rvQK/LL4PtMNfi4jCViR8u6
         Ir2OCM+6ppiQ3DlQ8xz5ae8jzTVYvkp+TyNGI1B5MRZuszZw4x1PuKqEcp6Hed++o7o7
         09Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMCAJwi+sI0njtoMQRZsAMxGbXp48erpw8P0nWxAqoE=;
        b=zXOfuPb2ODuSX7pG4mkMgjmUyCkclF3c57Dypsj+EKM+Ze0PZrMQpdj844jk4wi1Vh
         reCwy99yjLuFI5EzjcljI7t2K9j9/4dZAbRP5RyT7q2vF6Z7/8OnuXs2PdSe6dn016+j
         E41JNOPVD20vXxbZK3E3TqXkQsa6aXpsggBTpvKqAZV9KUmo+oFrWIB8PCzu8WkMcefo
         RSbVCOaHI86/xu+j7Pqg0DMB9xEWcvqiGoWno9eqrHUbJwhhWt35Kivx5d7ceAQG/cvs
         MvKh68rGdJNZLCSj3hoeWUkXhFD4Rl8mAPdagxCFYlmP7TK6cPNWQYTMQp2CVlEHVwEa
         L7zQ==
X-Gm-Message-State: AFqh2kpzprf6dI+RJYOnE6pIgpWsYSXSylZ0Nw383akF3Avk9EWXdErt
	IZ7JbItLlWpJrpeiQPUGhuLkiXcPi+YVixQU8Gg=
X-Google-Smtp-Source: AMrXdXtPAVZXd+z9GbRtDcjG2d2/OWWa9XJlPtZrzlsWIZB9s+sDNDlGLtdRlLdJA46LIsQdhoMF4g==
X-Received: by 2002:a05:6a00:3491:b0:581:5017:f960 with SMTP id cp17-20020a056a00349100b005815017f960mr15363193pfb.29.1672418710147;
        Fri, 30 Dec 2022 08:45:10 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id a79-20020a621a52000000b00581ad007a9fsm4413200pfa.153.2022.12.30.08.45.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 08:45:09 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 13/22] baremetal-image: Avoid overriding qemu variables from IMAGE_CLASSES
Date: Fri, 30 Dec 2022 06:44:03 -1000
Message-Id: <58420a64db4e30739768b99c9c30006a7f2ab08d.1672418540.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1672418540.git.steve@sakoman.com>
References: <cover.1672418540.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Dec 2022 16:45:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175154

From: Alejandro Hernandez Samaniego <alejandro@enedino.org>

Since qemuboot is part of IMAGE_CLASSES via qemu.inc it is being
inherited before we set the QB_FOO variables.
Since our variables have conditional definitions and at that point
they've already been defined by qemuboot, we can no longer define
them in our class.

Move the IMAGE_CLASSES inherit to execute it after we set the
QB_FOO variables to fix booting via runqemu.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 8ed78ec262b2502dc3b673b24a868a3eec616a20)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/baremetal-image.bbclass | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/baremetal-image.bbclass b/meta/classes-recipe/baremetal-image.bbclass
index d3377a92fa..513155e9ae 100644
--- a/meta/classes-recipe/baremetal-image.bbclass
+++ b/meta/classes-recipe/baremetal-image.bbclass
@@ -15,15 +15,6 @@
 #
 # See meta-skeleton for a working example.
 
-## Emulate image.bbclass
-# Handle inherits of any of the image classes we need
-IMAGE_CLASSES ??= ""
-IMGCLASSES = " ${IMAGE_CLASSES}"
-inherit ${IMGCLASSES}
-# Set defaults to satisfy IMAGE_FEATURES check
-IMAGE_FEATURES ?= ""
-IMAGE_FEATURES[type] = "list"
-IMAGE_FEATURES[validitems] += ""
 
 # Toolchain should be baremetal or newlib based.
 # TCLIBC="baremetal" or TCLIBC="newlib"
@@ -110,6 +101,17 @@ QB_OPT_APPEND:append:qemuriscv32 = " -bios none"
 CFLAGS:append:qemuriscv64 = " -mcmodel=medany"
 
 
+## Emulate image.bbclass
+# Handle inherits of any of the image classes we need
+IMAGE_CLASSES ??= ""
+IMGCLASSES = " ${IMAGE_CLASSES}"
+inherit ${IMGCLASSES}
+# Set defaults to satisfy IMAGE_FEATURES check
+IMAGE_FEATURES ?= ""
+IMAGE_FEATURES[type] = "list"
+IMAGE_FEATURES[validitems] += ""
+
+
 # This next part is necessary to trick the build system into thinking
 # its building an image recipe so it generates the qemuboot.conf
 addtask do_rootfs before do_image after do_install
-- 
2.25.1


