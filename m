Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 02B6878289
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 09:24:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v599Onai011756
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Jun 2017 02:24:49 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 9 Jun 2017 02:24:48 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 9 Jun 2017 05:24:42 -0400
Message-ID: <4dd9b774d3b5d3c73335c861d4904af3775988af.1497000088.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1497000088.git.hongxu.jia@windriver.com>
References: <cover.1497000088.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] librepo: Fix typo: correct LRO_SSLVERIFYHOST with CURLOPT_SSL_VERIFYHOST
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
X-List-Received-Date: Fri, 09 Jun 2017 09:24:49 -0000
Content-Type: text/plain

The commit 51d32c6cd88ba0139c32793183fd6a236c1ef456 in
git://github.com/rpm-software-management/librepo.git
...
Author: Tomas Mlcoch <tmlcoch@redhat.com>
Date:   Mon May 5 14:31:35 2014 +0200

    Add LRO_SSLVERIFYPEER and LRO_SSLVERIFYHOST options (RhBug: 1093014)
...

It incorrectly setopt CURLOPT_SSL_VERIFYPEER for LRO_SSLVERIFYHOST.
Use CURLOPT_SSL_VERIFYHOST to correct.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...rrect-LRO_SSLVERIFYHOST-with-CURLOPT_SSL_.patch | 40 ++++++++++++++++++++++
 meta/recipes-devtools/librepo/librepo_git.bb       |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/librepo/librepo/0005-Fix-typo-correct-LRO_SSLVERIFYHOST-with-CURLOPT_SSL_.patch

diff --git a/meta/recipes-devtools/librepo/librepo/0005-Fix-typo-correct-LRO_SSLVERIFYHOST-with-CURLOPT_SSL_.patch b/meta/recipes-devtools/librepo/librepo/0005-Fix-typo-correct-LRO_SSLVERIFYHOST-with-CURLOPT_SSL_.patch
new file mode 100644
index 0000000..b0c7d1c
--- /dev/null
+++ b/meta/recipes-devtools/librepo/librepo/0005-Fix-typo-correct-LRO_SSLVERIFYHOST-with-CURLOPT_SSL_.patch
@@ -0,0 +1,40 @@
+From a4bbbccce6edc1a2d1bd475506e2975fd7696c88 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 8 Jun 2017 16:31:30 +0800
+Subject: [PATCH] Fix typo: correct LRO_SSLVERIFYHOST with
+ CURLOPT_SSL_VERIFYHOST
+
+In commit 51d32c6cd88ba0139c32793183fd6a236c1ef456
+---
+Author: Tomas Mlcoch <tmlcoch@redhat.com>
+Date:   Mon May 5 14:31:35 2014 +0200
+
+    Add LRO_SSLVERIFYPEER and LRO_SSLVERIFYHOST options (RhBug: 1093014)
+---
+
+It incorrectly setopt CURLOPT_SSL_VERIFYPEER for LRO_SSLVERIFYHOST.
+Use CURLOPT_SSL_VERIFYHOST to correct.
+
+Upstream-Status: Submitted
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ librepo/handle.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/librepo/handle.c b/librepo/handle.c
+index ccea79b..ff39db4 100644
+--- a/librepo/handle.c
++++ b/librepo/handle.c
+@@ -629,7 +629,7 @@ lr_handle_setopt(LrHandle *handle,
+ 
+     case LRO_SSLVERIFYHOST:
+         handle->sslverifyhost = va_arg(arg, long) ? 2 : 0;
+-        c_rc = curl_easy_setopt(c_h, CURLOPT_SSL_VERIFYPEER, handle->sslverifyhost);
++        c_rc = curl_easy_setopt(c_h, CURLOPT_SSL_VERIFYHOST, handle->sslverifyhost);
+         break;
+ 
+     case LRO_SSLCLIENTCERT:
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/librepo/librepo_git.bb b/meta/recipes-devtools/librepo/librepo_git.bb
index 2f194f1..3238b14 100644
--- a/meta/recipes-devtools/librepo/librepo_git.bb
+++ b/meta/recipes-devtools/librepo/librepo_git.bb
@@ -7,6 +7,7 @@ SRC_URI = "git://github.com/rpm-software-management/librepo.git \
            file://0002-Do-not-try-to-obtain-PYTHON_INSTALL_DIR-by-running-p.patch \
            file://0003-tests-fix-a-race-when-deleting-temporary-directories.patch \
            file://0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch \
+           file://0005-Fix-typo-correct-LRO_SSLVERIFYHOST-with-CURLOPT_SSL_.patch \
            "
 
 PV = "1.7.20+git${SRCPV}"
-- 
2.8.1


