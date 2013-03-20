Received: from co9ehsobe002.messaging.microsoft.com ([207.46.163.25]
	helo=co9outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1UIEGT-0006Ne-Ol
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 09:21:02 +0100
Received: from mail65-co9-R.bigfish.com (10.236.132.244) by
	CO9EHSOBE022.bigfish.com (10.236.130.85) with Microsoft SMTP Server id
	14.1.225.23; Wed, 20 Mar 2013 07:48:57 +0000
Received: from mail65-co9 (localhost [127.0.0.1])	by mail65-co9-R.bigfish.com
	(Postfix) with ESMTP id 64AEB2A01A3	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 07:48:57 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -11
X-BigFish: VS-11(z342Szzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail65-co9 (localhost.localdomain [127.0.0.1]) by mail65-co9
	(MessageSwitch) id 1363765687221669_12981;
	Wed, 20 Mar 2013 07:48:07 +0000 (UTC)
Received: from CO9EHSMHS022.bigfish.com (unknown [10.236.132.235])	by
	mail65-co9.bigfish.com (Postfix) with ESMTP id 341526006F	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 07:48:07 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS022.bigfish.com
	(10.236.130.32) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 20 Mar 2013 07:48:07 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Wed, 20 Mar 2013 07:48:06 +0000
Received: from b19537-desktop.ap.freescale.net
	(b19537-desktop.ap.freescale.net [10.192.208.197])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r2K7m3pj017175;
	Wed, 20 Mar 2013 00:48:04 -0700
From: Zhenhua Luo <zhenhua.luo@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Mar 2013 15:52:12 +0800
Message-ID: <1363765932-17501-1-git-send-email-zhenhua.luo@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: B40290@freescale.com, Zhenhua Luo <zhenhua.luo@freescale.com>
Subject: fix march sanity check issue
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
X-List-Received-Date: Wed, 20 Mar 2013 08:21:30 -0000
X-List-Received-Date: Wed, 20 Mar 2013 08:21:30 -0000
Content-Type: text/plain

1. check if gcc_test is really generate before os.remove("gcc_test") to avoid
   following error:
      ERROR: Execution of event handler 'check_sanity_eventhandler' failed
      Traceback (most recent call last):
      File "check_sanity_eventhandler(e)", line 4, in check_sanity_eventhandler(e=<bb.event.ConfigParsed object at 0x3151450>)
      File "sanity.bbclass", line 107, in check_sanity(sanity_data=<bb.data_smart.DataSmart object at 0x11ba110>)
      File "sanity.bbclass", line 22, in check_gcc_march(sanity_data=<bb.data_smart.DataSmart object at 0x11ba110>)
      OSError: [Errno 2] No such file or directory: 'gcc_test'
2. set result to False when build failed with -march=native to ensure 
   -march=native is appended to BUILD_CFLAGS  when host gcc really supports this flag, 
   otherwise following error appears when build native packages.
      | cap_text.c:1: error: bad value (native) for -march= switch
      | cap_text.c:1: error: bad value (native) for -mtune= switch

Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
---
 meta/classes/sanity.bbclass |    9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 8cdb06e..ecc0a43 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -327,11 +327,14 @@ def check_gcc_march(sanity_data):
         if status != 0:
             # Check if GCC could work with march
             status,result = commands.getstatusoutput("${BUILD_PREFIX}gcc -march=native gcc_test.c -o gcc_test")
-            if status == 0:
-                result =  True
+            if status == 0: 
+                result = True
+            else:
+                result = False
 
         os.remove("gcc_test.c")
-        os.remove("gcc_test")
+        if os.path.exists("gcc_test"):
+            os.remove("gcc_test")
 
     return result
 
-- 
1.7.9.5




