Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id BEAA47070E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 03:13:06 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kx10so22087844pab.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 20:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=T7Ra31Y1K0x53hQZVWycehA9hHPiYiLFrV8XOnwGoHU=;
	b=nrwaKYeHKExzCS9RCmewBne29xU2TfEMRnEbBjQBsKlAiXLJe9TTWcH970P/XeM5vE
	ii69vi+pG84agAh02WENcGX+xZBx2Qrp2YzO+JGAlUDIYsbJA0Tk/KpNI3H9iu2gQqHS
	BjtVgJneceAthwyeB8pgZXnDR1raQ35/L3iRujs2A8NkSfyxG07OUJ0je4f1ADWCLQqC
	j6Z3NLr1L1F8JuJLeUYjBP5Zm+4Gk+RKsLCvxFbMKspOaNpgiZ5z2m4j+bh/6EqmpKWc
	rTJF5QzkolC95vnlXy/tJlOtiflMzTcXy9cI8aa09x8V0xFus3GVMrAz7dC8fSx3uzpv
	OT/Q==
X-Received: by 10.70.137.37 with SMTP id qf5mr22385076pdb.56.1409022787882;
	Mon, 25 Aug 2014 20:13:07 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id qv9sm1233944pbb.86.2014.08.25.20.13.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Aug 2014 20:13:06 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 20:12:57 -0700
Message-Id: <1409022778-29904-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1409022778-29904-1-git-send-email-akuster808@gmail.com>
References: <1409022778-29904-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/3] IBM power6 v2: Add new tune file for PPC power6
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
X-List-Received-Date: Tue, 26 Aug 2014 03:13:07 -0000

v2: rename file

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/machine/include/tune-power6.inc | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-power6.inc

diff --git a/meta/conf/machine/include/tune-power6.inc b/meta/conf/machine/include/tune-power6.inc
new file mode 100644
index 0000000..7563798
--- /dev/null
+++ b/meta/conf/machine/include/tune-power6.inc
@@ -0,0 +1,21 @@
+DEFAULTTUNE ?= "ppcpr6"
+
+require conf/machine/include/powerpc/arch-powerpc64.inc
+
+TUNEVALID[power6] = "Enable IBM Power6 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "power6", " -mcpu=power6", "", d)}"
+
+AVAILTUNES += "ppcp6 ppc64p6"
+TUNE_FEATURES_tune-ppcp6 = "m32 fpu-hard power6 altivec"
+BASE_LIB_tune-ppcp6 = "lib"
+TUNE_PKGARCH_tune-ppcp6 = "ppcp6"
+PACKAGE_EXTRA_ARCHS_tune-ppcp6 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppcp6"
+
+TUNE_FEATURES_tune-ppc64p6 = "m64 fpu-hard power6 altivec"
+BASE_LIB_tune-ppc64p6 = "lib64"
+TUNE_PKGARCH_tune-ppc64p6 = "ppc64p6"
+PACKAGE_EXTRA_ARCHS_tune-ppc64p6 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64p6"
+
+# glibc configure options to get power6 specific library
+GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains("TUNE_FEATURES", "power6", "--with-cpu=power6", "", d)}"
+GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains("TUNE_FEATURES", "power6", "--with-cpu=power6", "", d)}"
-- 
1.9.1


