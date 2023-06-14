Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17E67C001B1
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 09:29:44 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.7478.1686734980297187740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jun 2023 02:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=aJe4Rc7r;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-9788554a8c9so83448266b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 02:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686734979; x=1689326979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqOm4/SyxGYL8FBOA1Gt09BiQLB6cZ7nvIsKG2jr0gs=;
        b=aJe4Rc7r4Sdy6I8c9ABAxHkAk3ZeTnfMUeHFHyILEkW3R6t9kE+fSLpsViqwj4Y43B
         XDyt7BigFS2nRtqXTRFj9A9Dngk7hk5dit68iFMA3Yt4AGUB1gt7Xh9bvrdA99iCtY5h
         +BNe2NjMMpo/eSaU3qpbNEtpk1WHcsvW5suUb2PV1+likSKpOivCF0eFfz3G/DJQcbYF
         mItJd09nheTna7oqt4xBzJoBEySX1f4PvjIWlV7lmmyZFQrtDhtVIy1T/YZDeLxJp4Jr
         wVhOW6FZayCKloKKCaGJfMVixa5+tCboyr2xHjbhFV8ggSl1j/FiF1eF/xKkdm1CjcNU
         JG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686734979; x=1689326979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqOm4/SyxGYL8FBOA1Gt09BiQLB6cZ7nvIsKG2jr0gs=;
        b=k5rCNbKXVL/fEf+NRCAx9WK20mcSacF78jhmDS5ADpNBmcSUDwxpSPKUbwcJmwZkLK
         A2pKna5VoTY2zXYRAPya5EnlRypzWiBEZ3Y20f6TMiMQmiv4xnhXQUzGzBR2yugp+kKS
         DsFP3XFxboASebW3uFSm3ObbxYXncv7JAoVSZFRCG6IkUci51Mp54KXcLTu6EV41sDVH
         ai7IljhtBTUJhWJWx0xc+Ts1KQWdvaYkX9cxryDUpEbn/I8R8Mo1+Z6W1rnDzXIoJl9x
         oQCJphFn1BXxrPL/+oB2BOE0MsBXa0F/W5NeFxWxmyOk42tDpkivV70TkM3X91YS/sJ5
         SvJw==
X-Gm-Message-State: AC+VfDw1Ja3efbjI/1Wej0PoDL+2jHRImGHrF/olK3KpRGSCoBFnC+Zj
	MC2RHZmL74A1fn88iBgKVNHvxBQjfSc=
X-Google-Smtp-Source: ACHHUZ5RMANONsuBvga7QfxLztudalcbO8hGnMAeUteYPtuOsQ2kNjx0LRr3PvJJqOq4bfnBTsEbhw==
X-Received: by 2002:a17:907:94ca:b0:94f:2d5f:6949 with SMTP id dn10-20020a17090794ca00b0094f2d5f6949mr16069734ejc.42.1686734978784;
        Wed, 14 Jun 2023 02:29:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id k19-20020a170906129300b0097381fe7aaasm7747375ejb.180.2023.06.14.02.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 02:29:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/55] gobject-introspection: upgrade 1.74.0 -> 1.76.1
Date: Wed, 14 Jun 2023 11:28:44 +0200
Message-Id: <20230614092918.4065570-21-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230614092918.4065570-1-alex@linutronix.de>
References: <20230614092918.4065570-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 09:29:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182766

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...01-Relocate-the-repository-directory-for-native-builds.patch | 2 +-
 ...-introspection_1.74.0.bb => gobject-introspection_1.76.1.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.74.0.bb => gobject-introspection_1.76.1.bb} (99%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index 030ff176010..9ba8bcfd71a 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From d396e5126461631e2c73ce98ba034f1e44598f6a Mon Sep 17 00:00:00 2001
+From 2c31944eabbb42a86a4ddaa2998a3b100a13138d Mon Sep 17 00:00:00 2001
 From: Sascha Silbe <x-yo17@se-silbe.de>
 Date: Fri, 8 Jun 2018 13:55:10 +0200
 Subject: [PATCH] Relocate the repository directory for native builds
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb
similarity index 99%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb
index d3a7ce2fd93..17748b9f496 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.74.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb
@@ -17,7 +17,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-$
            file://0001-g-ir-tool-template.in-fix-girdir-path.patch \
            "
 
-SRC_URI[sha256sum] = "347b3a719e68ba4c69ff2d57ee2689233ea8c07fc492205e573386779e42d653"
+SRC_URI[sha256sum] = "196178bf64345501dcdc4d8469b36aa6fe80489354efe71cb7cb8ab82a3738bf"
 
 SRC_URI:append:class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.30.2


