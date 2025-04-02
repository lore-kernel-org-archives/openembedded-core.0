Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3908C36014
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:10:47 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.2228.1743577841187157737
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DXNb7e5V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39149bccb69so5564206f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743577839; x=1744182639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LGxqkMVXUty6M2b13OYnVp+h4NL54erlXsLlwdh2drk=;
        b=DXNb7e5VQwGElx9Xqf7Da9QfusQs34PI8PgRRT/wqm09vsyRrV2L4MibgWeKXDL70n
         TPrlJRndXNAdcFRF00TuVvbht3kQ2jBj6oY33kIXCvLEmXqp9J5Rx3RjATD+uS9hMeIH
         ead2cwJTws4INgxhDh3GEm/LIvIpBypuZZuAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743577839; x=1744182639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LGxqkMVXUty6M2b13OYnVp+h4NL54erlXsLlwdh2drk=;
        b=QcHQaiNjYR57utvFSQU68miGnkJSMKEw8nj9+MRR2xrGmt3Z/Yt4qCtVGEbpPztF3N
         CjZuiOQ/OvOFEV1RXhGY7hqxJmwaybqjB1ItnNUOC2yh9QCygfNf1qCsIVLm2cnfLbCy
         kffwmnNQEdcnxJMsTZB2Q+DZuwXr0qrKfqZnsUY/j8hgvaiCnj7jwxA1y+Ps+eZsqyI0
         kdwTNYlB4wR9cZfMRPfVclfcJI8qnCgdxZqf/g4HfNbt8GKjTxkkSwV5l1YCQDsbuL5R
         j1dunwHHxsDgTkwuZF93pcy8lxENeLFlPct5L/6NiZbhTwMX6k0JOZcE3NnSlWxsK1+V
         ha1w==
X-Gm-Message-State: AOJu0YzNvFJgspnjlYvcUOIKU3rKDAl2HbSiosUxM0Fr6dtzPVL8cbKS
	SaU3f1Ire/fjTgkWHgG/3fWeBsEn4MpKdEFR2nesAyh8x9YZzoM/oBywAf7VT2ZEHJFD9DKvs2V
	a
X-Gm-Gg: ASbGncsndD6x1lQt8yxOK7oGBCJoNr/wPEft6trTBJP80tONQybespl1jWcpsuZyXED
	VX+dTPJtETgw1rtLiAqoAEIOz0PCXjLuZEVOXVu9zQbO8hC1deI0Uc0u4cwamvReoID8jZAMRc0
	B/aZSAM3q12rOhe3IyzfkRGa6vsg8WZCklKSy8ybFuDetJJA84EORSYTiws+ahWmH+Sa0HEnu/H
	kxLW7OicTjt8K1e65MEk+gBswqniyShmWpXiLgf8J/ZvzvQIY+yZPf2zXE+Dvl3W/ReHB6NLn5Y
	CGs54RvuwUueNN+MgNnmbamtPyotV6nDXG9MM0aDdhq46GeWnDnEETel7Yb1oo9ztepRvIqM8w=
	=
X-Google-Smtp-Source: AGHT+IEUYr1ZERixz6XQZKEjQ7fGoFYpPvdwYpgxFcrn4UsD51nkBmtFTed914z2Uu80cSMg30ezpQ==
X-Received: by 2002:adf:e508:0:b0:390:de58:d7fe with SMTP id ffacd0b85a97d-39c29806cd3mr850746f8f.51.1743577838985;
        Wed, 02 Apr 2025 00:10:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:24b8:b374:749c:8558])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11344385e9.29.2025.04.02.00.10.34
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:10:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/48] connman: upgrade 1.43 -> 1.44
Date: Wed,  2 Apr 2025 08:09:36 +0100
Message-ID: <20250402071017.2157620-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
References: <20250402071017.2157620-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214180

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...stop-systemd-resolved-when-we-use-co.patch |  7 ++---
 ...visibility-to-default-for-debug-symb.patch | 12 +++------
 ...ve-musl-does-not-implement-res_ninit.patch |  5 +---
 .../connman/connman/no-version-scripts.patch  | 26 ++++++++++++++++---
 .../{connman_1.43.bb => connman_1.44.bb}      |  2 +-
 5 files changed, 31 insertions(+), 21 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.43.bb => connman_1.44.bb} (84%)

