Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.7636.1614232775214055620
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 21:59:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 11P5xIw6013580
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 Feb 2021 21:59:18 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 24 Feb 2021 21:59:17 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Wed, 24 Feb 2021 21:59:16 -0800
From: "kai" <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] toolchain-scripts.bbclass: customize prompt string for SDKs
Date: Thu, 25 Feb 2021 13:59:14 +0800
Message-ID: <20210225055914.34860-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Introduce a new variable SDK_PS1 to customize prompt string for SDKs
when source script environment-setup-script.

The default prompt string of SDKs looks like:

SDK-poky-glibc-x86_64--cortexa57-qemuarm64$

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
v2: not set PS1 for buildtools-tarball

 meta/classes/toolchain-scripts.bbclass | 1 +
 meta/conf/bitbake.conf                 | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index db1d3215ef..88df373d0b 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -45,6 +45,7 @@ toolchain_create_sdk_env_script () {
 		EXTRAPATH="$EXTRAPATH:$sdkpathnative$bindir/${TARGET_ARCH}${TARGET_VENDOR}-$i"
 	done
 	echo "export PATH=$sdkpathnative$bindir:$sdkpathnative$sbindir:$sdkpathnative$base_bindir:$sdkpathnative$base_sbindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':$PATH' >> $script
+	echo 'export PS1="${SDK_PS1}"' >>$script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
 	echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig:$SDKTARGETSYSROOT'"$prefix"'/share/pkgconfig' >> $script
 	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 48af17fbf7..6075749a5e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -422,6 +422,7 @@ PKGDATA_DIR = "${TMPDIR}/pkgdata/${MACHINE}"
 
 SDK_NAME_PREFIX ?= "oecore"
 SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TUNE_PKGARCH}"
+SDK_PS1 ?= "SDK-${SDK_NAME}:\\\\$ "
 SDKPATH = "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
 SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
 
-- 
2.17.1

