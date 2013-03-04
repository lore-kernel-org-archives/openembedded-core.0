Received: from db3ehsobe004.messaging.microsoft.com ([213.199.154.142]
	helo=db3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B42214@freescale.com>) id 1UCg23-0007LI-9Q
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 01:47:04 +0100
Received: from mail16-db3-R.bigfish.com (10.3.81.237) by
	DB3EHSOBE001.bigfish.com (10.3.84.21) with Microsoft SMTP Server id
	14.1.225.23; Mon, 4 Mar 2013 23:45:17 +0000
Received: from mail16-db3 (localhost [127.0.0.1])	by mail16-db3-R.bigfish.com
	(Postfix) with ESMTP id 477DE600CC	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2013 23:45:17 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1202h1e76h1d1ah1d2ahzz8275bhz2dh2a8h668h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1155h)
Received: from mail16-db3 (localhost.localdomain [127.0.0.1]) by mail16-db3
	(MessageSwitch) id 1362440715413778_21064;
	Mon,  4 Mar 2013 23:45:15 +0000 (UTC)
Received: from DB3EHSMHS005.bigfish.com (unknown [10.3.81.245])	by
	mail16-db3.bigfish.com (Postfix) with ESMTP id 5B78E4001C	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2013 23:45:15 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS005.bigfish.com
	(10.3.87.105) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 4 Mar 2013 23:45:15 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Mon, 4 Mar 2013 23:45:12 +0000
Received: from b42214-Latitude-E6420.am.freescale.net
	(b42214-Latitude-E6420.am.freescale.net [10.112.103.77])	by
	tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id r24NjBMZ012995;
	Mon, 4 Mar 2013 16:45:12 -0700
From: Leonardo Sandoval <leonardo.sandoval@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Mar 2013 17:45:10 -0600
Message-ID: <1362440710-5636-1-git-send-email-leonardo.sandoval@freescale.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] sstate.bbclass: Enclose sstate search parameter with quotes
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
X-List-Received-Date: Tue, 05 Mar 2013 00:47:05 -0000
Content-Type: text/plain

In case filenames have spaces, execution of the function
sstater_install will hang, so the print parameter %s must be
enclosed with quotes.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval@freescale.com>
---
 meta/classes/sstate.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 118a28a..6232aa2 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -174,7 +174,7 @@ def sstate_install(ss, d):
                     break
             if realmatch:
                 match.append(f)
-                sstate_search_cmd = "grep -rl %s %s --exclude=master.list | sed -e 's:^.*/::' -e 's:\.populate-sysroot::'" % (f, d.expand("${SSTATE_MANIFESTS}"))
+                sstate_search_cmd = "grep -rl '%s' %s --exclude=master.list | sed -e 's:^.*/::' -e 's:\.populate-sysroot::'" % (f, d.expand("${SSTATE_MANIFESTS}"))
                 search_output = subprocess.Popen(sstate_search_cmd, shell=True, stdout=subprocess.PIPE).communicate()[0]
                 if search_output != "":
                     match.append("Matched in %s" % search_output.rstrip())
-- 
1.7.4.1




