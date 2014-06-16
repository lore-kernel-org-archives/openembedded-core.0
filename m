Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8B8DA6FEB0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 12:13:55 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5GCDA4V006497 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 13:13:51 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Z2-XsspR3sFK
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 13:13:50 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5GCDiFJ006518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 13:13:45 +0100
Message-ID: <1402920818.562.64.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jun 2014 13:13:38 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gcc-configure-common: Address problems with gengtype
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
X-List-Received-Date: Mon, 16 Jun 2014 12:13:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The gengtype patch we apply to gcc aims to ensure that the build and host
config headers don't get confused. We're seeing build failures where
both headers have been included, likely due to a race over the configuration
files.

It seems the gengtype-lex.c file isn't being regenerated when it should
and the unconditional inclusion of bconfig.h is resulting in these issues.

The fix is therefore to remove the file, forcing its regeneration.

[YOCTO #6393]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/recipes-devtools/gcc/gcc-configure-common.inc
index 4a10554..75fb379 100644
--- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
@@ -91,6 +91,8 @@ python do_preconfigure () {
     import subprocess
     cmd = d.expand('PATH=${PATH} cd ${S} && gnu-configize')
     subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
+    # See 0044-gengtypes.patch, we need to regenerate this file
+    bb.utils.remove(d.expand("${S}/gcc/gengtype-lex.c"))
 }
 addtask do_preconfigure after do_patch before do_configure
 do_preconfigure[depends] += "gnu-config-native:do_populate_sysroot autoconf-native:do_populate_sysroot"



