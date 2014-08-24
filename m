Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8EF5C70E5A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 21:41:27 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id y13so19134714pdi.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 14:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=nW4RBYSqvJ2mZrzJ7Nukz0MJ5rb+wTv7M5y6DGUUu5c=;
	b=UbWH2YbPsFF9i/FWZA3VOpuz8IvKYFIQNVmvhrD1PnNCYs3P2z/Us2gTnPOTS5mcZT
	7y8A2222pXcVB16+k+hvAt5MEhbAIQo80HSpCr721ov5nrh6AIV3o9AwGJGMakE4zkyB
	5hRKZyV4dknDQntrjIjepLr7QWhZPhYU68UfBTADD1eZ262F20+jLWS/5HzjUFqYmcBA
	2/rdvooodfVI6hcxgE5vVJNGgXwt/ejjPyuaGbTOsmIn+G0c3tgRFmpif5J7qTijdQIt
	e3/cSrzAwi3lyFsbWK9GXIQgKc7kQsFDQePog2a32bBkfrGShf9xOy/YtTrnViy8h2We
	2Etg==
X-Received: by 10.70.100.137 with SMTP id ey9mr22996103pdb.21.1408916488834;
	Sun, 24 Aug 2014 14:41:28 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	s16sm31659860pdj.21.2014.08.24.14.41.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Aug 2014 14:41:27 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Aug 2014 14:41:17 -0700
Message-Id: <1408916479-31831-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1408916479-31831-1-git-send-email-akuster808@gmail.com>
References: <1408916479-31831-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 1/3] IBM Power5: Add new tune file for PPC power5 cpu
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
X-List-Received-Date: Sun, 24 Aug 2014 21:41:29 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/conf/machine/include/tune-ppcpower5.inc | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-ppcpower5.inc

diff --git a/meta/conf/machine/include/tune-ppcpower5.inc b/meta/conf/machine/include/tune-ppcpower5.inc
new file mode 100644
index 0000000..30be869
--- /dev/null
+++ b/meta/conf/machine/include/tune-ppcpower5.inc
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


