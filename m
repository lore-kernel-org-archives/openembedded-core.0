Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1886FCD11DC
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 16:44:44 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.50335.1710953077145969709
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 09:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eMiTrPSs;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6e6ce174d45so86503b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 09:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1710953076; x=1711557876; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4UnhWF5evodL7r/gzaqNfcyJI5Q++dVnHvjhgTug5s=;
        b=eMiTrPSs+8Eu3uHbR828l+CyAKEO2TuCDK8+ybEeigY/0HMcAuRYHt7Om8HoYvRm3w
         KHJc5FrWcrUzHoSFvqr3OG5z1Zue3ORm3K29k8qIf8B9evTlGKlo6dAuYtnbK2ClXdjc
         F+mqLnDYelZqpVYQ9TFobOrNR074HDxpipZMv+a6R7jZRl+yn/jU8Dr/JqUK4rQqs4ls
         37bv2lXZswbL2Q7QHjQqIYxzfUN94ork3tVCevIIm2KsIwgBlpo+8BoKaQyywAd+rYRN
         ysvymb7H2upAAHOopJiOWwqPGXBDYodajlHvllRQBOPsa52NxBN2I47RkYAv8CM3gJAm
         QVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710953076; x=1711557876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r4UnhWF5evodL7r/gzaqNfcyJI5Q++dVnHvjhgTug5s=;
        b=pBLoF40ZL02yzRnHYpv0ZWrxxvAnESsuqsXZVs7gxcCruenPO6vEMkVvZ27FK0iOB5
         6rs04leVL5rR4Jt4g7/Su9W3b6cJBm2Qn2kk/r32l6aFQP30XqKsgzUsgmSrHfbOSsR0
         e9LWsjKIGxl0YmWtxMkZyA9F8z0Ch7+4NXo9OxNQ2hKnYhFGl2SUWTqqLYw0Z8LSCmPU
         B7Zh2mrMxIU/IS8pGrDtvxMsY3JtNyX3qtO4a2yMLdIjz9Jn9O+SI/Qs8z4gx81Hysh6
         3h1PVQ3aTSQmObgVZccStSpnSLqxmv5EiQ7fOdkngFV8Sh0LIJu9AFrFMSr/Dl1MhoAp
         t2NQ==
X-Gm-Message-State: AOJu0YxOR9ahOkxH6YYKmlpAhP3hb+kPqE+ZidM2z131Lt8xyGnJHleH
	5JD7MNYuNVICJv5pWEYIk/SDSJIKZotLkeSzFPhQQcMA4eXvscasScUuOd7A8P6uTD5I5Qoh4mP
	XjIM=
X-Google-Smtp-Source: AGHT+IEuu5gAvUf66IbdBufC8mWBDZZwWkyy/dRikLjKF8Pr5PRhNzH2XgNXOm1Rrfdnk5mygCIsXQ==
X-Received: by 2002:a05:6a00:13a0:b0:6e7:9a5e:3b45 with SMTP id t32-20020a056a0013a000b006e79a5e3b45mr2758388pfg.11.1710953076403;
        Wed, 20 Mar 2024 09:44:36 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id a3-20020a62d403000000b006e6bfff6085sm12725437pfh.143.2024.03.20.09.44.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 09:44:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/12] linux-firmware: upgrade 20231030 -> 20231211
Date: Wed, 20 Mar 2024 06:44:04 -1000
Message-Id: <894cfb61103e09b6bf0467a6b96765e774ca985b.1710952928.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710952928.git.steve@sakoman.com>
References: <cover.1710952928.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 16:44:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197397

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
index 65cbca798e..3f201d853f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231030.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
@@ -134,7 +134,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "ceb5248746d24d165b603e71b288cf75"
+WHENCE_CHKSUM  = "3113c4ea08e5171555f3bf49eceb5b07"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -212,7 +212,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "c98d200fc4a3120de1a594713ce34e135819dff23e883a4ed387863ba25679c7"
+SRC_URI[sha256sum] = "96af7e4b5eabd37869cdb3dcbb7ab36911106d39b76e799fa1caab16a9dbe8bb"
 
 inherit allarch
 
@@ -223,7 +223,8 @@ do_compile() {
 }
 
 do_install() {
-        oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' install
+        # install-nodedup avoids rdfind dependency
+        oe_runmake 'DESTDIR=${D}' 'FIRMWAREDIR=${nonarch_base_libdir}/firmware' install-nodedup
         cp GPL-2 LICEN[CS]E.* WHENCE ${D}${nonarch_base_libdir}/firmware/
 }
 
-- 
2.34.1


