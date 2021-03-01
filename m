Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.13016.1614608244295644324
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Mar 2021 06:17:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 121EGdex008444
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 Mar 2021 06:16:39 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 1 Mar 2021 06:16:39 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 1 Mar 2021 06:16:38 -0800
From: "kai" <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>, <kergoth@gmail.com>
CC: <openembedded-core@lists.openembedded.org>, <poky@lists.yoctoproject.org>
Subject: [PATCH v3 1/2] toolchain-scripts.bbclass: customize prompt string for SDKs
Date: Mon, 1 Mar 2021 22:16:33 +0800
Message-ID: <20210301141634.6177-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <16683D655B45BE78.10373@lists.openembedded.org>
References: <16683D655B45BE78.10373@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Introduce a new variable SDK_PS1 to customize prompt string for SDKs
when source script environment-setup-script. If variable SDK_PS1 is not
set or empty, nothing changed. Otherwise new PS1 with the value of
SDK_PS1 is used after source the sdk environment file.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/toolchain-scripts.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index db1d3215ef..67a812cb02 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -8,6 +8,8 @@ TARGET_CC_ARCH_append_libc-musl = " -mmusl"
 # default debug prefix map isn't valid in the SDK
 DEBUG_PREFIX_MAP = ""
 
+EXPORT_SDK_PS1 = "${@ 'export PS1=\'%s\'' % d.getVar('SDK_PS1') if d.getVar('SDK_PS1') else ''}"
+
 # This function creates an environment-setup-script for use in a deployable SDK
 toolchain_create_sdk_env_script () {
 	# Create environment setup script.  Remember that $SDKTARGETSYSROOT should
@@ -39,6 +41,7 @@ toolchain_create_sdk_env_script () {
 	echo '    return 1' >> $script
 	echo 'fi' >> $script
 
+	echo "${EXPORT_SDK_PS1}" >> $script
 	echo 'export SDKTARGETSYSROOT='"$sysroot" >> $script
 	EXTRAPATH=""
 	for i in ${CANADIANEXTRAOS}; do
-- 
2.17.1