diff --git a/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-resolved-when-we-use-co.patch b/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-resolved-when-we-use-co.patch
index 8e2e0bd02d5..4597fe68fcd 100644
--- a/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-resolved-when-we-use-co.patch
+++ b/meta/recipes-connectivity/connman/connman/0001-connman.service-stop-systemd-resolved-when-we-use-co.patch
@@ -1,4 +1,4 @@
-From 9f70b94ebf18f52c115634642652830fa77f27a1 Mon Sep 17 00:00:00 2001
+From 19aff57e4da920d9ca972903582305b4efe81ef3 Mon Sep 17 00:00:00 2001
 From: "Maxin B. John" <maxin.john@intel.com>
 Date: Mon, 12 Jun 2017 16:52:39 +0300
 Subject: [PATCH] connman.service: stop systemd-resolved when we use connman
@@ -13,7 +13,7 @@ Signed-off-by: Maxin B. John <maxin.john@intel.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/src/connman.service.in b/src/connman.service.in
-index 9f5c10f..dab48bc 100644
+index 7376346..79e75d6 100644
 --- a/src/connman.service.in
 +++ b/src/connman.service.in
 @@ -6,6 +6,7 @@ RequiresMountsFor=@localstatedir@/lib/connman
@@ -24,6 +24,3 @@ index 9f5c10f..dab48bc 100644
  
  [Service]
  Type=dbus
--- 
-2.4.0
-
diff --git a/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch b/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
index e6f03e632ea..a68707b2fa6 100644
--- a/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
+++ b/meta/recipes-connectivity/connman/connman/0001-plugin.h-Change-visibility-to-default-for-debug-symb.patch
@@ -1,4 +1,4 @@
-From 4ddaf78dad5a9ee4a0658235f71b75132192123e Mon Sep 17 00:00:00 2001
+From c254226d4ebbd846c1f8169d70413a0d32d7ae77 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 7 Apr 2012 18:52:12 -0700
 Subject: [PATCH] plugin.h: Change visibility to default for debug symbols
@@ -8,14 +8,13 @@ have hidden visibility
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-
 Upstream-Status: Pending
 ---
