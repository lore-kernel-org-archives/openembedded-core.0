Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2B86372C3B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 22:15:47 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id m14so813029wev.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jan 2015 14:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ao+Gzy22jiVGAOkxoBUfTQXCm0wKaecmnyz/eU7uYkk=;
	b=tk3vTJsGtDHrurnGw4pjmOWePWMDi7R/U0SW5SfreWBzmOu8UAwh3vCf0KjqC7T+vU
	Ihb3mOXwzpMJluE+MysjcP879w5Y+e8FhTC4WYub6WbaH9ueqROvP+nfHvCZPw79rSLe
	OznsV04ptbI3sb0bz2+7GwDQDHHfTfDFomGIQ0KiMGdloHtYO0MSg0qrbjMahR/OSUjY
	DiZn231ckMP5e143Uo4p8s2zSQMDvpIPvuEMtvEjkzuspwNG1pncgt8UPmLgolgpydD9
	KHpv+cxJmP+KOR1xTy7e72qn7crtGf1mU2aiPWqlFuUdzm/pm6djvWx9Aw/+2caVEOTn
	6PfQ==
X-Received: by 10.194.93.5 with SMTP id cq5mr32319086wjb.84.1421446547709;
	Fri, 16 Jan 2015 14:15:47 -0800 (PST)
Received: from nuc.betafive.co.uk
	(cpc19-shep11-2-0-cust55.8-3.cable.virginm.net. [81.111.243.56])
	by mx.google.com with ESMTPSA id x6sm7664547wjf.24.2015.01.16.14.15.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Jan 2015 14:15:47 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: OE Core <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Jan 2015 22:15:27 +0000
Message-Id: <1421446529-24888-6-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1421446529-24888-1-git-send-email-paul@paulbarker.me.uk>
References: <1421446529-24888-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH V2 5/7] poky-feed-config-opkg: Remove
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
X-List-Received-Date: Fri, 16 Jan 2015 22:15:47 -0000

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


