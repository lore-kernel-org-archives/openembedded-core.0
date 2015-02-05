Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id A628472701
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:04:22 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id lf10so3277785pab.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=mHNjUmsgfBJUkKNwHS5ADiwOVcXEeeHF5Y3GGOBWlrY=;
	b=elBBxLrff7j97POQhCmFQ/zcD3MHtCpotDW5CAZXNVL4wxKcFMlyr2Nvv8tOgqkhMG
	NYdI+hZOfAl0CZOM+Kespa9bjyzuYvcprQOlOKmhb7UOu2CqW9xKseiVg47iaqkAGhaX
	mtdtYrWwNoBvV+zJqsTF+ICj3+kG+W8oodwgzBJ9O1eENelTatJzCSBeaqe26D74hNbb
	dcnX62VmjVmL27QQWWzHyZ1bWm01pA51ZnFdBtAtx7nsvhdzxIlwg5uNcZM7+p6s/L42
	RKWmqo1pw8ZtlqdB03hZkOd4O0Ow8THE3HLS5rFiaIfkIAeS6z+xpfFruzuNMzaRYLek
	641Q==
X-Received: by 10.66.145.3 with SMTP id sq3mr6212830pab.7.1423152263829;
	Thu, 05 Feb 2015 08:04:23 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.04.21
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:04:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:13 -0800
Message-Id: <cb1282a8368ff9149e5c9ea8d39f550bbf1de5a3.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 05/61] libunwind: Fix test case link failure on PowerPC with Altivec
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
X-List-Received-Date: Thu, 05 Feb 2015 16:04:24 -0000

From: Ting Liu <ting.liu@freescale.com>

Signed-off-by: Ting Liu <ting.liu@freescale.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...k-failure-on-PowerPC-systems-with-Altivec.patch | 28 ++++++++++++++++++++++
 meta/recipes-support/libunwind/libunwind_1.1.bb    |  4 ++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-support/libunwind/libunwind-1.1/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch

diff --git a/meta/recipes-support/libunwind/libunwind-1.1/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch b/meta/recipes-support/libunwind/libunwind-1.1/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch
new file mode 100644
index 0000000..dc0f5c1
--- /dev/null
+++ b/meta/recipes-support/libunwind/libunwind-1.1/Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch
@@ -0,0 +1,28 @@
+Fix test case link failure on PowerPC systems with Altivec
+
+Upstream-Status:backport
+
+On systems where the system compiler supports Altivec by default,
+the libunwind Makefile will attempt to build an extra test case
+ppc64-test-altivec.  Unfortunately, the link step will fail since
+the Makefile does not actually link against the libunwind library.
+
+Fixed by adding the appropriate LDADD macro.
+
+Signed-off-by: Ulrich Weigand <address@hidden>
+---
+ tests/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 0e30536..9c76628 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -201,3 +201,4 @@ Lia64_test_rbs_LDADD = $(LIBUNWIND_local)
+ Lia64_test_readonly_LDADD = $(LIBUNWIND_local)
+ ia64_test_dyn1_LDADD = $(LIBUNWIND)
+ ia64_test_sig_LDADD = $(LIBUNWIND)
++ppc64_test_altivec_LDADD = $(LIBUNWIND)
+-- 
+1.8.5
+
diff --git a/meta/recipes-support/libunwind/libunwind_1.1.bb b/meta/recipes-support/libunwind/libunwind_1.1.bb
index bc38e36..20db132 100644
--- a/meta/recipes-support/libunwind/libunwind_1.1.bb
+++ b/meta/recipes-support/libunwind/libunwind_1.1.bb
@@ -1,4 +1,8 @@
 require libunwind.inc
 
+SRC_URI += "\
+    file://Fix-test-case-link-failure-on-PowerPC-systems-with-Altivec.patch \
+"
+
 SRC_URI[md5sum] = "fb4ea2f6fbbe45bf032cd36e586883ce"
 SRC_URI[sha256sum] = "9dfe0fcae2a866de9d3942c66995e4b460230446887dbdab302d41a8aee8d09a"
-- 
1.9.1


