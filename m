Return-Path: <alexandru.sardan@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe004.messaging.microsoft.com [207.46.163.27])
	by mail.openembedded.org (Postfix) with ESMTP id 277466E9A3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 17:46:00 +0000 (UTC)
Received: from mail28-co9-R.bigfish.com (10.236.132.251) by
	CO9EHSOBE025.bigfish.com (10.236.130.88) with Microsoft SMTP Server id
	14.1.225.22; Mon, 3 Mar 2014 17:46:00 +0000
Received: from mail28-co9 (localhost [127.0.0.1])	by mail28-co9-R.bigfish.com
	(Postfix) with ESMTP id A37E81001CC	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 17:46:00 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch1155h)
Received: from mail28-co9 (localhost.localdomain [127.0.0.1]) by mail28-co9
	(MessageSwitch) id 1393868758438814_18162;
	Mon,  3 Mar 2014 17:45:58 +0000 (UTC)
Received: from CO9EHSMHS006.bigfish.com (unknown [10.236.132.250])	by
	mail28-co9.bigfish.com (Postfix) with ESMTP id 66313400047;
	Mon,  3 Mar 2014 17:45:58 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS006.bigfish.com
	(10.236.130.16) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Mon, 3 Mar 2014 17:45:58 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Mon, 3 Mar 2014 17:45:57 +0000
Received: from fsr-ub1264-102.ea.freescale.net
	(fsr-ub1264-102.ea.freescale.net [10.171.74.5])	by
	tx30smr01.am.freescale.net
	(8.14.3/8.14.0) with ESMTP id s23Hjte3011517;
	Mon, 3 Mar 2014 10:45:56 -0700
From: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Mar 2014 19:45:38 +0200
Message-ID: <1393868738-7330-1-git-send-email-alexandru.sardan@freescale.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1393860775.31845.13.camel@ted>
References: <1393860775.31845.13.camel@ted>
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] libgcc: make sure symlinks are created in a valid directory
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
X-List-Received-Date: Mon, 03 Mar 2014 17:46:03 -0000
Content-Type: text/plain

When adding extra symlinks, we have to make sure that the directory
that the links are created in is valid. Added a check for this.

This is an incremental addition to commit
97f2a81d6796ddaf7bbaab86c2ab9039673c732c

Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
---
 meta/recipes-devtools/gcc/libgcc.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index b185660..96f1969 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -150,7 +150,7 @@ python do_extra_symlinks() {
     if targetsysnoext != d.getVar('TARGET_SYS', True):
         dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + targetsysnoext
         src = d.getVar('TARGET_SYS', True)
-        if not os.path.lexists(dest):
+        if not os.path.lexists(dest) and os.path.lexists(d.getVar('D', True) + d.getVar('libdir', True)):
             os.symlink(src, dest)
 }
 
-- 
1.7.9.5



