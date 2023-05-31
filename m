Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1786AC77B7A
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:55:41 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.8735.1685519733957233050
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 00:55:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ZIKoRxPp;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-96fbc74fbf1so985365266b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 00:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685519732; x=1688111732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zoj/MXqUcVvXbZo6GTEELJyNGvUZ52ajftJmjQBG/lg=;
        b=ZIKoRxPp6UWMQMdSiYcRm/YPfvoTMKty3XyOLVzznKWwmWEXEgfVF1GPUMfojEg7ok
         WjI7cEi5zOvSHG+9bG0YXomUo2hb4nQPTpVrs2wDpUuxyL7QI23RFsZyHoJRGNPExd4c
         1FLzB0kwRZV473aivpV8j0S2B7Z6RnxJIlcmk0sEz/1vIiNsoaZyM2e0/fMMvBWCCOyV
         QL53Sjp9rjjwqO6Wga+dOua7VyRAMFLIv/cY0lYFPJSIVJDu5HY3131Hxoip/pzYpHJn
         tEzeDFg8NOGodtYFsSdXGVlB7B3RlPSLAzCDrBj5hkq13JTVSjk1MOpUx1IufcxuAzlx
         S95g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685519732; x=1688111732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zoj/MXqUcVvXbZo6GTEELJyNGvUZ52ajftJmjQBG/lg=;
        b=l66GU4T7tqzgQWU8bY0Jm/FNH0jhTw0AY/8Bpan5A/gxoZ57kL7R1nNcLnPxYTGPtw
         hxoouO23q6pK8cZHF6ZPQd/kqqwHdIcWMpQO6TwF12B7GkkcweVOXqO7eMI3z6QRm8c/
         mECA3qM1dLMO0U8fmgafZ4XgO4nE/pC/ap0Tk3+snj8+K5gbfGtnh5fAWDWV3XXrmr7V
         tcy4SWlAKoCNMgW9nQSjXGCWYp4Bv3otKpPBahn6tl8BOWk0yU8KxG1x9QH3T52IWyXm
         aPuZaaY8XzPe92pOPL1JAwL4klRAzUiPfMx2ntEhtISSE/pzOj8/iz5yucMdJO/Vlwn4
         9g9A==
X-Gm-Message-State: AC+VfDzir6YulZJvEhmJi1upd8rylZgAT+Rruroay5AKT6AiHyZkcF0k
	rplZ6EILTIsQ5IFZDqsCGE3+39IlWgADug==
X-Google-Smtp-Source: ACHHUZ7LkUYNoVxpICMTB5eP827Ws8F+SDuTt8qenr7yZabGbPLfLCkvCi6IQ3oawULmsGr1oz7SfA==
X-Received: by 2002:a17:907:6d23:b0:974:1ca9:836e with SMTP id sa35-20020a1709076d2300b009741ca9836emr1497673ejc.6.1685519732153;
        Wed, 31 May 2023 00:55:32 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id r20-20020a170906365400b0094e7d196aa4sm8489062ejb.160.2023.05.31.00.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 00:55:31 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/3] maintainers.inc: correct unassigned entries (> was missing)
Date: Wed, 31 May 2023 09:55:24 +0200
Message-Id: <20230531075526.3894314-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 07:55:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181998

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 359a29c0768..aab8f9bb636 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -40,7 +40,7 @@ RECIPE_MAINTAINER:pn-alsa-ucm-conf = "Michael Opdenacker <michael.opdenacker@boo
 RECIPE_MAINTAINER:pn-alsa-utils = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
 RECIPE_MAINTAINER:pn-apr = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-apr-util = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER:pn-apt = "Unassigned <unassigned@yoctoproject.org"
+RECIPE_MAINTAINER:pn-apt = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-argp-standalone = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-asciidoc = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-aspell = "Anuj Mittal <anuj.mittal@intel.com>"
@@ -59,7 +59,7 @@ RECIPE_MAINTAINER:pn-base-passwd = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-bash = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-bash-completion = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-bc = "Anuj Mittal <anuj.mittal@intel.com>"
-RECIPE_MAINTAINER:pn-bind = "Unassigned <unassigned@yoctoproject.org"
+RECIPE_MAINTAINER:pn-bind = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-binutils = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-cross-${TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} = "Khem Raj <raj.khem@gmail.com>"
@@ -151,7 +151,7 @@ RECIPE_MAINTAINER:pn-docbook-xml-dtd4 = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-docbook-xsl-stylesheets = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-dos2unix = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-dosfstools = "Yi Zhao <yi.zhao@windriver.com>"
-RECIPE_MAINTAINER:pn-dpkg = "Unassigned <unassigned@yoctoproject.org"
+RECIPE_MAINTAINER:pn-dpkg = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-dropbear = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-dtc = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-dwarfsrcfiles = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -414,7 +414,7 @@ RECIPE_MAINTAINER:pn-liburcu = "Wang Mingyu <wangmy@fujitsu.com>"
 RECIPE_MAINTAINER:pn-liburi-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libusb1 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libubootenv = "Stefano Babic <sbabic@denx.de>"
-RECIPE_MAINTAINER:pn-libuv = "Unassigned <unassigned@yoctoproject.org"
+RECIPE_MAINTAINER:pn-libuv = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libva = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libva-initial = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libva-utils = "Anuj Mittal <anuj.mittal@intel.com>"
-- 
2.30.2


