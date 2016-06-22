Return-Path: <Li.Zhou@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2EDFF60053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 05:19:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u5M5Jhxh018133
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 22:19:43 -0700
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Tue, 21 Jun 2016 22:19:42 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2016 13:19:27 +0800
Message-ID: <20160622051927.17908-1-li.zhou@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [PATCH] smartpm: make "smart query/info" search package name in Provides too.
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
X-List-Received-Date: Wed, 22 Jun 2016 05:19:44 -0000
Content-Type: text/plain

"smart query glibc" or "smart info glibc" will get result as:
"error: 'glibc' matches no packages".
While "smart install glibc" can get result as:
"libc6-xxx (for glibc) is already installed".
Here change "smart query/info" to search package name in Provides too,
and one result example is: "smart query glibc" gets the same result
with "smart query libc6".

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...e-smart-query-info-search-package-name-in.patch | 51 ++++++++++++++++++++++
 meta/recipes-devtools/python/python-smartpm_git.bb |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/0001-smartpm-make-smart-query-info-search-package-name-in.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/0001-smartpm-make-smart-query-info-search-package-name-in.patch b/meta/recipes-devtools/python/python-smartpm/0001-smartpm-make-smart-query-info-search-package-name-in.patch
new file mode 100644
index 0000000..75389c3
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/0001-smartpm-make-smart-query-info-search-package-name-in.patch
@@ -0,0 +1,51 @@
+From 7b7b7c120dd20f825ec886a9b90b1d4291d1d332 Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Wed, 22 Jun 2016 11:09:20 +0800
+Subject: [PATCH] smartpm: make "smart query/info" search package name in
+ Provides too.
+
+"smart query glibc" or "smart info glibc" will get result as:
+"error: 'glibc' matches no packages".
+While "smart install glibc" can get result as:
+"libc6-xxx (for glibc) is already installed".
+Here change "smart query/info" to search package name in Provides too,
+and one result example is: "smart query glibc" gets the same result
+with "smart query libc6".
+
+Upstream-Status: Pending
+
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ smart/commands/info.py  | 2 +-
+ smart/commands/query.py | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/smart/commands/info.py b/smart/commands/info.py
+index 59fbe98..85d05f9 100644
+--- a/smart/commands/info.py
++++ b/smart/commands/info.py
+@@ -75,7 +75,7 @@ def main(ctrl, opts, reloadchannels=True):
+     if opts.args:
+         pkgs = {}
+         for arg in opts.args:
+-            ratio, results, suggestions = ctrl.search(arg, addprovides=False)
++            ratio, results, suggestions = ctrl.search(arg)
+ 
+             if not results:
+                 if suggestions:
+diff --git a/smart/commands/query.py b/smart/commands/query.py
+index b6f5697..22cb60f 100644
+--- a/smart/commands/query.py
++++ b/smart/commands/query.py
+@@ -165,7 +165,7 @@ def main(ctrl, opts, reloadchannels=True):
+     else:
+         packages = {}
+         for arg in opts.args:
+-            ratio, results, suggestions = ctrl.search(arg, addprovides=False)
++            ratio, results, suggestions = ctrl.search(arg)
+             if not results:
+                 if suggestions:
+                     dct = {}
+-- 
+2.9.0
+
diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb b/meta/recipes-devtools/python/python-smartpm_git.bb
index d9a908d..b926f66 100644
--- a/meta/recipes-devtools/python/python-smartpm_git.bb
+++ b/meta/recipes-devtools/python/python-smartpm_git.bb
@@ -23,6 +23,7 @@ SRC_URI = "\
           file://smart-already-installed-message.patch \
           file://smart-set-noprogress-for-pycurl.patch \
           file://smart-cache.py-getPackages-matches-name-version.patch \
+          file://0001-smartpm-make-smart-query-info-search-package-name-in.patch \
          "
 
 SRCREV = "407a7eca766431257dcd1da15175cc36a1bb22d0"
-- 
2.9.0


