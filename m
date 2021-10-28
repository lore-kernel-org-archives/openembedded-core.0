Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09B3EC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 18:44:08 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web12.2005.1635446646512663870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 11:44:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=mCcjLRDx;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.42, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f42.google.com with SMTP id i13so6006254lfe.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 11:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lli82AnL3ACnCbSoD3LQ6s8qLz2MGaA4xR3xF4MQPho=;
        b=mCcjLRDxwUBV2M+BiARp/KSCQP0sS0/h/sjMn/Tag948odrlWcxdbV2Y5R5g7j4ghZ
         2qDkS6kBCX86lOzbSGvRTAZI4OukSg3kSpIjFcePLBjTi9NNZAiqFyB/kQoz+Pqg6nVT
         kSdXEgRCq2Cp2WEl+SebMV0yn4QrzpPkKvojTmz4YYrrwaLCJnTdFpV/a/hgzdp+Fjrq
         59SnuoYglsHQVdBRJhTs8FyNP8bbA7U2OBNg556arECEM3b8otnDFNniHqGb0roP1RGs
         mUbBe09g3/k2T6qXQiKNQQrsZnhZn4GWHyC5rf1RQQFQglWG9xU0kdshQE2Lzvtnm7+v
         scaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lli82AnL3ACnCbSoD3LQ6s8qLz2MGaA4xR3xF4MQPho=;
        b=ig++GE396X8Y25evLzmgGHrcHusbPzDyy54Kloz1V+o1Mmw0YR56ac5mzNebp0QkZN
         FsKq1AJMSXdXqR+YXy3IByayRK/JkWhUj2OgEvpX9znP//f+qJJBZHevc3lk3R1+yFcU
         JYwvUyiJcuSTxLf05HZnatJ/FtP5MgivQ94jOJ2urlAikuJOx6FlDYCPDJOq85vxbG41
         ZBwT9aBVGk4xjHt1igTSYWuWvpN93DJCPTW4m8yDnFrqn900eAbH3lZRsTKb4i5fll14
         vf4H6AT0FlzkazbZUUAu8oAUvMcKLkTeo2PHYmMqi8L76E097qJneqsQ7Yw+CLueDtXH
         CALA==
X-Gm-Message-State: AOAM532rGbnjas6s/Hh3eO6Z7N5rWMctBAdTQGuQCGdBj0vsQYtUv3CN
	EmJpdbWOF5VudKhRGlK4yVQ9TwIvqhIDNHwF
X-Google-Smtp-Source: 
 ABdhPJww/sY3cD/nu8qIf5oGhsa/bY1EwydTvS2i9Wya1NjBG1vyzgNlUE9kVbeHB5BT7vXSFR+JpQ==
X-Received: by 2002:a19:c157:: with SMTP id r84mr5985060lff.412.1635446644101;
        Thu, 28 Oct 2021 11:44:04 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 o19sm391683lfk.42.2021.10.28.11.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 11:44:03 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 1/2] libxcvt: add recipe
Date: Thu, 28 Oct 2021 20:43:55 +0200
Message-Id: <20211028184356.3890493-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 18:44:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157602

This library is a dependancy of xserver-xorg 21.1.0.

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../xorg-lib/libxcvt_0.1.1.bb                 | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 8f0b8d39b5..f3e0a75d56 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -413,6 +413,7 @@ RECIPE_MAINTAINER:pn-libwpe = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libx11 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxau = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxcb = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-libxcvt = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER:pn-libxcomposite = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxcursor = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libxcrypt = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
new file mode 100644
index 0000000000..628ccfb647
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxcvt_0.1.1.bb
@@ -0,0 +1,19 @@
+SUMMARY = "Library providing a standalone version of the X server \
+implementation of the VESA CVT standard timing modelines generator"
+HOMEPAGE = "https://gitlab.freedesktop.org/xorg/lib/libxcvt"
+BUGTRACKER = "https://gitlab.freedesktop.org/xorg/lib/libxcvt/-/issues"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=129947a06984d6faa6f9a9788fa2a03f"
+SECTION = "x11/libs"
+
+SRC_URI = "git://gitlab.freedesktop.org/xorg/lib/libxcvt.git;protocol=https"
+SRCREV = "6fe840b9295cfdc41bd734586c5b8756f6af6f9b"
+
+S = "${WORKDIR}/git"
+
+inherit meson
+
+FILES:${PN} = " \
+    ${libdir}/libxcvt.so.0* \
+    ${bindir}/cvt \
+"
-- 
2.25.1


