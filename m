Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A2F52611E1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 00:30:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 0250ULTj014023
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Mar 2020 16:30:21 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.487.0;
	Wed, 4 Mar 2020 16:30:20 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Mar 2020 16:30:20 -0800
Message-ID: <20200305003020.5164-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [PATCH 1/1] dnf: fix python3 syntax warning
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
X-List-Received-Date: Thu, 05 Mar 2020 00:30:20 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Backport from dnf version 4.2.7.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../dnf/dnf/Fix-SyntaxWarning.patch                | 34 ++++++++++++++++++++++
 meta/recipes-devtools/dnf/dnf_4.2.2.bb             |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/dnf/dnf/Fix-SyntaxWarning.patch

diff --git a/meta/recipes-devtools/dnf/dnf/Fix-SyntaxWarning.patch b/meta/recipes-devtools/dnf/dnf/Fix-SyntaxWarning.patch
new file mode 100644
index 0000000..1bd8b09
--- /dev/null
+++ b/meta/recipes-devtools/dnf/dnf/Fix-SyntaxWarning.patch
@@ -0,0 +1,34 @@
+From 23c5b15efe42e5e6ee695e54798bac248532d8d6 Mon Sep 17 00:00:00 2001
+
+Date: Tue, 28 May 2019 13:14:51 +0200
+Subject: [oe-core][PATCH 1/1] Fix SyntaxWarning: "is" with a literal. Did you
+ mean "=="?
+
+---
+ dnf/cli/commands/repoquery.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+---
+
+Unchanged.  Appears in version 4.2.7.
+
+Upstream-Status: Backport [git://github.com/rpm-software-management/dnf.git]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+
+diff --git a/dnf/cli/commands/repoquery.py b/dnf/cli/commands/repoquery.py
+index 941a470..63fc668 100644
+--- a/dnf/cli/commands/repoquery.py
++++ b/dnf/cli/commands/repoquery.py
+@@ -611,7 +611,7 @@ class RepoQueryCommand(commands.Command):
+ 
+     def tree_seed(self, query, aquery, opts, level=-1, usedpkgs=None):
+         for pkg in sorted(set(query.run()), key=lambda p: p.name):
+-            usedpkgs = set() if usedpkgs is None or level is -1 else usedpkgs
++            usedpkgs = set() if usedpkgs is None or level == -1 else usedpkgs
+             if pkg.name.startswith("rpmlib") or pkg.name.startswith("solvable"):
+                 return
+             self.grow_tree(level, pkg, opts)
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/dnf/dnf_4.2.2.bb b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
index f6e616e..5244e10 100644
--- a/meta/recipes-devtools/dnf/dnf_4.2.2.bb
+++ b/meta/recipes-devtools/dnf/dnf_4.2.2.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/rpm-software-management/dnf.git \
            file://0005-Do-not-prepend-installroot-to-logdir.patch \
            file://0029-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            file://0030-Run-python-scripts-using-env.patch \
+           file://Fix-SyntaxWarning.patch \
            "
 
 SRCREV = "9947306a55271b8b7c9e2b6e3b7d582885b6045d"
-- 
2.7.4


