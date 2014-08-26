Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2334670F5A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 03:13:03 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id lf10so22407762pab.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 20:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=moNLPmBhz5yfUKmRPoEXBdTPoIduL4SaiAFtv1ehZYA=;
	b=P4VJiLuv52O+UmTc44Y7yi+sEaQnlGdW92oWahJ7/GoqBWRgViqwU3TZIEv4qoaC7S
	Xdt6v6UCDt4HVTt0vvgxya5ZmZZVy3RqgVUGQOJ1StrPxtrqUzUR4qCoKUUlXGF3upLR
	IgGVyKNn6WC69EDIUvOfTgp70dLz8Nu2qcZHUO2RG9CVoQWrZj3u0kVGrhxmpHggj6y+
	aF8jK2E2eZqttXkdQO15UqUwpzdokAUfzrCNNeLMjJl5G6asLyvwdi7X2cBGEC7gdyEe
	lDWVsweyPTBGDd5Il5lvFPZtyIfuea0wf6BM6Z17taHG/cnAzFUsdJhUCbnZ8i5T3z9c
	JwlQ==
X-Received: by 10.70.21.202 with SMTP id x10mr33987591pde.92.1409022785431;
	Mon, 25 Aug 2014 20:13:05 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id qv9sm1233944pbb.86.2014.08.25.20.13.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Aug 2014 20:13:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 20:12:56 -0700
Message-Id: <1409022778-29904-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1409022778-29904-1-git-send-email-akuster808@gmail.com>
References: <1409022778-29904-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 1/3] IBM Power5 v2: Add new tune file for PPC power5 cpu
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
X-List-Received-Date: Tue, 26 Aug 2014 03:13:04 -0000

V2: rename file
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/machine/include/tune-power5.inc | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-power5.inc

diff --git a/meta/conf/machine/include/tune-power5.inc b/meta/conf/machine/include/tune-power5.inc
new file mode 100644
index 0000000..30be869
--- /dev/null
+++ b/meta/conf/machine/include/tune-power5.inc
@@ -0,0 +1,21 @@
+DEFAULTTUNE ?= "ppc64p5"
+
+require conf/machine/include/powerpc/arch-powerpc64.inc
+
+TUNEVALID[power5] = "Enable IBM Power5 specific processor optimizations"
+TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "power5", " -mcpu=power5", "", d)}"
+
+AVAILTUNES += "ppcp5 ppc64p5"
+TUNE_FEATURES_tune-ppcp5 = "m32 fpu-hard power5 altivec"
+BASE_LIB_tune-ppcp5 = "lib"
+TUNE_PKGARCH_tune-ppcp5 = "ppcp5"
+PACKAGE_EXTRA_ARCHS_tune-ppcp5 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc} ppcp5"
+
+TUNE_FEATURES_tune-ppc64p5 = "m64 fpu-hard power5 altivec"
+BASE_LIB_tune-ppc64p5 = "lib64"
+TUNE_PKGARCH_tune-ppc64p5 = "ppc64p5"
+PACKAGE_EXTRA_ARCHS_tune-ppc64p5 = "${PACKAGE_EXTRA_ARCHS_tune-powerpc64} ppc64p5"
+
+# glibc configure options to get power5 specific library
+GLIBC_EXTRA_OECONF_powerpc64 += "${@bb.utils.contains("TUNE_FEATURES", "power5", "--with-cpu=power5", "", d)}"
+GLIBC_EXTRA_OECONF_powerpc += "${@bb.utils.contains("TUNE_FEATURES", "power5", "--with-cpu=power5", "", d)}"
-- 
1.9.1


