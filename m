Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3AD38731E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 07:07:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0B77LNu015949
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 10 Jan 2016 23:07:21 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 10 Jan 2016 23:07:20 -0800
From: <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Mon, 11 Jan 2016 15:07:12 +0800
Message-ID: <b1f3994f64c6bb285c762038cec35351934aa553.1452495946.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1452495946.git.kai.kang@windriver.com>
References: <cover.1452495946.git.kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] glib-2.0: add dependency glib-2.0-native back
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
X-List-Received-Date: Mon, 11 Jan 2016 07:07:23 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It uses command glib-genmarshal to build glib-2.0 which is from
glib-2.0-native. If the command doesn't exist on host, build fails
with error:

| /bin/sh: --prefix=test_marshal: command not found
| make[4]: *** [testmarshal.c] Error 127

So add the dependency back.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 86f7e0e..785d4d7 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -17,10 +17,10 @@ SECTION = "libs"
 
 BBCLASSEXTEND = "native nativesdk"
 
-DEPENDS = "virtual/libiconv libffi zlib"
-DEPENDS_append = " ${@bb.utils.contains('PTEST_ENABLED', '1', ' glib-2.0-native dbus', '', d)}"
+DEPENDS = "virtual/libiconv libffi zlib glib-2.0-native"
+DEPENDS_append = " ${@bb.utils.contains('PTEST_ENABLED', '1', ' dbus', '', d)}"
 DEPENDS_class-native = "pkgconfig-native gettext-native libffi-native zlib-native"
-DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-gettext nativesdk-libffi nativesdk-zlib"
+DEPENDS_class-nativesdk = "nativesdk-libtool nativesdk-gettext nativesdk-libffi nativesdk-zlib glib-2.0-native"
 
 PACKAGES =+ "${PN}-utils ${PN}-bash-completion ${PN}-codegen"
 
-- 
2.6.1


