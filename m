Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBAD8C433F5
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 10:20:54 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web08.26430.1643278853504289929
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kl1IX23T;
 spf=pass (domain: gmail.com, ip: 209.85.128.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so1554424wme.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YIIulm6m/OmCKHg70czj0k7hZQrziEasU7hv40/uOng=;
        b=kl1IX23TK3bhB6VfagplDsc0sxajrudQbecKIZldSiEFh+qbUXKk9kCJsr2o/IKbHm
         Q+exYHU6UYJGcCzwTPiJ8ZKkA5DJcqyNZjFHE0SS540iRc/rcCJM18GSiZDybSqxGcj3
         bGi5QDpCiurCK2+kJSL5SQYpRvtTb73roumj0UPEIVLwHgSntx+ebDCG909l1WuXgb7N
         6SI6nuFZe3LiIXObkWX+6QpHqTe+G5t0nZK3BHA8ntsOSf9b2BaOIQ+3v0chzMuOxhmn
         yhlGXqlhIlGHN6gDOHqDuYM85EguyDeuJOAlLrfDcQRdWPGS+T/pyStMxpm/Lx2dKcaZ
         Sr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YIIulm6m/OmCKHg70czj0k7hZQrziEasU7hv40/uOng=;
        b=EKLZb0mdKW1Vr+QY3zkcmJ7MSX0tOHob6aGNqqGJeEHloLb3bcNaWqvK+SgV2UiK4L
         exGIYXixLLGOwGtVbWHlo9GjVD1G185Jh8iBbbxuyJLUygepQmNxcsseaTDzg9DtYUFv
         YmhNvO74QJDOzVCVlHG0omp4Cx+5phDXmZ9FVQDP5V0Wuxlhz9gcT21FDZe9ifw2n2dy
         wNDg+m9eMdkyUwP4vNADAoTvINJYVawrr9mDG811OIKuox+fUznfvXvLzFE9RjrQv5jo
         JqsyAGXrYEMnjJKSLUMQWELRQ1lFMsS/gT3VeiagEDme4Q343ANC4NMte1l3bzcPYXmy
         2DvA==
X-Gm-Message-State: AOAM530Ok2WtWF8kQ1rE/qg+5ac/gIHcmp2eeoTxVpWIx0xRQWu8kxgB
	QkvavK3JgruHyT6ugJRk9/bK7lTObgk=
X-Google-Smtp-Source: 
 ABdhPJzuWEPHQVS9S6ukgSxYPsd0KhFsxL/QwdCk5bVKJKkQ2HAxRJ2lVTz4KN9ca3dUxh4VYIQWFg==
X-Received: by 2002:a7b:c458:: with SMTP id
 l24mr11255232wmi.108.1643278852090;
        Thu, 27 Jan 2022 02:20:52 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t14sm4060849wmq.43.2022.01.27.02.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 02:20:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/17] libusb1: correct SRC_URI
Date: Thu, 27 Jan 2022 11:20:04 +0100
Message-Id: <20220127102005.3050843-16-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127102005.3050843-1-alex@linutronix.de>
References: <20220127102005.3050843-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 10:20:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161038

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/libusb/libusb1_1.0.24.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.24.bb b/meta/recipes-support/libusb/libusb1_1.0.24.bb
index 95a20958a1..e70021f4f7 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.24.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.24.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Userspace library to access USB (version 1.0)"
 DESCRIPTION = "A cross-platform library to access USB devices from Linux, \
 macOS, Windows, OpenBSD/NetBSD, Haiku and Solaris userspace."
-HOMEPAGE = "http://libusb.sf.net"
+HOMEPAGE = "https://libusb.info"
 BUGTRACKER = "http://www.libusb.org/report"
 SECTION = "libs"
 
@@ -10,10 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
+SRC_URI = "https://github.com/libusb/libusb/releases/download/v${PV}/libusb-${PV}.tar.bz2 \
            file://run-ptest \
           "
 
+UPSTREAM_CHECK_URI = "https://github.com/libusb/libusb/releases"
+
 SRC_URI[sha256sum] = "7efd2685f7b327326dcfb85cee426d9b871fd70e22caa15bb68d595ce2a2b12a"
 
 S = "${WORKDIR}/libusb-${PV}"
-- 
2.20.1


