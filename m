Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 104A677EA8
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jul 2017 14:24:06 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id z6so20459165pfk.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jul 2017 07:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TkH97Rs0kJdDKrSAQTSYP0F5SrGCXMcHNIFp+Jq3ve8=;
	b=MRW3U0IITovijWoBgU4QJUls9Z4NnMv4UTied1dMmTRTOB5Qm/QU3MfBlGG9aZxuxl
	H2L8cceS91QAAQmtu0EcQ2ST+vkLgUB4W9KO8fxHVhJCv15UPCHdXMP9jqDjdMUoLyqw
	bF/GGWrRy5HeSU52CcyGKLYG6/XW4vwI4TT1bl2hLchPjvE9MjHSGgZJzdzCRCTQs9YH
	WWnTf1gvC8ZnHjux6cdyXDvaPBOfp1Jls87wC+hxxY257crJxxqX3BGkjLFbglC8ckjm
	Um5cUv+4p+jt+tZWBwuZ1vVqiGKGmOAbcy4JWYZlvAa5rYI9Q6otHDmb5jSJ2+hcwibq
	wOLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TkH97Rs0kJdDKrSAQTSYP0F5SrGCXMcHNIFp+Jq3ve8=;
	b=p4dqIt+HdFrQH5ri6Sazl4ptcrvQFnAl5IBH4T0sIUpHlV2d5WRSpaHQ83syO60Ivt
	uN12lHWB6p7yuTnvxhus+PVQ52p+oYdVDpe91yM0LWk6lqyOrgAhtcpVRnDK5f/U1gDj
	jUATnR7HP8pHT+Z4W/gizLvQ+yZC4OULsNDCYDi9+WyRphtiO+H3F4/GfzSQFypfRaIN
	aAtJZIZB+rFaZhhqelmdYpnzeHwgP8hV//EPxTWSLvMejA3F5IeFADqTjhg4EOowhnd8
	QWzClgMhqCHq7n/iIG72P5xPaXmYqQBJeMcS6QcQTZxDa5/lRsqr1kg7bAUDYLZvIcvI
	m6GQ==
X-Gm-Message-State: AIVw113aEvjjtovphblfUNgelSnNDf+G3nMXH3oAJT4wEeAC8OKtwnsO
	XhDonA8C0lzB6Rzs
X-Received: by 10.99.119.12 with SMTP id s12mr1036561pgc.143.1498919047376;
	Sat, 01 Jul 2017 07:24:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	17sm25026909pfn.84.2017.07.01.07.24.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jul 2017 07:24:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jul 2017 07:23:22 -0700
Message-Id: <ad531299bf307125073c336a1051a59c484e79b4.1498893436.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1498893436.git.raj.khem@gmail.com>
References: <cover.1498893436.git.raj.khem@gmail.com>
Subject: [PATCH 19/19] epiphany: Fix build errors when compiling with security flags
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Jul 2017 14:24:06 -0000

We need to have some level of optimization level for FORTIFY_SOURCE
to work therefore set --enable-debug=no

Add a patch to fix build error due to unused result of fread

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.24.2.bb     |  6 ++--
 ...bookmarks-Check-for-return-value-of-fread.patch | 32 ++++++++++++++++++++++
 2 files changed, 36 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-gnome/epiphany/files/0001-bookmarks-Check-for-return-value-of-fread.patch

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb b/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb
index 77c19331cb..dafad8a793 100644
--- a/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_3.24.2.bb
@@ -9,11 +9,13 @@ DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes avahi libnotify gcr \
 inherit gnomebase gsettings distro_features_check upstream-version-is-even gettext
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch"
+SRC_URI += "file://0001-yelp.m4-drop-the-check-for-itstool.patch \
+            file://0001-bookmarks-Check-for-return-value-of-fread.patch \
+           "
 SRC_URI[archive.md5sum] = "e035dc6f64f0c1909de823e03f16b2f3"
 SRC_URI[archive.sha256sum] = "5abc0d0c60591df5236ac9b8979dc9f7d9acbb8ad0902b4772d2b7beea81c58d"
 
-EXTRA_OECONF += " --with-distributor-name=${DISTRO}"
+EXTRA_OECONF += " --with-distributor-name=${DISTRO} --enable-debug=no"
 
 do_configure_prepend() {
     sed -i -e s:help::g ${S}/Makefile.am
diff --git a/meta/recipes-gnome/epiphany/files/0001-bookmarks-Check-for-return-value-of-fread.patch b/meta/recipes-gnome/epiphany/files/0001-bookmarks-Check-for-return-value-of-fread.patch
new file mode 100644
index 0000000000..ddcd39400c
--- /dev/null
+++ b/meta/recipes-gnome/epiphany/files/0001-bookmarks-Check-for-return-value-of-fread.patch
@@ -0,0 +1,32 @@
+From aa2176be32eed2578da82f34d31148f934c11c34 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 28 Jun 2017 17:03:45 -0700
+Subject: [PATCH] bookmarks: Check for return value of fread()
+
+Fixes below compiler error
+ignoring return value of 'fread', declared with attribute warn_unused_result
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/bookmarks/ephy-bookmark.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/bookmarks/ephy-bookmark.c b/src/bookmarks/ephy-bookmark.c
+index ff0239b..8633ce4 100644
+--- a/src/bookmarks/ephy-bookmark.c
++++ b/src/bookmarks/ephy-bookmark.c
+@@ -217,7 +217,8 @@ ephy_bookmark_init (EphyBookmark *self)
+   bytes = g_malloc (num_bytes);
+ 
+   fp = fopen ("/dev/urandom", "r");
+-  fread (bytes, sizeof (guint8), num_bytes, fp);
++  if (fread (bytes, sizeof (guint8), num_bytes, fp) != num_bytes)
++    g_warning("Unable to read data from /dev/urandom\n");
+ 
+   self->id = g_malloc0 (ID_LEN + 1);
+   for (gsize i = 0; i < num_bytes; i++) {
+-- 
+2.13.2
+
-- 
2.13.2


