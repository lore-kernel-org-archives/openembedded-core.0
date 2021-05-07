Received: from mga02.intel.com (mga02.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.6883.1620370974892359593
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 2p862mOTxIf9LuU9+/U7DKYapqY2FB/EozAJYgVVMLAq9LDC4Z9lHSGt7h6RYQxYtup4n0xCuC
 ktOQIyemzyhg==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794791"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794791"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:20 -0700
IronPort-SDR: UVDCDRoxPh9KbxF/D3szicic0BP66jbNh52dSYP+9BPcw0uKGXiYLwyMyc+4N8C7J7BbFBNYOK
 kyWaw9f6znYA==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331664"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:03:19 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 22/31] busybox: Fix reproducibility
Date: Fri,  7 May 2021 15:02:34 +0800
Message-Id: <b5bb7b5499b7a1ece9ef6592166709fecd5e6935.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620370571.git.anuj.mittal@intel.com>
References: <cover.1620370571.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

The ensures that globbing results in same order irrespective of shell in
use

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fdeee94fa78f91613850500b209b75a6608241d0)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...Use-C-locale-when-calling-sed-on-glo.patch | 28 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.33.0.bb   |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch b/meta/recipes-core/busybox/busybox/0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch
new file mode 100644
index 0000000000..e0a22c5bb3
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch
@@ -0,0 +1,28 @@
+From bff7f16f7f41de8df67beb03722f235828ef2249 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 3 May 2021 15:48:19 -0700
+Subject: [PATCH] gen_build_files: Use C locale when calling sed on globbed files
+
+sort order is different based on chosen locale and also default shell
+being bash or dash
+
+This sets the environment variable LC_ALL to the value C, which will
+enforce bytewise sorting, irrespective of the shell
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ scripts/gen_build_files.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/scripts/gen_build_files.sh
++++ b/scripts/gen_build_files.sh
+@@ -4,6 +4,8 @@
+ # but users complain that many sed implementations
+ # are misinterpreting --.
+ 
++export LC_ALL=C
++
+ test $# -ge 2 || { echo "Syntax: $0 SRCTREE OBJTREE"; exit 1; }
+ 
+ # cd to objtree
diff --git a/meta/recipes-core/busybox/busybox_1.33.0.bb b/meta/recipes-core/busybox/busybox_1.33.0.bb
index 58e9cf7fce..b2a30ba16f 100644
--- a/meta/recipes-core/busybox/busybox_1.33.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.33.0.bb
@@ -47,6 +47,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://rev.cfg \
            file://pgrep.cfg \
            file://0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch \
+           file://0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch \
            "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-- 
2.30.2

