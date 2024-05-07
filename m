Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FFC5C25B78
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 05:33:33 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.4768.1715060007054020370
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 22:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SjA7Gk6o;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e4bf0b3e06so24096165ad.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 22:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715060006; x=1715664806; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=233KhXWarGVEp8oyyxVIQ0uwa0wmS0OffiUgla3e5/Y=;
        b=SjA7Gk6o3ns871cpQfMUomDZU0oTAYKnX7ewemV5aPYFQmdGn6Wi0DdsXcbhbgJDqW
         R9ubhjsiglfXa1JAdSv3mTHrt07M5BgYDl/+7JO4J31AAj3dAhIEYeeGI0gnJ3yf4j0Y
         TlPd3RdndkzFviY4c7I8kSnP5h4Apl6Akao9G6UYSDq97CGIATPKK3fh8OyKCyeM0/rI
         upI4VvK201U7Edey7ij0PH+p4963zSFOowmalyTeu8VJRFSGRfGdjAcQfxWV0wNn+o3f
         +Qx99fAYhccyX729waccCEqNXMljoBR4+tnrVGfZcKs2GzJKzJOdVmT+iV99k+dg79UL
         cSzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715060006; x=1715664806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=233KhXWarGVEp8oyyxVIQ0uwa0wmS0OffiUgla3e5/Y=;
        b=VySWFublAgBDK/7+YLzdHA0Aj8h0vBzOLp1HHrvQRb3ufAEjjFPZ7Gn0fbIAcbjja0
         EZE3jsWDi68PKBYhZQolr6maNoTAmIBdkyC7ozqNyXrmyUtznvM4BRZ2odMY/m12vZFk
         8oqgy6Ahq2J2sd9NsFnMLHAtKAQs58wpkX3EWfjSXBOtqOuCOgpz3898zJn5ZUNCXWHv
         +sI0CRqSU0BEFjNsKBpP6lBYI47JIR3cfcaixW4IjhyBmJUgSHWuDHyNkgT/9cv/DP/5
         jYMfMj+2xRG9HGdoaAI5ulHpjk3BRTaEiByNiQZ2kK7MSuFiypy6nwS/K7moidFUcf10
         b2lw==
X-Gm-Message-State: AOJu0YzbyzhC12sQozWrudAzw0Mlg23R5s26CPn1TtNd1IPQdnJ9lWVZ
	5DbQbQ36aIo5DF8O6WyuN0nv6WWNzMklxxQRKz4N8A7EREPa+TqrwSmAjFrv
X-Google-Smtp-Source: AGHT+IHgRtTXPmoSFmPU/IEKc4IG6YSL7fd3BGZiAGTGQPj6dxHb9LgfXRRRm1GNlhzovIZIeEQM/w==
X-Received: by 2002:a17:902:d2c6:b0:1eb:b50e:3577 with SMTP id n6-20020a170902d2c600b001ebb50e3577mr15060176plc.56.1715060006229;
        Mon, 06 May 2024 22:33:26 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id i10-20020a170902c94a00b001eb4a71cb58sm9221483pla.114.2024.05.06.22.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 22:33:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 04/11] zip lrzsz connman-gnome libfm: ignore various issues fatal with gcc-14
Date: Mon,  6 May 2024 22:33:15 -0700
Message-ID: <20240507053320.1566814-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507053320.1566814-1-raj.khem@gmail.com>
References: <20240507053320.1566814-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 05:33:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199073

From: Martin Jansa <martin.jansa@gmail.com>

work arounds for:
oe-core/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb:do_compile
oe-core/meta/recipes-connectivity/connman/connman-gnome_0.7.bb:do_compile
oe-core/meta/recipes-support/libfm/libfm_1.3.2.bb:do_compile
oe-core/meta/recipes-extended/zip/zip_3.0.bb:do_compile

http://errors.yoctoproject.org/Errors/Build/183127/

More fixes on ML (especially for -native with gcc-14 on host)
zip: https://lists.openembedded.org/g/openembedded-core/message/198783
cdrtools: https://lists.openembedded.org/g/openembedded-core/message/198899
syslinux: https://lists.openembedded.org/g/openembedded-core/message/198901

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb                | 6 ++++++
 meta/recipes-connectivity/connman/connman-gnome_0.7.bb | 4 ++++
 meta/recipes-extended/zip/zip_3.0.bb                   | 5 +++++
 meta/recipes-support/libfm/libfm_1.3.2.bb              | 4 ++++
 4 files changed, 19 insertions(+)

diff --git a/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb b/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb
index 63edcbd8643..3024ddcaf07 100644
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
index f6150d98ec9..46b3f854c52 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -28,3 +28,7 @@ RDEPENDS:${PN} = "connman"
 do_install:append() {
     install -m 0644 ${UNPACKDIR}/images/* ${D}/usr/share/icons/hicolor/22x22/apps/
 }
+
+# http://errors.yoctoproject.org/Errors/Details/766926/
+# connman-client.c:200:15: error: assignment to 'GtkTreeModel *' {aka 'struct _GtkTreeModel *'} from incompatible pointer type 'GtkTreeStore *' {aka 'struct _GtkTreeStore *'} [-Wincompatible-pointer-types]
+CFLAGS += "-Wno-error=incompatible-pointer-types"
diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extended/zip/zip_3.0.bb
index 70df5ab8728..e7705b8faf4 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -53,3 +53,8 @@ BBCLASSEXTEND = "native"
 
 # exclude version 2.3.2 which triggers a false positive
 UPSTREAM_CHECK_REGEX = "^zip(?P<pver>(?!232).+)\.tgz"
+
+# http://errors.yoctoproject.org/Errors/Details/766953/
+# unix/unix.c:84:51: error: passing argument 4 of 'fread' from incompatible pointer type [-Wincompatible-pointer-types]
+CFLAGS += "-Wno-error=incompatible-pointer-types"
+# proper fix on ML: https://lists.openembedded.org/g/openembedded-core/message/198783
diff --git a/meta/recipes-support/libfm/libfm_1.3.2.bb b/meta/recipes-support/libfm/libfm_1.3.2.bb
index 057c7370293..1d7609165b4 100644
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
2.45.0


