Return-Path: <alexandru.sardan@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe002.messaging.microsoft.com [216.32.181.182])
	by mail.openembedded.org (Postfix) with ESMTP id 11C626F6F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 13:16:46 +0000 (UTC)
Received: from mail174-ch1-R.bigfish.com (10.43.68.225) by
	CH1EHSOBE022.bigfish.com (10.43.70.79) with Microsoft SMTP Server id
	14.1.225.22; Mon, 31 Mar 2014 13:16:46 +0000
Received: from mail174-ch1 (localhost [127.0.0.1])	by
	mail174-ch1-R.bigfish.com (Postfix) with ESMTP id D5CEA1001A2;
	Mon, 31 Mar 2014 13:16:45 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h2189h1d1ah1d2ah21bch1fc6hzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h226dh22d0h24afh2327h2336h2438h2461h2487h24d7h2516h2545h255eh25cch25f6h2605h268bh1155h)
Received: from mail174-ch1 (localhost.localdomain [127.0.0.1]) by mail174-ch1
	(MessageSwitch) id 139627179778190_8831;
	Mon, 31 Mar 2014 13:16:37 +0000 (UTC)
Received: from CH1EHSMHS009.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.235])	by mail174-ch1.bigfish.com (Postfix) with ESMTP id
	DBFF5C0146;	Mon, 31 Mar 2014 13:16:36 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS009.bigfish.com
	(10.43.70.9) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Mon, 31 Mar 2014 13:16:31 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-005.039d.mgd.msft.net (10.84.1.17) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Mon, 31 Mar 2014 13:16:30 +0000
Received: from fsr-ub1264-102.ea.freescale.net
	(fsr-ub1264-102.ea.freescale.net [10.171.74.5])	by
	tx30smr01.am.freescale.net
	(8.14.3/8.14.0) with ESMTP id s2VDGSAb006217;
	Mon, 31 Mar 2014 06:16:29 -0700
From: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 31 Mar 2014 16:16:13 +0300
Message-ID: <1396271773-6916-1-git-send-email-alexandru.sardan@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
X-FOPE-CONNECTOR: Id%0$Dn%FREESCALE.MAIL.ONMICROSOFT.COM$RO%1$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] gcc: changed multilib options handling
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
X-List-Received-Date: Mon, 31 Mar 2014 13:16:48 -0000
Content-Type: text/plain

Duplicate parameters in the tune args are repeated in the
MULTILIB_OPTIONS variable. This leads to incorrect configurations
if the order of the parameters is bad.
(Eg. "mhard-float m32/mhard-float m64" leads to an incorrect config)
This patch finds the common parameters and removes the duplicates.

Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
---
 meta/recipes-devtools/gcc/gcc-multilib-config.inc |   24 +++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index 005aa6b..30745a6 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -148,6 +148,7 @@ python gcc_multilib_setup() {
     options = []
     dirnames = []
     osdirnames = []
+    optsets = []
 
     for ml in ml_list:
         tune = d.getVar(ml, True)
@@ -172,16 +173,31 @@ python gcc_multilib_setup() {
         else:
             bb.error('Unknown libdir (%s) of the tune : %s' % (tune_baselib, tune))
 
-        # take out '-' and march='s from parameters
-        options.append(re.sub(r'march=[^ ]+ *', '',
-                            re.sub(r' +\-+', ' ',
-                                re.sub(r'^ *\-+', '', tune_parameters['ccargs']))))
+        # take out '-' mcpu='s and march='s from parameters
+        options.append(re.sub(r'mcpu=[^ ]+ *', '',
+                         re.sub(r'march=[^ ]+ *', '',
+                           re.sub(r' +\-+', ' ',
+                             re.sub(r'^ *\-+', '', tune_parameters['ccargs'])))))
         if tune_baselib == 'lib':
             dirnames.append('32')  # /lib => 32bit lib
         else:
             dirnames.append(tune_baselib.replace('lib', ''))
         osdirnames.append('../' + tune_baselib)
 
+    if len(options) > 1:
+        for optstr in options:
+            optsets.append(optstr.split())
+
+    #get common options present in all the tune parameters
+        common_opt_set = set.intersection(*map(set, optsets))
+
+    #common options will be added at the end of the options string only once
+        if (len(common_opt_set) > 0):
+            rex = re.compile(''.join(['\\b(', '|'.join(common_opt_set), ')\\W']), re.I)
+            options = [rex.sub("", optstr) for optstr in options]
+            options = [optstr.strip() for optstr in options]
+            options[len(options)-1] = ' '.join((options[len(options)-1], ' '.join(common_opt_set)))
+
     write_config(builddir, target_config_files, options, dirnames, osdirnames)
     write_headers(builddir, header_config_files, libdir32, libdir64, libdirx32, libdirn32)
 }
-- 
1.7.9.5



