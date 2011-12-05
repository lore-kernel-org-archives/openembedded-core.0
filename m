Received: from ch1ehsobe001.messaging.microsoft.com ([216.32.181.181]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RXfh3-0005zq-IL
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Dec 2011 22:03:21 +0100
Received: from mail202-ch1-R.bigfish.com (10.43.68.252) by
	CH1EHSOBE008.bigfish.com (10.43.70.58) with Microsoft SMTP Server id
	14.1.225.23; Mon, 5 Dec 2011 20:56:34 +0000
Received: from mail202-ch1 (localhost [127.0.0.1])	by
	mail202-ch1-R.bigfish.com (Postfix) with ESMTP id 1E904440281	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2011 20:56:34 +0000 (UTC)
X-SpamScore: 0
X-BigFish: VS0(zz98bKzz1202h1082kzz8275bhz2dh2a8h668h839h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail202-ch1 (localhost.localdomain [127.0.0.1]) by mail202-ch1
	(MessageSwitch) id 1323118591909564_6868;
	Mon,  5 Dec 2011 20:56:31 +0000 (UTC)
Received: from CH1EHSMHS016.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.244])	by mail202-ch1.bigfish.com (Postfix) with ESMTP id
	D98C5C0042 for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2011 20:56:31 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS016.bigfish.com
	(10.43.70.16) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 5 Dec 2011 20:56:29 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.339.2; Mon, 5 Dec 2011 14:56:28 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	pB5KuRN9027120	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Dec 2011 14:56:28 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Dec 2011 14:56:27 -0600
Message-ID: <1323118587-17891-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] populate_sdk.bbclass: remap packages when generating sdk tarball
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
X-List-Received-Date: Mon, 05 Dec 2011 21:03:22 -0000
Content-Type: text/plain

This fixes the issue below:

| Generating solve db for /local/home/mattsm/git/poky/build_p4080ds_release/tmp/deploy/rpm/all...
|    total:               1      0.000000 MB      0.093784 secs
|    fingerprint:         9      0.000012 MB      0.000252 secs
|    install:             3      0.000000 MB      0.039092 secs
|    dbadd:               3      0.000000 MB      0.034837 secs
|    dbget:              12      0.000000 MB      0.000062 secs
|    dbput:               3      0.009532 MB      0.002731 secs
|    readhdr:            31      0.019160 MB      0.000084 secs
|    hdrload:            15      0.027924 MB      0.000116 secs
|    hdrget:            494      0.000000 MB      0.000691 secs
| Processing task-core-standalone-sdk-target...
| Processing glib-2.0...
| Unable to find package glib-2.0 (glib-2.0)!
| ERROR: Function 'do_populate_sdk' failed (see /local/home/mattsm/git/poky/build_p4080ds_release/tmp/work/ppce500mc-fsl-linux/fsl-toolchain-1.0-r6/temp/log.do_populate_sdk.16975 for further information)

If you have:

TOOLCHAIN_TARGET_TASK += "glib-2.0"

The package name was not getting remapped correctly for the do_populate_sdk
case.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/classes/populate_sdk.bbclass |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta/classes/populate_sdk.bbclass b/meta/classes/populate_sdk.bbclass
index 1ef72cf..5aa8e92 100644
--- a/meta/classes/populate_sdk.bbclass
+++ b/meta/classes/populate_sdk.bbclass
@@ -18,6 +18,13 @@ PID = "${@os.getpid()}"
 
 EXCLUDE_FROM_WORLD = "1"
 
+python () {
+    # If we don't do this we try and run the mapping hooks while parsing which is slow
+    # bitbake should really provide something to let us know this...
+    if bb.data.getVar('BB_WORKERCONTEXT', d, True) is not None:
+        runtime_mapping_rename("TOOLCHAIN_TARGET_TASK", d)
+}
+
 fakeroot do_populate_sdk() {
 	rm -rf ${SDK_OUTPUT}
 	mkdir -p ${SDK_OUTPUT}
-- 
1.7.6.1




