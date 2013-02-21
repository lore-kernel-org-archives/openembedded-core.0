Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1U8PpC-0008FW-7V
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 07:40:10 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1L6NwSu025296
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2013 22:23:58 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 20 Feb 2013 22:23:57 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Feb 2013 14:23:53 +0800
Message-ID: <e4c16846be73e7e5a67e3c1430a052bf4f5d3a56.1361426774.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361426774.git.hongxu.jia@windriver.com>
References: <cover.1361426774.git.hongxu.jia@windriver.com>
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
X-List-Received-Date: Thu, 21 Feb 2013 06:40:10 -0000
Content-Type: text/plain

Add an option `-march' to BUILD_CFLAGS, GCC 4.3.4 on x86 host needs this
option to let the atomic operations ("lock free") be available while it
is used to compile glib-2.0-native.

[YOCTO #3563]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
index d58d489..4012b21 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb
@@ -44,6 +44,11 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = "\
             eglibc-localedata-translit-cjk-variants \
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



