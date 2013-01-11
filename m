Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
	helo=am1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TtZbH-0005a6-Od
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 09:04:33 +0100
Received: from mail28-am1-R.bigfish.com (10.3.201.248) by
	AM1EHSOBE008.bigfish.com (10.3.204.28) with Microsoft SMTP Server id
	14.1.225.23; Fri, 11 Jan 2013 07:04:02 +0000
Received: from mail28-am1 (localhost [127.0.0.1])	by mail28-am1-R.bigfish.com
	(Postfix) with ESMTP id 95F934A01E8	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2013 07:04:02 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1ee6h1de0h1202h1e76h1d1ah1d2ah1082kzz8275dhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1155h)
Received: from mail28-am1 (localhost.localdomain [127.0.0.1]) by mail28-am1
	(MessageSwitch) id 1357887798693428_26713;
	Fri, 11 Jan 2013 07:03:18 +0000 (UTC)
Received: from AM1EHSMHS003.bigfish.com (unknown [10.3.201.236])	by
	mail28-am1.bigfish.com (Postfix) with ESMTP id CB9E4300070	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2013 07:03:04 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS003.bigfish.com
	(10.3.207.103) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 11 Jan 2013 07:03:04 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.2.318.3; Fri, 11 Jan 2013 07:03:02 +0000
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id
	r0B731c8030593	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Jan 2013 00:03:02 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Jan 2013 01:03:02 -0600
Message-ID: <1357887783-25188-2-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
In-Reply-To: <1357887783-25188-1-git-send-email-msm@freescale.com>
References: <1357887783-25188-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [for-denzil 2/3] bitbake: command: Add missing import traceback
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
X-List-Received-Date: Fri, 11 Jan 2013 08:04:36 -0000
Content-Type: text/plain

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Without this, if an exception occurs the server will silently crash
with no feedback to the user about why (since traceback isn't imported).

(Bitbake rev: e637a635bf7b5a9a2e9dc20afc18aceec98d578f)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 bitbake/lib/bb/command.py |    1 +
 1 file changed, 1 insertion(+)

diff --git a/bitbake/lib/bb/command.py b/bitbake/lib/bb/command.py
index 00b854e..c08e2ce 100644
--- a/bitbake/lib/bb/command.py
+++ b/bitbake/lib/bb/command.py
@@ -69,6 +69,7 @@ class Command:
             except CommandError as exc:
                 return None, exc.args[0]
             except Exception:
+                import traceback
                 return None, traceback.format_exc()
             else:
                 return result, None
-- 
1.7.9.7




