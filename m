Return-Path: <kergoth@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 780E06A9D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 20:46:52 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id v19so10700294obq.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 13:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/9OF1mk3AaeTJkGQziWPDjGmh4Utp3T9YI0QEhZy7vc=;
	b=Ym5ju3W6+krc31BvbBk1OEyeM6CMaO+7aqysFj/hhxJ9xXDz4ixO4lqSdS8tp1hqnu
	QpuHgbs8UtPLL86q0TmvXVu/OHI+nNJNbFjVCM4Esl6257d37TR07aray/03+jDZpCNI
	qxI0g1w3jJv0IZy+8RBd/gvu9JO1OtD/lpXNZTcRE5TXTNdkNmmliT3Qqg19RM838cSx
	w5dwsYDQq8X78c/8nNLvDKabBbfInTIXRQgYrRAx1whS1qedpMtXZ2A2lMhnsAz6JUo+
	Jr6qpZ4Jdf/NcSAyIvuEdSKh5jOhQaiWMdueWx9pTDPq+1ycWghBmlrnaYW/LMgBaq+Z
	6VZg==
X-Received: by 10.60.35.136 with SMTP id h8mr9888221oej.129.1370897213521;
	Mon, 10 Jun 2013 13:46:53 -0700 (PDT)
Received: from precise64.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id z5sm24272820obw.4.2013.06.10.13.46.51
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 13:46:52 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jun 2013 13:46:51 -0700
Message-Id: <41516af35242f86839c1afe0e9735061a2bdf5b0.1370896985.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3
In-Reply-To: <cover.1370896985.git.chris_larson@mentor.com>
References: <cover.1370896985.git.chris_larson@mentor.com>
In-Reply-To: <cover.1370896985.git.chris_larson@mentor.com>
References: <cover.1370896985.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/4] avahi: inherit python classes, use PACKAGECONFIG
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
X-List-Received-Date: Mon, 10 Jun 2013 20:46:52 -0000

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


