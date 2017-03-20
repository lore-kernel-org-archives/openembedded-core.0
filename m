Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 1131D77941
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 12:20:35 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id n11so62782193wma.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 05:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Ic/aF7mJ+Skq4EvgJkNrLwjdxCVILBYePTjR1qPig68=;
	b=a8Cxp7TRu/T+NQs3RPuKslFlwWFCgUNgM6avWoKuHR4+wMzxXkdlFU0lxPJjI+ZoWA
	NDxoIhCgmO6SLPvP3/IxDIfeqzJPCONUU6vt8U0YlpWioIrMRl0sSy8INWJAbugX3/Jz
	oTSs5MyfayV+FNG/VXPw3eSatQD29g1mQnu/AOrcSfbJMV291YBq2fnOzwp6UhWQ93lC
	UubHSj7nqFO9Nl+A0Z+9o0eHtrooZm81HZKj1LEodVtfvQMhGvomE1nNnPu4egj2ZX5P
	bUN/KsjiSsIvJwZ3yyoggZJlwOKvCzw1tL3icw9azFz3gaKkFstmhH+WjJ/tn+LO0dzc
	Jzuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ic/aF7mJ+Skq4EvgJkNrLwjdxCVILBYePTjR1qPig68=;
	b=HB28U+DVInSmD5hbKUaGeeSVdo0mwNOFQPUJfTp3li3ma32Ip5m6kMpcqeFWmmhmai
	0x0swAWkxIrOwakiAAO0JmQrJUmsoa78zDP6Xpoa149cvRowqyvEke0UbEWtMCZhXKwv
	RIN2lmSpWFegEhq0EB5OoKW2MnqcRkaaKxBXekOHpCeIS2Yi6sS5WhHd6G0oQ06E5n8t
	a2LtjaQBVJIiolba5zU/DBM7zJ8otmezsNMdS1No17KoKZKDM7hVk+7RCP4y7FIjbXAj
	XR41LzuQRb19kcNKdl7NjNgFulYr/osHBbkPEshcr7gtH8spUWfShvY8SaRB6STMNBDr
	0iPA==
X-Gm-Message-State: AFeK/H1m/mlK9UPZwON10E18dbsWNcNs01mJR+4DKn4C+7IpVE3IJX6txt+SNYP2+vrlQhiW
X-Received: by 10.28.154.7 with SMTP id c7mr10489094wme.119.1490012436538;
	Mon, 20 Mar 2017 05:20:36 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	m80sm13246323wmi.34.2017.03.20.05.20.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Mar 2017 05:20:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Mar 2017 12:20:30 +0000
Message-Id: <1490012430-748-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] binutils: disable gold on mingw
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
X-List-Received-Date: Mon, 20 Mar 2017 12:20:36 -0000

oe-core 759eed (binutils: Enable threading when gold is enabled and is not
default linker) causes linking in mingw SDKs to fail:

.../work/i686-nativesdk-mingw32-pokysdk-mingw32/binutils-cross-canadian-x86-64/2.28-r0
/recipe-sysroot-native/usr/bin/i686-pokysdk-mingw32/../../libexec/i686-pokysdk-mingw32/gcc/i686-pokysdk-mingw32/6.3.0/ld:
cannot find -lpthread

Work around this by disabling gold entirely in mingw SDKs.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/binutils/binutils.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 37813dd..7efe13f 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -78,6 +78,7 @@ EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
 
 LDGOLD_class-native = ""
 LDGOLD_class-crosssdk = ""
+LDGOLD_sdkmingw32 = ""
 LDGOLD ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', '--enable-gold=default --enable-threads', '--enable-gold --enable-ld=default --enable-threads', d)}"
 
 # This is necessary due to a bug in the binutils Makefiles
-- 
2.8.1


