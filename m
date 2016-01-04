Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id DB2CF731D1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 10:23:38 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id b14so177429808wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jan 2016 02:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZMGqRlsxpdj3ni0wOUbQiz6ShI0Fow0X9LX5NwOJs8o=;
	b=ggJbKjP/j3L2C35sxsyHZP5VS17kLkTv2KmYhFAous2lml5RBnS6tXjOGYFH8dy7FX
	YAozVcI3AQGXdIaGKxtePzQXCSJWyObKd3i2b7mJg2fgY8h1FKmnCjbkstT5LDDlCpU9
	gBQLsiT5m4PyAs1hqwHrXeXYhERn1CZ+W6OiagKqBr5oWLbE7ac/H0O/8gcXqXHUOD1c
	MNSkPr15JFk/Q5JB89n9a5C2glYIDWhsztIZOyOLo96tRDiS45uGaDRg/eDRIq79GVXA
	eVFvkFrjw6ZZKdldl3IepLxRABx0RD043+SvjRl/b7mUcC37QunEjGanysfLwMFlNThO
	phMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZMGqRlsxpdj3ni0wOUbQiz6ShI0Fow0X9LX5NwOJs8o=;
	b=MOAe+HS4OOI3TaVz8+P66kv7MGNyAbOilOBBkwQ0KjWl27c4ufbas65T7aQuu+U/Gu
	SdMh7HhrAYLPPWz+vs3FAi9QV+qnocutsBX5yoZwLuKXBm9UFD9fLG1UyGP6u2LixiqQ
	p+agEyNOviGSfSmRgWNLNOptxLCWlvQ0lbBkk1zoX5gKrFOmNBB/HJ8hCTjpL3x7glKZ
	aExF6nf2ediHnqBZ7rDC2Ekbh2/3kxmki1WNlCcpxTEqP2+kt6OsweMmlZWdjbMmHiSp
	b+qSfFdSI3vksALXjXqZrx4MvwWo9BHDUeZ83SFydyqFHDxD9547yiOvTze24+YohR5Z
	9sag==
X-Gm-Message-State: ALoCoQkWgHDOnm8xhbL7mASrPxJNTaHmVHu/6JYFz95TgnDd/zmGVqkaV2P86VaGjN7gIrShuBNjUgR3E/MhQ4d9L0z7dP/B8Q==
X-Received: by 10.194.184.104 with SMTP id et8mr102354366wjc.87.1451903018825; 
	Mon, 04 Jan 2016 02:23:38 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z65sm36901949wmg.10.2016.01.04.02.23.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 Jan 2016 02:23:38 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jan 2016 10:23:32 +0000
Message-Id: <1451903012-22560-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1451903012-22560-1-git-send-email-ross.burton@intel.com>
References: <1451903012-22560-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] systemd: add more compression and importd PACKAGECONFIGs
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
X-List-Received-Date: Mon, 04 Jan 2016 10:23:39 -0000

Add explicit PACKAGECONFIGs for all of compression formats that systemd can
detect at configure time, and an explicit enable/disable for importd.  importd
defaults to disabled as it needs curl and all the compression formats to be
enabled.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/systemd/systemd_228.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_228.bb b/meta/recipes-core/systemd/systemd_228.bb
index 0f95390..6673042 100644
--- a/meta/recipes-core/systemd/systemd_228.bb
+++ b/meta/recipes-core/systemd/systemd_228.bb
@@ -70,13 +70,13 @@ PACKAGECONFIG[gcrypt] = "--enable-gcrypt,--disable-gcrypt,libgcrypt"
 # regardless of PACKAGECONFIG, libgcrypt is always required to expand
 # the AM_PATH_LIBGCRYPT autoconf macro
 DEPENDS += "libgcrypt"
-# Compress the journal
-PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
 PACKAGECONFIG[cryptsetup] = "--enable-libcryptsetup,--disable-libcryptsetup,cryptsetup"
 PACKAGECONFIG[microhttpd] = "--enable-microhttpd,--disable-microhttpd,libmicrohttpd"
 PACKAGECONFIG[elfutils] = "--enable-elfutils,--disable-elfutils,elfutils"
 PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
 PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
+# importd requires curl/xz/zlib/bzip2/gcrypt
+PACKAGECONFIG[importd] = "--enable-importd,--disable-importd"
 PACKAGECONFIG[libidn] = "--enable-libidn,--disable-libidn,libidn"
 PACKAGECONFIG[audit] = "--enable-audit,--disable-audit,audit"
 PACKAGECONFIG[manpages] = "--enable-manpages,--disable-manpages,libxslt-native xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
@@ -92,6 +92,10 @@ PACKAGECONFIG[qrencode] = "--enable-qrencode,--disable-qrencode,qrencode"
 PACKAGECONFIG[compat] = "--enable-compat-libs,--disable-compat-libs"
 PACKAGECONFIG[dbus] = "--enable-dbus,--disable-dbus,dbus"
 PACKAGECONFIG[coredump] = "--enable-coredump,--disable-coredump"
+PACKAGECONFIG[bzip2] = "--enable-bzip2,--disable-bzip2,bzip2"
+PACKAGECONFIG[lz4] = "--enable-lz4,--disable-lz4,lz4"
+PACKAGECONFIG[xz] = "--enable-xz,--disable-xz,xz"
+PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_KILL=${base_bindir}/kill"
 CACHED_CONFIGUREVARS += "ac_cv_path_KMOD=${base_bindir}/kmod"
-- 
2.6.4


