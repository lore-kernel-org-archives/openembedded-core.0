Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 159E9783EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 19:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 959F120B86;
	Thu, 15 Jun 2017 19:09:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id xwYvUHoTS-nH; Thu, 15 Jun 2017 19:09:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 739A5207AF;
	Thu, 15 Jun 2017 19:09:52 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id EF60B1624E1;
	Thu, 15 Jun 2017 15:09:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 15:09:49 -0400
Message-Id: <1497553789-126570-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] toolchain-scripts: add check for LD_LIBRARY_PATH in the SDK env setup script
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
X-List-Received-Date: Thu, 15 Jun 2017 19:09:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

Provide a descriptive error message and exit the environment-setup script,
when LD_LIBRARY_PATH is set on the host system.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta/classes/toolchain-scripts.bbclass | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 260ece9..ef7b26f 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -25,6 +25,21 @@ toolchain_create_sdk_env_script () {
 	script=${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-$multimach_target_sys}
 	rm -f $script
 	touch $script
+
+	echo '# Check for LD_LIBRARY_PATH being set, which can break SDK and generally is a bad practice' >> $script
+	echo '# http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html#AEN80' >> $script
+	echo '# http://xahlee.info/UnixResource_dir/_/ldpath.html' >> $script
+	echo '# Only disable this check if you are absolutely know what you are doing!' >> $script
+	echo 'if [ ! -z "$LD_LIBRARY_PATH" ]; then' >> $script
+	echo "    echo \"Your environment is misconfigured, you probably need to 'unset LD_LIBRARY_PATH'\"" >> $script
+	echo "    echo \"but please check why this was set in the first place and that it's safe to unset.\"" >> $script
+	echo '    echo "The SDK will not operate correctly in most cases when LD_LIBRARY_PATH is set."' >> $script
+	echo '    echo "For more references see:"' >> $script
+	echo '    echo "  http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html#AEN80"' >> $script
+	echo '    echo "  http://xahlee.info/UnixResource_dir/_/ldpath.html"' >> $script
+	echo '    return 1' >> $script
+	echo 'fi' >> $script
+
 	echo 'export SDKTARGETSYSROOT='"$sysroot" >> $script
 	EXTRAPATH=""
 	for i in ${CANADIANEXTRAOS}; do
-- 
2.7.4


