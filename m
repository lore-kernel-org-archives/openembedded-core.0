Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8997C369A1
	for <webhook@archiver.kernel.org>; Thu,  3 Apr 2025 10:53:20 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.10568.1743677593569600118
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Apr 2025 03:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JfMP1xCc;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c0dfba946so475169f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 03:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743677591; x=1744282391; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3+ExCSaBoAh+/mXbdaTN4cSKKmQrfZ8zHmaTB/V4Umg=;
        b=JfMP1xCctf5FMhKVxk3JriKqbQcHMqPTno0HLL7tFdF7S8t9Pxxf0Om5DsqoUbW75R
         p2Apv/V0G3FM/j9fGTLkBld0ot4PBnZDEr9i9lhsIX4KHTbi+0H8LruTIy7get5oRpuQ
         wiGBfc3tWKhUcE4T71a+McJqgJAsedoiNvqcmQllL3WmfV8bWhga7VIh37I9S+MWgyej
         /B60LPENLFTAjFF0/8aYHJi9KAMW7YzL7tLqYZ9zZLlC1jkCidwyGPpLSc7Q/kjp/64y
         9UC9xMCPb9bu0C6NplG/j1sEpkkO1gGl/DDSuRk/BdSm0rN+/G9DywsbvH9EQ3Mf2brY
         7Hnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743677591; x=1744282391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+ExCSaBoAh+/mXbdaTN4cSKKmQrfZ8zHmaTB/V4Umg=;
        b=j0S9ig1KomsowXjeFXAsnK3AFdwjsPpgrDBkv9BVwFs19vUmCbZHAN/h7tDMgw8g0/
         aElIkbq5id8jo+3klWiLnBd/z5KijC8VG96cgi5W3wetE6svweDdADVdZmZM11xA3OSS
         5on+uMBEhEsTsxQ93AzdR7rReXGQbz+awAdEq3xlS0o41AxcjALy0MXRD/barpM3wIBF
         53gsLO2rCHJdOURMI5pL2YNPi6LP9NqJlzaA6wtyOiDrmnGHzkF81LtJo+a9o1wiQHmT
         +e0Kf4TBTtdvYEGNOCapNWCU2jBDfG9zEn8KM2zMUh4TvizYYAqWKfRf+pBlpZZwpp6t
         xbMQ==
X-Gm-Message-State: AOJu0YzikQFuklO4WB3g6OIBgqGSHxPEytSRnOVAp8t5JP6U5ZPaPufx
	aWHczRlbpi7hDQYv5zifIUh0tDwAjy6F30E9BRVyZHSuu8S6ds4LFJ+5TyRy
X-Gm-Gg: ASbGncvZ38Q8fb9BLFLGremGNl2EUP6jw64OfEESSkPvIp96Y4fMfnkbm6/81FtkQRv
	k690qxkY4V8SYxHX1YqY0lfObFoBypKFMtm6yGX0bIFh6UXHdEqsX50e3qWE9EiZtaqiGR52U/+
	mf7rGiDS5aJzvN5aTHfPwBnWYHMFt8P6jQxHrr34WoSp7lNMXd68R19jz6W7CTUJ06av4y/6WFY
	Woef3PCKjiyKiQEZJYJ6nd//9GSKSgYE3DUzdqo4rh15j8CZs2b2cyMaN2/TMjr6y+l4GX71Jca
	v9q3PTeupmVI3GmrNOTs/DAGz0UabLDWBeAE5he5TvRECb/S3xfCCD8mGs6YFd4hTLms4mztO3U
	HvTMv/fUEq7o=
X-Google-Smtp-Source: AGHT+IEpUycGvi6J3+QwqYOCZHSXnlrnSL0jLSMlrYZrOdqNs8BHA4RG8f09YLS/c/31KVQg4AO0Qg==
X-Received: by 2002:a05:6000:290a:b0:39c:1f0f:382a with SMTP id ffacd0b85a97d-39c2f8e6c33mr2174555f8f.35.1743677591438;
        Thu, 03 Apr 2025 03:53:11 -0700 (PDT)
