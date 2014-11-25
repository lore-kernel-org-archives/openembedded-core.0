Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AF577721BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 05:58:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAP5wmV8017860
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 24 Nov 2014 21:58:48 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Mon, 24 Nov 2014 21:58:47 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <saul.wold@intel.com>,
	<liezhi.yang@windriver.com>
Date: Tue, 25 Nov 2014 13:58:43 +0800
Message-ID: <f88b26d3dae098e6c16d7a216228932c3260ac04.1416894918.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1416894918.git.hongxu.jia@windriver.com>
References: <cover.1416894918.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemtap: fix do_compile failed on fedora21
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
X-List-Received-Date: Tue, 25 Nov 2014 05:58:49 -0000
Content-Type: text/plain

For dora, the systemtap-native do_compile failed on fedora21
...
| In file included from /usr/include/stdio.h:27:0,
|                  from tmp/work/x86_64-linux/systemtap-native/
2.3+gitAUTOINC+e58138572e-r0/git/staprun/staprun.h:18,
|                  from tmp/work/x86_64-linux/systemtap-native/
2.3+gitAUTOINC+e58138572e-r0/git/staprun/staprun.c:24:
| /usr/include/features.h:148:3: error: #warning "_BSD_SOURCE and
_SVID_SOURCE are deprecated, use _DEFAULT_SOURCE" [-Werror=cpp]
|  # warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use
_DEFAULT_SOURCE"
...

We backport a patch from 2.6 to fix this issue

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...pt-to-glibc-deprecation-of-_BSD_SOURCE-ad.patch | 27 ++++++++++++++++++++++
 meta/recipes-kernel/systemtap/systemtap_git.inc    |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-PR16632-Adapt-to-glibc-deprecation-of-_BSD_SOURCE-ad.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap/0001-PR16632-Adapt-to-glibc-deprecation-of-_BSD_SOURCE-ad.patch b/meta/recipes-kernel/systemtap/systemtap/0001-PR16632-Adapt-to-glibc-deprecation-of-_BSD_SOURCE-ad.patch
new file mode 100644
index 0000000..df9b7c9
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/0001-PR16632-Adapt-to-glibc-deprecation-of-_BSD_SOURCE-ad.patch
@@ -0,0 +1,27 @@
+From 62379eedc739605f04d02e76eb50c4d2f129ae08 Mon Sep 17 00:00:00 2001
+From: "Frank Ch. Eigler" <fche@redhat.com>
+Date: Tue, 25 Nov 2014 13:45:14 +0800
+Subject: [PATCH] PR16632: Adapt to glibc deprecation of _BSD_SOURCE: add _DEFAULT_SOURCE
+
+Upstream-Status: Backport from commit c6278d012a483d97f5ee4756406d9c88735d2838
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ staprun/staprun.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/staprun/staprun.c b/staprun/staprun.c
+index b85e2b0..1e1b5c3 100644
+--- a/staprun/staprun.c
++++ b/staprun/staprun.c
+@@ -21,6 +21,7 @@
+ 
+ #define _XOPEN_SOURCE
+ #define _BSD_SOURCE
++#define _DEFAULT_SOURCE
+ #include "staprun.h"
+ #include "../privilege.h"
+ #include "../runtime/k_syms.h"
+-- 
+1.9.1
+
diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index d8c6408..2724c0e 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -7,6 +7,7 @@ PV = "2.3+git${SRCPV}"
 SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://docproc-build-fix.patch \
            file://obsolete_automake_macros.patch \
+           file://0001-PR16632-Adapt-to-glibc-deprecation-of-_BSD_SOURCE-ad.patch \
           "
 
 FILESPATH = "${FILE_DIRNAME}/systemtap"
-- 
1.9.1


