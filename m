Return-Path: <alexandru.sardan@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe002.messaging.microsoft.com [216.32.180.12])
	by mail.openembedded.org (Postfix) with ESMTP id EDE0E6017E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Apr 2014 15:01:25 +0000 (UTC)
Received: from mail114-va3-R.bigfish.com (10.7.14.252) by
	VA3EHSOBE006.bigfish.com (10.7.40.26) with Microsoft SMTP Server id
	14.1.225.22; Wed, 9 Apr 2014 15:01:04 +0000
Received: from mail114-va3 (localhost [127.0.0.1])	by
	mail114-va3-R.bigfish.com (Postfix) with ESMTP id 2C7261C00AE;
	Wed,  9 Apr 2014 15:01:04 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h2148h1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6h208chzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h268bh26d3h1155h)
Received: from mail114-va3 (localhost.localdomain [127.0.0.1]) by mail114-va3
	(MessageSwitch) id 1397055662338226_25014;
	Wed,  9 Apr 2014 15:01:02 +0000 (UTC)
Received: from VA3EHSMHS037.bigfish.com (unknown [10.7.14.233])	by
	mail114-va3.bigfish.com (Postfix) with ESMTP id 413CB6005B;
	Wed,  9 Apr 2014 15:01:02 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS037.bigfish.com
	(10.7.99.47) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Wed, 9 Apr 2014 15:01:00 +0000
Received: from az84smr01.freescale.net (10.64.34.197) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.3.174.2; Wed, 9 Apr 2014 15:01:19 +0000
Received: from fsr-ub1264-102.ea.freescale.net
	(fsr-ub1264-102.ea.freescale.net [10.171.74.5])	by
	az84smr01.freescale.net (8.14.3/8.14.0) with ESMTP id s39F1Hc2016444;
	Wed, 9 Apr 2014 08:01:17 -0700
From: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Apr 2014 18:01:03 +0300
Message-ID: <1397055663-5541-1-git-send-email-alexandru.sardan@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] libgcc: Use TARGET_VENDOR_virtclass-multilib for symlink src calculation
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
X-List-Received-Date: Wed, 09 Apr 2014 15:01:26 -0000
Content-Type: text/plain

When defining a symlink for the multilib location based on MULTILIB_VARIANTS,
use TARGET_VENDOR_virtclass-multilib to get the vendor, as hardcoding
the value with TARGET_VENDOR + 'ml' + mlvariant may not corespond with
the actual directory where the libs are installed.

Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
---
 meta/recipes-devtools/gcc/libgcc.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/libgcc.inc b/meta/recipes-devtools/gcc/libgcc.inc
index 96f1969..eb7a6e8 100644
--- a/meta/recipes-devtools/gcc/libgcc.inc
+++ b/meta/recipes-devtools/gcc/libgcc.inc
@@ -131,8 +131,8 @@ python do_multilib_install() {
         if not tune_bitness:
             tune_bitness = '32' # /lib => 32bit lib
 
-        src = '../../../' + tune_baselib + '/' + \
-            tune_arch + d.getVar('TARGET_VENDOR', True) + 'ml' + ml + \
+        vendor = d.getVar('TARGET_VENDOR_virtclass-multilib' + '-' + ml, True)
+        src = '../../../' + tune_baselib + '/' + tune_arch + vendor + \
             '-' + d.getVar('TARGET_OS', True) + '/' + binv + '/'
 
         dest = d.getVar('D', True) + d.getVar('libdir', True) + '/' + \
-- 
1.7.9.5



