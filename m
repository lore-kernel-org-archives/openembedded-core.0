Return-Path: <kergoth@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 9A58A6A5B4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 01:49:30 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id un1so3739427pbc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 18:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=DtFZQTTIEK+GZYLgVzBmPrV+kMFzdsHYMv8JQbblrIc=;
	b=rxzIQm6SaE3/XzVE86nz+8SesonrQ+uhdgvWgNekB3ymUq4Ynpy+nyiq987LUuVwFJ
	r3sDb0us1HeudgXM2rHDlJW1p3CN82wFnjAjjrWTUmbN1XSyGE8vVe4j9YkePUzYvwWT
	cBqWuOdZ7h7R+3bctDnLB9R2tGUfx2dWht+U2OGAbyGGwf2ogE/WC4TqMdL4qdx3W4mv
	VSGMyPEdeVnyJ5KrB6mLTDyaAc3JH42mQQDMMes7zD0VVUWxJynsWrI47ZEMnP5y+LKu
	h0OItLNyXNLFA7QajzNG6ofNNs9oVZfHTNymJJYhoQ2OtV55aOgyhbtQ+Py/z04evKdm
	EU6w==
X-Received: by 10.68.108.163 with SMTP id hl3mr12095323pbb.160.1370915372009; 
	Mon, 10 Jun 2013 18:49:32 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id z19sm3388361paf.12.2013.06.10.18.49.29
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 18:49:31 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 18:49:31 -0700
Message-Id: <7f9158be5a4849dccea0ed848d29f963697c22e3.1370915304.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1370915304.git.chris_larson@mentor.com>
References: <cover.1370915304.git.chris_larson@mentor.com>
In-Reply-To: <cover.1370915304.git.chris_larson@mentor.com>
References: <cover.1370915304.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH v2 1/4] connman: use PACKAGECONFIG for WISPr support
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
X-List-Received-Date: Tue, 11 Jun 2013 01:49:30 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-connectivity/connman/connman.inc | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 0eb5865..f250d78 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -13,7 +13,7 @@ LICENSE  = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
                     file://src/main.c;beginline=1;endline=20;md5=d6a1ac98a6791c5294e8a7f176ecd66d"
 
-DEPENDS  = "dbus glib-2.0 ppp iptables gnutls"
+DEPENDS  = "dbus glib-2.0 ppp iptables"
 
 INC_PR = "r20"
 
@@ -32,7 +32,7 @@ EXTRA_OECONF += "\
     ${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdunitdir=${systemd_unitdir}/system/', '--with-systemdunitdir=', d)} \
 "
 
-PACKAGECONFIG ??= "\
+PACKAGECONFIG ??= "wispr \
                    ${@base_contains('DISTRO_FEATURES', 'wifi','wifi', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', 'bluetooth','bluetooth', '', d)} \
                    ${@base_contains('DISTRO_FEATURES', '3g','3g', '', d)} \
@@ -50,6 +50,8 @@ PACKAGECONFIG[openvpn] = "--enable-openvpn,--disable-openvpn,,openvpn"
 PACKAGECONFIG[vpnc] = "--enable-vpnc,--disable-vpnc,,vpnc"
 PACKAGECONFIG[l2tp] = "--enable-l2tp,--disable-l2tp,,xl2tpd"
 PACKAGECONFIG[pptp] = "--enable-pptp,--disable-pptp,,pptp-linux"
+# WISPr support for logging into hotspots, requires TLS
+PACKAGECONFIG[wispr] = "--enable-wispr,--disable-wispr,gnutls,"
 
 INITSCRIPT_NAME = "connman"
 INITSCRIPT_PARAMS = "start 05 5 2 3 . stop 22 0 1 6 ."
@@ -89,7 +91,9 @@ do_install_append() {
 
 	install -d ${D}${bindir}
 	install -m 0755 ${S}/tools/*-test ${D}${bindir}
-	install -m 0755 ${S}/tools/wispr ${D}${bindir}
+	if [ -e ${S}/tools/wispr ]; then
+		install -m 0755 ${S}/tools/wispr ${D}${bindir}
+	fi
 	install -m 0755 ${B}/client/connmanctl ${D}${bindir}
 
 	# We don't need to package an empty directory
-- 
1.8.3


