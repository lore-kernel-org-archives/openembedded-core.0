Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97AACC43217
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 03:01:57 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.7193.1667530916922620662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 20:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=gOLqB0tu;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id h14so3397375pjv.4
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 20:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6A5BhTI29zIvXWvcPgzOQ7MwB1c65Ylqr5S89UZVcoY=;
        b=gOLqB0tuRxr65++/rE9sBKjtw/MF9XzUWXFyA6KsSMZMIV2ZdrrWi+rIKY9veV+/Oq
         iUOiXqGkkHpaT7AjwhAMxUoDFH444Afoif72G/tZ3thOJrsvovWNtCM7ft2hgXwIvTB+
         Ljh+vji2eIBqaiYNIRfxbUM5LvLO2wNxm94XdBYb96MK505v4s8iIYfpWx3r/i6/3vNV
         KMJuX+TCnr+OdD/s80L9TqoXeg9avk8v9sIdp1fp/e8kLy3M22xSaFSTUdqW3dhEIQrR
         L/Kw92Y/DT4DLwghjO5TIcbr+Dh4yAxuKaAE5rq0m28/nxSIIfS42NK8tIIBaPuO3yDd
         agSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6A5BhTI29zIvXWvcPgzOQ7MwB1c65Ylqr5S89UZVcoY=;
        b=Q1PlpmmVflOK2A0jHjBX+PDtiJZzprQEZajsk7JUsAb42sM7fqvVB40lblFj1a7tNz
         Wvimb2xdRXXYYY7HHiE4OQkF4sfgia2lWY5ylqAaUE3Lg1tbU2zbu2NlamFVHHpbFdsk
         J4C6zeC64wW45pC/PbEBpfMkcPxEzyQXzazf+LdoEOQClu0rb5CNqfhTWJ2z2ijtixk7
         oNmC0YwNHFCRrPdqTS0TXN8BZb6ywQr8gTeH6uBCQCSkNG7zqQyT2RmJthH1yoIRNaj0
         TS0tz/GAYQZ9GTh9sLIkCU7UhcoQ6kECBpO+lkkD317fouFnoGK2p/BkuHk8hMaiErqu
         MeNg==
X-Gm-Message-State: ACrzQf2Ikv4x2hc3CEBMDZxorbFaPXzu0DlXQQtauyaO8rTXTyjfZICZ
	eZ6sB0fhQHI6253eVsNjigQMTF57SoHbNun0
X-Google-Smtp-Source: AMsMyM48yUIVUAakAuiZbtTXwiCGyIwdMa+xd6Lg3Vpk6suot0ewPqDIxQkJUNpUxGcdTRtng7Y09w==
X-Received: by 2002:a17:903:11c7:b0:178:af17:e93e with SMTP id q7-20020a17090311c700b00178af17e93emr32925279plh.78.1667530916000;
        Thu, 03 Nov 2022 20:01:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id r7-20020a17090a454700b0020b7de675a4sm667902pjm.41.2022.11.03.20.01.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 20:01:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/31] u-boot: Remove duplicate inherit of cml1
Date: Thu,  3 Nov 2022 17:00:54 -1000
Message-Id: <ac8a7a94315dda8bf4cb0c9a1ebf846414d02074.1667530733.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667530733.git.steve@sakoman.com>
References: <cover.1667530733.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 03:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172680

From: Alex Kiernan <alex.kiernan@gmail.com>

Splitting u-boot-configure.inc out of the base left duplicate
cml1.bbclass in the base include.

Fixes: fc9a17ad386c ("u-boot: Split do_configure logic into separate file")
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 286f91f7659307bcdf0ba541b8d6b56db5604ceb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/u-boot/u-boot.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
index f022aed732..b2f33e3826 100644
--- a/meta/recipes-bsp/u-boot/u-boot.inc
+++ b/meta/recipes-bsp/u-boot/u-boot.inc
@@ -5,7 +5,7 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS += "${@bb.utils.contains('UBOOT_ENV_SUFFIX', 'scr', 'u-boot-mkimage-native', '', d)}"
 
-inherit uboot-config uboot-extlinux-config uboot-sign deploy cml1 python3native kernel-arch
+inherit uboot-config uboot-extlinux-config uboot-sign deploy python3native kernel-arch
 
 DEPENDS += "swig-native"
 
-- 
2.25.1


