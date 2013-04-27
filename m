Received: from r-finger.com ([178.79.160.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tf+lists.yocto@r-finger.com>) id 1UW10X-0000Rh-6K
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Apr 2013 11:01:28 +0200
Received: from i7-990x.r-finger.com
	(host86-137-87-250.range86-137.btcentralplus.com [86.137.87.250])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 9B4859528;
	Sat, 27 Apr 2013 09:43:40 +0100 (BST)
From: tf+lists.yocto@r-finger.com
To: openembedded-core@lists.openembedded.org
Date: Sat, 27 Apr 2013 09:43:38 +0100
Message-Id: <1367052218-8320-1-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Tomas Frydrych <tomas@sleepfive.com>
Subject: [PATCH] sudo: disable SSP for auxiliary build tools mksiglist and mksigname
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Apr 2013 09:01:29 -0000

From: Tomas Frydrych <tomas@sleepfive.com>

The do_compile_prepend() fragment ensures that the non-installable build
tools mksiglist and mksigname are built using the BUILD_CC, but if the the
BUILD_CC does not support SSP and the cross compiler does, the build fails
due to the SSP flags set in the Makefile. Ensuring that SSP is not enabled
when building these tools prevents this from happening.

Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
---
 meta/recipes-extended/sudo/sudo.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/sudo/sudo.inc
index e778485..35da367 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -23,7 +23,7 @@ do_configure_prepend () {
 
 # mksigname/mksiglist are used on build host to generate source files
 do_compile_prepend () {
-	oe_runmake CC=$BUILD_CC CPPFLAGS="$BUILD_CPPFLAGS -I${S}/include -I${S} -I${B}"  -C compat mksigname mksiglist
+	oe_runmake SSP_CFLAGS="" SSP_LDFLAGS="" CC=$BUILD_CC CPPFLAGS="$BUILD_CPPFLAGS -I${S}/include -I${S} -I${B}"  -C compat mksigname mksiglist
 }
 
 # Explicitly create ${localstatedir}/lib before do_install to ensure
-- 
1.7.10.4



