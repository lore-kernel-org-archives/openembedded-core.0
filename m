Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F7EC433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 11:05:19 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.10154.1636023919119294604
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 04:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q0qBWXAY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id s13so8002784wrb.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 04:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hirWlY7hYbD9hrDSubHsxHfSp24vjDbmUrqulBXG3f4=;
        b=Q0qBWXAY1h7Aj1btIe9sRH4Rh9p9tt87oTXanbT4L12LDIZrLiIIJhSKcjZlvRxa5J
         1q0960OPHy2/7jxRpfFeuxZrlSon31luT/GcSbu+6HjP6l+T20e7jx6DOC627kKXoeeW
         Agj87cX8p0zOCfa8ZZTrMEIJR6ey1pkk0VC10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hirWlY7hYbD9hrDSubHsxHfSp24vjDbmUrqulBXG3f4=;
        b=JPaOWOAgOsC7THuT+/LeTW5Ru5lxy9fLuGMFUZkxS4omfBm2cqBoc3KmmD3BNiht66
         kFLyb9fKXqpY+Nv3Jq6YYCCgYgd21P7IzDuhnCDr6+QLU31GOm+Yf2Xp/a91aUrYzGrN
         xzrKZHaaZmb7Ucxqt4zdZxLE0XMpbF4heOx+nCFkatRZKeae42+436LQdbb2diRsFBoh
         zmKotoDF6e2/W+e0YS1WCYuWzS1dVs563Vr1gSqwcXE/zOpstOuVZl2IIXXWjC4SFbh/
         gCGphpLvMW5PhdO8qBgUkelHhXYjnftL7Q23ZSwMmTio0abkSKfNSfR8EDjweY+WY1Mt
         vv/A==
X-Gm-Message-State: AOAM532xu9C+/FBanIjBjNx2n1qXCrw1gJMiuas7oRaTfErY1KTEcILX
	PXvJoV9MakhA5m2hm23s6Ezpdrazoce79g==
X-Google-Smtp-Source: 
 ABdhPJxt5/mRMakDNkIs7nILftOsB4lr5z6uie18hDihTQLwaChb+hUxVcgeWUJ1/ZoT2l9KwKQrMQ==
X-Received: by 2002:a05:6000:18ad:: with SMTP id
 b13mr29442590wri.195.1636023916912;
        Thu, 04 Nov 2021 04:05:16 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:2578:3d9c:c55b:5282])
        by smtp.gmail.com with ESMTPSA id
 l26sm4855219wms.15.2021.11.04.04.05.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 04:05:16 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH RFC 0/2] Replace VIRTUAL-RUNTIME variables
Date: Thu,  4 Nov 2021 11:05:14 +0000
Message-Id: <20211104110516.3616891-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 11:05:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157838

The VIRTUAL-RUNTIME variables are a hack and not fit for purpose.
These patches replace it with something different. There are some
issues listed in the second patch which probably rule out the 
implmentation as is but I liked it enough to get it this far and
maybe some better solution can rise from the ideas here.

Richard Purdie (2):
  package: Introduce PACKAGE_GLOBAL_RENAMES
  conf/recipes: Replace VIRTUAL-RUNTIME with PACKAGE_GLOBAL_RENAMES

 meta/classes/base.bbclass                     |  6 +++++
 meta/classes/image.bbclass                    | 10 +++++----
 meta/classes/multilib_global.bbclass          |  5 +++++
 meta/classes/package.bbclass                  | 18 ++++++++++-----
 meta/classes/packagegroup.bbclass             |  4 ++--
 meta/classes/populate_sdk_base.bbclass        |  9 ++++----
 meta/classes/update-alternatives.bbclass      |  5 +----
 .../conf/distro/include/default-providers.inc | 13 +++++------
 .../include/init-manager-mdev-busybox.inc     |  9 ++++----
 .../conf/distro/include/init-manager-none.inc |  7 +++---
 .../distro/include/init-manager-systemd.inc   |  9 ++++----
 .../distro/include/init-manager-sysvinit.inc  |  7 +++---
 meta/conf/layer.conf                          |  2 +-
 meta/lib/oe/rootfs.py                         |  2 +-
 meta/recipes-core/busybox/busybox.inc         |  4 ++--
 meta/recipes-core/busybox/busybox_1.34.1.bb   |  6 ++---
 .../images/core-image-minimal-initramfs.bb    |  2 +-
 .../images/core-image-tiny-initramfs.bb       |  4 +---
 .../initrdscripts/initramfs-framework_1.0.bb  |  4 ++--
 .../initramfs-live-install-efi_1.0.bb         |  4 ++--
 .../initramfs-live-install_1.0.bb             |  4 ++--
 .../initramfs-module-install-efi_1.0.bb       |  4 ++--
 .../initramfs-module-install_1.0.bb           |  4 ++--
 .../packagegroups/packagegroup-base.bb        |  9 +++-----
 .../packagegroups/packagegroup-core-boot.bb   | 22 ++++++++-----------
 meta/recipes-devtools/dpkg/dpkg.inc           |  2 +-
 meta/recipes-devtools/opkg/opkg_0.4.5.bb      |  2 +-
 meta/recipes-extended/lsb/lsb-release_1.4.bb  |  2 +-
 .../packagegroup-core-base-utils.bb           |  4 +---
 .../packagegroup-core-full-cmdline.bb         |  9 ++++----
 .../packagegroups/packagegroup-core-weston.bb |  2 +-
 .../packagegroups/packagegroup-core-x11.bb    |  9 +-------
 meta/recipes-graphics/wayland/weston-init.bb  |  6 ++---
 meta/recipes-graphics/wayland/weston_9.0.0.bb |  2 +-
 .../gstreamer/gstreamer1.0-omx_1.18.5.bb      |  3 +--
 35 files changed, 106 insertions(+), 108 deletions(-)

-- 
2.32.0


