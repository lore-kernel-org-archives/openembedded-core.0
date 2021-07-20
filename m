Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.3993.1626759788737651940
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jul 2021 22:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 16K5h6HF021236
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jul 2021 22:43:07 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 19 Jul 2021 22:43:06 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Mon, 19 Jul 2021 22:43:05 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH v2] rxvt-unicode: fix CVE-2021-33477
Date: Tue, 20 Jul 2021 13:43:03 +0800
Message-ID: <20210720054303.13374-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fixed CVE-2021-33477 and disabled problematic code in 2 commits in
rxvt-unicode upstream. Backport and rebase the latter one to fix
CVE-2021-33477 for rxvt-unicode.

CVE: CVE-2021-33477

Ref to:
https://security-tracker.debian.org/tracker/CVE-2021-33477

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../rxvt-unicode/CVE-2021-33477.patch         | 25 +++++++++++++++++++
 .../rxvt-unicode/rxvt-unicode_9.22.bb         |  4 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/rxvt-unicode/rxvt-unicode/CVE-2021-33477.patch

diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode/CVE-2021-33477.patch b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/CVE-2021-33477.patch
new file mode 100644
index 0000000000..1b7c47c866
--- /dev/null
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode/CVE-2021-33477.patch
@@ -0,0 +1,25 @@
+Backport patch to fix CVE-2021-33477.
+
+CVE: CVE-2021-33477
+
+Upstream-Status: Backport [http://cvs.schmorp.de/rxvt-unicode/src/command.C?view=log#rev1.585]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+--- rxvt-unicode/src/command.C	2019/07/07 08:02:15	1.584
++++ rxvt-unicode/src/command.C	2019/07/07 08:06:44	1.585
+@@ -2692,12 +2692,14 @@
+         }
+         break;
+ 
++#if 0 // disabled because embedded newlines can make exploits easier
+         /* kidnapped escape sequence: Should be 8.3.48 */
+       case C1_ESA:		/* ESC G */
+         // used by original rxvt for rob nations own graphics mode
+         if (cmd_getc () == 'Q')
+           tt_printf ("\033G0\012");	/* query graphics - no graphics */
+         break;
++#endif
+ 
+         /* 8.3.63: CHARACTER TABULATION SET */
+       case C1_HTS:		/* ESC H */
diff --git a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.22.bb b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.22.bb
index 283e8d7751..c14e8d06a7 100644
--- a/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.22.bb
+++ b/meta/recipes-sato/rxvt-unicode/rxvt-unicode_9.22.bb
@@ -4,7 +4,9 @@ LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://src/main.C;beginline=1;endline=31;md5=d3600d7ee1062667fcd1193fbe6485f6"
 
-SRC_URI += "file://0001-libev-remove-deprecated-throw-specification.patch"
+SRC_URI += "file://0001-libev-remove-deprecated-throw-specification.patch \
+            file://CVE-2021-33477.patch \
+            "
 
 SRC_URI[sha256sum] = "e94628e9bcfa0adb1115d83649f898d6edb4baced44f5d5b769c2eeb8b95addd"
 
-- 
2.17.1

