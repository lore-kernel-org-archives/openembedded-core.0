Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5E1C25B5F
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 01:15:11 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.1142.1715044502755306229
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 18:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LiLTfGWC;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1ecddf96313so22067995ad.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 18:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715044502; x=1715649302; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5g7h1ocdXmxMwPfA88nArGnrbuZA1kXC8DaT5k2GuE=;
        b=LiLTfGWCtjrmT+Q4mrGGcYS/1JHJVrky30ZwcPr6l7fctI/JqlUTEtCQAZ7cfkktMm
         HZ7jy2o4uvTxQtuGe15HzwDlvHczgMArcapfD1GRv9YegtLnuOPVo8fgBUyol0sGwv54
         xSUcOxFgAReH23ZEGIEfInT2w1/HZ7fBZppOqno8vp1ox4iGsknin0ii04nTU7tvt0bR
         CE2axPA1c6hshoB2cwBrOn+vt5OJDwtie28rmy2vxYKhzSSJruYVhYHFHihrzVh243O+
         hCWhnSbkn2omm562NokF1B1CHYBnrWKD/MISrRDh5nevS/9ZumuaLPzi0kkN/IRDk6wP
         mnzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715044502; x=1715649302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5g7h1ocdXmxMwPfA88nArGnrbuZA1kXC8DaT5k2GuE=;
        b=LaqURT7UuID3szJtxU5oQWgC9FoQmD7+YfnAGNnQEflviJ4JzYMzCrd/8VveK2kOBi
         ZpXzPR1mrNlaagqcnYr6E76jv7h83FLrdEH/52cPRpkcPi1sfd1P9f1QmTN8WK5cQK4q
         7T/LJPkIBY+qZN2d+cLJw4aic7IHftLWqbtcYtYNLDFa6J9zjf9up55H+BkVt9qnbYau
         nZxFL2GLH9JlQ1f/IPdExKkBnMOz2JJ0cvT/cyBYHFKc+66xlQiWw7fTW7bdFd8n0l9G
         hKoGba7nTV+fFS6t9lbcTR8TTerQnNPPW5kNfdfgzXWzs9UhcMwipovLAicWyFym2dp7
         fi1Q==
X-Gm-Message-State: AOJu0YxOtIJwjL9I8BNRJwYIBBU9nXC1QYjIkVGCGJfMRav4HPCy7Fr+
	F6udtyhfJEtDdM0igKf/eaUntXkYfFjqsus2YWYlSSjljKB1fyqlQkWo9s9W
X-Google-Smtp-Source: AGHT+IHirpkqPR1nzajNmpHJEp9vpLPTXq7wA9gZq4GB+oh/ROv10k7Sa/hf5HhvreVjW2agwPZp6g==
X-Received: by 2002:a17:902:f687:b0:1e4:51ab:fffb with SMTP id l7-20020a170902f68700b001e451abfffbmr16431498plg.25.1715044501574;
        Mon, 06 May 2024 18:15:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::cf93])
        by smtp.gmail.com with ESMTPSA id b11-20020a170902d50b00b001eb2f4648d3sm8830898plg.228.2024.05.06.18.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 18:15:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 04/10] zip lrzsz connman-gnome kea libfm: ignore various issues fatal with gcc-14
Date: Mon,  6 May 2024 18:14:49 -0700
Message-ID: <20240507011455.313230-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240507011455.313230-1-raj.khem@gmail.com>
References: <20240507011455.313230-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 01:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199051

From: Martin Jansa <martin.jansa@gmail.com>

TODO: kea

work arounds for:
oe-core/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb:do_compile
oe-core/meta/recipes-connectivity/connman/connman-gnome_0.7.bb:do_compile
oe-core/meta/recipes-connectivity/kea/kea_2.4.1.bb:do_compile
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
 meta/recipes-connectivity/kea/kea_2.4.1.bb             | 6 ++++++
 meta/recipes-extended/zip/zip_3.0.bb                   | 5 +++++
 meta/recipes-support/libfm/libfm_1.3.2.bb              | 4 ++++
 5 files changed, 25 insertions(+)

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
diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb b/meta/recipes-connectivity/kea/kea_2.4.1.bb
index 6c1e457938a..fc963e545ad 100644
--- a/meta/recipes-connectivity/kea/kea_2.4.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.4.1.bb
@@ -75,3 +75,9 @@ FILES:${PN}-staticdev += "${libdir}/kea/hooks/*.a ${libdir}/hooks/*.a"
 FILES:${PN} += "${libdir}/hooks/*.so"
 
 PARALLEL_MAKEINST = ""
+
+# http://errors.yoctoproject.org/Errors/Details/766928/
+# TOPDIR/BUILD/work/qemux86_64-webos-linux/kea/2.4.1/recipe-sysroot-native/usr/bin/x86_64-webos-linux/../../libexec/x86_64-webos-linux/gcc/x86_64-webos-linux/14.0.1/ld: ./.libs/libdhcp4.a(dhcp4_srv.o): in function `isc::dhcp::OptionDescriptor isc::dhcp::CfgOption::get<char [6]>(char const (&) [6], unsigned short) const':
+# /usr/src/debug/kea/2.4.1/src/lib/dhcpsrv/cfg_option.h:608:(.text._ZNK3isc4dhcp9CfgOption3getIA6_cEENS0_16OptionDescriptorERKT_t[_ZNK3isc4dhcp9CfgOption3getIA6_cEENS0_16OptionDescriptorERKT_t]+0x85): undefined reference to `isc::dhcp::CfgOption::getAll(std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> > const&) const'
+# collect2: error: ld returned 1 exit status
+# TODO: Fix for gcc-14
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


