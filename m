Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RkBL7-0007ul-EU
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 10:16:26 +0100
Received: from mail110-ch1-R.bigfish.com (10.43.68.250) by
	CH1EHSOBE014.bigfish.com (10.43.70.64) with Microsoft SMTP Server id
	14.1.225.23; Mon, 9 Jan 2012 08:53:52 +0000
Received: from mail110-ch1 (localhost [127.0.0.1])	by
	mail110-ch1-R.bigfish.com (Postfix) with ESMTP id A35D544033D	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2012 08:53:52 +0000 (UTC)
X-SpamScore: 4
X-BigFish: VS4(zzb922lzz1202hzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail110-ch1 (localhost.localdomain [127.0.0.1]) by mail110-ch1
	(MessageSwitch) id 1326099230437490_15577;
	Mon,  9 Jan 2012 08:53:50 +0000 (UTC)
Received: from CH1EHSMHS030.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.249])	by mail110-ch1.bigfish.com (Postfix) with ESMTP id
	660BF6E023D	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2012 08:53:50 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS030.bigfish.com
	(10.43.70.30) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 9 Jan 2012 08:53:50 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.355.3; Mon, 9 Jan 2012 02:53:49 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id q098rlmv029264;
	Mon, 9 Jan 2012 02:53:48 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Jan 2012 16:58:26 +0800
Message-ID: <1326099506-5473-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] FSLONLY: adjust the meta-oe layer sequence to make Yocto pick up the right bbclass file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Jan 2012 09:16:26 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 fsl-setup-poky |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/fsl-setup-poky b/fsl-setup-poky
index a5cc702..d1faaae 100755
--- a/fsl-setup-poky
+++ b/fsl-setup-poky
@@ -168,13 +168,6 @@ echo >> build_${BOARD}_release/conf/local.conf
 sed "/  \"/d" build_${BOARD}_release/conf/bblayers.conf > build_${BOARD}_release/conf/bblayers.conf~
 mv build_${BOARD}_release/conf/bblayers.conf~ build_${BOARD}_release/conf/bblayers.conf
 
-# append meta-oe/meta-oe if it exists
-if [ -e $CUR_DIR/meta-oe/meta-oe ]; then
-    echo "  $CUR_DIR/meta-oe/meta-oe \\" >> build_${BOARD}_release/conf/bblayers.conf
-elif [ -e $CUR_DIR/../meta-oe/meta-oe ]; then
-    echo "  $CUR_DIR/../meta-oe/meta-oe \\" >> build_${BOARD}_release/conf/bblayers.conf
-fi
-
 # append meta-fsl-ppc bblayer into conf/bblayers.conf
 echo "  ${META_FSL_PPC_LAYER_PATH} \\" >> build_${BOARD}_release/conf/bblayers.conf
 
@@ -191,6 +184,13 @@ if [ -e $CUR_DIR/meta-fsl-local-sdk ]; then
 elif [ -e $CUR_DIR/../meta-fsl-local-sdk ]; then
     echo "  $CUR_DIR/../meta-fsl-local-sdk \\" >> build_${BOARD}_release/conf/bblayers.conf
 fi
+
+# append meta-oe/meta-oe if it exists
+if [ -e $CUR_DIR/meta-oe/meta-oe ]; then
+    echo "  $CUR_DIR/meta-oe/meta-oe \\" >> build_${BOARD}_release/conf/bblayers.conf
+elif [ -e $CUR_DIR/../meta-oe/meta-oe ]; then
+    echo "  $CUR_DIR/../meta-oe/meta-oe \\" >> build_${BOARD}_release/conf/bblayers.conf
+fi
 echo "  \"" >> build_${BOARD}_release/conf/bblayers.conf
 
 # enable 64b multilib if we are a p5020ds(-32b)
-- 
1.7.0.4




