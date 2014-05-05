Return-Path: <Bruce.Ashfield@windriver.com>
X-Greylist: delayed 3435 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 05 May 2014 15:07:30 UTC
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 64AE660D8D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 May 2014 15:07:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s45EAF9w004267
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 May 2014 07:10:15 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.56.46) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 5 May 2014 07:10:14 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 5 May 2014 10:10:07 -0400
Message-ID: <6e326495b27935d351c2a3c89d5b73603eba52c3.1399297986.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1399297986.git.bruce.ashfield@windriver.com>
References: <cover.1399297986.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] kernel-yocto: quote kconfig mode check
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
X-List-Received-Date: Mon, 05 May 2014 15:07:34 -0000
Content-Type: text/plain

We allow inheriting recipes to control the kconfig mode used by merge_config.sh
via the KCONFIG_MODE variable. An error crept into the variable reference, and
since it is not quoted, the true condition always runs.

The result is that operations without an explicit kconfig mode cannot trigger
allnoconfig for defconfig builds, which can result in some options being
dropped from the final .config.

Quoting the reference allows it to evaluate properly.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 53bc6d443cdb..6010dc94e026 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -241,7 +241,7 @@ do_kernel_configme() {
 	echo "[INFO] doing kernel configme"
 	export KMETA=${KMETA}
 
-	if [ -n ${KCONFIG_MODE} ]; then
+	if [ -n "${KCONFIG_MODE}" ]; then
 		configmeflags=${KCONFIG_MODE}
 	else
 		# If a defconfig was passed, use =n as the baseline, which is achieved
-- 
1.8.1.2


