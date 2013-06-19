Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5E1406A8D1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 02:45:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5J2jocB009719
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 19:45:50 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.153) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 18 Jun 2013 19:45:50 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jun 2013 10:45:45 +0800
Message-ID: <d144145e87b9f15189080665ce91db537522935f.1371609581.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1371609581.git.hongxu.jia@windriver.com>
References: <cover.1371609581.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] wget:fix do_configure failed
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
X-List-Received-Date: Wed, 19 Jun 2013 02:45:50 -0000
Content-Type: text/plain

Create a new build enviroment, build wget failed
...
configure:34512: checking for libssl
configure:34542: i586-poky-linux-gcc  -m32 -march=i586 --sysroot=/home/jiahongxu/yocto/build-20130613-qemu/tmp/sysroots/qemux86 -o conftest - O2 -pipe -g -feliminate-unused-debug-types  -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed conftest.c -ldl  -lssl /home/jiahongxu/yocto/build-  20130613-qemu/tmp/sysroots/qemux86/lib/libcrypto.so -lz >&5
/home/jiahongxu/yocto/build-20130613-qemu/tmp/sysroots/x86_64-linux/usr/libexec/i586-poky-linux/gcc/i586-poky-linux/4.7.2/ld: cannot find -lz collect2: error: ld returned 1 exit status
...

From log as we known, the reason is link zlib failed, it isn't
explicitly in wget's DEPENDS. Add zlib to wget's DEPENDS.

[YOCTO #4749]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-extended/wget/wget.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/wget/wget.inc b/meta/recipes-extended/wget/wget.inc
index ba37a87..de9b620 100644
--- a/meta/recipes-extended/wget/wget.inc
+++ b/meta/recipes-extended/wget/wget.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "A console URL download utility featuring HTTP, FTP, and more."
 SECTION = "console/network"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-DEPENDS = "openssl"
+DEPENDS = "openssl zlib"
 
 INC_PR = "r16"
 
-- 
1.8.1.2


