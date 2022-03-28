Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD86C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 01:23:10 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.5849.1648430589898876966
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 18:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ghEx6AyW;
 spf=pass (domain: gmail.com, ip: 209.85.215.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id c11so11018599pgu.11
        for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Mar 2022 18:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uPkrDCuOD8ziNtns0Wo5ie2SQkhVANQzg8m8N2aF7bg=;
        b=ghEx6AyW+SUzh7dB9ZhXAzgywqxrQJpsUs6KnZFAwWMGWX/jAYQ8WfoMU2vgeGUrBY
         4PBDKAQn4TUhXZT3suUoktfQNijNbZGtkpJA2WgQWZOeWnC8JN1ilD6qEQl8f9xQO0yI
         at8kzqBrUS2Mdgt/tT2n/axoh340UUGMiYFfCJuRcNaTx37Uh9GxUDnLAmamsiX6MHzw
         AemGP8WmLIsu+7j53PW1zWmxtERSw2wPbKbwPVKj5ABHiEzsRmayi9RDlp9qlp05lVLP
         FID3PSCJHcVCpxV544ZsgMUziLeW2eV2arINtgussyTBtelso8CxPRCY6gyb+5/pykx8
         Ya0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uPkrDCuOD8ziNtns0Wo5ie2SQkhVANQzg8m8N2aF7bg=;
        b=aVbDAFduPJKkXWG8fmPjgeRy0qEFHZeadaDlHgCJ1DtyvY8yVch9RH8vT2Y1WB4jvd
         6lX6RHsV31hp+9XnviFBa4O7BotoN6yvyifxx4OY/itDbFtLpYgTEefuxhAce7KsPguH
         qD4nlC4Adv4Jams8d9ZQFeoq9+f6Lxr1SfcwHHymR2TSiWYUskHOds92zbdY2Zk9rYnd
         tRAbNNUVQbHav2EC7nfKbbUmcncHGBkDbHb+YkovVWc2LY1q+36kJwz06RcVFldU2ITw
         epZb0MqCsg3Ba/gySiKGEAe3auh1PIYZrI/ooaGfkLW2LkrGjso4YWygB36SKXRbSvnw
         aNAw==
X-Gm-Message-State: AOAM5335gYik6ByyvbMk36gdmR0w+c/5Nlt5KJZ5ApmY/jwcMN2Wox7X
	y5JyhpxQeJzyX+XDY3juU1K7M5n7D6A=
X-Google-Smtp-Source: 
 ABdhPJzf0Iy4mqujBQVRZrpDc4PM7eRxGuHzKPqMnRQU/nZ8vtvS7AIS20372eV/iZ1wM4XBvd5DUA==
X-Received: by 2002:a63:7d04:0:b0:378:fb34:5162 with SMTP id
 y4-20020a637d04000000b00378fb345162mr8340616pgc.487.1648430589213;
        Sun, 27 Mar 2022 18:23:09 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 j16-20020a63e750000000b00373598b8cbfsm11163500pgk.74.2022.03.27.18.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 18:23:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] qemu: Disable for ppc32
Date: Sun, 27 Mar 2022 18:23:06 -0700
Message-Id: <20220328012306.313339-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 01:23:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163682

qemu no longer supports building for ppc32 hosts, therefore reflect this
in recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/qemu/qemu_6.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu_6.2.0.bb b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
index 92857adf9c3..9f7fad9886e 100644
--- a/meta/recipes-devtools/qemu/qemu_6.2.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_6.2.0.bb
@@ -23,3 +23,5 @@ PACKAGECONFIG ??= " \
 PACKAGECONFIG:class-nativesdk ??= "fdt sdl kvm pie \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virglrenderer epoxy', '', d)} \
 "
+# ppc32 hosts are no longer supported in qemu
+COMPATIBLE_HOST:powerpc = "null"
-- 
2.35.1


