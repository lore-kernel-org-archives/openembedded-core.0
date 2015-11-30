Return-Path: <Fang.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 90D14605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 08:50:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAU8ov8f025325
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 00:50:57 -0800
Received: from pek-lpd-ccm1.wrs.com (128.224.179.178) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 30 Nov 2015 00:50:57 -0800
From: Fang Jia <fang.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Nov 2015 16:50:34 +0800
Message-ID: <1448873434-34150-1-git-send-email-fang.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] toolchain-scripts.bbclass: unset command_not_found_handle
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
X-List-Received-Date: Mon, 30 Nov 2015 08:50:58 -0000
Content-Type: text/plain

On Ubuntu-system, When sourcing the env.sh from an exported sdk, and
running a bogus linux command (for example "asd"), a core dump of
python is usually generated.

Unset the command_not_found_handle to fix it.

Signed-off-by: Fang Jia <fang.jia@windriver.com>
---
 meta/classes/toolchain-scripts.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index d0b2b91..ab4feb0 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -32,6 +32,7 @@ toolchain_create_sdk_env_script () {
 	echo 'export OECORE_TARGET_SYSROOT="$SDKTARGETSYSROOT"' >> $script
 	echo "export OECORE_ACLOCAL_OPTS=\"-I $sdkpathnative/usr/share/aclocal\"" >> $script
 	echo "export PYTHONHOME=$sdkpathnative$prefix" >> $script
+	echo 'unset command_not_found_handle' >> $script
 
 	toolchain_shared_env_script
 }
-- 
1.9.1


