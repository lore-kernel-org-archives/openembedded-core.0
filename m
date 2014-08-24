Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id A385E70FC5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 21:41:29 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id z10so18892035pdj.30
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Aug 2014 14:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=O56tFizT+jzljxDJCcjf5Yqpl64YhAj4hay/m0tGFJQ=;
	b=xZD8hVhdI0AdeujihJJGAdH54Vu5Aa6wnHzeUzyhiPHJkpa9ogThK5I953QMi0SnV2
	0BKlAaaAjXruJA8d9KCHwDP+BvaiBlqdORdGBm7BTctRkIOzAYM4HnNQ9WZ0QWgwmw54
	dXQDmQyTh3T367qtvYvAKBJEfdi1pjZxoPCZerXn5H1pnoPoei1WKmE1DSQSijm/MdBU
	XBPzaAgqr6zGeLMhLJbqh33oWSeowsKWffW2lCUDfSwCDKTRbJgPn3VvBHAp8/zwyje4
	L44JrkcqC7//rDQZ/tn/6EDQLHlty7ht/aOVuS4h+w1DjFi7CDl5SYrIYh3FGaSQ6GB7
	8NwA==
X-Received: by 10.70.102.5 with SMTP id fk5mr10045868pdb.114.1408916490600;
	Sun, 24 Aug 2014 14:41:30 -0700 (PDT)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by mx.google.com with ESMTPSA id
	s16sm31659860pdj.21.2014.08.24.14.41.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Aug 2014 14:41:29 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Aug 2014 14:41:18 -0700
Message-Id: <1408916479-31831-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1408916479-31831-1-git-send-email-akuster808@gmail.com>
References: <1408916479-31831-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 2/3] IBM power6: Add new tune file for PPC power6
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
 meta/conf/machine/include/tune-ppcpower6.inc | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta/conf/machine/include/tune-ppcpower6.inc

diff --git a/meta/conf/machine/include/tune-ppcpower6.inc b/meta/conf/machine/include/tune-ppcpower6.inc
new file mode 100644
index 0000000..7563798
--- /dev/null
+++ b/meta/conf/machine/include/tune-ppcpower6.inc
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


