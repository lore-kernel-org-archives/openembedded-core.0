Received: from mail-gg0-f176.google.com ([209.85.161.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1U78bU-00076o-Np
	for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 19:04:44 +0100
Received: by mail-gg0-f176.google.com with SMTP id q6so432656ggc.35
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2013 09:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=kDsuN6EKzvmImmEhjKFOs+70LfL7AKZzgMI/OY+CkZg=;
	b=jw/raEiVwquw76lKrburF7PSiD5dN+X9Z1QM3w4mjQ2l7Wsn7wY0Lo4WAnmU/kIwSV
	Riv9bEE/6QOIXhgTk0guzGCn9dpJ3lD5N96XuFmsdznWKvK8H4Nxus/AnWZrHigfi5Mz
	M87d/JEVrWtMJFTeD0VGOPoJad/KJu111h4Oc1c9UE4cyNzsKsOLS/jZa2grPjzG+coi
	EJDN34D8x3BDN+sjL/czMfWoEaoBVPcvVJvn1ETncTGBYoJuF6r2Vq+bgmwQVSTCkC2X
	Kj03RWIN8o3xpRvUmjEVLe4nogZ4yoMJ7pcbwlpDRvYNMZLN7zPw8hehHjhMQi9vHlWK
	4xIg==
X-Received: by 10.236.122.7 with SMTP id s7mr15766479yhh.70.1361123316531;
	Sun, 17 Feb 2013 09:48:36 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([187.23.144.59])
	by mx.google.com with ESMTPS id j1sm108579298yhn.3.2013.02.17.09.48.33
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 09:48:35 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Feb 2013 14:53:09 -0300
Message-Id: <1361123592-32572-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1361123592-32572-1-git-send-email-otavio@ossystems.com.br>
References: <1361123592-32572-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 2/5] dbus: Drop x11 support from nativesdk
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Feb 2013 18:05:21 -0000

This avoid a libx11 dependency for nativesdk as it is not intended to
be run in the toolchain. We also remove the dbus-launch as without x11
support it might case trouble for user

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/dbus/dbus.inc | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/dbus.inc
index 292ab29..4897fd3 100644
--- a/meta/recipes-core/dbus/dbus.inc
+++ b/meta/recipes-core/dbus/dbus.inc
@@ -8,11 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=10dded3b58148f3f1fd804b26354af3e \
 X11DEPENDS = "virtual/libx11 libsm"
 DEPENDS = "expat virtual/libintl ${@base_contains('DISTRO_FEATURES', 'x11', '${X11DEPENDS}', '', d)}"
 DEPENDS_class-native = "expat-native virtual/libintl-native"
-DEPENDS_class-nativesdk = "nativesdk-expat virtual/nativesdk-libintl virtual/libx11"
+DEPENDS_class-nativesdk = "nativesdk-expat virtual/nativesdk-libintl"
 RDEPENDS_dbus = "${@base_contains('DISTRO_FEATURES', 'ptest', 'dbus-ptest', '', d)}"
 RDEPENDS_class-native = ""
 
-INC_PR = "r5"
+INC_PR = "r6"
 
 SRC_URI = "http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz \
            file://tmpdir.patch; \
@@ -126,5 +126,9 @@ do_install_class-native() {
 
 do_install_class-nativesdk() {
 	autotools_do_install
+
+	# dbus-launch has no X support so lets not install it in case the host
+	# has a more featured and useful version
+	rm -f ${D}${bindir}/dbus-launch
 }
 BBCLASSEXTEND = "native nativesdk"
-- 
1.8.1



