Return-Path: <alexandru.sardan@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe006.messaging.microsoft.com [216.32.180.16])
	by mail.openembedded.org (Postfix) with ESMTP id 675266D746
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 11:40:59 +0000 (UTC)
Received: from mail51-va3-R.bigfish.com (10.7.14.229) by
	VA3EHSOBE002.bigfish.com (10.7.40.22) with Microsoft SMTP Server id
	14.1.225.22; Fri, 15 Nov 2013 11:41:00 +0000
Received: from mail51-va3 (localhost [127.0.0.1])	by mail51-va3-R.bigfish.com
	(Postfix) with ESMTP id 2448918056F	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 11:41:00 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h2148h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h1d1ah1d2ah1fc6hzz1de098h8275bh1de097hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h224fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h1155h)
Received: from mail51-va3 (localhost.localdomain [127.0.0.1]) by mail51-va3
	(MessageSwitch) id 1384515658369915_31966;
	Fri, 15 Nov 2013 11:40:58 +0000 (UTC)
Received: from VA3EHSMHS011.bigfish.com (unknown [10.7.14.225])	by
	mail51-va3.bigfish.com (Postfix) with ESMTP id 4BDD81A004C	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 11:40:58 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS011.bigfish.com
	(10.7.99.21) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Fri, 15 Nov 2013 11:40:56 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-002.039d.mgd.msft.net (10.84.1.15) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Fri, 15 Nov 2013 11:40:55 +0000
Received: from wks96.ea.freescale.net (wks96.ea.freescale.net [10.171.74.133])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	rAFBesnD011252; Fri, 15 Nov 2013 04:40:55 -0700
From: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Nov 2013 13:51:36 +0200
Message-ID: <1384516296-7330-1-git-send-email-alexandru.sardan@freescale.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
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
X-List-Received-Date: Fri, 15 Nov 2013 11:40:59 -0000
Content-Type: text/plain

Duplicate parameters in the tune args are repeated in the
MULTILIB_OPTIONS variable. This leads to incorrect configurations
if the order of the parameters is bad.
(Eg. "mhard-float m32/mhard-float m64" leads to an incorrect config)
This patch finds the common parameters and removes the duplicates.
Also the mcpu parameter is ignored.

Signed-off-by: Alexandru-Cezar Sardan <alexandru.sardan@freescale.com>
---
 meta/recipes-devtools/gcc/gcc-multilib-config.inc |   26 +++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index 005aa6b..3a2b8c8 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -109,6 +109,7 @@ python gcc_multilib_setup() {
         'i586'      : ['gcc/config/i386/t-linux64'],
         'mips'      : ['gcc/config/mips/t-linux64'],
         'powerpc'   : ['gcc/config/rs6000/t-linux64'],
+        'powerpc64' : ['gcc/config/rs6000/t-linux64'],
     }
 
     gcc_header_config_files = {
@@ -116,6 +117,7 @@ python gcc_multilib_setup() {
         'i586'      : ['gcc/config/i386/linux64.h'],
         'mips'      : ['gcc/config/mips/linux64.h'],
         'powerpc'   : ['gcc/config/rs6000/linux64.h'],
+        'powerpc64' : ['gcc/config/rs6000/linux64.h'],
     }
 
     target_arch = (d.getVar('TARGET_ARCH_MULTILIB_ORIGINAL', True) if mlprefix
@@ -148,6 +150,7 @@ python gcc_multilib_setup() {
     options = []
     dirnames = []
     osdirnames = []
+    optsets = []
 
     for ml in ml_list:
         tune = d.getVar(ml, True)
@@ -172,16 +175,31 @@ python gcc_multilib_setup() {
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
+        #get common options present in all the tune parameters
+        common_opt_set = set.intersection(*map(set, optsets))
+
+        #common options will be added at the end of the options string only once
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



