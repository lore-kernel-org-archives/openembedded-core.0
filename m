Return-Path: <sebmennetrier@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3F92C6F348
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 10:44:23 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id f8so550610wiw.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2014 02:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=UJ2FQOYZE7ivRM/MTdGhyHO8Ctff26El25OFdUD06Oo=;
	b=oNuHOc964W1xUekFSql5gnbdolanTlwqcnJNK+u9wuI4zGSkDlgC45Kd36HGlGxfMj
	2L+Dq5zpBjHIN0HLs42r+YxQIizdTPOanTp5tUA4TxHvNnzUfuo3Wls+njYSNp55GzdU
	PouOe6gCDAgQ1hCoHKyZhYFJ5/CpqE/kTFHrJ4CC1R+33GPKfZHq6Fw+osmSdfutTljH
	JbA8tEiSpBJdJ0nAdOkXM/qBb6IE4e0IBrY3iB3XTTTm6JDEh0zp3cSkAtp2wzmNC3Vm
	EHgFycLuMfE75WoHNICdeS7QElHYjA2+p7tkhf3Ngc54ZPCwPmsbfQ4fsvszbM4WwitQ
	i/WA==
X-Received: by 10.180.98.71 with SMTP id eg7mr1802800wib.31.1393584264740;
	Fri, 28 Feb 2014 02:44:24 -0800 (PST)
Received: from smennetrier-desktop.mpl.mstarsemi.fr
	(connected-labs-gw1.ter2.neodc.mpl.cust.as8218.eu. [94.103.137.126])
	by mx.google.com with ESMTPSA id d6sm4954516wic.9.2014.02.28.02.44.23
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Feb 2014 02:44:23 -0800 (PST)
Sender: Sebastien MENNETRIER <sebmennetrier@gmail.com>
From: =?UTF-8?q?S=C3=A9bastien=20Mennetrier?= <s.mennetrier@innotis.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Feb 2014 11:43:50 +0100
Message-Id: <1393584230-6405-1-git-send-email-s.mennetrier@innotis.org>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH V2] libomxil: Fix link issue for gst-omx
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
X-List-Received-Date: Fri, 28 Feb 2014 10:44:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gst-omx element can not load due to a missing symbol.
Missing symbol RM_Deinit.

Signed-off-by: Sébastien Mennetrier <s.mennetrier@innotis.org>
---
 .../libomxil-0.9.3/dynamicloader-linking.patch       | 20 ++++++++++++++++++++
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb   |  3 ++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.patch

diff --git a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.patch b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.patch
new file mode 100644
index 0000000..787953a
--- /dev/null
+++ b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.patch
@@ -0,0 +1,20 @@
+This patch fixes link issue when libomxdynamicloader.so is loaded :
+Missing symbol RM_Deinit.
+
+This patch comes from "http://pkgs.fedoraproject.org/cgit/libomxil-bellagio.git/commit/?h=f17&id=4996a95828943d345e51ded6876c3103653eecf8"
+
+Upstream-Status: Pending
+
+Signed-off-by: Sébastien Mennetrier <s.mennetrier@innotis.org>
+
+--- a/src/dynamic_loader/Makefile.am	2014-02-25 15:29:10.128549636 +0100
++++ b/src/dynamic_loader/Makefile.am	2014-02-25 15:30:15.756548808 +0100
+@@ -3,7 +3,7 @@
+ omxdynamicloader_LTLIBRARIES = libomxdynamicloader.la
+ libomxdynamicloader_la_SOURCES = ste_dynamic_component_loader.c ste_dynamic_component_loader.h
+ 
+-libomxdynamicloader_la_LDFLAGS =
++libomxdynamicloader_la_LDFLAGS = -lomxil-bellagio -L$(top_builddir)/src/.libs
+ libomxdynamicloader_la_CFLAGS = -I$(top_srcdir)/include \
+ 			-I$(top_srcdir)/src \
+ 			-I$(top_srcdir)/src/base \
diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
index f6c6a16..4a7633d 100644
--- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
+++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
@@ -9,7 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ae6f0f4dbc7ac193b50f323a6ae191cb \
 SRC_URI = "${SOURCEFORGE_MIRROR}/omxil/libomxil-bellagio-${PV}.tar.gz \
            file://configure-fix.patch \
            file://parallel-make.patch \
-           file://makefile-docdir-fix.patch"
+           file://makefile-docdir-fix.patch \
+           file://dynamicloader-linking.patch"
 
 SRC_URI[md5sum] = "a1de827fdb75c02c84e55f740ca27cb8"
 SRC_URI[sha256sum] = "593c0729c8ef8c1467b3bfefcf355ec19a46dd92e31bfc280e17d96b0934d74c"
-- 
1.8.1.2


