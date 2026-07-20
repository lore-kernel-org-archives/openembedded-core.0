Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF68C4452E
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:23:58 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2908.1784568231997676613
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=n9prhUw7;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49546c690ffso27068745e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784568230; x=1785173030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LcjM3QIGZ88azbBEvxRrNQ6CF+nlAFxsDxani6ZKRC0=;
        b=n9prhUw7FGrbflSRbz4Avye4TwAa+tpV4eacQmr/jrcNr+7fx97kjCjJdqqw8GV7dL
         t/3SP5CduJs4AQxondaErwoSxMaLVRegPWF6s4wahyyy9G8n/MG3e3YF3bdWIVvMzQCs
         3uWWtI+d7JVSeW+CW1wug02H41FB/3cdgaDPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568230; x=1785173030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LcjM3QIGZ88azbBEvxRrNQ6CF+nlAFxsDxani6ZKRC0=;
        b=clf3E7iKTUGUyi4ebIlt5KJH+i4GwTGbKTMhxeKcaHdllun6RlEo+kKrOqetlAbe4i
         QmRI5Q8kIl72OvJZpBGVbgbo+/bJNWLhEcj70bnOO/tk9jza605hnOb/Yr+/Z6e8BMMe
         aA8WZm/xyv4j90mtdcNS3lH8NTojc/52g6Grdgjh4bT4sg6Lv+miXGJMSxx8Xb4/yuj1
         Omrz5JdCYXq6YquvtwLQA0TxaA+lch9TGps0lSqxYTgRsBiGra8RC7DELvonUHUKTgmI
         mF3FiTBaM49LghtWCEEpKfrALFUf6R1bYfuHd76ULFe+K5NtrEl7ACU1upg6R3NUU3VC
         Hgmg==
X-Gm-Message-State: AOJu0YwVHlfG06BriYf1iG1bJPTB7CvRzaoy6lyqj/WpMBmGhqmnHaXC
	AO//s4wip9ebF8SSbtBiJAobHIaoHVOclG6yBwb0xbG3NWTnhwDcqVssmtgjOgLgtlF8WBw+zlk
	/iX6z7jk=
X-Gm-Gg: AfdE7cmI9Xzz9FxVh88fbLSKGdyFrJMMCJ6wAnLRTJaw2wkcBZ3ch1e4KTbsJCckuOn
	w6FmMamRgaDNerdV//djTYA0BrGhNVqHIy0dk6DZQlUQmEG3C4sbj1kiDNSTSJgIN1FnPUO3L1c
	DEJT1HNgxSg3J8bu3hWYkixqrO8w4G+2iIASvbCCJBYrdFaMTohLEx4vM86poxXljQVquIyY/Hn
	ByduZseeuoT2ubl3sG03wjFknAarKHXDZ05GZxXPBY+Kga6u0t5Au5DLQb27MLr/yRbi3IpFOwP
	HEOUWVxhS5aVCBqyWAKmT75CgXBWFR99dNCFN63SeVkO+Ss3uP+6EykDtHURP/VcT0DSymUJF7U
	AkyDsQaQ+jsYPUvIrhIjGkKEqo1X2CeoH9LtxKgrFaW5DLW4gRIR/yMWq3/18zfYh1IQkGnI5zq
	1fOlBoF+/1P/opgKR7QoYnur+wMuv93ZPepoTkoNgtFxHPBPiA+mCeWc2X07wpOzfsNkYz591qK
	HGm3jv5TGMGVl2TtmY=
X-Received: by 2002:a05:600c:4743:b0:495:406c:81d5 with SMTP id 5b1f17b1804b1-4954a50b8b8mr177036935e9.28.1784568230182;
        Mon, 20 Jul 2026 10:23:50 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-b501-5b7b-2580-caa3-ecc1-dea5.rev.sfr.net. [2a02:8440:b501:5b7b:2580:caa3:ecc1:dea5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49563eee22esm36508575e9.1.2026.07.20.10.23.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:23:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 31/33] ca-certificates: upgrade 20260223 -> 20260601
Date: Mon, 20 Jul 2026 19:23:04 +0200
Message-ID: <eaa867538c65bbc68596248d3a36d412308f6a28.1784567958.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784567958.git.yoann.congal@smile.fr>
References: <cover.1784567958.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 17:23:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241465

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: ca-certificates-local example removed[1]

[1] https://salsa.debian.org/debian/ca-certificates/-/commit/0ba2e089daf128206b0a13423ceede612bb60270

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 366cfc1103661f98020d7b7c8d249f2b7f9432af)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
[YC: Changelog:
https://metadata.ftp-master.debian.org/changelogs/main/c/ca-certificates/ca-certificates_20260601_changelog
]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...a-certificates_20260223.bb => ca-certificates_20260601.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/ca-certificates/{ca-certificates_20260223.bb => ca-certificates_20260601.bb} (94%)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb b/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
similarity index 94%
rename from meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
rename to meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
index 9cf6d5afc7d..b23f20a7828 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20260223.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20260601.bb
@@ -5,7 +5,7 @@ This derived from Debian's CA Certificates."
 HOMEPAGE = "http://packages.debian.org/sid/ca-certificates"
 SECTION = "misc"
 LICENSE = "GPL-2.0-or-later & MPL-2.0"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=ae5b36b514e3f12ce1aa8e2ee67f3d7e"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=dab7c7cea776d1a1648deb0052c72647"
 
 # This is needed to ensure we can run the postinst at image creation time
 DEPENDS = ""
@@ -14,7 +14,7 @@ DEPENDS:class-nativesdk = "openssl-native"
 # Need rehash from openssl and run-parts from debianutils
 PACKAGE_WRITE_DEPS += "openssl-native debianutils-native"
 
-SRC_URI[sha256sum] = "2fa2b00d4360f0d14ec51640ae8aea9e563956b95ea786e3c3c01c4eead42b56"
+SRC_URI[sha256sum] = "7ab6301f7f34eef90a4d278647c260bc0762e0e14561f4649854cf4b0d4bea21"
 SRC_URI = "${DEBIAN_MIRROR}/main/c/ca-certificates/${BPN}_${PV}.tar.xz \
            file://0001-update-ca-certificates-don-t-use-Debianisms-in-run-p.patch \
            file://0003-update-ca-certificates-use-relative-symlinks-from-ET.patch \

