Return-Path: <B19537@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe002.messaging.microsoft.com [216.32.181.182])
	by mail.openembedded.org (Postfix) with ESMTP id 379C2606AD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 10:48:21 +0000 (UTC)
Received: from mail217-ch1-R.bigfish.com (10.43.68.227) by
	CH1EHSOBE020.bigfish.com (10.43.70.77) with Microsoft SMTP Server id
	14.1.225.23; Tue, 18 Jun 2013 10:48:21 +0000
Received: from mail217-ch1 (localhost [127.0.0.1])	by
	mail217-ch1-R.bigfish.com (Postfix) with ESMTP id 80EC61600FB	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 10:48:21 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1155h)
Received: from mail217-ch1 (localhost.localdomain [127.0.0.1]) by mail217-ch1
	(MessageSwitch) id 1371552495529000_5791;
	Tue, 18 Jun 2013 10:48:15 +0000 (UTC)
Received: from CH1EHSMHS034.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.239])	by mail217-ch1.bigfish.com (Postfix) with ESMTP id
	7E4E54A0051	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 10:48:15 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS034.bigfish.com
	(10.43.70.34) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 18 Jun 2013 10:48:15 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Tue, 18 Jun 2013 10:48:14 +0000
Received: from b19537-desktop.ap.freescale.net
	(b19537-desktop.ap.freescale.net [10.192.208.197])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r5IAmBAJ024832;
	Tue, 18 Jun 2013 03:48:12 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Jun 2013 18:55:25 +0800
Message-ID: <1371552925-25557-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Zhenhua Luo <zhenhua.luo@freescale.com>, b40527@freescale.com
Subject: [patch] sanity.bbclass: correct the gcc_arch check logic
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
X-List-Received-Date: Tue, 18 Jun 2013 10:48:22 -0000
Content-Type: text/plain

The gcc arch check result is incorrect when gcc version is older than 4.5.
Sanity checker requests user to add "-march=native" into BUILD_CFLAGS even if
the flag is not supported by host gcc.

The status is 0 when -march=native is supported by host gcc, so set result to
True, otherwise set result to False, the compare express is changed to be more
explicit. 

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 meta/classes/sanity.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 3b9934b..047baa5 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -325,7 +325,7 @@ def check_gcc_march(sanity_data):
         if status != 0:
             # Check if GCC could work with march
             status,result = oe.utils.getstatusoutput("${BUILD_PREFIX}gcc -march=native gcc_test.c -o gcc_test")
-            if status != 0: 
+            if status == 0: 
                 result = True
             else:
                 result = False
@@ -485,7 +485,7 @@ def check_sanity(sanity_data):
         if not check_app_exists("qemu-arm", sanity_data):
             messages = messages + "qemu-native was in ASSUME_PROVIDED but the QEMU binaries (qemu-arm) can't be found in PATH"
 
-    if check_gcc_march(sanity_data):
+    if check_gcc_march(sanity_data) == True:
         messages = messages + "Your gcc version is older than 4.5, please add the following param to local.conf\n \
         BUILD_CFLAGS_append = \" -march=native\"\n"
 
-- 
1.7.9.5



