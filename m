Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B47BC2BB9A
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 12:05:55 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.55028.1718625948313535380
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 05:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=034FwAZo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70601bcfddcso756649b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 05:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1718625947; x=1719230747; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HsO2HrPMav64sypImiinY7KQuBcmf8Uk7DzqdqzJ/Zg=;
        b=034FwAZoGhrz1NeHmJMPFOU40YPetuG0vF4yLSV+to9ViiyJira9gmXGnF4Sb8sK1o
         lnrJdjln6dlwdUzjAHt8Wcdp/KbCq/jZXm2t+YL5/fOMAFOmnN2YW57sMhV6MW0w+CXn
         XStQzNjyQJ4uUBm46H4rE9OZ8S+22KlLlOIdnB8aRtz400croF+SkcY+8ccd1WhWdzua
         /h0x4+ukqEDZAjoU0WkChYGkojmp9IeT8D9TqcgmRZyCTuWKlGlNVmHZakfpGmcPHf5S
         qy87SK3dPWW9x+fcb9cNek3+VLiJ92JYrwdgfYUqdPuj1pFFjN0QbuMsHg4pGx1vdYcp
         cg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718625947; x=1719230747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HsO2HrPMav64sypImiinY7KQuBcmf8Uk7DzqdqzJ/Zg=;
        b=K6Tdg1D6b/dpDzuRxpDc3naB3GMsy2xrlP7SuzQp9kICfkxYgbgxVaJLYfneqqNB8G
         CTxroGxT+TxGTbUNXtefB2XwgmQ/KpFta+guG+sWxY5W4mdBLfQaS2niAVgPIvQcqx/k
         6QHHb9cRlPvxn+PfAnZADhxdqjNR/59ToDAD3+iEfNvJ+JTdsTyHCRUDiQnMGTff+jiS
         Y1hVuzInpI8Rl9sxvhMqTwGwnDt8mHq4hL//c5rSgQE2nYcNNy1MXe7ZkT19SUtBiam+
         D/9gZ9JN3EloHQjcO+EkMb7LfMgPrdHxz+LtIqGgWRpBjStguHaAbixUq0wU+MJA07an
         +z+g==
X-Gm-Message-State: AOJu0YwXYfqF1RRS1cwFIvOBJIPVKwLnKlvtyDu5rbu/OjHlZ+xvLNVf
	2SPmjW6K2DavDYZMBO6XSn8/D3BTxRmJsya38NKGPQmMtmwiAS9wwZ5vn2KM+pK3W9xX/sAIOfM
	MS2c=
X-Google-Smtp-Source: AGHT+IGHBWKoxwAqGTFD9SqPj8Vmp4HM4fRp+69ngnl1g5JGRRpeWkDbh+FOeSCBqc4dCccQk4GXTg==
X-Received: by 2002:a05:6a00:1e0e:b0:705:a7a6:6d11 with SMTP id d2e1a72fcca58-705d71e1cc6mr9520577b3a.24.1718625947572;
        Mon, 17 Jun 2024 05:05:47 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc925fe7sm7482348b3a.19.2024.06.17.05.05.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 05:05:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/22] lrzsz connman-gnome libfm: ignore various issues fatal with gcc-14
Date: Mon, 17 Jun 2024 05:04:52 -0700
Message-Id: <924dc9bd3b1b21a60ebb117b0abf81d2650aedd0.1718625680.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718625680.git.steve@sakoman.com>
References: <cover.1718625680.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 12:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200825

From: Martin Jansa <martin.jansa@gmail.com>

work arounds for:
oe-core/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb:do_compile
oe-core/meta/recipes-connectivity/connman/connman-gnome_0.7.bb:do_compile
oe-core/meta/recipes-support/libfm/libfm_1.3.2.bb:do_compile

http://errors.yoctoproject.org/Errors/Build/183127/

More fixes on ML (especially for -native with gcc-14 on host)
cdrtools: https://lists.openembedded.org/g/openembedded-core/message/198899
syslinux: https://lists.openembedded.org/g/openembedded-core/message/198901

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 856ffc7d0893c1dc549baf401899947f70d31896)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb                | 6 ++++++
 meta/recipes-connectivity/connman/connman-gnome_0.7.bb | 4 ++++
 meta/recipes-support/libfm/libfm_1.3.2.bb              | 4 ++++
 3 files changed, 14 insertions(+)

diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 63edcbd864..3024ddcaf0 100644
--- a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
+++ b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
@@ -46,3 +46,9 @@ ALTERNATIVE_TARGET[rb] = "${bindir}/lrz"
 ALTERNATIVE_TARGET[sz] = "${bindir}/lsz"
 ALTERNATIVE_TARGET[sx] = "${bindir}/lsz"
 ALTERNATIVE_TARGET[sb] = "${bindir}/lsz"
+
+# http://errors.yoctoproject.org/Errors/Details/766929/
+# lrzsz-0.12.20/src/tcp.c:75:56: error: passing argument 3 of 'getsockname' from incompatible pointer type [-Wincompatible-pointer-types]
+# lrzsz-0.12.20/src/tcp.c:83:52: error: passing argument 3 of 'getsockname' from incompatible pointer type [-Wincompatible-pointer-types]
+# lrzsz-0.12.20/src/tcp.c:103:51: error: passing argument 3 of 'accept' from incompatible pointer type [-Wincompatible-pointer-types]
+CFLAGS += "-Wno-error=incompatible-pointer-types"
diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index fcd154b4b0..8875cdc02c 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -28,3 +28,7 @@ RDEPENDS:${PN} = "connman"
 do_install:append() {
     install -m 0644 ${WORKDIR}/images/* ${D}/usr/share/icons/hicolor/22x22/apps/
 }
+
+# http://errors.yoctoproject.org/Errors/Details/766926/
+# connman-client.c:200:15: error: assignment to 'GtkTreeModel *' {aka 'struct _GtkTreeModel *'} from incompatible pointer type 'GtkTreeStore *' {aka 'struct _GtkTreeStore *'} [-Wincompatible-pointer-types]
+CFLAGS += "-Wno-error=incompatible-pointer-types"
diff --git a/meta/recipes-support/libfm/libfm_1.3.2.bb b/meta/recipes-support/libfm/libfm_1.3.2.bb
index 057c737029..1d7609165b 100644
--- a/meta/recipes-support/libfm/libfm_1.3.2.bb
+++ b/meta/recipes-support/libfm/libfm_1.3.2.bb
@@ -53,3 +53,7 @@ do_install:append () {
     rm -f ${D}${libdir}/libfm-extra.a
     rm -f ${D}${libdir}/libfm-extra.la
 }
+
+# http://errors.yoctoproject.org/Errors/Details/766924/
+# libfm-1.3.2/src/actions/action.c:2050:25: error: assignment to 'gchar **' {aka 'char **'} from incompatible pointer type 'const gchar * const*' {aka 'const char * const*'} [-Wincompatible-pointer-types]
+CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.34.1


