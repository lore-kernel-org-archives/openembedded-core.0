Return-Path: <sipke.vriend@xilinx.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe003.messaging.microsoft.com [216.32.180.186])
	by mail.openembedded.org (Postfix) with ESMTP id 7E6C46B05F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 00:35:20 +0000 (UTC)
Received: from mail43-co1-R.bigfish.com (10.243.78.245) by
	CO1EHSOBE013.bigfish.com (10.243.66.76) with Microsoft SMTP Server id
	14.1.225.22; Thu, 23 Jan 2014 00:35:20 +0000
Received: from mail43-co1 (localhost [127.0.0.1])	by mail43-co1-R.bigfish.com
	(Postfix) with ESMTP id 500F26003D8	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 00:35:20 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 1
X-BigFish: VPS1(zze0eahzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h8275bh1de097hz2fh95h839hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1b0ah224fh1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e1dh1e23h1fe8h1ff5h2218h2216h226dh24afh2327h2336h2438h2461h2487h24d7h906i1155h)
Received-SPF: pass (mail43-co1: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=sipke.vriend@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail43-co1 (localhost.localdomain [127.0.0.1]) by mail43-co1
	(MessageSwitch) id 1390437318289849_6168;
	Thu, 23 Jan 2014 00:35:18 +0000 (UTC)
Received: from CO1EHSMHS020.bigfish.com (unknown [10.243.78.243])	by
	mail43-co1.bigfish.com (Postfix) with ESMTP id 427FE400046	for
	<openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2014 00:35:18 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by CO1EHSMHS020.bigfish.com
	(10.243.66.30) with Microsoft SMTP Server id 14.16.227.3;
	Thu, 23 Jan 2014 00:35:17 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-smtp1)	by
	xsj-gw1 with esmtp (Exim 4.63)	(envelope-from
	<sipke.vriend@xilinx.com>)	id
	1W68GL-0003FS-L2	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jan 2014 16:35:17 -0800
From: Sipke Vriend <sipke.vriend@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Jan 2014 10:35:02 +1000
X-Mailer: git-send-email 1.7.9.5
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Message-ID: <1f48d283-f35c-4b83-8a25-a914fdb9a8e3@CO1EHSMHS020.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] lib/oeqa: sshcontrol: Allow alternate port for SSHControl
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
X-List-Received-Date: Thu, 23 Jan 2014 00:35:21 -0000
Content-Type: text/plain

Add an optional parameter to SSHControl so the user can specify
and alternate port to the default (22).

Signed-off-by: Sipke Vriend <sipke.vriend@xilinx.com>
---
 meta/lib/oeqa/utils/sshcontrol.py |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index a0dcf02..7bdf2e7 100644
--- a/meta/lib/oeqa/utils/sshcontrol.py
+++ b/meta/lib/oeqa/utils/sshcontrol.py
@@ -13,7 +13,7 @@ import select
 
 class SSHControl(object):
 
-    def __init__(self, ip=None, timeout=300, logfile=None):
+    def __init__(self, ip=None, timeout=300, logfile=None, port=None):
         self.ip = ip
         self.timeout = timeout
         self._starttime = None
@@ -26,6 +26,8 @@ class SSHControl(object):
                 '-o', 'LogLevel=ERROR'
                 ]
         self.ssh = ['ssh', '-l', 'root'] + self.ssh_options
+        if port is not None:
+            self.ssh = self.ssh + ['-p', str(port)]
 
     def log(self, msg):
         if self.logfile:
-- 
1.7.9.5



