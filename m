Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TvkSm-0007pv-8i
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Jan 2013 09:04:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0H7nGJZ022840
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2013 23:49:16 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 16 Jan 2013 23:49:16 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Jan 2013 15:49:11 +0800
Message-ID: <270a48284b7cdbb1f0b6db644ac5b246d279c3cb.1358408649.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358408649.git.hongxu.jia@windriver.com>
References: <cover.1358408649.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] glib-2.0-native:fix do_configure failed with gcc 4.3.4 on x86 host
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
X-List-Received-Date: Thu, 17 Jan 2013 08:04:57 -0000
Content-Type: text/plain

Add an option `-march' to BUILD_CFLAGS, GCC 4.3.4 on x86 host needs this
option to let the atomic operations ("lock free") be available while it
is used to compile glib-2.0-native.

[YOCTO #3563]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
index e1d44e2..33ab881 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r1"
+PR = "r2"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
@@ -40,6 +40,11 @@ RDEPENDS_${PN}-ptest += "\
             python-dbus \
            "
 
+# Add an option `-march' to BUILD_CFLAGS, GCC 4.3.4 on x86 host needs this
+# option to let the atomic operations ("lock free") be available while it
+# is used to compile glib-2.0-native
+BUILD_CFLAGS += "-march=${@'${BUILD_ARCH}'.replace('_','-')}"
+
 do_configure_prepend() {
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
 }
-- 
1.7.10.4