- include/plugin.h |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
+ include/plugin.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/include/plugin.h b/include/plugin.h
-index 692a4e5..a9361c3 100644
+index 8d2bb08..a12a6be 100644
 --- a/include/plugin.h
 +++ b/include/plugin.h
 @@ -89,9 +89,9 @@ struct connman_plugin_desc {
@@ -30,6 +29,3 @@ index 692a4e5..a9361c3 100644
  		extern struct connman_plugin_desc connman_plugin_desc \
  				__attribute__ ((visibility("default"))); \
  		struct connman_plugin_desc connman_plugin_desc = { \
--- 
-1.7.5.4
-
diff --git a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
index 9e2cc34995a..2c612039ee8 100644
--- a/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
+++ b/meta/recipes-connectivity/connman/connman/0002-resolve-musl-does-not-implement-res_ninit.patch
@@ -1,4 +1,4 @@
-From 60783f0d885c9a0db8b6f1d528786321e53f1512 Mon Sep 17 00:00:00 2001
+From 4e726a5aaa75d60fab6a56bc37dbec48be53ff79 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Apr 2015 23:02:21 -0700
 Subject: [PATCH] gweb/gresolv.c: make use of res_ninit optional and subject to
@@ -83,6 +83,3 @@ index 8101d71..9f1477c 100644
  
  		if (!resolv->nameserver_list)
  			g_resolv_add_nameserver(resolv, "127.0.0.1", 53, 0);
--- 
-2.39.2
-
diff --git a/meta/recipes-connectivity/connman/connman/no-version-scripts.patch b/meta/recipes-connectivity/connman/connman/no-version-scripts.patch
index e96e38bcf91..3667a166f69 100644
--- a/meta/recipes-connectivity/connman/connman/no-version-scripts.patch
+++ b/meta/recipes-connectivity/connman/connman/no-version-scripts.patch
@@ -1,3 +1,8 @@
+From 67f37aafcc8ef5d2eb006387e7bec21f74518727 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Tue, 9 Aug 2016 12:12:02 +0100
+Subject: [PATCH] connman: disable version-scripts to fix crashes at startup
+
 With binutils 2.27 on at least MIPS, connmand will crash on startup.  This
 appears to be due to the symbol visibilty scripts hiding symbols that stdio
 looks up at runtime, resulting in it segfaulting.
@@ -12,16 +17,31 @@ remove the scripts to work around the problem until binutils is fixed.
 
 Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
+---
+ Makefile.am | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index d70725c..76ae432 100644
+index 3dc3bb5..3be5ccb 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -132,2 +132 @@ src_connmand_LDADD = gdbus/libgdbus-internal.la $(builtin_libadd) \
+@@ -143,8 +143,7 @@ src_connmand_LDADD = gdbus/libgdbus-internal.la $(builtin_libadd) \
+ 			@GIO_LIBS@ @GLIB_LIBS@ @DBUS_LIBS@ @GNUTLS_LIBS@ \
+ 			-lresolv -ldl -lrt
+ 
 -src_connmand_LDFLAGS = -Wl,--export-dynamic \
 -				-Wl,--version-script=$(srcdir)/src/connman.ver
 +src_connmand_LDFLAGS = -Wl,--export-dynamic
-@@ -166,2 +165 @@ vpn_connman_vpnd_LDADD = gdbus/libgdbus-internal.la $(builtin_vpn_libadd) \
+ 
+ src_connmand_wait_online_SOURCES = src/connmand-wait-online.c
+ 
+@@ -187,8 +186,7 @@ vpn_connman_vpnd_LDADD = gdbus/libgdbus-internal.la $(builtin_vpn_libadd) \
+ 				@GIO_LIBS@ @GLIB_LIBS@ @DBUS_LIBS@ @GNUTLS_LIBS@ \
+ 				-lresolv -ldl
+ 
 -vpn_connman_vpnd_LDFLAGS = -Wl,--export-dynamic \
 -				-Wl,--version-script=$(srcdir)/vpn/vpn.ver
 +vpn_connman_vpnd_LDFLAGS = -Wl,--export-dynamic
+ endif
+ 
+ BUILT_SOURCES = $(local_headers) src/builtin.h $(service_files) \
diff --git a/meta/recipes-connectivity/connman/connman_1.43.bb b/meta/recipes-connectivity/connman/connman_1.44.bb
similarity index 84%
rename from meta/recipes-connectivity/connman/connman_1.43.bb
rename to meta/recipes-connectivity/connman/connman_1.44.bb
index 1100599490a..396d8bc5ce2 100644
--- a/meta/recipes-connectivity/connman/connman_1.43.bb
+++ b/meta/recipes-connectivity/connman/connman_1.44.bb
@@ -9,7 +9,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
            "
 
 
-SRC_URI[sha256sum] = "1257cebe327e7900b7e2b84c0fb330aa90815e455898cd2f941f4308ed2be3bc"
+SRC_URI[sha256sum] = "2be2b00321632b775f9eff713acd04ef21e31fbf388f6ebf45512ff4289574ff"
 
 RRECOMMENDS:${PN} = "connman-conf"
 RCONFLICTS:${PN} = "networkmanager"

