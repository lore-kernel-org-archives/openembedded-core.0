Return-Path: <sebmennetrier@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8AD7B6F17C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 14:02:52 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id q58so1540908wes.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2014 06:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=6pv3mn3Zk5TkFdl2mrkpBnXJRaezTQMGGmExTXL9tsc=;
	b=IN19/lZuqK3VTooc8r7FjieSFrRGRExnRerHWaul9RK67Fr5jEYV0QaMv7gcdIEAey
	wDCZSm93k68PY6NgCh4uOfPzXeG3/+y5Fur6ONwABnO7RsqNXh/FLQQ/iTGsqW/pDTdT
	J7ozzI2mtng63Xoh3GEuFea75K11WjABEb+UxlrDIqL78qqsqwD74wpVZxtvT5PhGbaS
	n8jYy9sv+zACWU8EImB2UuCtTh9hdSjHvsIEwUHxYbTxFRjLPd2jDKYPaKbsBaeZHT7i
	DXprwLR4vzQbghBLoBSEzdpD6nd6EuPA3UxZ+mluqmvrSGMruUd0moez+QA6PbAdZuYc
	nlqg==
X-Received: by 10.180.93.74 with SMTP id cs10mr9982527wib.15.1393509773468;
	Thu, 27 Feb 2014 06:02:53 -0800 (PST)
Received: from smennetrier-desktop.mpl.mstarsemi.fr
	(connected-labs-gw1.ter2.neodc.mpl.cust.as8218.eu. [94.103.137.126])
	by mx.google.com with ESMTPSA id
	ha1sm11461772wjc.23.2014.02.27.06.02.52 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Feb 2014 06:02:52 -0800 (PST)
Sender: Sebastien MENNETRIER <sebmennetrier@gmail.com>
From: =?UTF-8?q?S=C3=A9bastien=20Mennetrier?= <s.mennetrier@innotis.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Feb 2014 15:02:04 +0100
Message-Id: <1393509724-26931-1-git-send-email-s.mennetrier@innotis.org>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH] libomxil: Fix link issue for gst-omx
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
X-List-Received-Date: Thu, 27 Feb 2014 14:02:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gst-omx element can not load due to a missing symbol.
Missing symbol RM_Deinit.

Signed-off-by: Sébastien Mennetrier <s.mennetrier@innotis.org>
---
 .../libomxil/libomxil-0.9.3/dynamicloader-linking.patch       | 11 +++++++++++
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb            |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.patch

diff --git a/meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.patch b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.patch
new file mode 100644
index 0000000..c0fa6d8
--- /dev/null
+++ b/meta/recipes-multimedia/libomxil/libomxil-0.9.3/dynamicloader-linking.patch
@@ -0,0 +1,11 @@
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


