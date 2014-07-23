Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C8FDD65E28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 02:56:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6N2uBx7029327
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 19:56:11 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 22 Jul 2014 19:56:10 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Jul 2014 10:53:42 +0800
Message-ID: <1406084022-19758-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] toolchain-scripts: Fix sed regex does not match
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
X-List-Received-Date: Wed, 23 Jul 2014 02:56:11 -0000
Content-Type: text/plain

Previously, we added incorrect path to handle for CANADIANEXTRAOS.
This patch fixes the sed regex does not match.

[YOCTO #6490]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/classes/toolchain-scripts.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 413effe..4a7b32c 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -15,8 +15,9 @@ toolchain_create_sdk_env_script () {
 	touch $script
 	echo 'export SDKTARGETSYSROOT='"$sysroot" >> $script
 	EXTRAPATH=""
+	target_sys="${TARGET_SYS}"
 	for i in ${CANADIANEXTRAOS}; do
-		EXTRAPATH="$EXTRAPATH:"`echo ${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS} | sed -e 's,${TARGET_PREFIX},${TARGET_PREFIX}$i,g'`
+		EXTRAPATH="$EXTRAPATH:"`echo ${SDKPATHNATIVE}${bindir_nativesdk}/$target_sys | sed -e "s,$target_sys,${target_sys%linux*}$i,g"`
 	done
 	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS}'$EXTRAPATH':$PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
-- 
1.9.1


