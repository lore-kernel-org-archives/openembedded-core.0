Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.7722.1614918147768864035
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 5Emn6UxM0QORaST80OuN8cDs6KtnrMAMwykjSwVFp4M3d3XW4HOPYkR6EGm22liJTFLEGLmcWH
 tsk/I0mQ5etw==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671057"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671057"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:31 -0800
IronPort-SDR: 4x2CX1dk6C97sXJUj60EH0iYeFFgxP42MUOlSYD09I4kJysFY+U2X2e2Oyil/pZf0S7hjXjt80
 m2BhpLtwFvbw==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128912"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:29 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 24/52] rsync: Fix a file sorting determinism issue
Date: Fri,  5 Mar 2021 12:21:00 +0800
Message-Id: <da24f076fe909d88202a175e44fd3c8d6468d337.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f6b7f395ae2d98363e365d31f5e95ce41a12e5b4)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../rsync/files/determism.patch               | 28 +++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.3.bb    |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/determism.patch

diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/recipes-devtools/rsync/files/determism.patch
new file mode 100644
index 0000000000..53a4ca7505
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/determism.patch
@@ -0,0 +1,28 @@
+The Makefile calls awk on a "*.c" glob. The results of this glob are sorted
+but the order depends on the locale settings, particularly whether
+"util.c" and "util2.c" sort before or after each other. In en_US.UTF-8
+they sort one way, in C, they sort the other. The sorting order changes 
+the output binaries. The behaviour also changes dependning on whether
+SHELL (/bin/sh) is dash or bash.
+
+Specify a C locale setting to be deterministic.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: rsync-3.2.3/Makefile.in
+===================================================================
+--- rsync-3.2.3.orig/Makefile.in
++++ rsync-3.2.3/Makefile.in
+@@ -26,6 +26,11 @@ MKDIR_P=@MKDIR_P@
+ VPATH=$(srcdir)
+ SHELL=/bin/sh
+ 
++# We use globbing in commands, need to be deterministic
++unexport LC_ALL
++LC_COLLATE=C
++export LC_COLLATE
++
+ .SUFFIXES:
+ .SUFFIXES: .c .o
+ 
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.3.bb b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
index 375efa0dea..08778ec908 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.3.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
@@ -12,6 +12,7 @@ DEPENDS = "popt"
 SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://rsyncd.conf \
            file://makefile-no-rebuild.patch \
+           file://determism.patch \
            "
 
 SRC_URI[sha256sum] = "becc3c504ceea499f4167a260040ccf4d9f2ef9499ad5683c179a697146ce50e"
-- 
2.29.2

