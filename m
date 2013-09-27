Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A70C160F09
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 09:58:27 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8R9wHts021915 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 10:58:23 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TEph2XV8pJ5I
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 10:58:23 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8R9wKCW021907
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 10:58:22 +0100
Message-ID: <1380275897.18603.417.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Sep 2013 10:58:17 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] native: Use a native site file and ensure the correct sed is used
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
X-List-Received-Date: Fri, 27 Sep 2013 09:58:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

native recipes were not using the site files. There are some things we need
to correct such as not using the path to sed-native. This allows us
to deploy settings globally for all recipes rather than hacking around
then in individual recipes as libtool-native used to for sed.

This fixes a regression introduced by
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=32edeb391f2107bb66b361cdcd4b8d4447731c33

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 102dfb8..6704e66 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -54,7 +54,7 @@ DEPENDS_GETTEXT = "gettext-native"
 PTEST_ENABLED = "0"
 
 # Don't use site files for native builds
-export CONFIG_SITE = ""
+export CONFIG_SITE = "${COREBASE}/meta/site/native"
 
 # set the compiler as well. It could have been set to something else
 export CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}"
diff --git a/meta/site/native b/meta/site/native
new file mode 100644
index 0000000..7dfb1cb
--- /dev/null
+++ b/meta/site/native
@@ -0,0 +1 @@
+ac_cv_path_SED=sed



