Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 709E16E688
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 16:27:30 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id b17-v6so256392pfi.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jul 2018 09:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RXfqmrIe2VjT9MghBPraX/wDlUY7AhFJEaQeyuFGUB4=;
	b=I1AkL+IbEnBEH/WhjvgBQOCpGP8sBgbQMwxe2WrP6+vJzcqcVaRg7yCiQZZMYToUlM
	Jb2tglF//uPLWRSozwKr/53DJ+/vTTbkBmzSxdnXUqjxU+2+Ibe2MwO9FVwRuMuODF9W
	6SJR8IIzJ26faWAD4WwI9FAXCHMuSTAjWMCYhygUUqJXy8hbzMx9qS7ZvID/Gxx9USN2
	ige4XJ3UF1gEJLMSKmwCsEmLrd4Yd7eDdLPSVsHg5R8WfJhvfTvS7sQllhhcazBAs4/T
	Gk3InzfUAXyhjtzMex5S0KYvYdHaTADrDzeUyuo0XuYqEdf1PnELvklzteQCs5DW9G09
	x+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RXfqmrIe2VjT9MghBPraX/wDlUY7AhFJEaQeyuFGUB4=;
	b=OPR3DpSRgxmZIUd6u7Q5x58vq4l4TPzabXTmCki/plfy0j0Rvja6jFN6h9Wq+ZdcLd
	SSCD0Ctl4kRLxgCmpksy1lG1CMGW/HfDuVv1USi3rXZKZa2YvLdJ6FJlBcxO6wvW8wrY
	5f69txLyJ4EHE9pxP4VWGzoi5j2182cCV+yNtEJB/mXsIg/9z7venFRU2ETYPFiAKtXU
	J7J7KMNnYsEcMN4PgUPH4nJJvmsWpV43pE22PRJF6ZFR5cNMP7vBD6Cp+qO+/r1q6anI
	75KMymxNbDAwGdPBNKmF0xo58aDdanGxM1/GWEUCvHdpl59MoWnxf5R5eVzx6DsdUOMH
	kzNQ==
X-Gm-Message-State: AOUpUlESC2YH0Bp8K8DnKKSoxMQ2sysWQEq50j6FRDbQ/lYl2KAIIdM+
	QK/ja4rOuKF1RyBqtd5XKhyS/Qb8
X-Google-Smtp-Source: AAOMgpc5irXTq04Uh840NC12u3AkkxNFKz+vlrIdpbeMOeKu7YyFWhn7OW+BF8n7jrk5UF1AgW8kXA==
X-Received: by 2002:a63:af14:: with SMTP id
	w20-v6mr6349738pge.47.1532190451204; 
	Sat, 21 Jul 2018 09:27:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::8092])
	by smtp.gmail.com with ESMTPSA id
	k26-v6sm14485231pfb.167.2018.07.21.09.27.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 21 Jul 2018 09:27:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Jul 2018 09:27:14 -0700
Message-Id: <20180721162715.12611-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180721162715.12611-1-raj.khem@gmail.com>
References: <20180721162715.12611-1-raj.khem@gmail.com>
Subject: [PATCH 6/7] xserver-xorg: Find wayland-protocol files in proper location during cross compile
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
X-List-Received-Date: Sat, 21 Jul 2018 16:27:30 -0000

Fixes
| make[2]: *** No rule to make target '//usr/share/wayland-protocols/unstable/relative-pointer/relative-pointer-unstable-v1.xml', needed by 'relative-pointer-unstable-v1-client-protocol.h'.  Stop.
| make[2]: *** Waiting for unfinished jobs....

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...R-for-defining-WAYLAND_PROTOCOLS_DAT.patch | 31 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.19.6.bb       |  3 ++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
new file mode 100644
index 0000000000..caad2781a8
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch
@@ -0,0 +1,31 @@
+From 03b856b08a2a9403dbd556c48ab4a94338f7893b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 20 Jul 2018 23:29:35 -0700
+Subject: [PATCH] use PKG_CHECK_VAR for defining WAYLAND_PROTOCOLS_DATADIR
+
+This allows to override the wayland-protocols pkgdatadir with the
+WAYLAND_PROTOCOLS_DATADIR from environment.
+
+pkgconfig would return an absolute path in /usr/share/wayland-protocols
+for the pkgdatadir value, which is not suitable for cross-compiling.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 14dfc2e..3bd18a0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2530,7 +2530,8 @@ if test "x$XWAYLAND" = xyes; then
+ 	AC_PATH_PROG([WAYLAND_SCANNER], [wayland-scanner],,
+ 		     [${WAYLAND_PREFIX}/bin$PATH_SEPARATOR$PATH])
+ 
+-	AC_SUBST(WAYLAND_PROTOCOLS_DATADIR, `$PKG_CONFIG --variable=pkgdatadir wayland-protocols`)
++	PKG_CHECK_VAR([WAYLAND_PROTOCOLS_DATADIR], [wayland-protocols >= $WAYLAND_PROTOCOLS_REQUIRED], pkgdatadir)
++	AC_SUBST([WAYLAND_PROTOCOLS_DATADIR])
+ fi
+ 
+ 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
index c680cf9e89..27d4e75b1e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.19.6.bb
@@ -5,10 +5,13 @@ SRC_URI += "file://musl-arm-inb-outb.patch \
             file://0003-modesetting-Fix-16-bit-depth-bpp-mode.patch \
             file://0003-Remove-check-for-useSIGIO-option.patch \
             file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
+            file://0001-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
             "
 SRC_URI[md5sum] = "3e47777ff034a331aed2322b078694a8"
 SRC_URI[sha256sum] = "a732502f1db000cf36a376cd0c010ffdbf32ecdd7f1fa08ba7f5bdf9601cc197"
 
+EXTRA_OEMAKE += "WAYLAND_PROTOCOLS_DATADIR=${STAGING_DATADIR}/wayland-protocols"
+
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
 
-- 
2.18.0


