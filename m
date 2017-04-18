Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D1B7A71AD4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 08:33:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3I8XMxk001565
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 01:33:23 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Apr 2017 01:33:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Apr 2017 01:33:20 -0700
Message-ID: <d1812ddb571443f56260e0a81567cc1165941fe0.1492504368.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1492504368.git.liezhi.yang@windriver.com>
References: <cover.1492504368.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] acl: fix race issue when do_compile
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
X-List-Received-Date: Tue, 18 Apr 2017 08:33:23 -0000
Content-Type: text/plain

Fixed race issue:
 In file included from acl_copy_entry.c:22:0:
 libacl.h:19:21: fatal error: sys/acl.h: No such file or directory
  #include <sys/acl.h>

[snip]

 compilation terminated.
 acl_get_file.c:27:24: fatal error: acl/libacl.h: No such file or directory
  #include <acl/libacl.h>
                         ^

The acl.h is in "include" directory, and include/Makefile creates
symlink "sys" and "acl" poinst to current dirctory:
$ ls include/ -l
acl -> .
sys -> .

So if "libacl" target runs before "include", the error would happen
since no "acl" or "sys" directory.

Let libacl depend on include can fix the problem.

[YOCTO #11349]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../Makefile-libacl-should-depend-on-include.patch | 51 ++++++++++++++++++++++
 meta/recipes-support/attr/acl_2.2.52.bb            |  4 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/attr/acl/Makefile-libacl-should-depend-on-include.patch

diff --git a/meta/recipes-support/attr/acl/Makefile-libacl-should-depend-on-include.patch b/meta/recipes-support/attr/acl/Makefile-libacl-should-depend-on-include.patch
new file mode 100644
index 0000000..4c7cba3
--- /dev/null
+++ b/meta/recipes-support/attr/acl/Makefile-libacl-should-depend-on-include.patch
@@ -0,0 +1,51 @@
+From d82457ce5ca7455e336da5e244d95f90e52aaef8 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 18 Apr 2017 01:17:26 -0700
+Subject: [PATCH] Makefile: libacl should depend on include
+
+Fixed race issue:
+ In file included from acl_copy_entry.c:22:0:
+ libacl.h:19:21: fatal error: sys/acl.h: No such file or directory
+  #include <sys/acl.h>
+
+[snip]
+
+ compilation terminated.
+ acl_get_file.c:27:24: fatal error: acl/libacl.h: No such file or directory
+  #include <acl/libacl.h>
+                         ^
+
+The acl.h is in "include" directory, and include/Makefile creates
+symlink "sys" and "acl" poinst to current dirctory:
+$ ls include/ -l
+acl -> .
+sys -> .
+
+So if "libacl" target runs before "include", the error would happen
+since no "acl" or "sys" directory.
+
+Let libacl depend on include can fix the problem.
+
+Upstream-Status: Pending
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index dce32d3..8a79379 100644
+--- a/Makefile
++++ b/Makefile
+@@ -48,7 +48,7 @@ else
+ endif
+ 
+ # tool/lib dependencies
+-libacl: libmisc
++libacl: include libmisc
+ getfacl setfacl chacl: libacl
+ 
+ ifeq ($(HAVE_BUILDDEFS), yes)
+-- 
+2.10.2
+
diff --git a/meta/recipes-support/attr/acl_2.2.52.bb b/meta/recipes-support/attr/acl_2.2.52.bb
index 9ab5853..306c7b5 100644
--- a/meta/recipes-support/attr/acl_2.2.52.bb
+++ b/meta/recipes-support/attr/acl_2.2.52.bb
@@ -16,7 +16,9 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/acl/${BP}.src.tar.gz \
            file://acl-fix-the-order-of-expected-output-of-getfacl.patch \
            file://test-fix-insufficient-quoting-of.patch \
            file://test-fixups-on-SELinux-machines-for-root-testcases.patch \
-           file://test-fix-directory-permissions.patch"
+           file://test-fix-directory-permissions.patch \
+           file://Makefile-libacl-should-depend-on-include.patch \
+"
 
 SRC_URI[md5sum] = "a61415312426e9c2212bd7dc7929abda"
 SRC_URI[sha256sum] = "179074bb0580c06c4b4137be4c5a92a701583277967acdb5546043c7874e0d23"
-- 
2.10.2


