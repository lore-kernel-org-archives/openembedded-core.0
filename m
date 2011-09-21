Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dbaryshkov@gmail.com>) id 1R6Rnl-0001GH-3y
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 20:45:45 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so2123662bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Sep 2011 11:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=cXpNDCi8pJeh03YK9pG9ubZKyyk1G+RacGvTSI2YmhQ=;
	b=VvUrgrTlX02k29OWeFjBmsLrDYn88doDNw4DGYkyXkz7bOm0VqdHm9ctQFLmXlDjM2
	ySlJ4hr+OkWC7sXrvi/NWa/AQ7NcudhKId0SPx4n4rCuxYypnuWXRTN+mKkFE91Hswfv
	iDuVS3qtQDr43dYBUipbiragO/NFlq5d+67Ck=
Received: by 10.204.5.89 with SMTP id 25mr861137bku.16.1316630428269;
	Wed, 21 Sep 2011 11:40:28 -0700 (PDT)
Received: from localhost.localdomain ([194.85.238.22])
	by mx.google.com with ESMTPS id t16sm5806554bkv.11.2011.09.21.11.40.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 11:40:27 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 22:39:55 +0400
Message-Id: <1316630404-10336-8-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
References: <1316630404-10336-1-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Subject: [PATCH 08/17] polkit: fixup packaging
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Sep 2011 18:45:45 -0000

1) Drop static versions of extensions, as there is no point in them
2) For completeness include .la files for extensions into polkit-dev

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 meta/recipes-extended/polkit/polkit_0.101.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-extended/polkit/polkit_0.101.bb b/meta/recipes-extended/polkit/polkit_0.101.bb
index 06ca595..b5f2e28 100644
--- a/meta/recipes-extended/polkit/polkit_0.101.bb
+++ b/meta/recipes-extended/polkit/polkit_0.101.bb
@@ -11,7 +11,7 @@ SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
            ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
 
 PAM_SRC_URI = "file://polkit-1_pam.patch"
-PR = "r1"
+PR = "r2"
 DEPENDS = "libpam expat dbus-glib eggdbus intltool-native"
 RDEPENDS_${PN} = "libpam"
 EXTRA_OECONF = "--with-authfw=pam --with-os-type=moblin --disable-man-pages --disable-gtk-doc --disable-introspection"
@@ -22,6 +22,11 @@ FILES_${PN} += "${libdir}/${PN}-1/extensions/*.so \
                 ${datadir}/${PN}-1/actions/* \
                 ${datadir}/dbus-1/system-services/*"
 FILES_${PN}-dbg += "${libdir}/${PN}-1/extensions/.debug/*.so"
+FILES_${PN}-dev += "${libdir}/${PN}-1/extensions/*.la "
+
+do_install_append() {
+	rm -f ${D}${libdir}/${PN}-1/extensions/*.a
+}
 
 SRC_URI[md5sum] = "f925ac93aba3c072977370c1e27feb7f"
 SRC_URI[sha256sum] = "927f65760e4fce23d7cdeae90245c22986eb0a39335a344915302158f73f9f1b"
-- 
1.7.2.5



