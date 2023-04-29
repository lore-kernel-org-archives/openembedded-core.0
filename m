Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249CAC77B7C
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 15:06:16 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.48202.1682780775199312719
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 08:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Cwex0PUm;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5144043d9d1so599036a12.3
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 08:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682780774; x=1685372774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9RS7/kmoO0E75xoXsOZFU0QERwHF2XR4adnzP2V/z4=;
        b=Cwex0PUmkR+M9O3zg2eOZe3H4o7llYolNLQqrOPfe9Lxl4h9LgwVo6xitLLBz4xHv1
         PYk5PPlnQ7myCf9J04vKzDPIXuNNY9uow16rXrmIS09/A0TPxbiS8r/R64RyGwn+fm4u
         dzj6yj8JvoBO5nlmMhXHthuI1VS7Zt5pbDiU6mv/LZhVEVavyliDpfF5yX/gMPytyBP8
         RD716fi0y4aL609w4c2dsdsiSyjP1GfOE772ZLRlTxICGmguNKHFjbIeHy+MDo+DO7WJ
         KHYqMriERORTVMHDo4Nvq0GLtRv3fXxW+Gn+u/t9qJ3R6a69y+vBiUjRndE8AfKaGJXX
         k90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682780774; x=1685372774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9RS7/kmoO0E75xoXsOZFU0QERwHF2XR4adnzP2V/z4=;
        b=kFI1fSxto9jphENHoMfcjzuvrtF4u5r9GP3LS7wjjsftaQ8ncAmUAZ4j7y+RZdkLCY
         kioePUKBPHVI1Uc+pfPYyqPNj0HKbTQqm51epZKs3caclG2kDgui/T9xWsRx5Io6emoE
         mtzOdyeJsRLSiGx/dZvHGNKKHJPonV/VzDeZ04PFgfWuZAe64lUS4EZ7gMXGYe8T+mjP
         W1II7+lWTqetYidcHaJ6v4LUbkH0/dZt6bK7q0ZNaSrsbVPs0CwRsJFrVN+7+5EaZsHq
         2evWXVp5Uck1giVicuHuMGCqf7OiuSUYbU8jspHWJdpn+7TUyPcDof0/cnbQjzZlrcng
         YwNA==
X-Gm-Message-State: AC+VfDz9c960oMZlHVx3vhd0Jrf3wT2F9fZzKuRhqJFaKT6D77xMQ3nS
	DcvUh4BxEzkQ5+2zsDROvLlYMYsYnYVn8Q==
X-Google-Smtp-Source: ACHHUZ68BeE9k84cvQ+CbCFNTLGcDmMZ5bE5S9UAwYWqCzaZcKx2ETlZIXGA3w7MCjRRqaDJm5Zkrg==
X-Received: by 2002:a17:90a:6043:b0:24d:cd33:e98 with SMTP id h3-20020a17090a604300b0024dcd330e98mr3907410pjm.12.1682780773794;
        Sat, 29 Apr 2023 08:06:13 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::f98d])
        by smtp.gmail.com with ESMTPSA id j4-20020a17090ae60400b0023faa95f75csm16622736pjy.36.2023.04.29.08.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 08:06:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] apt: Use a valid download location for 2.4.5 release tarball
Date: Sat, 29 Apr 2023 08:06:11 -0700
Message-Id: <20230429150611.1521134-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 15:06:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180541

Fixes
WARNING: apt-2.4.5-r0 do_fetch: Failed to fetch URL http://ftp.debian.org/debian/pool/main/a/apt/apt_2.4.5.tar.xz, attempting MIRRORS if available

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/apt/apt_2.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb b/meta/recipes-devtools/apt/apt_2.4.5.bb
index 429cf6e659..b2b41ab661 100644
--- a/meta/recipes-devtools/apt/apt_2.4.5.bb
+++ b/meta/recipes-devtools/apt/apt_2.4.5.bb
@@ -5,7 +5,7 @@ LICENSE = "GPL-2.0-or-later"
 SECTION = "base"
 
 # Triehash script taken from https://github.com/julian-klode/triehash
-SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
+SRC_URI = "https://launchpad.net/debian/+archive/primary/+sourcefiles/${BPN}/${PV}/${BPN}_${PV}.tar.xz \
            file://triehash \
            file://0001-Disable-documentation-directory-altogether.patch \
            file://0001-Fix-musl-build.patch \
-- 
2.40.1


