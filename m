Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BEFF260E79
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 08:31:42 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s488Vh55010872
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 May 2014 01:31:43 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Thu, 8 May 2014 01:31:38 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 8 May 2014 16:31:52 +0800
Message-ID: <ae1854f319457be87c28bb4753a2ff6b0e8780ca.1399537861.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1399537861.git.Qi.Chen@windriver.com>
References: <cover.1399537861.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] util-linux: fix parallel build issure for PATHFILES
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
X-List-Received-Date: Thu, 08 May 2014 08:31:42 -0000
Content-Type: text/plain

When compiling util-linux, it's possible to encounter the following error.

     /bin/sh: line 2:: misc-utils/uuidd.8.tmp: No such file or directory

This is because that the misc-utils directory doesn't exist when trying to
write to misc-utils/uuidd.8.tmp.

When generating misc-utils/uuidd.8 (or anything in PATHFILES), its directory
may not have been created yet. So we need to ensure the existence of the
directory to avoid the compilation error.

[YOCTO #6292]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...ensure-the-existence-of-directory-for-PAT.patch |   34 ++++++++++++++++++++
 meta/recipes-core/util-linux/util-linux_2.24.2.bb  |    1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-ensure-the-existence-of-directory-for-PAT.patch

diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-ensure-the-existence-of-directory-for-PAT.patch b/meta/recipes-core/util-linux/util-linux/util-linux-ensure-the-existence-of-directory-for-PAT.patch
new file mode 100644
index 0000000..8f26451
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/util-linux-ensure-the-existence-of-directory-for-PAT.patch
@@ -0,0 +1,34 @@
+Upstream-Status: Pending
+
+util-linux: ensure the existence of directory for PATHFILES
+
+When compiling util-linux, it's possible to encounter the following error.
+     /bin/sh: line 2:: misc-utils/uuidd.8.tmp: No such file or directory
+
+This is because that the misc-utils directory doesn't exist when trying to write to
+misc-utils/uuidd.8.tmp.
+
+When generating misc-utils/uuidd.8 (or anything in PATHFILES), its directory
+may not have been created yet. So we need to ensure the existence of the directory
+to avoid the compilation error.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Makefile.am |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/Makefile.am b/Makefile.am
+index 17f4c33..ca3dc0f 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -123,6 +123,7 @@ EXTRA_DIST += $(PATHFILES:=.in)
+ 
+ $(PATHFILES): Makefile
+ 	@ rm -f $@ $@.tmp
++	@ mkdir -p `dirname $@`
+ 	$(AM_V_GEN) srcdir=''; \
+ 		test -f ./$@.in || srcdir=$(srcdir)/; \
+ 		$(edit_cmd) $${srcdir}$@.in >$@.tmp
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/util-linux/util-linux_2.24.2.bb b/meta/recipes-core/util-linux/util-linux_2.24.2.bb
index a2d7430..ed753e4 100644
--- a/meta/recipes-core/util-linux/util-linux_2.24.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.24.2.bb
@@ -15,6 +15,7 @@ SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
             file://configure-sbindir.patch \
             file://fix-configure.patch \
             file://fix-parallel-build.patch \
+            file://util-linux-ensure-the-existence-of-directory-for-PAT.patch \
             ${OLDHOST} \
 "
 
-- 
1.7.9.5


