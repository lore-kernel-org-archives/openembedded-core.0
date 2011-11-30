Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
	helo=TX2EHSOBE007.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RVf79-0006so-Il
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 09:02:00 +0100
Received: from mail9-tx2-R.bigfish.com (10.9.14.251) by
	TX2EHSOBE007.bigfish.com (10.9.40.27) with Microsoft SMTP Server id
	14.1.225.22; Wed, 30 Nov 2011 07:55:09 +0000
Received: from mail9-tx2 (localhost [127.0.0.1])	by mail9-tx2-R.bigfish.com
	(Postfix) with ESMTP id DA811E01CF	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 07:55:09 +0000 (UTC)
X-SpamScore: 16
X-BigFish: VS16(z2e28uzzz1202h1082kzz8275bhz2dh2a8h668h839h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail9-tx2 (localhost.localdomain [127.0.0.1]) by mail9-tx2
	(MessageSwitch) id 1322639709724258_31958;
	Wed, 30 Nov 2011 07:55:09 +0000 (UTC)
Received: from TX2EHSMHS012.bigfish.com (unknown [10.9.14.252])	by
	mail9-tx2.bigfish.com (Postfix) with ESMTP id A4A546001E4	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 07:55:09 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS012.bigfish.com
	(10.9.99.112) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 30 Nov 2011 07:55:09 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server id 14.1.339.2; Wed, 30 Nov 2011 01:55:09 -0600
Received: from right.am.freescale.net (right.am.freescale.net [10.82.193.13])
	by az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	pAU7t80R014042	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 01:55:08 -0600 (CST)
From: Matthew McClintock <msm@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 30 Nov 2011 01:55:07 -0600
Message-ID: <1322639707-7798-2-git-send-email-msm@freescale.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <1322639707-7798-1-git-send-email-msm@freescale.com>
References: <1322639707-7798-1-git-send-email-msm@freescale.com>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] siggen.py: If both sigs have a variable in it's whitelist then don't say it's changed
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
X-List-Received-Date: Wed, 30 Nov 2011 08:02:00 -0000
Content-Type: text/plain

Some BB_HASHBASE_WHITELIST variables are in the lists of variable
dependencies for signatures. Ignore those differences in lists
since this difference does not matter

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
I'm seeing variables in BB_HASHBASE_WHITELIST make it
to the signature. Not sure if they are used to calculate
the hash but assuming they are not we don't need to print
out that they are different

 bitbake/lib/bb/siggen.py |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/bitbake/lib/bb/siggen.py b/bitbake/lib/bb/siggen.py
index 9231291..bb909ba 100644
--- a/bitbake/lib/bb/siggen.py
+++ b/bitbake/lib/bb/siggen.py
@@ -237,13 +237,13 @@ def compare_sigfiles(a, b):
     p2 = pickle.Unpickler(file(b, "rb"))
     b_data = p2.load()
 
-    def dict_diff(a, b):
+    def dict_diff(a, b, whitelist=set()):
         sa = set(a.keys())
         sb = set(b.keys())
         common = sa & sb
         changed = set()
         for i in common:
-            if a[i] != b[i]:
+            if a[i] != b[i] and i not in whitelist:
                 changed.add(i)
         added = sa - sb
         removed = sb - sa
@@ -263,7 +263,7 @@ def compare_sigfiles(a, b):
     if a_data['basehash'] != b_data['basehash']:
         print "basehash changed from %s to %s" % (a_data['basehash'], b_data['basehash'])
 
-    changed, added, removed = dict_diff(a_data['gendeps'], b_data['gendeps'])
+    changed, added, removed = dict_diff(a_data['gendeps'], b_data['gendeps'], a_data['basewhitelist'] & b_data['basewhitelist'])
     if changed:
         for dep in changed:
             print "List of dependencies for variable %s changed from %s to %s" % (dep, a_data['gendeps'][dep], b_data['gendeps'][dep])
-- 
1.7.6.1




