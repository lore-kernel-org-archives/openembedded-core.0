Received: from db3ehsobe001.messaging.microsoft.com ([213.199.154.139]
	helo=DB3EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R98Dk-0000Lk-93
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 06:27:41 +0200
Received: from mail99-db3-R.bigfish.com (10.3.81.253) by
	DB3EHSOBE001.bigfish.com (10.3.84.21) with Microsoft SMTP Server id
	14.1.225.22; Thu, 29 Sep 2011 04:22:13 +0000
Received: from mail99-db3 (localhost.localdomain [127.0.0.1])	by
	mail99-db3-R.bigfish.com (Postfix) with ESMTP id B7C888203C0	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:22:12 +0000 (UTC)
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1082kzz8275bhz2dh2a8h668h839h62h)
X-Spam-TCS-SCL: 1:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail99-db3 (localhost.localdomain [127.0.0.1]) by mail99-db3
	(MessageSwitch) id 1317270074554223_20847;
	Thu, 29 Sep 2011 04:21:14 +0000 (UTC)
Received: from DB3EHSMHS014.bigfish.com (unknown [10.3.81.244])	by
	mail99-db3.bigfish.com (Postfix) with ESMTP id 8370B560050	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 29 Sep 2011 04:21:14 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS014.bigfish.com
	(10.3.87.114) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Thu, 29 Sep 2011 04:21:13 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.323.7; Wed, 28 Sep 2011 23:21:12 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	p8T4LAKp024559	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2011 23:21:11 -0500 (CDT)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Sep 2011 23:20:56 -0500
Message-ID: <1317270070-14250-2-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1317270070-14250-1-git-send-email-msm@freescale.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH 02/16] bitbake pseudo wrapper: Don't base success on bitbake return code
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
X-List-Received-Date: Thu, 29 Sep 2011 04:27:41 -0000
Content-Type: text/plain

bitbake does not return 0 when a build succeeds. Instead lets look and
make sure the pseudo binaries are created as a proper test of success

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 scripts/bitbake |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index 587428c..4f4a179 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -61,13 +61,12 @@ if [ $buildpseudo = "1" ]; then
         TARTARGET=""
     fi
     bitbake pseudo-native $TARTARGET -c populate_sysroot
+    PSEUDOBINDIR=`bitbake -e | grep STAGING_BINDIR_NATIVE=\" | cut -d '=' -f2 | cut -d '"' -f2`
     ret=$?
     if [ "$ret" != "0" ]; then
         exit 1
     fi
-    PSEUDOBINDIR=`bitbake -e | grep STAGING_BINDIR_NATIVE=\" | cut -d '=' -f2 | cut -d '"' -f2`
-    ret=$?
-    if [ "$ret" != "0" ]; then
+    if [ ! -e $PSEUDOBINDIR/pseudo ]; then
         exit 1
     fi
     echo $PSEUDOBINDIR > $BUILDDIR/pseudodone
-- 
1.7.6.1




