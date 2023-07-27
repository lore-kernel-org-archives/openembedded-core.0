Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33066C00528
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:44:42 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.16774.1690487077438646025
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=akMstrpm;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-56334abe325so777142a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690487076; x=1691091876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5YxB7wSVKCgcNivfb+a1Ag5ako/BO8AuQRcvnqE+Sqs=;
        b=akMstrpmil6wKPZac+22HZG/EJyqIJXnCYNlDUatN4COYTkP9LuleFyhiqzHz28trQ
         7lUx2R7CGo/8hzj6cx6XmJ7ku/9NeokwzXyqodt8QQJcl3VfTllbFYkgf2lbnup6YzEl
         0Wj8dHqF6sPdvwNwCy6kTm6z6A6RiZqzKAccp8PAzykyUeWq2rCWJOJgvM+/mDQNqLY2
         iu65EWxZdc7q1UGHzfWgg12ptnh+fIGIB7rNfcnZKJAhH40jqO2WAI+I1CmEQh/9cT4/
         daDZDt+5WnoSTK1nAV1IrvrEkg0mn5sUtySrMfPrt9TkOkJL2Wg5lgUyJE3DeTC8Yzri
         yr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690487076; x=1691091876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YxB7wSVKCgcNivfb+a1Ag5ako/BO8AuQRcvnqE+Sqs=;
        b=JvHPqj1KcUQG9X0J71fSd/5IFNC/N+F06bxSA5+ie0FaG3ZzqBiK1o3GUDCyYGXv/Z
         jaLCZmlOEISSh2KbdawPpliHusq/GM0r/c4C4XE8GiocLLRB8f0iKFo1QUef4cCyHO8Z
         DhpcNN5xTMclGxnZK3sNUrbNG6SsIGBaLFg2RYC2Uw5nZPNWBjHT1Qzy2FV6uooc6Y9b
         KtGKlH3ZW2/vpU32tr/Um7icwd9C6bIREwo3LxLyzm2Ag82wzv1pmSLlN1p/EMHB33kU
         HqVWiFGfR65eDTkPA/n7R0shO8aetaXan6YENcoL5xl7SKy12Lva6oP9RHpKM8mziqN9
         FuQw==
X-Gm-Message-State: ABy/qLayXLX2Vt8txy/mxSAtZf01EVFuSaDRtUMcI9vZSUucVl54WuuH
	e3oglkCxvzSXWyae1Z4NiQFEIcEWNIR8d9zGwQE=
X-Google-Smtp-Source: APBJJlFEH3Yga2HleJw3WZRpeF0nqxdC/GFNmXhhFnT/P+X/Pf2p+Jp+DHhj1MbSbfKLon3peBurdQ==
X-Received: by 2002:a17:90b:688:b0:268:105b:ca1c with SMTP id m8-20020a17090b068800b00268105bca1cmr252748pjz.32.1690487076428;
        Thu, 27 Jul 2023 12:44:36 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 29-20020a17090a01dd00b0025bcdada95asm1620532pjd.38.2023.07.27.12.44.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 12:44:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 23/27] rootfs_rpm: don't depend on opkg-native for update-alternatives
Date: Thu, 27 Jul 2023 09:43:41 -1000
Message-Id: <49be8045a6595cb98413519d2e65e94345f026c1.1690486929.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690486929.git.steve@sakoman.com>
References: <cover.1690486929.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:44:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184998

From: Ross Burton <ross.burton@arm.com>

opkg-native hasn't provided update-alternatives since 2014[1] so this is
the wrong dependency, and image.bbclass depends on the virtual provider
virtual/update-alternatives-native already.

[1] oe-core 1e2c38ce13f8e4b25d8656d237343380cbc970aa

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 51004376be9a6b9a4c38585d14d2516d90138319)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/rootfs_rpm.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes-recipe/rootfs_rpm.bbclass b/meta/classes-recipe/rootfs_rpm.bbclass
index 6eccd5a959..55f1cc92ca 100644
--- a/meta/classes-recipe/rootfs_rpm.bbclass
+++ b/meta/classes-recipe/rootfs_rpm.bbclass
@@ -20,11 +20,9 @@ IMAGE_ROOTFS_EXTRA_SPACE:append = "${@bb.utils.contains("PACKAGE_INSTALL", "dnf"
 # Dnf is python based, so be sure python3-native is available to us.
 EXTRANATIVEPATH += "python3-native"
 
-# opkg is needed for update-alternatives
 RPMROOTFSDEPENDS = "rpm-native:do_populate_sysroot \
     dnf-native:do_populate_sysroot \
-    createrepo-c-native:do_populate_sysroot \
-    opkg-native:do_populate_sysroot"
+    createrepo-c-native:do_populate_sysroot"
 
 do_rootfs[depends] += "${RPMROOTFSDEPENDS}"
 do_populate_sdk[depends] += "${RPMROOTFSDEPENDS}"
-- 
2.34.1


