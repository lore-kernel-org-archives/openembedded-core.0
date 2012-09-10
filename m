Received: from va3ehsobe002.messaging.microsoft.com ([216.32.180.12]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TB9YS-0005fH-WB
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 21:21:57 +0200
Received: from mail50-va3-R.bigfish.com (10.7.14.240) by
	VA3EHSOBE004.bigfish.com (10.7.40.24) with Microsoft SMTP Server id
	14.1.225.23; Mon, 10 Sep 2012 19:09:26 +0000
Received: from mail50-va3 (localhost [127.0.0.1])	by mail50-va3-R.bigfish.com
	(Postfix) with ESMTP id 576B830023D	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 19:09:26 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 3
X-BigFish: VS3(zzzz1202h1d1ah1082kzz8275bhz2dh2a8h668h839hd24he5bhf0ah107ah1288h12a5h1155h)
Received: from mail50-va3 (localhost.localdomain [127.0.0.1]) by mail50-va3
	(MessageSwitch) id 1347304163618857_11944;
	Mon, 10 Sep 2012 19:09:23 +0000 (UTC)
Received: from VA3EHSMHS002.bigfish.com (unknown [10.7.14.241])	by
	mail50-va3.bigfish.com (Postfix) with ESMTP id 939B62E0228	for
	<openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 19:09:23 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS002.bigfish.com
	(10.7.99.12) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 10 Sep 2012 19:09:23 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.2.309.3; Mon, 10 Sep 2012 14:09:22 -0500
Received: from right.am.freescale.net (right.am.freescale.net [10.82.176.228])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	q8AJ9LZv032595 for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 12:09:22 -0700
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Sep 2012 14:09:21 -0500
Message-ID: <1347304161-19864-1-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.9.7
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] sysvinit-inittab_2.88dsf.bb: only run serial checks at boot if we have items to check
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
X-List-Received-Date: Mon, 10 Sep 2012 19:21:57 -0000
Content-Type: text/plain

Right now, we delay running the serial console checks to we boot up. This causes
issues for read only file systems. So, if have not configured any serial ports to
check via SERIAL_CONSOLES_CHECK we can skip the check at boot. This fixes any
issues with read only file systems and ipk packaging.

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
index 1089edb..5394f18 100644
--- a/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
@@ -65,7 +65,11 @@ if [ "x$D" == "x" ]; then
 	done
 	kill -HUP 1
 else
-	exit 1
+	if [ "${SERIAL_CONSOLES_CHECK}" = "" ]; then
+		exit 0
+	else
+		exit 1
+	fi
 fi
 }
 
-- 
1.7.9.7




