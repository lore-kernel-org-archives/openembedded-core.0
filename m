Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TlbRL-00070B-AG
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 09:25:15 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBK8AUaY019819
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 00:10:31 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 20 Dec 2012 00:10:29 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Dec 2012 16:10:25 +0800
Message-ID: <8bfee81d0404d9325ccaccb260cadad8269d92ae.1355990839.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1355990839.git.hongxu.jia@windriver.com>
References: <cover.1355990839.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] glib-2.0-native:add option march to BUILD_CFLAGS
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
X-List-Received-Date: Thu, 20 Dec 2012 08:25:16 -0000
Content-Type: text/plain

Add option -march to BUILD_CFLAGS in order to let the atomic operations
("lock free") be available while using old version GCC (4.3.4 for example)
on x86 host to compile glib-2.0-native.

[YOCTO #3563]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
index 966a851..7c0a2cb 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r0"
+PR = "r1"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
@@ -19,6 +19,11 @@ SRC_URI[sha256sum] = "855fcbf87cb93065b488358e351774d8a39177281023bae58c286f4161
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
 BBCLASSEXTEND = "native nativesdk"
 
+# Add option -march to BUILD_CFLAGS in order to let the atomic operations
+# ("lock free") be available while using old version GCC on x86 host to
+# compile glib-2.0-native
+BUILD_CFLAGS += "-march=`echo ${BUILD_ARCH} | sed 's/_/-/'`"
+
 do_configure_prepend() {
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
 }
-- 
1.7.10.4



