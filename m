Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 23BD9725D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 15:26:29 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id k14so1531527wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 07:26:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=4syEZIu7NcCt6tRF2HfBrhc1iJdaBRxhJtYXMzy1/BE=;
	b=JJrXRVuRktHNrxuEslOjAyGVk1J2xmdO2wfktRqSBVrwq3A1KfPhbW3tA5gfvr3LYW
	CYXMUDY/5QdqUHaT2INQF9BXzf2vjg5wmZgMSoRr6p3ojrcnX3FJ4lww1UcOTL1PHAmB
	7TtRgBOJYzl/qRSloP8gznmfQ/zP9oeO69GHMm+d5hzOUiGIm7qfJ5lejVPqqWyOdNUX
	x4nDxgMq0U0zrNZwkC5NerHntBIcOD3VMD3FyGIyw5BAH1qqkPKU13OEUfVIVcCLM6Yz
	yiW9pA1ii7Dc5bf1DZ2C8p9oCEN40yjE/CMdY5NHGX+6P4mYCcobtXbjUk5ytYdKYnlJ
	Zs7A==
X-Gm-Message-State: ALoCoQm/ODOXndrLyrc5urgNBTHG+ZvdkApr4DN5i2odalk+FVQWYOI7AWoih0kzdp3FNk5PP72h
X-Received: by 10.194.61.168 with SMTP id q8mr61790025wjr.53.1418743589778;
	Tue, 16 Dec 2014 07:26:29 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id h13sm17332578wiw.4.2014.12.16.07.26.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Dec 2014 07:26:28 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Dec 2014 15:25:41 +0000
Message-Id: <1418743541-17587-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] connman: use PACKAGECONFIG to control systemd option
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
X-List-Received-Date: Tue, 16 Dec 2014 15:26:33 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index f121a81..ddabdb9 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -27,10 +27,10 @@ EXTRA_OECONF += "\
     --enable-test \
     --disable-polkit \
     --enable-client \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--with-systemdunitdir=', d)} \
 "
 
 PACKAGECONFIG ??= "wispr \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd','systemd', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi','wifi', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth','bluetooth', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', '3g','3g', '', d)} \
@@ -40,6 +40,7 @@ PACKAGECONFIG ??= "wispr \
 # local.conf or distro config
 # PACKAGECONFIG_append_pn-connman = " openvpn vpnc l2tp pptp"
 
+PACKAGECONFIG[systemd] = "--with-systemdunitdir=${systemd_unitdir}/system/,--with-systemdunitdir="
 PACKAGECONFIG[wifi] = "--enable-wifi, --disable-wifi, wpa-supplicant"
 PACKAGECONFIG[bluetooth] = "--enable-bluetooth, --disable-bluetooth, bluez4"
 PACKAGECONFIG[3g] = "--enable-ofono, --disable-ofono, ofono"
-- 
1.7.10.4


