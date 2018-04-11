Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C9A8C74874
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 06:59:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3B6xdLH024690
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 23:59:39 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 10 Apr 2018 23:59:39 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Apr 2018 14:56:09 +0800
Message-ID: <8d2a41f56f13d483defdbcff1d0233f6d9ab4428.1523429249.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1523429249.git.jackie.huang@windriver.com>
References: <cover.1523429249.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] patch: fix CVE-2018-6951
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
X-List-Received-Date: Wed, 11 Apr 2018 06:59:39 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

* CVE detail: https://nvd.nist.gov/vuln/detail/CVE-2018-6951

* upstream tracking: http://savannah.gnu.org/bugs/?53132

* Fix segfault with mangled rename patch
  - src/pch.c (intuit_diff_type): Ensure that two filenames are specified
    for renames and copies (fix the existing check).

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...02-Fix-segfault-with-mangled-rename-patch.patch | 35 ++++++++++++++++++++++
 meta/recipes-devtools/patch/patch_2.7.6.bb         |  4 ++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/patch/patch/0002-Fix-segfault-with-mangled-rename-patch.patch

diff --git a/meta/recipes-devtools/patch/patch/0002-Fix-segfault-with-mangled-rename-patch.patch b/meta/recipes-devtools/patch/patch/0002-Fix-segfault-with-mangled-rename-patch.patch
new file mode 100644
index 0000000000..b0bd6fa83a
--- /dev/null
+++ b/meta/recipes-devtools/patch/patch/0002-Fix-segfault-with-mangled-rename-patch.patch
@@ -0,0 +1,35 @@
+From f290f48a621867084884bfff87f8093c15195e6a Mon Sep 17 00:00:00 2001
+From: Andreas Gruenbacher <agruen@gnu.org>
+Date: Mon, 12 Feb 2018 16:48:24 +0100
+Subject: [PATCH] Fix segfault with mangled rename patch
+
+http://savannah.gnu.org/bugs/?53132
+* src/pch.c (intuit_diff_type): Ensure that two filenames are specified
+for renames and copies (fix the existing check).
+
+Upstream-Status: Backport [http://git.savannah.gnu.org/cgit/patch.git/commit/?id=f290f48a621867084884bfff87f8093c15195e6a]
+CVE: CVE-2018-6951
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+
+---
+ src/pch.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/pch.c b/src/pch.c
+index ff9ed2c..bc6278c 100644
+--- a/src/pch.c
++++ b/src/pch.c
+@@ -974,7 +974,8 @@ intuit_diff_type (bool need_header, mode_t *p_file_type)
+     if ((pch_rename () || pch_copy ())
+ 	&& ! inname
+ 	&& ! ((i == OLD || i == NEW) &&
+-	      p_name[! reverse] &&
++	      p_name[reverse] && p_name[! reverse] &&
++	      name_is_valid (p_name[reverse]) &&
+ 	      name_is_valid (p_name[! reverse])))
+       {
+ 	say ("Cannot %s file without two valid file names\n", pch_rename () ? "rename" : "copy");
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/patch/patch_2.7.6.bb b/meta/recipes-devtools/patch/patch_2.7.6.bb
index 576a2ac8fa..19ddf34981 100644
--- a/meta/recipes-devtools/patch/patch_2.7.6.bb
+++ b/meta/recipes-devtools/patch/patch_2.7.6.bb
@@ -1,7 +1,9 @@
 require patch.inc
 LICENSE = "GPLv3"
 
-SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch"
+SRC_URI += "file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+            file://0002-Fix-segfault-with-mangled-rename-patch.patch \
+"
 
 SRC_URI[md5sum] = "4c68cee989d83c87b00a3860bcd05600"
 SRC_URI[sha256sum] = "8cf86e00ad3aaa6d26aca30640e86b0e3e1f395ed99f189b06d4c9f74bc58a4e"
-- 
2.11.0


