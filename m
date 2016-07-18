Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B866D7317F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 03:32:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6I3Wqli019046
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jul 2016 20:32:57 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 17 Jul 2016 20:32:55 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Jul 2016 20:32:42 -0700
Message-ID: <283bf667b05152624fd20f814b19f8ee6a9eb72e.1468811788.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1468811788.git.liezhi.yang@windriver.com>
References: <cover.1468811788.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/9] build-compare: remove space at head
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
X-List-Received-Date: Mon, 18 Jul 2016 03:32:57 -0000
Content-Type: text/plain

The command like:
rpm -qp --nodigest --nosignature --qf '<foo> [%{REQUIRENAME}\n]\n'
                                            ^^space

The space will be printed, and will impact the check result, so remove it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../build-compare/build-compare_git.bb             |  1 +
 .../files/functions.sh-remove-space-at-head.patch  | 41 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-devtools/build-compare/files/functions.sh-remove-space-at-head.patch

diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb b/meta/recipes-devtools/build-compare/build-compare_git.bb
index 676f11d..88996e2 100644
--- a/meta/recipes-devtools/build-compare/build-compare_git.bb
+++ b/meta/recipes-devtools/build-compare/build-compare_git.bb
@@ -9,6 +9,7 @@ SRC_URI = "git://github.com/openSUSE/build-compare.git \
            file://Rename-rpm-check.sh-to-pkg-diff.sh.patch;striplevel=1 \
            file://Ignore-DWARF-sections.patch;striplevel=1 \
            file://0001-Add-support-for-deb-and-ipk-packaging.patch \
+           file://functions.sh-remove-space-at-head.patch \
            "
 
 SRCREV = "c5352c054c6ef15735da31b76d6d88620f4aff0a"
diff --git a/meta/recipes-devtools/build-compare/files/functions.sh-remove-space-at-head.patch b/meta/recipes-devtools/build-compare/files/functions.sh-remove-space-at-head.patch
new file mode 100644
index 0000000..02e96ba
--- /dev/null
+++ b/meta/recipes-devtools/build-compare/files/functions.sh-remove-space-at-head.patch
@@ -0,0 +1,41 @@
+From 402a821e604f280e62c34bf4d40c6d1b4c6c892d Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 4 Jul 2016 20:11:33 -0700
+Subject: [PATCH] functions.sh: remove space at head
+
+The command like:
+rpm -qp --nodigest --nosignature --qf '<foo> [%{REQUIRENAME}\n]\n'
+                                            ^^space
+
+The space will be printed, and will impact the check result, so remove it.
+
+Upstream-Status: Submitted [https://github.com/openSUSE/build-compare/pull/9]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ functions.sh | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/functions.sh b/functions.sh
+index 85c9003..b1069d2 100644
+--- a/functions.sh
++++ b/functions.sh
+@@ -26,6 +26,7 @@ function trim_release_old()
+   sed -e "
+   /\(\/boot\|\/lib\/modules\|\/lib\/firmware\|\/usr\/src\|$version_release_old_regex_l\$\)/{s,$version_release_old_regex_l,@VERSION@-@RELEASE_LONG@,g;s,$version_release_old_regex_s,@VERSION@-@RELEASE_SHORT@,g}
+   s/\(\/var\/adm\/update-scripts\/\)${name_ver_rel_old_regex_l}\([^[:blank:]]\+\)/\1@NAME_VER_REL@\2/g
++  s/^ *//g
+   "
+ }
+ function trim_release_new()
+@@ -33,6 +34,7 @@ function trim_release_new()
+   sed -e "
+   /\(\/boot\|\/lib\/modules\|\/lib\/firmware\|\/usr\/src\|$version_release_new_regex_l\$\)/{s,$version_release_new_regex_l,@VERSION@-@RELEASE_LONG@,g;s,$version_release_new_regex_s,@VERSION@-@RELEASE_SHORT@,g}
+   s/\(\/var\/adm\/update-scripts\/\)${name_ver_rel_new_regex_l}\([^[:blank:]]\+\)/\1@NAME_VER_REL@\2/g
++  s/^ *//g
+   "
+ }
+ # Get single directory or filename with long or short release string
+-- 
+2.9.0
+
-- 
2.9.0


