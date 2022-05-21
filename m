Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A2DC433EF
	for <webhook@archiver.kernel.org>; Sat, 21 May 2022 08:25:29 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web09.3635.1653121528312531955
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 May 2022 01:25:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Lds+drAI;
 spf=pass (domain: gmail.com, ip: 209.85.208.41,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id h11so12076490eda.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 21 May 2022 01:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YrmOcrxkpfOzL88EyoqXT7ypJbL2Ai6Bf5+l7BX8ZSA=;
        b=Lds+drAIK1qgJ/9p0EhJ93H+QKNvIwxHzsPlr0dQ208KE86nTcLAqiEAhGVDtW+0OM
         giPwuXu0AVsSH6L+bRIheMdtmzWxTrowRYzQehC7XyF4GDexT6wstwr7HLkdp1yqY45y
         hWYk53nt+Athr3isRKmuhKmXZqBWxiYLpHjaZ+HXs3UdtmKZ2QYIvtqK5m5hOthsxGXP
         jpjhegeqyFxFDe/oXXx7lztHFeSr0wKSrtvFtT4Ucvc1pdzhDVNxfq+bFmlAiDrhj/lR
         FisIpJm/KoJuzG3t3tsEz+7Uoo2aubyifQadyKZ85EGuuyUYEZdY4a2SVl1TO5nIkn5h
         aXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YrmOcrxkpfOzL88EyoqXT7ypJbL2Ai6Bf5+l7BX8ZSA=;
        b=VCE7rcPBKiijxNOXoeadHNVXUyeD5HSW2+9ceLpwN2DLBQGuUZyUQiMwVrAV3ciOBl
         xnfwIH18VW/FzoFx7g9IjUwvFzc/gXY1tY6y/lOph7Ze9o3wLdK4h0AobqIhhNwCF1nO
         zq0J/EMIh7DSN83R8iso/qlpIMApox3EGC8L4CrTrIuZID7jklDBkGEjoNp6upi1M0dJ
         zUnLJqs3ngIuMmkueiFZF94aFTWzBcQ25x7vDyR0NMf4ylqunKoLrP0ig+cOM07x+haq
         KyLI2TRDhSURbczaTYzb3lM1RVm6/6o6N5EaDpkQ4vv6gEdepZbyObE08WOpOei5EFtA
         IbDA==
X-Gm-Message-State: AOAM532waVrwQ4UKVFDVjWJGTY1WxECOhk8O22gL5CDt1B2xrE5zlBfp
	vwGZnxpU3GemNMJAR+W5UABJLBgV/ic=
X-Google-Smtp-Source: 
 ABdhPJyq5S1Z6egCEvMwfOceARvWL+t2SajLZZdee5TA2oAiUXwLYaMhYftPpx6BoWI961n6MSGBIw==
X-Received: by 2002:aa7:cacb:0:b0:428:b435:dc43 with SMTP id
 l11-20020aa7cacb000000b00428b435dc43mr14398733edt.123.1653121526664;
        Sat, 21 May 2022 01:25:26 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 v21-20020a17090651d500b006f3ef214e2asm4101438ejk.144.2022.05.21.01.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 01:25:26 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alexk@zuma.ai>
Subject: [OE-Core][PATCH v4 2/3] eudev: Cleanup redundant configuration
Date: Sat, 21 May 2022 09:25:19 +0100
Message-Id: <20220521082520.5473-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521082520.5473-1-alex.kiernan@gmail.com>
References: <20220521082520.5473-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 May 2022 08:25:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165957

hid2hci moved to bluez4 in 2011. The FILES changes for ${PN} and
${PN}-dev only added existing defaults into the set.

Signed-off-by: Alex Kiernan <alexk@zuma.ai>
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta/recipes-core/udev/eudev_3.2.11.bb | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/udev/eudev_3.2.11.bb
index 7e34d5b4758c..7f190e7323bc 100644
--- a/meta/recipes-core/udev/eudev_3.2.11.bb
+++ b/meta/recipes-core/udev/eudev_3.2.11.bb
@@ -52,9 +52,6 @@ do_install:append() {
 
 	# Use classic network interface naming scheme
 	touch ${D}${sysconfdir}/udev/rules.d/80-net-name-slot.rules
-
-	# hid2hci has moved to bluez4. removed in udev as of version 169
-	rm -f ${D}${base_libdir}/udev/hid2hci
 }
 
 do_install:prepend:class-target () {
@@ -69,11 +66,7 @@ INITSCRIPT_PARAMS = "start 04 S ."
 PACKAGES =+ "libudev"
 PACKAGES =+ "eudev-hwdb"
 
-FILES:${PN} += "${libexecdir} ${nonarch_base_libdir}/udev ${bindir}/udevadm"
-FILES:${PN}-dev = "${datadir}/pkgconfig/udev.pc \
-                   ${includedir}/libudev.h ${libdir}/libudev.so \
-                   ${includedir}/udev.h ${libdir}/libudev.la \
-                   ${libdir}/libudev.a ${libdir}/pkgconfig/libudev.pc"
+FILES:${PN} += "${nonarch_base_libdir}/udev"
 FILES:libudev = "${base_libdir}/libudev.so.*"
 FILES:eudev-hwdb = "${sysconfdir}/udev/hwdb.d"
 
-- 
2.35.1


