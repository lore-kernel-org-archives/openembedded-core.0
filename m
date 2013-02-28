Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UAxs4-0003Un-4f
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 08:25:43 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1S79IuL025981
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 23:09:18 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.328.9; Wed, 27 Feb 2013 23:09:17 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Feb 2013 15:09:13 +0800
Message-ID: <7cdecd634555fae2c5c486880210dc65b62f3d7d.1362033854.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362033854.git.hongxu.jia@windriver.com>
References: <cover.1362033854.git.hongxu.jia@windriver.com>
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
X-List-Received-Date: Thu, 28 Feb 2013 07:25:46 -0000
Content-Type: text/plain

When compile glib-2.0-native with GCC 4.3.4 on x86 host, the GCC needs
`-march' to let the atomic operations ("lock free") be available. Pass
`-march=native' to cause the compiler to auto-detect the architecture of the
build computer, If the auto-detect is unsuccessful the option has no effect.

[YOCTO #3563]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
index d58d489..dbcd9b4 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
@@ -44,6 +44,12 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = "\
             eglibc-localedata-translit-cjk-variants \
            "
 
+# When compile glib-2.0-native with GCC 4.3.4 on x86 host, the GCC needs
+# `-march' to let the atomic operations ("lock free") be available. Pass
+# `-march=native' to cause the compiler to auto-detect the architecture of the
+# build computer, If the auto-detect is unsuccessful the option has no effect.
+BUILD_CFLAGS += "-march=native"
+
 do_configure_prepend() {
 	sed -i -e '1s,#!.*,#!${USRBINPATH}/env python,' ${S}/gio/gdbus-2.0/codegen/gdbus-codegen.in
 }
-- 
1.7.10.4



