Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 044B47708E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 18:59:57 +0000 (UTC)
Received: by iofz202 with SMTP id z202so63990889iof.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 11:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iDA5EOrnF6h5Gehp50rduX+pgNLMdaPHkf7xr/qleg8=;
	b=iuHJYfhoDkNOh6CIJ/OYupqBx2sk9m95Nt97bRM9Y9KBF9Qf9oDe+aWFVxSco/s9fx
	2t7kwrS/46mjHNz5rh2T+7/r4f8wprZeOqBGsRpNp16LnR73wJwy2lSdCmkDUIisgGYp
	0PpBXVGEc3j9Vxi7SdSxhmB8aJMfTwmnq2o4MCT5ojSXQx8DRcOiU6Rrko0i5IMzmeY6
	6/RJlIQLnPaWStBAcPOGXPU5l5qwoiZy9VMVXmLnW3OyMaLSNkhZYP5/wOyp+/PXyxQO
	SVwMDkDPCT7gUIbRXWGkhLs8l5EheFT2HO324d6q9KcWWIyKLO/5ZT6v1TECfypywItP
	gWlw==
X-Received: by 10.107.129.168 with SMTP id l40mr15282289ioi.174.1445281198009; 
	Mon, 19 Oct 2015 11:59:58 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ot2sm8240489igb.17.2015.10.19.11.59.56
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 11:59:57 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 11:59:35 -0700
Message-Id: <1445281177-3309-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445281177-3309-1-git-send-email-armccurdy@gmail.com>
References: <1445281177-3309-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/5] tune-silvermont.inc: support for second generation Intel Atom CPUs
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
X-List-Received-Date: Mon, 19 Oct 2015 18:59:58 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/tune-silvermont.inc | 36 +++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-silvermont.inc

diff --git a/meta/conf/machine/include/tune-silvermont.inc b/meta/conf/machine/include/tune-silvermont.inc
new file mode 100644
index 0000000..19bff65
--- /dev/null
+++ b/meta/conf/machine/include/tune-silvermont.inc
@@ -0,0 +1,36 @@
+# Settings for the GCC(1) cpu-type "silvermont":
+#
+#      Intel Silvermont CPU with 64-bit extensions, MOVBE, MMX, SSE, SSE2, SSE3,
+#      SSSE3, SSE4.1, SSE4.2, POPCNT, AES, PCLMUL and RDRND instruction set
+#      support. 
+#
+# This tune is recommended for the processors based on the second generation
+# Silvermont (22nm) Intel Atom CPUs.
+#
+DEFAULTTUNE ?= "silvermont-32"
+
+# Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
+require conf/machine/include/tune-bonnell.inc
+
+# Extra tune features
+TUNEVALID[silvermont] = "Enable silvermont specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "silvermont", " -march=silvermont -mtune=silvermont -msse4.2 -mfpmath=sse", "", d)}"
+
+# Extra tune selections
+AVAILTUNES += "silvermont-32"
+TUNE_FEATURES_tune-silvermont-32 = "${TUNE_FEATURES_tune-x86} silvermont"
+BASE_LIB_tune-silvermont-32 = "lib"
+TUNE_PKGARCH_tune-silvermont-32 = "silvermont-32"
+PACKAGE_EXTRA_ARCHS_tune-silvermont-32 = "${PACKAGE_EXTRA_ARCHS_tune-bonnell-32} silvermont-32"
+
+AVAILTUNES += "silvermont-64"
+TUNE_FEATURES_tune-silvermont-64 = "${TUNE_FEATURES_tune-x86-64} silvermont"
+BASE_LIB_tune-silvermont-64 = "lib64"
+TUNE_PKGARCH_tune-silvermont-64 = "silvermont-64"
+PACKAGE_EXTRA_ARCHS_tune-silvermont-64 = "${PACKAGE_EXTRA_ARCHS_tune-bonnell-64} silvermont-64"
+
+AVAILTUNES += "silvermont-64-x32"
+TUNE_FEATURES_tune-silvermont-64-x32 = "${TUNE_FEATURES_tune-x86-64-x32} silvermont"
+BASE_LIB_tune-silvermont-64-x32 = "libx32"
+TUNE_PKGARCH_tune-silvermont-64-x32 = "silvermont-64-x32"
+PACKAGE_EXTRA_ARCHS_tune-silvermont-64-x32 = "${PACKAGE_EXTRA_ARCHS_tune-bonnell-64-x32} silvermont-64-x32"
-- 
1.9.1


