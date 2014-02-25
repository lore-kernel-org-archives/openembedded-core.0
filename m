Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 53D796F36B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 09:40:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1P9eljb028980
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2014 01:40:47 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 25 Feb 2014 01:40:47 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Feb 2014 17:44:03 +0800
Message-ID: <561a013c9d91e9c116800924eb9c5eebb3e28c70.1393321369.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1393321369.git.liezhi.yang@windriver.com>
References: <cover.1393321369.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] grub: exclude .pc from POTFILES.in (fix build on CentOS 5.8)
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
X-List-Received-Date: Tue, 25 Feb 2014 09:40:49 -0000
Content-Type: text/plain

Exclude the .pc from po/POTFILES.in since quilt uses "patch --backup",
which will create the backup file under .pc, this may cause unexpected
errors, for example, on CentOS 5.x, if the backup file is null
(newfile), it's mode will be 000, then we will get errors when xgettext
try to read it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../grub/grub/autogen.sh-exclude-pc.patch          | 34 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub_git.bb                  |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/grub/autogen.sh-exclude-pc.patch

diff --git a/meta/recipes-bsp/grub/grub/autogen.sh-exclude-pc.patch b/meta/recipes-bsp/grub/grub/autogen.sh-exclude-pc.patch
new file mode 100644
index 0000000..fc5aa4e
--- /dev/null
+++ b/meta/recipes-bsp/grub/grub/autogen.sh-exclude-pc.patch
@@ -0,0 +1,34 @@
+From ff8f68cc48fd3c30d55e1d570d51f2e0952c968e Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sat, 25 Jan 2014 23:49:44 -0500
+Subject: [PATCH] autogen.sh: exclude .pc from po/POTFILES.in
+
+Exclude the .pc from po/POTFILES.in since quilt uses "patch --backup",
+which will create the backup file under .pc, this may cause unexpected
+errors, for example, on CentOS 5.x, if the backup file is null
+(newfile), it's mode will be 000, then we will get errors when xgettext
+try to read it.
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ autogen.sh |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/autogen.sh b/autogen.sh
+index 7424428..843619e 100755
+--- a/autogen.sh
++++ b/autogen.sh
+@@ -5,7 +5,7 @@ set -e
+ export LC_COLLATE=C
+ unset LC_ALL
+ 
+-find . -iname '*.[ch]' ! -ipath './grub-core/lib/libgcrypt-grub/*' ! -ipath './build-aux/*' ! -ipath './grub-core/lib/libgcrypt/src/misc.c' ! -ipath './grub-core/lib/libgcrypt/src/global.c' ! -ipath './grub-core/lib/libgcrypt/src/secmem.c'  ! -ipath './util/grub-gen-widthspec.c' ! -ipath './util/grub-gen-asciih.c' |sort > po/POTFILES.in
++find . -iname '*.[ch]' ! -ipath './grub-core/lib/libgcrypt-grub/*' ! -ipath './build-aux/*' ! -ipath './grub-core/lib/libgcrypt/src/misc.c' ! -ipath './grub-core/lib/libgcrypt/src/global.c' ! -ipath './grub-core/lib/libgcrypt/src/secmem.c'  ! -ipath './util/grub-gen-widthspec.c' ! -ipath './util/grub-gen-asciih.c' ! -path './.pc/*' | sort > po/POTFILES.in
+ find util -iname '*.in' ! -name Makefile.in  |sort > po/POTFILES-shell.in
+ 
+ echo "Importing unicode..."
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 1796e7f..82a25c9 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -20,6 +20,7 @@ PV = "2.00+${SRCPV}"
 SRCREV = "0776112c5311196889a15058a3b1be4c81ba5e05"
 SRC_URI = "git://git.savannah.gnu.org/grub.git \
            file://40_custom \
+           file://autogen.sh-exclude-pc.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
1.8.3.1


