Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 19373710BE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 03:13:08 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id v10so21649085pde.38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 20:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZQWUQFMh5Cs3B2HNE72B6uy/o+LwEsbGqW6hmkMAlF0=;
	b=kyp6OXJDD+W5B3xwKovtZHEnYy8X3qLylfwD+mg0jz8i5HjCNeDPteMKbuuFLgVHAY
	NT28X3I1qEsq7ebeDS9E2TqknyxfsjC1OPZ/aNOQzAldTUb3N6Dqbe/i12l7NuofrFGS
	AdO5+AB+cnVh/XgQ/9/SmNUT8aNHGoVpvLWnP47Nell72RhaRTSY0lvER0OUngp3qWL/
	rW5mmtNfZr5Kbhq993ZNXghlwrLS4xuY1u6ALi+OwwsyCZ2JydDPkDtH6V/Y9Uk+MfMg
	Uoou3rbPWKXDIv95D2rM1PRbTW6wR7wMqO4alZpiLVXI5UFIwrvbaj7h/rrJU2Jktokz
	ScoQ==
X-Received: by 10.68.245.9 with SMTP id xk9mr16418761pbc.123.1409022789962;
	Mon, 25 Aug 2014 20:13:09 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id qv9sm1233944pbb.86.2014.08.25.20.13.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Aug 2014 20:13:08 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 20:12:58 -0700
Message-Id: <1409022778-29904-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1409022778-29904-1-git-send-email-akuster808@gmail.com>
References: <1409022778-29904-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 3/3] IBM power7 v2: Add new tune file for PPC power7
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
X-List-Received-Date: Tue, 26 Aug 2014 03:13:09 -0000

v2: rename file

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/machine/include/tune-power7.inc | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-power7.inc

diff --git a/meta/conf/machine/include/tune-power7.inc b/meta/conf/machine/include/tune-power7.inc
new file mode 100644
index 0000000..7069e75
--- /dev/null
+++ b/meta/conf/machine/include/tune-power7.inc
@@ -0,0 +1,21 @@
+DEFAULTTUNE ?= "ppcpr7"
+
+require conf/machine/include/powerpc/arch-powerpc64.inc
+
+TUNEVALID[power7] = "Enable IBM Power7 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "power7", " -mcpu=power7", "", d)}"
+
+AVAILTUNES += "ppcp7 ppc64p7"
+TUNE_FEATURES_tune-ppcp7 = "m32 fpu-hard power7 altivec"
+BASE_LIB_tune-ppcp7 = "lib"
+TUNE_PKGARCH_tune-ppcp7 = "ppcp7"
+PACKAGE_EXTRA_ARCHS_tune-ppcp7 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppcp7"
+
+TUNE_FEATURES_tune-ppc64p7 = "m64 fpu-hard power7 altivec"
+BASE_LIB_tune-ppc64p7 = "lib64"
+TUNE_PKGARCH_tune-ppc64p7 = "ppc64p7"
+PACKAGE_EXTRA_ARCHS_tune-ppc64p7 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64p7"
+
+# glibc configure options to get power7 specific library
+GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains("TUNE_FEATURES", "power7", "--with-cpu=power7", "", d)}"
+GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains("TUNE_FEATURES", "power7", "--with-cpu=power7", "", d)}"
-- 
1.9.1


