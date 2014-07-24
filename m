Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A0C9D70734
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 21:11:00 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6OLAuOw025415 for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 22:10:56 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3E6MGt_0yq5M
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 22:10:56 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6OLAsvG025402
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 22:10:55 +0100
Message-ID: <1406236249.27697.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jul 2014 22:10:49 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gcc-multilib: Simply/fix MULTILIB_OPTIONS handling
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
X-List-Received-Date: Thu, 24 Jul 2014 21:11:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

MULTILIB_OPTIONS takes the parameters which trigger a given multilib to be
selected. It supports *one* option per multilib, '/' separated. Spaces
separate options used to generate additional multilib combinations.

Adding in all of CFLAGS to this is therefore clearly a really bad idea
but how do we fix things?

The best option I've come up with so far is a list of whitelist variables
to use to trigger the multilibs. Its populated with the standard multilibs
we support, anyone setting up an advanced multilib can populate the variable
with the correct trigger parameters.

This has the advantage of simplifying the code and allowing us to remove
the code filtering blocks since there is no longer option duplication. Testing
after this change shows a much improved sdk toolchain functionality.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index acea6d8..b8c705a 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -14,6 +14,8 @@
 #    gcc/config/mips/linux64.h
 #    gcc/config/rs6000/linux64.h
 
+MULTILIB_OPTION_WHITELIST ??= "-m32 -m64 -mx32 -mabi=n32 -mabi=32 -mabi=64" 
+
 python gcc_multilib_setup() {
     import re
     import shutil
@@ -187,30 +189,19 @@ python gcc_multilib_setup() {
             bb.error('Unknown libdir (%s) of the tune : %s' % (tune_baselib, tune))
 
         # take out '-' mcpu='s and march='s from parameters
-        options.append(re.sub(r'mcpu=[^ ]+ *', '',
-                         re.sub(r'march=[^ ]+ *', '',
-                           re.sub(r' +\-+', ' ',
-                             re.sub(r'^ *\-+', '', tune_parameters['ccargs'])))))
+        opts = []
+        whitelist = (d.getVar("MULTILIB_OPTION_WHITELIST", True) or "").split()
+        for i in tune_parameters['ccargs'].split():
+            if i in whitelist:
+                opts.append(i)
+        options.append(" ".join(opts))
+
         if tune_baselib == 'lib':
             dirnames.append('32')  # /lib => 32bit lib
         else:
             dirnames.append(tune_baselib.replace('lib', ''))
         osdirnames.append('../' + tune_baselib)
 
-    if len(options) > 1:
-        for optstr in options:
-            optsets.append(optstr.split())
-
-    #get common options present in all the tune parameters
-        common_opt_set = set.intersection(*map(set, optsets))
-
-    #common options will be added at the end of the options string only once
-        if (len(common_opt_set) > 0):
-            rex = re.compile(''.join(['\\b(', '|'.join(common_opt_set), ')\\W']), re.I)
-            options = [rex.sub("", optstr) for optstr in options]
-            options = [optstr.strip() for optstr in options]
-            options[len(options)-1] = ' '.join((options[len(options)-1], ' '.join(common_opt_set)))
-
     write_config(builddir, target_config_files, options, dirnames, osdirnames)
     write_headers(builddir, header_config_files, libdir32, libdir64, libdirx32, libdirn32)
 }



