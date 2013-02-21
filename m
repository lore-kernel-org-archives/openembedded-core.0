Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1U8PpD-0008Fn-OY
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 07:40:14 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1L6O161020785
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2013 22:24:01 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 20 Feb 2013 22:23:58 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Feb 2013 14:23:54 +0800
Message-ID: <d4581f6a9390de38f4ad48b61d2aad8f1c8de1db.1361426774.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1361426774.git.hongxu.jia@windriver.com>
References: <cover.1361426774.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] qemu-native:fix do_compile failed with gcc 4.3.4 on x86 host
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
X-List-Received-Date: Thu, 21 Feb 2013 06:40:15 -0000
Content-Type: text/plain

Add an option `-march' to BUILD_CFLAGS, GCC 4.3.4 on x86 host needs this
option to let the atomic operations ("lock free") be available while it
is used to compile qemu-native.

[YOCTO #3563]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6c44b31..6289bf2 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -38,6 +38,11 @@ EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disa
 				--disable-curl \
 				"
 
+# Add an option `-march' to BUILD_CFLAGS, GCC 4.3.4 on x86 host needs this
+# option to let the atomic operations ("lock free") be available while it
+# is used to compile qemu-native
+BUILD_CFLAGS += "-march=${@'${BUILD_ARCH}'.replace('_','-')}"
+
 do_configure_prepend_class-native() {
 	# Undo the -lX11 added by linker-flags.patch, don't assume that host has libX11 installed
 	sed -i 's/-lX11//g' Makefile.target
-- 
1.7.10.4



