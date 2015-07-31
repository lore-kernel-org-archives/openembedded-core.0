Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1D7397647D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 10:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VAOpZn019919 for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:24:51 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZZ2LPnGzcei5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:24:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VAObbw019912
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 11:24:48 +0100
Message-ID: <1438338277.22462.7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 31 Jul 2015 11:24:37 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] gcc-multilib-config: Adapt mips for mips64 and different gcc versions
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
X-List-Received-Date: Fri, 31 Jul 2015 10:24:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit



The location of some files for mips varies between gcc 4.9 and 5.2. Ensure
that we cover both cases (and allow specified files to be optional).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gcc/gcc-multilib-config.inc b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
index 2e746e5..bdf4be7 100644
--- a/meta/recipes-devtools/gcc/gcc-multilib-config.inc
+++ b/meta/recipes-devtools/gcc/gcc-multilib-config.inc
@@ -29,6 +29,7 @@ python gcc_multilib_setup() {
     bb.utils.remove(build_conf_dir, True)
     ml_globs = ('%s/*/t-linux64' % src_conf_dir,
                 '%s/*/linux64.h' % src_conf_dir,
+                '%s/*/linux.h' % src_conf_dir,
                 '%s/linux.h' % src_conf_dir)
 
     # copy the target multilib config files to ${B}
@@ -80,7 +81,10 @@ python gcc_multilib_setup() {
                 return '"/%s/"' % libdir
 
         for ml_conf_file in files:
-            with open(root + '/' + ml_conf_file, 'r') as f:
+            fn = root + '/' + ml_conf_file
+            if not os.path.exists(fn):
+                continue
+            with open(fn, 'r') as f:
                 filelines = f.readlines()
 
                 # replace lines like
@@ -132,8 +136,8 @@ python gcc_multilib_setup() {
         'x86_64'    : ['gcc/config/i386/linux64.h'],
         'i586'      : ['gcc/config/i386/linux64.h'],
         'i686'      : ['gcc/config/i386/linux64.h'],
-        'mips'      : ['gcc/config/mips/linux64.h'],
-        'mips64'    : ['gcc/config/mips/linux64.h'],
+        'mips'      : ['gcc/config/mips/linux.h', 'gcc/config/mips/linux64.h'],
+        'mips64'    : ['gcc/config/mips/linux.h', 'gcc/config/mips/linux64.h'],
         'powerpc'   : ['gcc/config/rs6000/linux64.h'],
         'powerpc64' : ['gcc/config/rs6000/linux64.h'],
     }



