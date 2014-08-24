Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id B9A357107F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 21:41:31 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id y10so19081340pdj.28
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 14:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LspRBgm9Ai+6tiAvd/2fp9sWwj/RNSrfhih19rSyMm8=;
	b=BdwyaO3Erv7WKUAA0uSnSUYq6QIy7lXPa7GodnVnFM77kvO5mnq/e3+i0rnl/kvPtm
	hx4/aHS+XCRlkvE/GIBjt6pReK/zzaXvpCsWC7VbtvMBjeGzRt7oU/NbtsLYe2lvTU5B
	S+vrYa08cyesoh+tQEHdhxrZWoFF/0Zn/ZlTZSThRxC1AHaCYkMyRD9dBW+coXI0GT7h
	3FMA+ScNhVgJ11QmGFj5ymrdJorbq4k+2bpqTTD+lAiw8ZBywggfco/n41FQrDg8GuJa
	l22o2eOLO+tE+pwuDN2nBZYUQYlCtmYU7APO8Mpr4tn6M+Ln6DdU4DXDFTbHCWVxWs2h
	mK4g==
X-Received: by 10.70.65.34 with SMTP id u2mr13659740pds.58.1408916492511;
	Sun, 24 Aug 2014 14:41:32 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	s16sm31659860pdj.21.2014.08.24.14.41.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Aug 2014 14:41:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Aug 2014 14:41:19 -0700
Message-Id: <1408916479-31831-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1408916479-31831-1-git-send-email-akuster808@gmail.com>
References: <1408916479-31831-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 3/3] IBM power7: Add new tune file for PPC power7
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
X-List-Received-Date: Sun, 24 Aug 2014 21:41:31 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/machine/include/tune-ppcpower7.inc | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-ppcpower7.inc

diff --git a/meta/conf/machine/include/tune-ppcpower7.inc b/meta/conf/machine/include/tune-ppcpower7.inc
new file mode 100644
index 0000000..7069e75
--- /dev/null
+++ b/meta/conf/machine/include/tune-ppcpower7.inc
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


