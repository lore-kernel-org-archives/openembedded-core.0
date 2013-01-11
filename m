Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TtZaN-0005WF-Qj
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 09:03:31 +0100
Received: from mail107-am1-R.bigfish.com (10.3.201.243) by
	AM1EHSOBE020.bigfish.com (10.3.207.142) with Microsoft SMTP Server id
	14.1.225.23; Fri, 11 Jan 2013 07:03:07 +0000
Received: from mail107-am1 (localhost [127.0.0.1])	by
	mail107-am1-R.bigfish.com (Postfix) with ESMTP id B30D426009E	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2013 07:03:07 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 10
X-BigFish: VS10(z38daozzz1ee6h1de0h1202h1e76h1d1ah1d2ah1082kzz8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1155h)
Received: from mail107-am1 (localhost.localdomain [127.0.0.1]) by mail107-am1
	(MessageSwitch) id 1357887785209059_27222;
	Fri, 11 Jan 2013 07:03:05 +0000 (UTC)
Received: from AM1EHSMHS003.bigfish.com (unknown [10.3.201.254])	by
	mail107-am1.bigfish.com (Postfix) with ESMTP id 30A7F46006B	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2013 07:03:05 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS003.bigfish.com
	(10.3.207.103) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 11 Jan 2013 07:03:05 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Fri, 11 Jan 2013 07:03:03 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	r0B731c9030593	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2013 00:03:02 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Jan 2013 01:03:03 -0600
Message-ID: <1357887783-25188-3-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1357887783-25188-1-git-send-email-msm@freescale.com>
References: <1357887783-25188-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [for-denzil 3/3] bitbake: command: Fix getCmdLineAction bugs
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
X-List-Received-Date: Fri, 11 Jan 2013 08:03:32 -0000
Content-Type: text/plain

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Executing "bitbake" doesn't get a sane message since the None return value
wasn't being handled correctly. Also fix msg -> cmd_action['msg'] as
otherwise an invalid variable is accessed which then crashes the server
due to the previous bug.

(Bitbake rev: c6211291ae07410832031a5274690437cc2b09a6)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 bitbake/lib/bb/command.py |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/bitbake/lib/bb/command.py b/bitbake/lib/bb/command.py
index c08e2ce..a143aed 100644
--- a/bitbake/lib/bb/command.py
+++ b/bitbake/lib/bb/command.py
@@ -148,8 +148,10 @@ class CommandsSync:
         Get any command parsed from the commandline
         """
         cmd_action = command.cooker.commandlineAction
-        if cmd_action['msg']:
-            raise CommandError(msg)
+        if cmd_action is None:
+            return None
+        elif 'msg' in cmd_action and cmd_action['msg']:
+            raise CommandError(cmd_action['msg'])
         else:
             return cmd_action['action']
 
-- 
1.7.9.7




