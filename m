Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8EA4F71633
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 10:01:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9SA1gH7014617
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Oct 2015 03:01:42 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Wed, 28 Oct 2015 03:01:41 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Oct 2015 17:52:43 +0800
Message-ID: <1446025963-4522-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] rpm: define EM_AARCH64 for debugedit
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
X-List-Received-Date: Wed, 28 Oct 2015 10:01:48 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

EM_AARCH64 maybe not be defined due to old version elf.h when compile
rpm-native, and lead to that debugedit can not work on aarch64 elf object
files, since there is no other dependence, except these two macro,
define them to make debugedit work on aarch64 elf files.

  debugedit: /bitbake_build/tmp/work/aarch64-wrs-linux/libvirt/1.2.19-r0/
  package/usr/lib64/libvirt/ptest/daemon/libvirtd_admin_la-admin_server.o:
  Unhandled relocation 258 in .debug_info section

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../rpm/rpm/0001-define-EM_AARCH64.patch           | 35 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/rpm/rpm/0001-define-EM_AARCH64.patch

diff --git a/meta/recipes-devtools/rpm/rpm/0001-define-EM_AARCH64.patch b/meta/recipes-devtools/rpm/rpm/0001-define-EM_AARCH64.patch
new file mode 100644
index 0000000..f5fcfec
--- /dev/null
+++ b/meta/recipes-devtools/rpm/rpm/0001-define-EM_AARCH64.patch
@@ -0,0 +1,35 @@
+[PATCH] define EM_AARCH64
+
+Upstream-Status: pending
+
+EM_AARCH64 maybe not be defined due to old version elf.h, and lead to
+that debugedit can not work on aarch64 elf object files, since there is
+no other dependence, except these two macro, define them to make
+debugedit work on aarch64 elf files.
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ tools/debugedit.c | 7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/tools/debugedit.c b/tools/debugedit.c
+index de693ed..d16a641 100644
+--- a/tools/debugedit.c
++++ b/tools/debugedit.c
+@@ -35,6 +35,13 @@
+ 
+ #include <gelf.h>
+ 
++#ifndef EM_AARCH64
++#define EM_AARCH64      183             /* ARM AARCH64 */
++#endif
++#ifndef R_AARCH64_ABS32
++#define R_AARCH64_ABS32 258
++#endif 
++
+ /* some defines taken from the dwarf standard */
+ 
+ #define DW_TAG_compile_unit	0x11
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/rpm/rpm_5.4.14.bb b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
index b450c6f..4b1b623 100644
--- a/meta/recipes-devtools/rpm/rpm_5.4.14.bb
+++ b/meta/recipes-devtools/rpm/rpm_5.4.14.bb
@@ -99,6 +99,7 @@ SRC_URI = "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.14-0.20131024.src.rpm;e
 	   file://rpm-macros.in-disable-external-key-server.patch \
 	   file://rpm-opendb-before-verifyscript-to-avoid-null-point.patch \
 	   file://configure.ac-check-for-both-gpg2-and-gpg.patch \
+	   file://0001-define-EM_AARCH64.patch \
 	  "
 
 # Uncomment the following line to enable platform score debugging
-- 
1.9.1


