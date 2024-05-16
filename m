Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A80DBC25B78
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 11:27:07 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.11215.1715858820780351811
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 04:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C+23jbaY;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a5a89787ea4so290775966b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 04:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715858819; x=1716463619; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPaaLcxUek1fD4cNgAipWucUTsk8/Pra3W5BzXhnP0o=;
        b=C+23jbaYeH9SejwjRO3++rMlPgmD/imij7S+kFn6sIQlCk2E3Bs4tKsOqqMas6QZ+l
         AiBvuGvqzI9NXdovE7iNGyFGNUv7p0Wa4gMrroUgTaz7tFMV2geVwLl2Ih+PjAMJd5Xv
         n5Qk5gXREGK3XRKV6yBtXsshSN+ibqdz9+RBBhylHJVhgbTfKoNKEJ+EpMkY5JQe3De4
         CyinZ6QfiyYLYQdyKWiW1cDcumMLoWbmfrMyfbJUvfKtmB7ssPQvM4anI2JCUTDuEr4v
         hB5YgI7mZKf4EnuIc2tTIYHlasvWcOwevp4LOAt1v+s9YXy/zse/tm5ttZMAD9lL5C92
         v8kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715858819; x=1716463619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WPaaLcxUek1fD4cNgAipWucUTsk8/Pra3W5BzXhnP0o=;
        b=cSH7x7dgN8Ct+eVdhLeq+/cE558mBDJ22YJ+3Zk7cep0Zr73FdojqiVeKPowpnFu/X
         hiMWIRBg3cKKLWPwi6AtbT5S8Klvi0IKxauyWTw6iQ+BntiQE/BuPJ2CWFVHXpD2UUm0
         gUWop1TMDwuIDk/s0LuVQ2R0WwtzJVxTdaoMwMCYxD/F9QF6udwq1jDhbTvsdUIa/m2B
         Oh6+rQOS52OeUKBt41bdEO9zT8tUhVg1l3ePprYSHaoUbJsAx22kYgSFfk4F65bcdmVK
         PxmXtAqT4y5ayttGL3MP0kHabdKu623SiyjJMAAvk3rm8kgWkKdIJfkbv+KzsEI3gZe+
         F7wQ==
X-Gm-Message-State: AOJu0YxqQWktJtpDpUqj8uUYeaPIL6PcUtYqe58MFrMyBNB1a3wy/4Kf
	t7hpQxRkXatmufsDZniRsdks4NzqJ4wes6pCLpio6g2ipnoWFv2NbNCivA==
X-Google-Smtp-Source: AGHT+IFcbzKsCqJ0vF7DdQir1b5FIV+p7AAFNIocg0pdMFSnfP9ODL8GGNJoG2+EI0T5WOlFKqYk4A==
X-Received: by 2002:a17:906:3713:b0:a59:cc74:c28f with SMTP id a640c23a62f3a-a5a2d66a379mr1224480666b.52.1715858819219;
        Thu, 16 May 2024 04:26:59 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b18110sm973898366b.225.2024.05.16.04.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 04:26:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/13] iptables: correctly enable libnetfilter_conntrack support
Date: Thu, 16 May 2024 13:26:38 +0200
Message-Id: <20240516112640.2145789-11-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240516112640.2145789-1-alex.kanavin@gmail.com>
References: <20240516112640.2145789-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 11:27:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199478

From: Alexander Kanavin <alex@linutronix.de>

This is done via configure option, and makes
0004-configure.ac-only-check-conntrack-when-libnfnetlink-.patch
unnecessary, as both libnetfilter_conntrack and libnfnetlink
are enabled in lockstep.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...y-check-conntrack-when-libnfnetlink-.patch | 49 -------------------
 .../iptables/iptables_1.8.10.bb               |  3 +-
 2 files changed, 1 insertion(+), 51 deletions(-)
 delete mode 100644 meta/recipes-extended/iptables/iptables/0004-configure.ac-only-check-conntrack-when-libnfnetlink-.patch

