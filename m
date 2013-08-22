Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 17D2E6B2C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 11:30:28 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg9fi001261; Thu, 22 Aug 2013 12:42:19 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zM9Tt1pw_xky; Thu, 22 Aug 2013 12:42:19 +0100 (BST)
Received: from ted (bebox.config [93.97.175.187] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7MBg9Ic001241
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 22 Aug 2013 12:42:10 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1VCT5c-0001jW-HW; Thu, 22 Aug 2013 12:30:08 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Aug 2013 12:29:58 +0100
Message-Id: <1377171000-6469-26-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1377171000-6469-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 26/28] bitbake.conf: Work around dev symlink problems on darwin
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
X-List-Received-Date: Thu, 22 Aug 2013 11:30:29 -0000

On darwin, we have:

libxxx.dylib -> libxxx.Y.dylib

compared to Linux which has:

libxxx.so -> libxxx.so.Y

Our ordering of PACKAGES with -dev first and then ${PN} makes it impossible to
match the files correctly using simple globbing. This makes darwin targets
completely broken since both the libs and the dev symlinks end up in ${PN}-dev.

Whilst this commit is a hack, it at least puts the files into ${PN} and allows the
builds to be used. Symlinks don't take up much space so this isn't the end of
the world. I'm open to better solutions to this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 4535f68..45a5221 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -259,14 +259,17 @@ RPROVIDES = ""
 MULTI_PROVIDER_WHITELIST = "virtual/libintl virtual/libintl-native virtual/nativesdk-libintl virtual/xserver virtual/update-alternatives-native virtual/update-alternatives"
 
 SOLIBS = ".so.*"
-SOLIBS_darwin = ".*.dylib"
-SOLIBS_darwin8 = ".*.dylib"
-SOLIBS_darwin9 = ".*.dylib"
+SOLIBS_darwin = ".dylib"
+SOLIBS_darwin8 = ".dylib"
+SOLIBS_darwin9 = ".dylib"
 
 SOLIBSDEV = ".so"
-SOLIBSDEV_darwin = ".dylib"
-SOLIBSDEV_darwin8 = ".dylib"
-SOLIBSDEV_darwin9 = ".dylib"
+# Due to the ordering of PACKAGES and the naming of the dev symlinks on darwin,
+# we can't make the symlinks end up in the -dev packages easily at this point. This hack
+# at least means builds aren't completely broken and symlinks don't take up much space.
+SOLIBSDEV_darwin = ".dylibbroken"
+SOLIBSDEV_darwin8 = ".dylibbroken"
+SOLIBSDEV_darwin9 = ".dylibbroken"
 
 PACKAGE_BEFORE_PN ?= ""
 PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
-- 
1.8.1.2


