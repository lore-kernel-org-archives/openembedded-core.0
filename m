Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.3142.1625557348367373321
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 00:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1667gQw0021848
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Jul 2021 00:42:27 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1667gQDK011044
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Jul 2021 00:42:26 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 6 Jul 2021 00:42:26 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Tue, 6 Jul 2021 00:42:25 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] rxvt-unicode: fix CVE-2021-33477
Date: Tue, 6 Jul 2021 15:42:23 +0800
Message-ID: <20210706074223.32206-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2021-33477 for rxvt-unicode.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
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
2.17.1

