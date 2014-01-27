Return-Path: <sipke.vriend@xilinx.com>
Received: from am1outboundpool.messaging.microsoft.com
	(am1ehsobe006.messaging.microsoft.com [213.199.154.209])
	by mail.openembedded.org (Postfix) with ESMTP id B2DF26E719
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 22:25:37 +0000 (UTC)
Received: from mail9-am1-R.bigfish.com (10.3.201.249) by
	AM1EHSOBE019.bigfish.com (10.3.207.141) with Microsoft SMTP Server id
	14.1.225.22; Mon, 27 Jan 2014 22:25:38 +0000
Received: from mail9-am1 (localhost [127.0.0.1])	by mail9-am1-R.bigfish.com
	(Postfix) with ESMTP id EBDBC3001B4;
	Mon, 27 Jan 2014 22:25:37 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:149.199.60.83; KIP:(null); UIP:(null); IPV:NLI;
	H:xsj-gw1; RD:unknown-60-83.xilinx.com; EFVD:NLI
X-SpamScore: 1
X-BigFish: VPS1(zzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h8275bh1de097hz2fh95h839hd24hf0ah119dh1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h14ddh1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1b0ah224fh1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e1dh1e23h1fe8h1ff5h2218h2216h226dh24afh2327h2336h2438h2461h2487h24d7h906i1155h)
Received-SPF: pass (mail9-am1: domain of xilinx.com designates 149.199.60.83
	as permitted sender) client-ip=149.199.60.83;
	envelope-from=sipke.vriend@xilinx.com; helo=xsj-gw1 ;
	helo=xsj-gw1 ; 
Received: from mail9-am1 (localhost.localdomain [127.0.0.1]) by mail9-am1
	(MessageSwitch) id 139086153653804_19691;
	Mon, 27 Jan 2014 22:25:36 +0000 (UTC)
Received: from AM1EHSMHS013.bigfish.com (unknown [10.3.201.231])	by
	mail9-am1.bigfish.com (Postfix) with ESMTP id F1AD24004D;
	Mon, 27 Jan 2014 22:25:35 +0000 (UTC)
Received: from xsj-gw1 (149.199.60.83) by AM1EHSMHS013.bigfish.com
	(10.3.207.151) with Microsoft SMTP Server id 14.16.227.3;
	Mon, 27 Jan 2014 22:25:31 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-smtp1)	by
	xsj-gw1 with esmtp (Exim 4.63)	(envelope-from
	<sipke.vriend@xilinx.com>)	id
	1W7ucU-0002g5-UZ; Mon, 27 Jan 2014 14:25:30 -0800
From: Sipke Vriend <sipke.vriend@xilinx.com>
To: <stefanx.stanacar@intel.com>
Date: Tue, 28 Jan 2014 08:25:09 +1000
X-Mailer: git-send-email 1.7.9.5
X-RCIS-Action: ALLOW
MIME-Version: 1.0
Message-ID: <7d308450-d9cc-4489-96e8-3e000d5b4818@AM1EHSMHS013.ehs.local>
X-OriginatorOrg: xilinx.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] lib/oeqa: sshcontrol: Allow alternate port for SSHControl
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
X-List-Received-Date: Mon, 27 Jan 2014 22:25:38 -0000
Content-Type: text/plain

Add an optional parameter to SSHControl so the user can specify
and alternate port to the default (22).

Signed-off-by: Sipke Vriend <sipke.vriend@xilinx.com>
---
 meta/lib/oeqa/utils/sshcontrol.py |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/sshcontrol.py b/meta/lib/oeqa/utils/sshcontrol.py
index 3e53ec3..8913250 100644
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
+        if port:
+            self.ssh = self.ssh + ['-p', str(port)]
 
     def log(self, msg):
         if self.logfile:
-- 
1.7.9.5



