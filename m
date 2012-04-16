Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SJigZ-0001Fu-4f for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 11:57:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3G9m27T030508
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 10:48:02 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28589-09 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 10:47:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3G9lrZr030502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 10:47:56 +0100
Message-ID: <1334569676.16992.67.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 10:47:56 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] python: Fix re-execution problem due to patching configure and configure.in
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
X-List-Received-Date: Mon, 16 Apr 2012 09:57:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There was a patch patching both configure and configure.in. Since the recipes
all autoreconf, this is pointless and means subsequent patch tasks fail.

The fix is to only patch configure.in.

[YOCTO #2194]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-devtools/python/python-native/sys_platform_is_now_always_linux2.patch b/meta/recipes-devtools/python/python-native/sys_platform_is_now_always_linux2.patch
index ed52936..1cb8fea 100644
--- a/meta/recipes-devtools/python/python-native/sys_platform_is_now_always_linux2.patch
+++ b/meta/recipes-devtools/python/python-native/sys_platform_is_now_always_linux2.patch
@@ -14,17 +14,6 @@ Issue #12326: sys.platform is now always 'linux2' on Linux
 
 Even if Python is compiled on Linux 3.
 
-diff --git a/configure b/configure
---- a/configure
-+++ b/configure
-@@ -2995,6 +2995,7 @@ then
- 	MACHDEP="$ac_md_system$ac_md_release"
- 
- 	case $MACHDEP in
-+	linux*) MACHDEP="linux2";;
- 	cygwin*) MACHDEP="cygwin";;
- 	darwin*) MACHDEP="darwin";;
- 	atheos*) MACHDEP="atheos";;
 diff --git a/configure.in b/configure.in
 --- a/configure.in
 +++ b/configure.in




