Return-Path: <paul.betafive@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id E137472505
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 22:12:13 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id b13so5353251wgh.32
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Dec 2014 14:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ao+Gzy22jiVGAOkxoBUfTQXCm0wKaecmnyz/eU7uYkk=;
	b=02Yd2u6HEV4FxRMz8II/mFs6tzI4FRFH/0kya0NNYFryfcgmVhIdFjj4cQuBW+hWBh
	+IHyqclB+BLPSGe3BUALiKEqoosPq6fv4dzP3Wud/soYQY/B5fbaQODlIFTXe8tlG5aO
	V0a82PJ/JcPgzfCSlmX5GQW1sCqgUXl+PMVv2Dk/Ut+XTCG/kxbNBilQB9HPKhZ6S0vH
	tYRsaGUl2xK+qdoUXEwvQ/WqdQJRAzouJdPW7oPxgz2y/tUbv343JhfKJHSrddHMbpnA
	13BkycpdHNMKf7DGKuY+0M8JDlucG34Oe7IyLF5X8tnDSy9g12Fz2LExP9b0TtId95Gn
	Lylw==
X-Received: by 10.194.2.75 with SMTP id 11mr36993785wjs.78.1419199933693;
	Sun, 21 Dec 2014 14:12:13 -0800 (PST)
Received: from nuc.betafive.co.uk
	(cpc19-shep11-2-0-cust55.8-3.cable.virginm.net. [81.111.243.56])
	by mx.google.com with ESMTPSA id
	kn5sm21350509wjb.48.2014.12.21.14.12.12
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Dec 2014 14:12:13 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Dec 2014 22:11:55 +0000
Message-Id: <1419199917-27913-7-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1419199917-27913-1-git-send-email-paul@paulbarker.me.uk>
References: <1419199917-27913-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH 6/8] poky-feed-config-opkg: Remove
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
X-List-Received-Date: Sun, 21 Dec 2014 22:12:15 -0000

This recipe was not usable as-is. A much better way of configuring package feeds
for opkg is provided by the distro-feed-config recipe in meta-oe.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../feed-config/poky-feed-config-opkg_1.0.bb       | 44 ----------------------
 1 file changed, 44 deletions(-)
 delete mode 100644 meta/recipes-core/feed-config/poky-feed-config-opkg_1.0.bb

diff --git a/meta/recipes-core/feed-config/poky-feed-config-opkg_1.0.bb b/meta/recipes-core/feed-config/poky-feed-config-opkg_1.0.bb
deleted file mode 100644
index fb312f8..0000000
--- a/meta/recipes-core/feed-config/poky-feed-config-opkg_1.0.bb
+++ /dev/null
@@ -1,44 +0,0 @@
-SUMMARY = "Poky example feed configuration"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r2"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-INHIBIT_DEFAULT_DEPS = "1"
-
-#FEEDNAMEPREFIX ?= "INVALID"
-#FEEDURIPREFIX ?= "INVALID"
-
-do_compile() {
-	mkdir -p ${S}/${sysconfdir}/opkg/
-
-	archconf=${S}/${sysconfdir}/opkg/arch.conf
-
-	rm -f $archconf
-	ipkgarchs="${ALL_MULTILIB_PACKAGE_ARCHS}"
-	priority=1
-	for arch in $ipkgarchs; do 
-		echo "arch $arch $priority" >> $archconf
-		priority=$(expr $priority + 5)
-	done
-
-	basefeedconf=${S}/${sysconfdir}/opkg/base-feeds.conf
-
-	rm -f $basefeedconf
-	touch $basefeedconf
-
-	#for arch in $ipkgarchs; do
-	#        echo "src/gz ${FEEDNAMEPREFIX}-$arch http://pokylinux.org/${FEEDURIPREFIX}$arch" >> $basefeedconf
-	#done
-}
-
-
-do_install () {
-	install -d ${D}${sysconfdir}/opkg
-	install -m 0644  ${S}/${sysconfdir}/opkg/* ${D}${sysconfdir}/opkg/
-}
-
-FILES_${PN} = "${sysconfdir}/opkg/ "
-
-CONFFILES_${PN} += "${sysconfdir}/opkg/base-feeds.conf \
-                    ${sysconfdir}/opkg/arch.conf"
-
-- 
1.9.1