diff --git a/meta/recipes-extended/iptables/iptables/0004-configure.ac-only-check-conntrack-when-libnfnetlink-.patch b/meta/recipes-extended/iptables/iptables/0004-configure.ac-only-check-conntrack-when-libnfnetlink-.patch
deleted file mode 100644
index 5a022ebc8c3..00000000000
--- a/meta/recipes-extended/iptables/iptables/0004-configure.ac-only-check-conntrack-when-libnfnetlink-.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 6832501bbb90a3dab977a4625d0391804c0e795c Mon Sep 17 00:00:00 2001
-From: "Maxin B. John" <maxin.john@intel.com>
-Date: Tue, 21 Feb 2017 11:49:07 +0200
-Subject: [PATCH] configure.ac:
- only-check-conntrack-when-libnfnetlink-enabled.patch
-
-Package libnetfilter-conntrack depends on package libnfnetlink. iptables
-checks package libnetfilter-conntrack whatever its package config
-libnfnetlink is enabled or not. When libnfnetlink is disabled but
-package libnetfilter-conntrack exists, it fails randomly with:
-
-In file included from
-.../iptables/1.4.21-r0/iptables-1.4.21/extensions/libxt_connlabel.c:8:0:
-
-.../tmp/sysroots/qemumips/usr/include/libnetfilter_conntrack/libnetfilter_conntrack.h:14:42:
-fatal error: libnfnetlink/linux_nfnetlink.h: No such file or directory
-
-compilation terminated.
-GNUmakefile:96: recipe for target 'libxt_connlabel.oo' failed
-Only check libnetfilter-conntrack when libnfnetlink is enabled to fix it.
-
-Upstream-Status: Pending
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
-
----
- configure.ac | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index d607772..25a8e75 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -159,10 +159,12 @@ if test "$nftables" != 1; then
- fi
- 
- if test "x$enable_connlabel" = "xyes"; then
--	PKG_CHECK_MODULES([libnetfilter_conntrack],
-+    nfconntrack=0
-+    AS_IF([test "x$enable_libnfnetlink" = "xyes"], [
-+    PKG_CHECK_MODULES([libnetfilter_conntrack],
- 		[libnetfilter_conntrack >= 1.0.6],
- 		[nfconntrack=1], [nfconntrack=0])
--
-+    ])
- 	if test "$nfconntrack" -ne 1; then
- 		blacklist_modules="$blacklist_modules connlabel";
- 		echo "WARNING: libnetfilter_conntrack not found, connlabel match will not be built";
diff --git a/meta/recipes-extended/iptables/iptables_1.8.10.bb b/meta/recipes-extended/iptables/iptables_1.8.10.bb
index cbd727b75df..a9c88582cda 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.10.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.10.bb
@@ -14,7 +14,6 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.xz \
            file://ip6tables.service \
            file://ip6tables.rules \
            file://0001-configure-Add-option-to-enable-disable-libnfnetlink.patch \
-           file://0004-configure.ac-only-check-conntrack-when-libnfnetlink-.patch \
            "
 SRC_URI[sha256sum] = "5cc255c189356e317d070755ce9371eb63a1b783c34498fb8c30264f3cc59c9c"
 
@@ -33,7 +32,7 @@ PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
 
 # libnfnetlink recipe is in meta-networking layer
-PACKAGECONFIG[libnfnetlink] = "--enable-libnfnetlink,--disable-libnfnetlink,libnfnetlink libnetfilter-conntrack"
+PACKAGECONFIG[libnfnetlink] = "--enable-libnfnetlink --enable-connlabel,--disable-libnfnetlink --disable-connlabel,libnfnetlink libnetfilter-conntrack"
 
 # libnftnl recipe is in meta-networking layer(previously known as libnftables)
 PACKAGECONFIG[libnftnl] = "--enable-nftables,--disable-nftables,libnftnl"
-- 
2.39.2


