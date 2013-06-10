Return-Path: <kergoth@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 83AB26A9A1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 23:15:50 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id y14so5031153pdi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 16:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/9OF1mk3AaeTJkGQziWPDjGmh4Utp3T9YI0QEhZy7vc=;
	b=MqWwh58eZKB1AyFqmB5nLzhqbaCyOqL8oFYnR0UWYgHlv2HrcgmlZ5AYjW3hV11Sfx
	JBnrgS1U96XI8lNX4LnpR2MinSF29sszg3S8zJRSYWAHTAo48uWQQJVZ/ZozF8rdXsDD
	3ipNoyO+5HraEGw9yZFpmICifpDNWye0gaiJQc++uILZhM46B3yRxfIH82zpArMCk1Ct
	+Dj/EN/2F0Jh7eAHh+lzYI4QCdnVyApdEBBGqs52fou355DroXeCxG1PG7lnJoK9aCEd
	EtYf7hYjx/IsikzhZV0qoIqGMBuLKZjsD+rvxKIfjTotnn924SyA1Sqa0fprPFjYXQ4Z
	IZNA==
X-Received: by 10.68.232.136 with SMTP id to8mr12042079pbc.9.1370906151721;
	Mon, 10 Jun 2013 16:15:51 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	nz3sm11887957pbb.33.2013.06.10.16.15.49 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 16:15:50 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 16:15:49 -0700
Message-Id: <0f019edce58d8226948dc7e7e9d4fe9ec04a8c5f.1370906102.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1370906102.git.chris_larson@mentor.com>
References: <cover.1370906102.git.chris_larson@mentor.com>
In-Reply-To: <cover.1370906102.git.chris_larson@mentor.com>
References: <cover.1370906102.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH v2 3/4] avahi: inherit python classes, use PACKAGECONFIG
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
X-List-Received-Date: Mon, 10 Jun 2013 23:15:50 -0000

From: Christopher Larson <chris_larson@mentor.com>

Without using our python classes and having appropriate dependencies, the
build is nondeterministic, and whether a python-avahi package is produced will
vary depending on the host environment, yet avahi-discover is always produced,
and it depends on python-avahi.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
index 7d56dad..557c1c1 100644
--- a/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
+++ b/meta/recipes-connectivity/avahi/avahi-ui_0.6.31.bb
@@ -6,6 +6,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1 \
 
 require avahi.inc
 
+inherit python-dir pythonnative
+
+PACKAGECONFIG ??= "python"
+PACKAGECONFIG[python] = "--enable-python,--disable-python,python-native python"
+
 PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "2f22745b8f7368ad5a0a3fddac343f2d"
@@ -26,7 +31,7 @@ FILES_${PN}-staticdev += "${libdir}/libavahi-ui.a"
 
 FILES_${PN}-utils = "${bindir}/b* ${datadir}/applications/b*"
 
-FILES_python-avahi = "${PYTHON_SITEPACKAGES_DIR}/avahi/*"
+FILES_python-avahi = "${PYTHON_SITEPACKAGES_DIR}/avahi ${PYTHON_SITEPACKAGES_DIR}/avahi_discover"
 FILES_avahi-discover = "${bindir}/avahi-discover \
                         ${datadir}/applications/avahi-discover.desktop \
                         ${datadir}/avahi/interfaces/avahi-discover*"
@@ -34,7 +39,7 @@ FILES_avahi-discover-standalone = "${bindir}/avahi-discover-standalone \
                                    ${datadir}/avahi/interfaces/avahi-discover.glade"
 
 RDEPENDS_avahi-discover = "python-avahi python-pygtk"
-RDEPENDS_python-avahi = "python-dbus"
+RDEPENDS_python-avahi = "python-core python-dbus"
 
 
 do_install_append () {
-- 
1.8.3


