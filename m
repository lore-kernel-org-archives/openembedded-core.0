Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id A6E52786B5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 12:00:20 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id j21-v6so17593795wmh.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 04:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IR38tQssAZIMc150wgojXgV6CQjG/nh8BxF59h0/PWU=;
	b=lAc+U+lrz/TKoNKK9mh5aP20EBP+8/+O5PgJCnHGAIbjklZ44CCGoytUtqEoGRlVzq
	fnV54OwgaXzHUOx4S0pUPfOW6Xi+d8FvUKQKLc7Q8DW5cVX+r1RaR72t7qqDfM9t6Ews
	ffTg0Oe6t0x8bTK5dPzTk9EmhzRLFVqOMpCmXwLqK6unHjAX9W0F/4TbF5phhKz1Oi9k
	zyBEbtgObXXvdOyQ/gWK+5ZFw48CWT9CFD8HhKGI1Uth20CCkCHgpieDMwD683V4aYwc
	YMMK/HmHV9QwjhpK94oyr7cc7k7jqHRVKCG1o96y6HxJkBXqfW9clgMzvGc4O6TTxDRo
	CR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IR38tQssAZIMc150wgojXgV6CQjG/nh8BxF59h0/PWU=;
	b=htV3AV+cwxEImwl400DQtAN4AD+J7JbuVKUEVqqCVm6Q2v3O2Wo4ifGflFLTaYBR8m
	Knldc4gEku1/sKU1qEbz2f5f+j1SLvDJ1asQqhSWXwxCgafHhKg5GEnlBFZWML9aTVx4
	U6Z84d+Iw8Z0uB7XuCXXYvZ0FpmjzgQejp3GIpxTrfXBQ4GbPGCRT+xJkAPAU95WMF1C
	vAAUEQnldLJ/ZUKyLb0XgOMBITq9QtPwJBcCRi8U5xtjCDxtHjNfiKrcfddTHbnnE4Lk
	kdMzsydqcsxVMY0UuWoEZuPJ4gOj12suk1tBI2NRzsdA+ffkUUuZQRF7AtyqC694I757
	B6Dg==
X-Gm-Message-State: APf1xPC+35Hc+DinYXvRAtX9c0ApcujTxIGR2ry/P8iih8Gov55FsK2M
	C/jt/AXIUQek0yDluY04mNjXMMD1
X-Google-Smtp-Source: AH8x226OhxpOBivBUHSoU7B2Nb8p9SSOT6NsNf3c/XYfXpOfeZvRhYkbXbfYiZXHI+Cx9bxTcf4q2Q==
X-Received: by 10.28.141.144 with SMTP id p138mr1799254wmd.58.1517918421569;
	Tue, 06 Feb 2018 04:00:21 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 7sm8327657wmq.42.2018.02.06.04.00.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Feb 2018 04:00:20 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Feb 2018 11:59:53 +0000
Message-Id: <20180206115954.1780-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180206115954.1780-1-ross.burton@intel.com>
References: <20180206115954.1780-1-ross.burton@intel.com>
Subject: [PATCH 3/4] pigz: pigz is not gzip
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
X-List-Received-Date: Tue, 06 Feb 2018 12:00:21 -0000

Whilst pigz is effectively a parallel gzip, the command line arguments are not
the same so pigz isn't a drop-in replacement for gzip.

[ YOCTO #12139 ]
[ YOCTO #12410 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/default-providers.inc |  1 -
 meta/recipes-extended/pigz/pigz_2.4.bb         | 21 +--------------------
 2 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index c1cc97fccc7..e65c1ed323d 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -42,7 +42,6 @@ PREFERRED_PROVIDER_opkg ?= "opkg"
 PREFERRED_PROVIDER_opkg-native ?= "opkg-native"
 PREFERRED_PROVIDER_nativesdk-opkg ?= "nativesdk-opkg"
 PREFERRED_PROVIDER_console-tools ?= "kbd"
-PREFERRED_PROVIDER_gzip-native ?= "pigz-native"
 PREFERRED_PROVIDER_udev ?= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','eudev',d)}"
 PREFERRED_RPROVIDER_bluez-hcidump ?= "${@bb.utils.contains('DISTRO_FEATURES','bluetooth bluez5','bluez5','bluez-hcidump',d)}"
 # Alternative is ltp-ddt in meta-oe: meta-oe/recipes-devtools/ltp-ddt/ltp-ddt_0.0.4.bb
diff --git a/meta/recipes-extended/pigz/pigz_2.4.bb b/meta/recipes-extended/pigz/pigz_2.4.bb
index cb41154dafe..20e4154434f 100644
--- a/meta/recipes-extended/pigz/pigz_2.4.bb
+++ b/meta/recipes-extended/pigz/pigz_2.4.bb
@@ -8,8 +8,6 @@ SECTION = "console/utils"
 LICENSE = "Zlib & Apache-2.0"
 LIC_FILES_CHKSUM = "file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline=7;endline=21"
 
-PROVIDES_class-native += "gzip-native"
-
 SRC_URI = "https://github.com/madler/pigz/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz"
 SRC_URI[md5sum] = "3c8a601db141d3013ef9fe5f2daaf73f"
 SRC_URI[sha256sum] = "e228e7d18b34c4ece8d596eb6eee97bde533c6beedbb728d07d3abe90b4b1b52"
@@ -21,9 +19,7 @@ DEPENDS = "zlib"
 
 EXTRA_OEMAKE = "-e MAKEFLAGS="
 
-inherit update-alternatives
-
-do_install_class-target() {
+do_install() {
 	# Install files into /bin (FHS), which is typical place for gzip
 	install -d ${D}${base_bindir}
 	install ${B}/pigz ${D}${base_bindir}/pigz
@@ -31,19 +27,4 @@ do_install_class-target() {
 	ln -nsf pigz ${D}${base_bindir}/pigzcat
 }
 
-do_install() {
-	install -d ${D}${bindir}
-	install ${B}/pigz ${D}${bindir}/gzip
-	ln -nsf gzip ${D}${bindir}/gunzip
-	ln -nsf gzip ${D}${bindir}/zcat
-}
-
-ALTERNATIVE_PRIORITY = "80"
-ALTERNATIVE_${PN} = "gunzip gzip zcat"
-ALTERNATIVE_${PN}_class-nativesdk = ""
-ALTERNATIVE_LINK_NAME[gunzip] = "${base_bindir}/gunzip"
-ALTERNATIVE_LINK_NAME[gzip] = "${base_bindir}/gzip"
-ALTERNATIVE_LINK_NAME[zcat] = "${base_bindir}/zcat"
-ALTERNATIVE_TARGET = "${base_bindir}/pigz"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.11.0


