Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TVm6v-0001W5-C2
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Nov 2012 17:34:48 +0100
Received: from mail155-tx2-R.bigfish.com (10.9.14.251) by
	TX2EHSOBE004.bigfish.com (10.9.40.24) with Microsoft SMTP Server id
	14.1.225.23; Tue, 6 Nov 2012 16:20:59 +0000
Received: from mail155-tx2 (localhost [127.0.0.1])	by
	mail155-tx2-R.bigfish.com (Postfix) with ESMTP id 812D72000A9	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  6 Nov 2012 16:20:59 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1de0h1202h1d1ah1d2ah1082kzz8275bh8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h1155h)
Received: from mail155-tx2 (localhost.localdomain [127.0.0.1]) by mail155-tx2
	(MessageSwitch) id 1352218858136880_23292;
	Tue,  6 Nov 2012 16:20:58 +0000 (UTC)
Received: from TX2EHSMHS005.bigfish.com (unknown [10.9.14.251])	by
	mail155-tx2.bigfish.com (Postfix) with ESMTP id 1ECCC40047	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  6 Nov 2012 16:20:58 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS005.bigfish.com
	(10.9.99.105) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 6 Nov 2012 16:20:54 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Tue, 6 Nov 2012 16:20:54 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	qA6GKmvI019667
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Nov 2012 09:20:53
	-0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Nov 2012 10:20:48 -0600
Message-ID: <1352218848-19801-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [for-denzil] bitbake: compile tar-replacement firstly
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Nov 2012 16:34:48 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

Compiling tar-replacement or not is decided by version of host tar,
if the host tar version is lower than 1.23, Compiling tar-replacement
is needed.

When doing popoluate tar-replacement sysroot to write the tar to
sysroot, but writing is not finished. other packages probably
use the being written tar to unzip file, which will lead to failure
and report the below error:
"bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/tar: Text file busy"

Now we compile tar-replacement firstly to ensure that a being written
tar command will not be used.

(From OE-Core rev: 3c1c4719fc96f6f1fbb257413d6baf3d91fdf4e8)

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/bitbake |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/bitbake b/scripts/bitbake
index 3772d82..c52d5d2 100755
--- a/scripts/bitbake
+++ b/scripts/bitbake
@@ -134,7 +134,12 @@ if [ $buildpseudo -gt 0 ]; then
             fi
         done
     done
-    bitbake pseudo-native $TARTARGET $additionalopts -c populate_sysroot
+
+    if [ $needtar = "1" ]; then
+	bitbake $TARTARGET -c populate_sysroot
+    fi
+
+    bitbake pseudo-native $additionalopts -c populate_sysroot
     ret=$?
     if [ "$ret" != "0" ]; then
         exit 1
-- 
1.7.9.7




