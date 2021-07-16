Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.1434.1626403354833085378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494624"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494624"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:50 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075496"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:49 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 13/28] rxvt-unicode: fix CVE-2021-33477
Date: Fri, 16 Jul 2021 10:42:11 +0800
Message-Id: <ad7582bcef28da48b9a7f97eb43805f393f4979a.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2021-33477 for rxvt-unicode.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../rxvt-unicode-fix-CVE-2021-33477.patch     | 33 +++++++++++++++++++
 .../rxvt-unicode/rxvt-unicode_9.22.bb         |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt-unicode-fix-CVE-2021-33477.patch

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt-unicode-fix-CVE-2021-33477.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt-unicode-fix-CVE-2021-33477.patch
new file mode 100644
index 0000000000..6c3590c311
--- /dev/null
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/rxvt-unicode-fix-CVE-2021-33477.patch
@@ -0,0 +1,33 @@
+Backport patch to fix CVE-2021-33477.
+
+CVE: CVE-2021-33477
+
+Upstream-Status: Backport [http://cvs.schmorp.de/rxvt-unicode/src/command.C?r1=1.582&r2=1.583]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/command.C | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/command.C b/src/command.C
+index 7b79f51..2f7de60 100644
+--- a/src/command.C
++++ b/src/command.C
+@@ -2725,7 +2725,7 @@ rxvt_term::process_escape_seq ()
+         /* kidnapped escape sequence: Should be 8.3.48 */
+       case C1_ESA:		/* ESC G */
+         // used by original rxvt for rob nations own graphics mode
+-        if (cmd_getc () == 'Q')
++        if (cmd_getc () == 'Q' && option (Opt_insecure))
+           tt_printf ("\033G0\012");	/* query graphics - no graphics */
+         break;
+ 
+@@ -2944,7 +2944,7 @@ rxvt_term::process_csi_seq ()
+         break;
+ 
+       case CSI_CUB:		/* 8.3.18: (1) CURSOR LEFT */
+-      case CSI_HPB: 		/* 8.3.59: (1) CHARACTER POSITION BACKWARD */
++      case CSI_HPB:		/* 8.3.59: (1) CHARACTER POSITION BACKWARD */
+ #ifdef ISO6429
+         arg[0] = -arg[0];
+ #else				/* emulate common DEC VTs */
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.22.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.22.bb
index 283e8d7751..dee549cc78 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.22.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.22.bb
@@ -4,7 +4,9 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://src/main.C;beginline=1;endline=31;md5=d3600d7ee1062667fcd1193fbe6485f6"
 
-SRC_URI += "file://0001-libev-remove-deprecated-throw-specification.patch"
+SRC_URI += "file://0001-libev-remove-deprecated-throw-specification.patch \
+            file://rxvt-unicode-fix-CVE-2021-33477.patch \
+            "
 
 SRC_URI[sha256sum] = "e94628e9bcfa0adb1115d83649f898d6edb4baced44f5d5b769c2eeb8b95addd"
 
-- 
2.31.1

