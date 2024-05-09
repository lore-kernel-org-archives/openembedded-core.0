Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0661BC25B74
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 01:30:57 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.8.1715218253165290585
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 18:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jea963U5;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2b27c532e50so300916a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 18:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715218252; x=1715823052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kicgq613sdQHFr4X75rrOfkfMgF8y/kdwDqvealArnc=;
        b=jea963U5V31TOLDGnh/ukxmB4uuxQMEEy+lIEJ8bnqySjUW4KkIbLyM/cYtCGy1e+I
         FSeOb9aWy+Z0qFSpUqjvPiBOjuZEJidBOTclj1ewJsoSuXImmauYy+OX+6/7SUa++YgK
         Pn4yFoCyi9dA2Ge+gHPM6jyioYFgvSmThwCQV8q6UcfXP3yclgG04A0Pu0V9LNtILRoO
         v/NoJlyW6CkiwyEqyB7bS+vLEq26Bncz76OFjCRTQidMO3ewZ6palYUwLunxTHTa/X2V
         avNQ7Q30ETXh/1o4fd5iNpc6wCjC8mCh6lWzRM30sLeUX7tCPuVcfi86FlD43vxGiYxR
         4Yyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715218252; x=1715823052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kicgq613sdQHFr4X75rrOfkfMgF8y/kdwDqvealArnc=;
        b=d3Qe+H5TRV8mgNrrSSNOKGHaJUDTS97kzyBxnaEj5/hqQ+liAEMS9mwg2TrF7s6loJ
         7ntxRbTcJSq+y7FHhZIBYjx1F8iqf4r8P9LBM2vmNLKkGhjSxCguvZJ4tj3M8ha0Lazk
         oOqe4PjF9+huCzt97GLS/Dtkra5XP3hR7izQvWUiOmNVPyxcNlcz/M3rwa9dK8xWxfdy
         O5VpRqNhFam/WbJ+5/zsW6r8zzrmAEts6+VtuePUQ3hDVMfbUCN+KCbyWKsE37f4GoJy
         nM69OdhrPXfeCQf4cI+SWZteve9dSGk4o/hGlqeSwJhqRWQKuupIqZndGONqZpO9rhRv
         KyHg==
X-Gm-Message-State: AOJu0YyGSZSyudIZD0+JSxpVn1etoIBqk7zNordUed5bLtnha1Hmug0G
	s+wCq9DHVVBaguR237bG508gJU18f5kMAKsswGI9aakeUd31DXGoOtNoEIle
X-Google-Smtp-Source: AGHT+IExaZszGsJS0/Gtibbz2SyCkLgNpqnLvxwXuj5X9boxY9tE8QZgm8uxZX81VeJUaYUJfnHmhQ==
X-Received: by 2002:a17:90a:e548:b0:2b2:1d33:f687 with SMTP id 98e67ed59e1d1-2b616be479fmr3764612a91.47.1715218252340;
        Wed, 08 May 2024 18:30:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::af2d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b67158de4dsm244558a91.42.2024.05.08.18.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 18:30:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V3 2/4] lrzsz connman-gnome libfm: ignore various issues fatal with gcc-14
Date: Wed,  8 May 2024 18:30:47 -0700
Message-ID: <20240509013049.523093-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240509013049.523093-1-raj.khem@gmail.com>
References: <20240509013049.523093-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 01:30:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199133

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
---
v3: Drop zip as it has another fix in ml

 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb                | 6 ++++++
 meta/recipes-connectivity/connman/connman-gnome_0.7.bb | 4 ++++
 meta/recipes-support/libfm/libfm_1.3.2.bb              | 4 ++++
 3 files changed, 14 insertions(+)

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


