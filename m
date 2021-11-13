Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30679C433EF
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 16:08:17 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.265.1636819696447815645
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 08:08:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hGOgaW+H;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 j5-20020a17090a318500b001a6c749e697so8097344pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 08:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mOaafSqaQkJX8oLn3Of1xoljRevCGr+1izrWWhDyUjc=;
        b=hGOgaW+HC1EjSHeTGkerGj3R0ZvbsSt9IV+f/jAIcxMJaMYkdY5lzUVWGF9uR1tuOH
         oBk0ywaIIUS108Vk/9cplH+d3RUXuK/WFDfrfCs56AXT1qm6MQ906l5DF6CB5sLfpNBr
         SNzK+xa/PA2PJ9VeOuQxQGGkIC/f50xFaLA0696LR5SX8acDaBFytnqU965jGk6BOVN6
         uGOC9lKQ2NYQoIJK0E4Pqo+6LcKa4HD2LUm8JLSc6fSAFhncb8I3wXTmVCRt44dlqv5t
         eNrP9QQIlF+2+yi4SAk5x/x+1uWENMQ/UAsNFRupTynu1pxt1qJLXMPpxDYN5rX/nrEC
         la3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mOaafSqaQkJX8oLn3Of1xoljRevCGr+1izrWWhDyUjc=;
        b=vE1htO3D61flWNb4kufsev2czRc+VVjpNow7W/tp/I1bKSqBAv7uKuHVm/VIDHUa2P
         zO9VdL2CtT6hD9/oixi/hzPN+15S/9Jf709MqnpQwYbPwwcap696yV2Ex866H/+pcttM
         YwiX9WHHh35nv4jZCJHAGxtZX3tvONXe+l20epEUkNWV73H2c0OONZYbuklSq9joxJkH
         nFhjcC7zXpB49tqpRyOKTIXE8uTufbKUPhGyXYvc/xORbe/NlH2tsMBpgVASLK4PN8nH
         BcOvPPeotcsyroRrLjRfOCLvKMr1DxOzyPNkZMhPnTW1NUXts0zTcXE3ycThfeJGW+iV
         0S6A==
X-Gm-Message-State: AOAM531Uea7JjAi9X1LuOvRBwihL65d1mNj7i40HEv/Pp/ij7vLXLb0k
	JfU3sEoVrYRQGIcaJYQ0ZSFkOAF3c/M=
X-Google-Smtp-Source: 
 ABdhPJypl/SyPvHzJfunuOWBB+ndGJ/h8idNSJ5JbHOeqGe8oXf43wED7sTE3TV5ktj9dQoVKk8l0Q==
X-Received: by 2002:a17:902:b588:b0:143:b732:834 with SMTP id
 a8-20020a170902b58800b00143b7320834mr4395242pls.22.1636819695820;
        Sat, 13 Nov 2021 08:08:15 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::7905])
        by smtp.gmail.com with ESMTPSA id
 z22sm9854045pfe.93.2021.11.13.08.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 08:08:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/2] python3-pygobject: Do not add -Dintrospection
Date: Sat, 13 Nov 2021 08:08:13 -0800
Message-Id: <20211113160813.2011818-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211113160813.2011818-1-raj.khem@gmail.com>
References: <20211113160813.2011818-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Nov 2021 16:08:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158246

This also reverts commit 9c0cc06a3d857124c0e1c1c9342f79ba5a3b10bc.

meson 0.60 turns unknown options into hard errors

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Squash revert and fix typo

 .../python/python3-pygobject_3.42.0.bb              | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
index 7ff7c5b4dd5..b07969c5efb 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
@@ -6,18 +6,11 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase distutils3-base upstream-version-is-even
+GIR_MESON_OPTION = ""
 
-DEPENDS += "python3 glib-2.0"
-
-# Generating introspection data depends on a combination of native and target
-# introspection tools, and qemu to run the target tools.
-DEPENDS:append:class-target = " gobject-introspection gobject-introspection-native qemu-native prelink-native"
+inherit gnomebase distutils3-base gobject-introspection upstream-version-is-even
 
-# Even though introspection is disabled on -native, gobject-introspection package is still
-# needed for m4 macros.
-DEPENDS:append:class-native = " gobject-introspection-native"
-DEPENDS:append:class-nativesdk = " gobject-introspection-native"
+DEPENDS += "python3 glib-2.0"
 
 SRCNAME="pygobject"
 
-- 
2.33.1


