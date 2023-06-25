Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E9BEC001DD
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:22:57 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.20349.1687728173944501753
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:22:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=C47S1Lnp;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3090d3e9c92so3977388f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 14:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687728172; x=1690320172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KzLM7AAesm8qV9XUrldLSEgj5V2PgNTvD/8oOWxVMT8=;
        b=C47S1LnpQwgHWRrnJBiKZxNneg/lBGrk6EkVDfV4wdhZxqWb0hg4rIScBjgQryRdLg
         0AwrYtqJlUGQZDED4Zkc/zIdF3p11LrDxRcmPv1lf997xGdwThBThVf1I4TJFWN1N1tq
         iBS1kPqQrEC//Hlzk/2rMYptjDnNDOsFpbP8uhUL15nyCeMBKWqSE6OACm95ZLIRwDHi
         DzprUXWnKguGNHicqol5UUGLgxheYq65HjbYShPH+fON9Ob1XuTTzkZvcgWE8ND+kVkp
         R1EcOWRJwDhjQsmpUuzcOWMXTngRYvWeLV0qzoOqXXsYP96SWJKyBM1DKuu4nUG7WzWN
         rJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687728172; x=1690320172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KzLM7AAesm8qV9XUrldLSEgj5V2PgNTvD/8oOWxVMT8=;
        b=XP2udV92KBBLkmax/SrxHvgiPuf4g8mk1IUouudz57rbq2ghuFY22tZpHFRgnGq3nk
         m+4wxNNBT5/84gZndYg87WK25LO26GHFwdUhLujBo3HE8UDRmeHOhR47ALkYVkwVtYri
         4iOu66y/cm1YrZ9Bqk+UMkCUKkabozPM/6pdVOqtLGHvOKCpP1XmlfXIRpUbS4649bqc
         8LSKu09ohsECpVyNWc+4CJDVUJT7LEDx3J5dOm3rZQ3UHTTaoGhM6QjUxukvXM6fLmfS
         qCG4jqnSRaMzTBv2fhZ65PA2Pky/EBhX1luFYhDCoE7DHqZrDpkyd6TdUY9376WLUyBG
         cNaw==
X-Gm-Message-State: AC+VfDwRxoSZ4R6h6/U/7Zm4hdIktZObU+ngCjQg5pgL4I+3sT9kucQx
	1Jvt6ip7yJ/IUgB07CMYLcb9veBACA0Utw==
X-Google-Smtp-Source: ACHHUZ7KLO1lBQAgv8ybn9QUTqqet4kbFaW4bG6FkjyyuDTUYl0NEPqWKvMh6jXkW/JZ3z5pO0tmTw==
X-Received: by 2002:adf:f847:0:b0:311:1a9c:5e03 with SMTP id d7-20020adff847000000b003111a9c5e03mr28518347wrq.51.1687728172373;
        Sun, 25 Jun 2023 14:22:52 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm5426736wrz.47.2023.06.25.14.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 14:22:52 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/21] xcb-util-cursor: add a recipe from meta-oe
Date: Sun, 25 Jun 2023 23:22:35 +0200
Message-Id: <20230625212241.915739-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230625212241.915739-1-alex@linutronix.de>
References: <20230625212241.915739-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 21:22:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183390

This is a requirement of weston 12.x when xwayland is enabled.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc               |  1 +
 .../recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb | 10 ++++++++++
 2 files changed, 11 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 9bb5c5205c2..322657ffc62 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -847,6 +847,7 @@ RECIPE_MAINTAINER:pn-x264 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-xauth = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xcb-proto = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xcb-util = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-xcb-util-cursor = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xcb-util-image = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xcb-util-keysyms = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-xcb-util-renderutil = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb b/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb
new file mode 100644
index 00000000000..047697845c3
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/xcb-util-cursor_0.1.4.bb
@@ -0,0 +1,10 @@
+require recipes-graphics/xorg-lib/xcb-util.inc
+
+SUMMARY = "XCB port of libXcursor"
+
+DEPENDS += "xcb-util xcb-util-renderutil xcb-util-image"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ce469b61c70ff8d7cce0547476891974"
+
+SRC_URI[sha256sum] = "28dcfe90bcab7b3561abe0dd58eb6832aa9cc77cfe42fcdfa4ebe20d605231fb"
-- 
2.30.2