Received: from ip-10-0-0-134.eu-west-1.compute.internal ([2a05:d018:db1:fb00:c4f8:7a97:b7aa:1bfd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630ddesm18346865e9.5.2025.04.03.03.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 03:53:09 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 03 Apr 2025 10:52:55 +0000
Subject: [PATCH OE-Core v2 2/6] connman: Delete patches for gold and MIPS
 binutils fix
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-connman-v2-2-8bb637312ba8@gmail.com>
References: <20250403-connman-v2-0-8bb637312ba8@gmail.com>
In-Reply-To: <20250403-connman-v2-0-8bb637312ba8@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
X-Mailer: b4 0.14.2
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Apr 2025 10:53:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214313

gold is no longer built/supported. The workaround for binutils on MIPS no
longer appears to be required.

Also fix up tabs/whitespace in shell functions, correct HOMEPAGE, drop broken
BUGTRACKER link.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...ange-visibility-to-default-for-debug-symb.patch | 31 --------------
 .../connman/connman/no-version-scripts.patch       | 47 ----------------------
 meta/recipes-connectivity/connman/connman_1.44.bb  | 13 +++---
 3 files changed, 5 insertions(+), 86 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch b/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
deleted file mode 100644
index a68707b2fa62a6e1ac37e05b8706908c456cec02..0000000000000000000000000000000000000000
--- a/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From c254226d4ebbd846c1f8169d70413a0d32d7ae77 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 7 Apr 2012 18:52:12 -0700
-Subject: [PATCH] plugin.h: Change visibility to default for debug symbols
-
-gold refuses to link in undefined weak symbols which
-have hidden visibility
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- include/plugin.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/include/plugin.h b/include/plugin.h
-index 8d2bb08..a12a6be 100644
---- a/include/plugin.h
-+++ b/include/plugin.h
-@@ -89,9 +89,9 @@ struct connman_plugin_desc {
- #else
- #define CONNMAN_PLUGIN_DEFINE(name, description, version, priority, init, exit) \
- 		extern struct connman_debug_desc __start___debug[] \
--				__attribute__ ((weak, visibility("hidden"))); \
-+				__attribute__ ((weak, visibility("default"))); \
- 		extern struct connman_debug_desc __stop___debug[] \
--				__attribute__ ((weak, visibility("hidden"))); \
-+				__attribute__ ((weak, visibility("default"))); \
- 		extern struct connman_plugin_desc connman_plugin_desc \
- 				__attribute__ ((visibility("default"))); \
- 		struct connman_plugin_desc connman_plugin_desc = { \
diff --git a/meta/recipes-connectivity/connman/connman/no-version-scripts.patch b/meta/recipes-connectivity/connman/connman/no-version-scripts.patch
deleted file mode 100644
index 3667a166f69346c3ca3592d179cc1baaa16cb1b4..0000000000000000000000000000000000000000
--- a/meta/recipes-connectivity/connman/connman/no-version-scripts.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 67f37aafcc8ef5d2eb006387e7bec21f74518727 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Tue, 9 Aug 2016 12:12:02 +0100
-Subject: [PATCH] connman: disable version-scripts to fix crashes at startup
-
-With binutils 2.27 on at least MIPS, connmand will crash on startup.  This
-appears to be due to the symbol visibilty scripts hiding symbols that stdio
-looks up at runtime, resulting in it segfaulting.
-
-This certainly appears to be a bug in binutils 2.27 although the problem has
-been known about for some time:
-
-https://sourceware.org/bugzilla/show_bug.cgi?id=17908
-
-As the version scripts are only used to hide symbols from plugins we can safely
-remove the scripts to work around the problem until binutils is fixed.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Ross Burton <ross.burton@intel.com>
----
- Makefile.am | 6 ++----
- 1 file changed, 2 insertions(+), 4 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 3dc3bb5..3be5ccb 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -143,8 +143,7 @@ src_connmand_LDADD = gdbus/libgdbus-internal.la $(builtin_libadd) \
- 			@GIO_LIBS@ @GLIB_LIBS@ @DBUS_LIBS@ @GNUTLS_LIBS@ \
- 			-lresolv -ldl -lrt
- 
--src_connmand_LDFLAGS = -Wl,--export-dynamic \
--				-Wl,--version-script=$(srcdir)/src/connman.ver
-+src_connmand_LDFLAGS = -Wl,--export-dynamic
- 
- src_connmand_wait_online_SOURCES = src/connmand-wait-online.c
- 
-@@ -187,8 +186,7 @@ vpn_connman_vpnd_LDADD = gdbus/libgdbus-internal.la $(builtin_vpn_libadd) \
- 				@GIO_LIBS@ @GLIB_LIBS@ @DBUS_LIBS@ @GNUTLS_LIBS@ \
- 				-lresolv -ldl
- 
--vpn_connman_vpnd_LDFLAGS = -Wl,--export-dynamic \
--				-Wl,--version-script=$(srcdir)/vpn/vpn.ver
-+vpn_connman_vpnd_LDFLAGS = -Wl,--export-dynamic
- endif
- 
- BUILT_SOURCES = $(local_headers) src/builtin.h $(service_files) \
diff --git a/meta/recipes-connectivity/connman/connman_1.44.bb b/meta/recipes-connectivity/connman/connman_1.44.bb
index 1cd97d342f894bcffa6a7ed80ac8dc23e6a0565d..553a377684c67190bbf274a28759bc1825b21d75 100644
--- a/meta/recipes-connectivity/connman/connman_1.44.bb
+++ b/meta/recipes-connectivity/connman/connman_1.44.bb
@@ -7,8 +7,7 @@ It is a fully modular system that can be extended, through plug-ins, \
 to support all kinds of wired or wireless technologies. Also, \
 configuration methods, like DHCP and domain name resolving, are \
 implemented using plug-ins."
-HOMEPAGE = "http://connman.net/"
-BUGTRACKER = "https://01.org/jira/browse/CM"
+HOMEPAGE = "https://web.git.kernel.org/pub/scm/network/connman/connman.git/about/"
 LICENSE  = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://src/main.c;beginline=1;endline=20;md5=486a279a6ab0c8d152bcda3a5b5edc36"
@@ -20,10 +19,8 @@ CVE_PRODUCT = "connman connection_manager"
 DEPENDS  = "dbus glib-2.0 ppp"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
-           file://0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch \
            file://0001-connman.service-stop-systemd-resolved-when-we-use-co.patch \
            file://connman \
-           file://no-version-scripts.patch \
            file://0002-resolve-musl-does-not-implement-res_ninit.patch \
            "
 
@@ -116,10 +113,10 @@ do_install:append() {
 	# plugins directory to be present for ownership
 	mkdir -p ${D}${libdir}/connman/plugins
 
-    # For read-only filesystem, do not create links during bootup
-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
-        ln -sf ../run/connman/resolv.conf ${D}${sysconfdir}/resolv-conf.connman
-    fi
+	# For read-only filesystem, do not create links during bootup
+	if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+		ln -sf ../run/connman/resolv.conf ${D}${sysconfdir}/resolv-conf.connman
+	fi
 }
 
 # These used to be plugins, but now they are core

-- 
2.46.1


