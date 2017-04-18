Return-Path: <marc.ferland@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 55FAB71C72
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 13:20:29 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id x86so32990197ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 06:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ahN0plfS332klbmBv2+IEwuIPrU4NN93fWVDIRM9HLM=;
	b=UBHZa76mYLtvcI/MeFTVToNwEEonnAGZBmVGmjIJANM8Z+86DC/nxl15Q0MVRv9AHh
	+Vn3bphBGpPJM+WfEMcJwH0ZcwUoYNpv49WC8hpZZ3n5iQEu7t6N3h2A4+ERfr91xZkX
	43Zao37XSj9onwZgr3ii2Dv+owcabD5zhWmLUZmP9lakMwkNZ99yBFqWkAnCrHC3bAzR
	hPt+A8vDedqXEhZkcbsiGpPvK6tS3mv2fHVI0+LtORLZ2wZ3r+aFoKT+0JsE89BgyAr3
	x1au+VmOEynOCRcC5QiEePs0KLVpEJixw9oezeXrfxpqxAffU07ozrJ0J50P2uLnPSqN
	4bhg==
X-Gm-Message-State: AN3rC/7ymyeQH19EzlaLN4RwzhBSirz1I+czyOsz3FQpszNY/tyJHaYQ
	a8DeUwj2O/N0sc3T
X-Received: by 10.36.156.2 with SMTP id b2mr13394383ite.4.1492521630667;
	Tue, 18 Apr 2017 06:20:30 -0700 (PDT)
Received: from marc-desktop.AMOTUS.local
	(modemcable182.194-37-24.static.videotron.ca. [24.37.194.182])
	by smtp.gmail.com with ESMTPSA id
	m124sm4879865itd.3.2017.04.18.06.20.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Apr 2017 06:20:30 -0700 (PDT)
From: Marc Ferland <ferlandm@amotus.ca>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Apr 2017 09:20:06 -0400
Message-Id: <1492521609-26624-6-git-send-email-ferlandm@amotus.ca>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1492521609-26624-1-git-send-email-ferlandm@amotus.ca>
References: <1492521609-26624-1-git-send-email-ferlandm@amotus.ca>
Subject: [PATCHv3 5/8] bluez5: add PACKAGECONFIG option for cups
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
X-List-Received-Date: Tue, 18 Apr 2017 13:20:29 -0000

Signed-off-by: Marc Ferland <ferlandm@amotus.ca>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 71a5016..c8a240f 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -18,6 +18,7 @@ PACKAGECONFIG[readline] = "--enable-client,--disable-client,readline,"
 PACKAGECONFIG[testing] = "--enable-testing,--disable-testing"
 PACKAGECONFIG[midi] = "--enable-midi,--disable-midi,alsa-lib"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd"
+PACKAGECONFIG[cups] = "--enable-cups,--disable-cups,,cups"
 
 SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
@@ -34,7 +35,6 @@ inherit autotools pkgconfig systemd update-rc.d distro_features_check ptest
 EXTRA_OECONF = "\
   --enable-tools \
   --enable-deprecated \
-  --disable-cups \
   --enable-test \
   --enable-datafiles \
   --enable-library \
@@ -82,7 +82,11 @@ do_install_append() {
 
 PACKAGES =+ "${PN}-testtools ${PN}-obex ${PN}-noinst-tools"
 
-FILES_${PN} += "${libdir}/bluetooth/plugins/*.so ${systemd_unitdir}/ ${datadir}/dbus-1"
+FILES_${PN} += " \
+    ${libdir}/bluetooth/plugins/*.so \
+    ${systemd_unitdir}/ ${datadir}/dbus-1 \
+    ${libdir}/cups \
+"
 FILES_${PN}-dev += "\
   ${libdir}/bluetooth/plugins/*.la \
 "
-- 
2.7.4


