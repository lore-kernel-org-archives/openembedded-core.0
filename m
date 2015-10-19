Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 1E36F7705F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 18:59:55 +0000 (UTC)
Received: by iow1 with SMTP id 1so207403626iow.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 11:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bWZySXxa7WJOb9qX2sdBUg6yifsbg7sqKQ5B52ahWtA=;
	b=GFRvEPsp/cGPgSLID7K7MeCtFQiV8Z6CQTqDfHBMJdPblXvcAiTwmvYYrhFpYIQ6km
	JeGbaCGmVyWWt/R/XbnEB+VSme9Bb/jf0YgsbpkTO7LZCv2z1t9dqRMa0K2TTmUh/iuF
	4Y3MBi51wHLkOSMTS6bQNQQ3rmEX5gbVqSjQ1kbrsarkWp3BGhD3Ov6epObKm369BZd6
	Bq0/a4NbKB5UAt4hBbty2upH4tDeYhU6Fnm3pU3WZu+9kORCX/OAkK4NLNlMo/jyOyJh
	LIivPzbH6Yxfoj/NFW6PFCmiWVMn2fTgQROIG2zlpa/v+biCjhgAvKCGGdPBtf8GSFh3
	Z+iQ==
X-Received: by 10.107.169.18 with SMTP id s18mr34880042ioe.190.1445281195917; 
	Mon, 19 Oct 2015 11:59:55 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ot2sm8240489igb.17.2015.10.19.11.59.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 11:59:55 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 11:59:34 -0700
Message-Id: <1445281177-3309-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445281177-3309-1-git-send-email-armccurdy@gmail.com>
References: <1445281177-3309-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/5] tune-bonnell.inc: support for first generation Intel Atom CPUs
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
X-List-Received-Date: Mon, 19 Oct 2015 18:59:56 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/tune-bonnell.inc | 35 ++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-bonnell.inc

diff --git a/meta/conf/machine/include/tune-bonnell.inc b/meta/conf/machine/include/tune-bonnell.inc
new file mode 100644
index 0000000..f6d92dc
--- /dev/null
+++ b/meta/conf/machine/include/tune-bonnell.inc
@@ -0,0 +1,35 @@
+# Settings for the GCC(1) cpu-type "bonnell":
+#
+#      Intel Bonnell CPU with 64-bit extensions, MOVBE, MMX, SSE, SSE2, SSE3
+#      and SSSE3 instruction set support. 
+#
+# This tune is recommended for the processors based on the first generation
+# Bonnell (45nm) and Saltwell (32nm) Intel Atom CPUs.
+#
+DEFAULTTUNE ?= "bonnell-32"
+
+# Include the previous tune to pull in PACKAGE_EXTRA_ARCHS
+require conf/machine/include/tune-core2.inc
+
+# Extra tune features
+TUNEVALID[bonnell] = "Enable bonnell specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "bonnell", " -march=bonnell -mtune=bonnell -msse3 -mfpmath=sse", "", d)}"
+
+# Extra tune selections
+AVAILTUNES += "bonnell-32"
+TUNE_FEATURES_tune-bonnell-32 = "${TUNE_FEATURES_tune-x86} bonnell"
+BASE_LIB_tune-bonnell-32 = "lib"
+TUNE_PKGARCH_tune-bonnell-32 = "bonnell-32"
+PACKAGE_EXTRA_ARCHS_tune-bonnell-32 = "${PACKAGE_EXTRA_ARCHS_tune-core2-32} bonnell-32"
+
+AVAILTUNES += "bonnell-64"
+TUNE_FEATURES_tune-bonnell-64 = "${TUNE_FEATURES_tune-x86-64} bonnell"
+BASE_LIB_tune-bonnell-64 = "lib64"
+TUNE_PKGARCH_tune-bonnell-64 = "bonnell-64"
+PACKAGE_EXTRA_ARCHS_tune-bonnell-64 = "${PACKAGE_EXTRA_ARCHS_tune-core2-64} bonnell-64"
+
+AVAILTUNES += "bonnell-64-x32"
+TUNE_FEATURES_tune-bonnell-64-x32 = "${TUNE_FEATURES_tune-x86-64-x32} bonnell"
+BASE_LIB_tune-bonnell-64-x32 = "libx32"
+TUNE_PKGARCH_tune-bonnell-64-x32 = "bonnell-64-x32"
+PACKAGE_EXTRA_ARCHS_tune-bonnell-64-x32 = "${PACKAGE_EXTRA_ARCHS_tune-core2-64-x32} bonnell-64-x32"
-- 
1.9.1


