Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UAxs5-0003Up-8I
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 08:25:43 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1S79JGq001973
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 23:09:19 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.328.9; Wed, 27 Feb 2013 23:09:18 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Feb 2013 15:09:14 +0800
Message-ID: <3da91af174eb9daba91a9684af4f2d4093d8d44b.1362033854.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362033854.git.hongxu.jia@windriver.com>
References: <cover.1362033854.git.hongxu.jia@windriver.com>
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
X-List-Received-Date: Thu, 28 Feb 2013 07:25:46 -0000
Content-Type: text/plain

When compile qemu-native with GCC 4.3.4 on x86 host, the GCC needs
`-march' to let the atomic operations ("lock free") be available. Pass
`-march=native' to cause the compiler to auto-detect the architecture of the
build computer, If the auto-detect is unsuccessful the option has no effect.

[YOCTO #3563]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 6c44b31..73734f4 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -38,6 +38,12 @@ EXTRA_OECONF_class-nativesdk = "--target-list=${@get_qemu_target_list(d)} --disa
 				--disable-curl \
 				"
 
+# When compile qemu-native with GCC 4.3.4 on x86 host, the GCC needs
+# `-march' to let the atomic operations ("lock free") be available. Pass
+# `-march=native' to cause the compiler to auto-detect the architecture of the
+# build computer, If the auto-detect is unsuccessful the option has no effect.
+BUILD_CFLAGS += "-march=native"
+
 do_configure_prepend_class-native() {
 	# Undo the -lX11 added by linker-flags.patch, don't assume that host has libX11 installed
 	sed -i 's/-lX11//g' Makefile.target
-- 
1.7.10.4



