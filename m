Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F1466FFCD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Dec 2015 09:57:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBT9v585019449
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 29 Dec 2015 01:57:05 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 29 Dec 2015 01:57:04 -0800
From: <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Tue, 29 Dec 2015 17:43:41 +0800
Message-ID: <c46aeee4002b37e3f84433f78cbb82278e5d066e.1451382094.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1451382094.git.kai.kang@windriver.com>
References: <cover.1451382094.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] Revert "glib-2.0: build dependency cleanup"
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
X-List-Received-Date: Tue, 29 Dec 2015 09:57:06 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

This reverts commit fcd7494b347423185c883b2897c4908929843a71.

It uses command glib-genmarshal to build glib-2.0 which is from
glibc-2.0-native. If the command doesn't exist on host, build fails
with error:

| /bin/sh: --prefix=test_marshal: command not found
| make[4]: *** [testmarshal.c] Error 127

So add the dependency back.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 86f7e0e..8e4dcd7 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -17,10 +17,10 @@ SECTION = "libs"
 
 BBCLASSEXTEND = "native nativesdk"
 
-DEPENDS = "virtual/libiconv libffi zlib"
-DEPENDS_append = " ${@bb.utils.contains('PTEST_ENABLED', '1', ' glib-2.0-native dbus', '', d)}"
+DEPENDS = "glib-2.0-native virtual/libiconv libffi zlib"
+DEPENDS_append_class-target = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', ' dbus', '', d)}"
 DEPENDS_class-native = "pkgconfig-native gettext-native libffi-native zlib-native"
-DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-gettext nativesdk-libffi nativesdk-zlib"
+DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-gettext nativesdk-libffi nativesdk-zlib ${BPN}-native"
 
 PACKAGES =+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"
 
-- 
2.6.1


