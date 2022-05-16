Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A38C4332F
	for <webhook@archiver.kernel.org>; Mon, 16 May 2022 19:49:32 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.957.1652730567110149245
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 12:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=duK3qir3;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id s3so4558571edr.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 16 May 2022 12:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Kog/RupLHUi4gVzHdls/wU9LQOQ4JD3vL5IHm1Ec0+4=;
        b=duK3qir3o2YkmP6mmybtIF1OZqBA1i4j7+LyY3zQx5NXSoYricz+/oRYAX2/l5EfAX
         uo39F5Njwe4XqPLtUTHpsen+PYUlFqdeRSdecn5Hq/aMxvohV8Gq6/RusbgDx082iXHN
         hWD7jsiXD4FLxDg/RNcJ0t4vxVru4qO5JvWCWSt4yrjFWCMmpz0bmp7BwwQWzYvdiOk7
         2HVKTmhX74BZvNcbsQn41HHjNZXatq8N/UiXLL5i4xeuw7V67WzgFlJXrh2CD2Ppk4I/
         f+t8n8v51AYSH3x+1DLc1QAEiyFtsJ2jOw89WfxrpzP+kvoIp04XlzgZmc8oGReRVP3Y
         8/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Kog/RupLHUi4gVzHdls/wU9LQOQ4JD3vL5IHm1Ec0+4=;
        b=JLxeGMSudYFVCwZ6e/RCNhz1v6oJb+dTFbCVDdtfUVl5E5lAcfV/QYsjLLDapB7Gzq
         plDTnsLrZDxC/JQ0I5aASxSDmQ+u5m0LkY78mujmbEQ1MNBG6uA8ZdvIv6pYWJo86Hts
         MzEcW2q1qtybb4ydorrJLMjIdOyX5LKXLzzbpXDkhzNhV0STUOv3rD1qlDxGRBFGX1fO
         C6hRgd7IA7B7mm9nJxHiyBnvn5N45STCF6NFRbvpXvdgigLvOGJcnTSPEg571gze4VdQ
         AsUR32oIo6vJUgSe7MaiZp5ChWtcc3PuHeZC/02x6cJylJKFOexAo/w0H0DX97o9vYIH
         H7OA==
X-Gm-Message-State: AOAM530dFe81P6mAZI9X9F/z15xUf7J9mJt4KmDnTOWEJJf8rGHgK6PH
	QREg0snkxSF5Lu9hbfzhXtjaxHKTmhU=
X-Google-Smtp-Source: 
 ABdhPJyIy2qYalvMzq+HxqNQlSEeIYYeaVQUwWNeo2I3GNFZRQzcT7DcvbAaHw3sJtVSzDYHsn2aEQ==
X-Received: by 2002:a05:6402:3452:b0:42a:6266:3f16 with SMTP id
 l18-20020a056402345200b0042a62663f16mr14884356edc.419.1652730565462;
        Mon, 16 May 2022 12:49:25 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 o23-20020aa7dd57000000b0042abfe32ac8sm533125edw.30.2022.05.16.12.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 12:49:25 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alexk@zuma.ai>
Subject: [OE-Core][PATCH 2/3] eudev: Cleanup redundant configuration
Date: Mon, 16 May 2022 20:49:14 +0100
Message-Id: <20220516194915.29231-2-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220516194915.29231-1-alex.kiernan@gmail.com>
References: <20220516194915.29231-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 May 2022 19:49:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165696

hid2hci moved to bluez4 in 2011. The FILES changes for ${PN} and
${PN}-dev only added existing defaults into the set.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alex Kiernan <alexk@zuma.ai>
---
 meta/recipes-core/udev/eudev_3.2.11.bb | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/meta/recipes-core/udev/eudev_3.2.11.bb b/meta/recipes-core/udev/eudev_3.2.11.bb
index 0fd1b6ab2283..fc17e119bc68 100644
--- a/meta/recipes-core/udev/eudev_3.2.11.bb
+++ b/meta/recipes-core/udev/eudev_3.2.11.bb
@@ -50,9 +50,6 @@ do_install:append() {
 
 	# Use classic network interface naming scheme
 	touch ${D}${sysconfdir}/udev/rules.d/80-net-name-slot.rules
-
-	# hid2hci has moved to bluez4. removed in udev as of version 169
-	rm -f ${D}${base_libdir}/udev/hid2hci
 }
 
 do_install:prepend:class-target () {
@@ -67,11 +64,7 @@ INITSCRIPT_PARAMS = "start 04 S ."
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


