Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.17006.1627890765018628590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193001986"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193001986"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:52:45 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478650953"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:52:44 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/37] python3-pip: fix CVE-2021-3572
Date: Mon,  2 Aug 2021 15:51:48 +0800
Message-Id: <fb7a2af241795b82f121381cea6f4b56ce948ebf.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627890114.git.anuj.mittal@intel.com>
References: <cover.1627890114.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Backport the body of a fix for CVE-2021-3572 since hardknott carries
20.0.2, and the delta between it and the latest 21.1.3 is more than just
bugfixes.

CVE: CVE-2021-3572

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...git-references-on-unicode-separators.patch | 40 +++++++++++++++++++
 .../python/python3-pip_20.0.2.bb              |  4 +-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-pip/0001-Don-t-split-git-references-on-unicode-separators.patch

diff --git a/meta/recipes-devtools/python/python3-pip/0001-Don-t-split-git-references-on-unicode-separators.patch b/meta/recipes-devtools/python/python3-pip/0001-Don-t-split-git-references-on-unicode-separators.patch
new file mode 100644
index 0000000000..f85353668a
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pip/0001-Don-t-split-git-references-on-unicode-separators.patch
@@ -0,0 +1,40 @@
+From 25c1b92b1add0b81afe2fc6f9e82f66738a2d800 Mon Sep 17 00:00:00 2001
+From: Trevor Gamblin <trevor.gamblin@windriver.com>
+Date: Thu, 22 Jul 2021 09:57:53 -0400
+Subject: [PATCH] Don't split git references on unicode separators
+
+Upstream-Status: Backport 
+(https://github.com/pypa/pip/commit/e46bdda9711392fec0c45c1175bae6db847cb30b)
+
+CVE: CVE-2021-3572
+
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+---
+ src/pip/_internal/vcs/git.py | 10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/src/pip/_internal/vcs/git.py b/src/pip/_internal/vcs/git.py
+index 7483303a9..d706064e7 100644
+--- a/src/pip/_internal/vcs/git.py
++++ b/src/pip/_internal/vcs/git.py
+@@ -137,9 +137,15 @@ class Git(VersionControl):
+         output = cls.run_command(['show-ref', rev], cwd=dest,
+                                  show_stdout=False, on_returncode='ignore')
+         refs = {}
+-        for line in output.strip().splitlines():
++        # NOTE: We do not use splitlines here since that would split on other
++        #       unicode separators, which can be maliciously used to install a
++        #       different revision.
++        for line in output.strip().split("\n"):
++            line = line.rstrip("\r")
++            if not line:
++                continue
+             try:
+-                sha, ref = line.split()
++                sha, ref = line.split(" ", maxsplit=2)
+             except ValueError:
+                 # Include the offending line to simplify troubleshooting if
+                 # this error ever occurs.
+-- 
+2.31.1
+
diff --git a/meta/recipes-devtools/python/python3-pip_20.0.2.bb b/meta/recipes-devtools/python/python3-pip_20.0.2.bb
index 99eeea2edf..9242d0e82e 100644
--- a/meta/recipes-devtools/python/python3-pip_20.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pip_20.0.2.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8ba06d529c955048e5ddd7c45459eb2e"
 
 DEPENDS += "python3 python3-setuptools-native"
 
-SRC_URI += "file://0001-change-shebang-to-python3.patch"
+SRC_URI += "file://0001-change-shebang-to-python3.patch \
+            file://0001-Don-t-split-git-references-on-unicode-separators.patch \
+            "
 
 SRC_URI[md5sum] = "7d42ba49b809604f0df3d55df1c3fd86"
 SRC_URI[sha256sum] = "7db0c8ea4c7ea51c8049640e8e6e7fde949de672bfa4949920675563a5a6967f"
-- 
2.31.1

