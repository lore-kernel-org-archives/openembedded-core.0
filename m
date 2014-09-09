Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7EF8D6FBB9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 07:38:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s897cVJ4001712
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Sep 2014 00:38:31 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 9 Sep 2014 00:38:31 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Tue, 9 Sep 2014 00:38:30 -0700
Message-ID: <e4403f48bfb883e5b9989ddd95a0d99a089ecb92.1410248214.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1410248214.git.liezhi.yang@windriver.com>
References: <cover.1410248214.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] grub-efi: Replace _BSD_SOURCE macro with _DEFAULT_SOURCE
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
X-List-Received-Date: Tue, 09 Sep 2014 07:38:38 -0000
Content-Type: text/plain

This is needed with glibc 2.20 since _BSD_SOURCE
macro is gone

Khem fixed grub, but the grub-efi also needs it, the patch can't apply
to grub-efi, so made a new patch for it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../grub/files/grub-efi-fix-with-glibc-2.20.patch  |   32 ++++++++++++++++++++
 meta/recipes-bsp/grub/grub-efi_2.00.bb             |    1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/grub-efi-fix-with-glibc-2.20.patch

diff --git a/meta/recipes-bsp/grub/files/grub-efi-fix-with-glibc-2.20.patch b/meta/recipes-bsp/grub/files/grub-efi-fix-with-glibc-2.20.patch
new file mode 100644
index 0000000..4f12628
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/grub-efi-fix-with-glibc-2.20.patch
@@ -0,0 +1,32 @@
+From eb6368e65f6988eebad26cebdec057f797bceb40 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 9 Sep 2014 00:02:30 -0700
+Subject: [PATCH] Fix build with glibc 2.20
+
+* grub-core/kern/emu/hostfs.c: squahes below warning
+  warning: #warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE"
+
+Upstream-Status: Submitted
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ grub-core/kern/emu/hostfs.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/kern/emu/hostfs.c b/grub-core/kern/emu/hostfs.c
+index 3cb089c..a51ee32 100644
+--- a/grub-core/kern/emu/hostfs.c
++++ b/grub-core/kern/emu/hostfs.c
+@@ -16,7 +16,7 @@
+  *  You should have received a copy of the GNU General Public License
+  *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
+  */
+-#define _BSD_SOURCE
++#define _DEFAULT_SOURCE
+ #include <grub/fs.h>
+ #include <grub/file.h>
+ #include <grub/disk.h>
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-bsp/grub/grub-efi_2.00.bb b/meta/recipes-bsp/grub/grub-efi_2.00.bb
index 7b49493..d213f31 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.00.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.00.bb
@@ -28,6 +28,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://fix-issue-with-flex-2.5.37.patch \
            file://grub-efi-allow-a-compilation-without-mcmodel-large.patch \
            file://grub-2.00-add-oe-kernel.patch \
+           file://grub-efi-fix-with-glibc-2.20.patch \
           "
 SRC_URI[md5sum] = "e927540b6eda8b024fb0391eeaa4091c"
 SRC_URI[sha256sum] = "65b39a0558f8c802209c574f4d02ca263a804e8a564bc6caf1cd0fd3b3cc11e3"
-- 
1.7.9.5


