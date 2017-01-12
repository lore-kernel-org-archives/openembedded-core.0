Return-Path: <anders@openpuma.org>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id CE6C36E5CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 05:03:17 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id b22so1577096pfd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 21:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=openpuma-org.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dEb9VXH1Dy3CuQ9QsaFrEVluW5rwJkgF0fNrRFqr05s=;
	b=qIq2aKcfgw5fhFsHeZei7WXnt5HXK73tRHpPswcakW01fCgfviivGg+Y/HJJqzLRxL
	fbDfLlVGnObOhc56HZgbPah5QnGgz40AzcJTm+p1b8QdIeHFiex0Sd+V5Qe+givJf4SZ
	TnFLTEo5MU7VNYbkK81HscdHJNJVRyFzVWaLe/61Kxk6Nt9BLikVucvIrrTGcEiUoHgI
	a4WrOeicyecDuBUt0tgJtkkJ82Drl1nE4NR4sSvGEnWtDPsK52dbtVSN8TcGZ21gQZ3q
	XeFD0T/6qwiBclGlG4w173eUC2G2p8MviJ0ci2ZzcYFPyr/nn5V3lSOr2OjjV1OzGeqN
	bKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dEb9VXH1Dy3CuQ9QsaFrEVluW5rwJkgF0fNrRFqr05s=;
	b=LEWMv+KMDvvM0XmVzY2fPTUhQigWQ4p5HXhFNYSPLjiRP5p7CxyXuVxmO38mTU2LDc
	dbOY95urgLvcIMveK3ef9T4AwlctaDUzxRz3mzENMVtsvTBXgt9XsliKwMUx2PZkBTbo
	zz+AoWu4OlGNys0SVcCMWoQQfXcnsKtTDsWRVRVfHo1Lk8SHdbZQ7e2XfkSAHhvK70Bm
	tNFeaEPcntsg+X2ySkqFpB7gl6jAf4sHxKJRf1CWLN6kst3lO1csHl1h+jEI3JeKtS9m
	ohhL1CWYfAV8TiLde+JazWMu8WAAWWAAVQOrY4iUdzChAYskbsoYn14ecfSJZTsTbV88
	Nrlg==
X-Gm-Message-State: AIkVDXLyeWUOalAms5g4gsBnLCSsIUwBPI2uESXxAp3kfgNQ+79Jho1+9m9lsuXz39F00w==
X-Received: by 10.98.217.88 with SMTP id s85mr14323747pfg.167.1484197398419;
	Wed, 11 Jan 2017 21:03:18 -0800 (PST)
Received: from localhost.localdomain (cpe-172-88-176-4.socal.res.rr.com.
	[172.88.176.4]) by smtp.gmail.com with ESMTPSA id
	u124sm17510161pgb.6.2017.01.11.21.03.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Jan 2017 21:03:17 -0800 (PST)
From: Anders Oleson <anders@openpuma.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jan 2017 21:02:47 -0800
Message-Id: <1484197367-11314-1-git-send-email-anders@openpuma.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1484123040.4367.172.camel@linuxfoundation.org>
References: <1484123040.4367.172.camel@linuxfoundation.org>
Subject: [PATCH] dpkg: workaround for sstate contamination
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
X-List-Received-Date: Thu, 12 Jan 2017 05:03:19 -0000

The dpkg binary contains a hard-coded CONFIGDIR path which normally points to
/etc/dpkg. If /etc/dpkg/dpkg.cfg.d cannot be accessed and scandir returns
EACCESS, or any error other than ENOTDIR, it is treated as a fatal error.

Normally this is not an issue for dpkg, and indeed has been confirmed to be
the developers' design intent. But when dpkg-native is built for OpenEmbedded,
the hard-coded CONFIGDIR "leaks" the build specific location information into
the sstate-cache. Later on, if another user or machine picks up and reuses the
dpkg-native binary, it will fail if the original sysroot does not exist, is
not a directory, or is otherwise inaccessible.

The dpkg utility does not currently allow a command line or environment
override of CONFIGDIR, so this is a workaround that patches dpkg such that any
failure to access CONFIGDIR is tolerated and treated the same as if the
directory were empty. In OpenEmbedded, dpkg-native is always passed command
line arguments and the CONFIGDIR is empty, so this does not cause an issue for
the way OpenEmbedded uses dpkg-native.

This is a workaround that can be removed when dpkg grows the ability to
override the CONFIGDIR at runtime, which has been discussed.

Signed-off-by: Anders Oleson <anders@openpuma.org>
---
 .../dpkg/dpkg/allow-inaccessible-config-dir.patch  | 26 ++++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.18.7.bb          |  4 +++-
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/allow-inaccessible-config-dir.patch

diff --git a/meta/recipes-devtools/dpkg/dpkg/allow-inaccessible-config-dir.patch b/meta/recipes-devtools/dpkg/dpkg/allow-inaccessible-config-dir.patch
new file mode 100644
index 0000000..fca0c16
--- /dev/null
+++ b/meta/recipes-devtools/dpkg/dpkg/allow-inaccessible-config-dir.patch
@@ -0,0 +1,26 @@
+continue rather than fail if unable to access CONFIGDIR
+
+Signed-off-by: Anders Oleson <anders@openpuma.org>
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Note: a more comprehensive fix to dpkg will be to add a feature that allows a
+command line override of the hard-coded CONFIGDIR (/etc/dpkg/dpkg.cfg.d).
+Once that happens, this patch should be removed.
+
+Index: dpkg-1.18.7/lib/dpkg/options.c
+===================================================================
+--- dpkg-1.18.7.orig/lib/dpkg/options.c
++++ dpkg-1.18.7/lib/dpkg/options.c
+@@ -172,11 +172,8 @@ dpkg_options_load_dir(const char *prog,
+ 
+   dlist_n = scandir(dirname, &dlist, valid_config_filename, alphasort);
+   if (dlist_n < 0) {
+-    if (errno == ENOENT) {
+       free(dirname);
+       return;
+-    } else
+-      ohshite(_("error opening configuration directory '%s'"), dirname);
+   }
+ 
+   for (i = 0; i < dlist_n; i++) {
diff --git a/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb b/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb
index 28fdc13..73d1064 100644
--- a/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb
+++ b/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb
@@ -13,7 +13,9 @@ SRC_URI = "http://snapshot.debian.org/archive/debian/20160509T100042Z/pool/main/
            file://0005-dpkg-compiler.m4-remove-Wvla.patch \
            file://0006-add-musleabi-to-known-target-tripets.patch \
            "
-SRC_URI_append_class-native = " file://glibc2.5-sync_file_range.patch "
+SRC_URI_append_class-native = " file://glibc2.5-sync_file_range.patch \
+           file://allow-inaccessible-config-dir.patch \
+           "
 
 SRC_URI[md5sum] = "073dbf2129a54b0fc627464bf8af4a1b"
 SRC_URI[sha256sum] = "ace36d3a6dc750a42baf797f9e75ec580a21f92bb9ff96b482100755d6d9b87b"
-- 
1.9.1


