Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D2BC6F673
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 06:39:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s276dWr9014295
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Mar 2014 22:39:32 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 6 Mar 2014 22:39:32 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Mar 2014 01:39:26 -0500
Message-ID: <ae7d7d83b3f07e7a374a29aba900a5e172d79b6b.1394174229.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1394174229.git.liezhi.yang@windriver.com>
References: <cover.1394174229.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] libomxil: Fix link issue for gst-omx
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
X-List-Received-Date: Fri, 07 Mar 2014 06:39:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Sébastien Mennetrier <s.mennetrier@innotis.org>

gst-omx element can not load due to a missing symbol.
Missing symbol RM_Deinit.

(From OE-Core master rev: 56301698a55bcbab4272b273fd98ce4de84cbfac)

Signed-off-by: Sébastien Mennetrier <s.mennetrier@innotis.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../libomxil-0.9.3/dynamicloader-linking.patch     |   20 ++++++++++++++++++++
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb |    3 ++-
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
index 8c3166f..dfbd940 100644
--- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
+++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
@@ -10,7 +10,8 @@ PR = "r0"
 SRC_URI = "${SOURCEFORGE_MIRROR}/omxil/libomxil-bellagio-${PV}.tar.gz \
            file://configure-fix.patch \
            file://parallel-make.patch \
-           file://makefile-docdir-fix.patch"
+           file://makefile-docdir-fix.patch \
+           file://dynamicloader-linking.patch"
 
 SRC_URI[md5sum] = "a1de827fdb75c02c84e55f740ca27cb8"
 SRC_URI[sha256sum] = "593c0729c8ef8c1467b3bfefcf355ec19a46dd92e31bfc280e17d96b0934d74c"
-- 
1.7.10.4


