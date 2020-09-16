Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.13979.1600224507797191504
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2020 19:48:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: wenlin.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08G2mQVu008743
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2020 19:48:26 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Tue, 15 Sep 2020
 19:48:25 -0700
From: "wenlin.kang@windriver.com" <wenlin.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][zeus][PATCH] nasm: fix CVE-2020-24978
Date: Tue, 15 Sep 2020 19:48:25 -0700
Message-ID: <20200916024825.186993-1-wenlin.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

Fix CVE-2020-24978

Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
---
 ...BR3392712-pp_tokline-fix-double-free.patch | 36 +++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_2.14.02.bb    |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/0001-BR3392712-pp_tokline-fix-double-free.patch

diff --git a/meta/recipes-devtools/nasm/nasm/0001-BR3392712-pp_tokline-fix-double-free.patch b/meta/recipes-devtools/nasm/nasm/0001-BR3392712-pp_tokline-fix-double-free.patch
new file mode 100644
index 0000000000..b2cd3fe24b
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/0001-BR3392712-pp_tokline-fix-double-free.patch
@@ -0,0 +1,36 @@
+From 652c58c92d9e8eaf09a0eb125c4fe2d4b6cc3397 Mon Sep 17 00:00:00 2001
+From: Cyrill Gorcunov <gorcunov@gmail.com>
+Date: Tue, 15 Sep 2020 15:50:20 +0800
+Subject: [PATCH] BR3392712: pp_tokline: fix double free
+
+Make sure the data being freed get double
+freed after -- the pointers must be zapped
+(actually nasm_free and free_tlist support
+being called with NULL pointer as an argument).
+
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/8806c3ca007b84accac21dd88b900fb03614ceb7]
+CVE: CVE-2020-24978
+
+Signed-off-by: Cyrill Gorcunov <gorcunov@gmail.com>
+Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
+---
+ asm/preproc.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/asm/preproc.c b/asm/preproc.c
+index 2737ec1..da2c9c9 100644
+--- a/asm/preproc.c
++++ b/asm/preproc.c
+@@ -5119,6 +5119,9 @@ static char *pp_getline(void)
+                             free_tlist(m->iline);
+                             nasm_free(m->paramlen);
+                             l->finishes->in_progress = 0;
++                            m->params = NULL;
++                            m->iline = NULL;
++                            m->paramlen = NULL;
+                         }
+                     }
+ 
+-- 
+2.13.3
+
diff --git a/meta/recipes-devtools/nasm/nasm_2.14.02.bb b/meta/recipes-devtools/nasm/nasm_2.14.02.bb
index bd4ecea8b6..bb2b58f87e 100644
--- a/meta/recipes-devtools/nasm/nasm_2.14.02.bb
+++ b/meta/recipes-devtools/nasm/nasm_2.14.02.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=90904486f8fbf1861cf42752e1a39efe"
 SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://CVE-2018-19755.patch \
            file://CVE-2019-14248.patch \
+           file://0001-BR3392712-pp_tokline-fix-double-free.patch \
            "
 
 SRC_URI[md5sum] = "3f489aa48ad2aa1f967dc5e293bbd06f"
-- 
2.17.1

