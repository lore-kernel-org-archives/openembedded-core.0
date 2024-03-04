Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B6BC54E55
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 15:23:50 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.101650.1709565823164810065
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Mar 2024 07:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zMC6OoPA;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1dc9222b337so45638995ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 07:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1709565822; x=1710170622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCbQI+0sJTwEKIp5D6XH4wePKiTJ2uj1JhHOLp+3OU4=;
        b=zMC6OoPAjbwusAmD2dU1B880BQN5UnACTwxUlSG0RFH/kr5a3aSZlw1uqhJuQ4a6Pw
         e7bl1gWMttK7j1hikzos6aZSPVMuG5XpMu6Mt+rOWidM8ZumQdyVJNt577d2G09YLBjD
         88NUN7pR4f+uIzpdUm/uKd6/g0eRbOTgCcPSO3ccInOCxrWKvRW/Pb8VDh+ZBMoKX1g/
         WKJXRtHJtSOi9oMBHjrXNI+kqfA1KHzxnBreg4AEs0xnVCgM06x6+qYfESCPQaet4XYv
         qAQ/Cw82PlJ4JKedMFqWJU8UUHgQHK7Jny37KBFkMTOXDhpqTEB4O/TD74tUgngHiKLT
         oyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709565822; x=1710170622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PCbQI+0sJTwEKIp5D6XH4wePKiTJ2uj1JhHOLp+3OU4=;
        b=R0kEM61kBPHFIkr/wciVznMvLtS32sDfIH2VW67Z/t8dMIcddMc+n4GPMFut17Pwcn
         YKKP2fqqaAGNo2xy16G+s/Fw2MPJ1LR6mQ/Kt2IAKFUTiJ5Jaaq4WD8zvK814DMlK1/D
         fm51e+/aHtaYZTp8HSikMf7/6iFEwA1wg3VOR81j67cBuMEQCN1hyYmWaPYUp3+FsD8j
         ndW80HlWX3kLE10J4dfOaIteypXC+ok2vjVzyvTiZtqEt0fPwCrxp0Yuiau7nrek16yD
         xL2Tixp03A7D/YkXXfDppslDvz05XokJX6aL1EYCtPyZjZYk8W3YVsMc8w1d8OzWj7/z
         JRRg==
X-Gm-Message-State: AOJu0Yx01/8jInclH43Gr6ueBZ/XZKaBfxoqrpcQZMFfr3Us+stjIek3
	S8ZfZeuwNnRH40ritqd/XoiYKKofW0G2R74JeVT+CyjDtMQbeNR2B8rfIRrCCq+tVP1OSwB0/8E
	o52M=
X-Google-Smtp-Source: AGHT+IG37WUOJWg4f+q4lwUeX37zV3g1JwlLiOob2Nk8MFvMXv3ztOxjVEvNecCB7D0IEAEaSe7HaQ==
X-Received: by 2002:a17:90a:f68e:b0:29b:4b7e:a016 with SMTP id cl14-20020a17090af68e00b0029b4b7ea016mr2660717pjb.8.1709565822472;
        Mon, 04 Mar 2024 07:23:42 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 1-20020a17090a0f0100b0029981c0d5c5sm8898968pjy.19.2024.03.04.07.23.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 07:23:42 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/11] linux-firmware: upgrade 20231030 -> 20231211
Date: Mon,  4 Mar 2024 05:23:14 -1000
Message-Id: <122be5a683affb3044b8e8d605a4bfcc79c6b4c7.1709565668.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709565668.git.steve@sakoman.com>
References: <cover.1709565668.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 15:23:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196607

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0caafdbbf4e7dc84b919afe14f7cb8c46a9e4ac2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...nux-firmware_20231030.bb => linux-firmware_20231211.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20231030.bb => linux-firmware_20231211.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
index a42e5ed825..48e83cb34b 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
@@ -147,7 +147,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "ceb5248746d24d165b603e71b288cf75"
+WHENCE_CHKSUM  = "3113c4ea08e5171555f3bf49eceb5b07"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -231,7 +231,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "c98d200fc4a3120de1a594713ce34e135819dff23e883a4ed387863ba25679c7"
+SRC_URI[sha256sum] = "96af7e4b5eabd37869cdb3dcbb7ab36911106d39b76e799fa1caab16a9dbe8bb"
 
 inherit allarch
 
@@ -242,7 +242,8 @@ do_compile() {
 }
 
 do_install() {
-        oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' install
+        # install-nodedup avoids rdfind dependency
+        oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' install-nodedup
         cp GPL-2 LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware/
 }
 
-- 
2.34.1


