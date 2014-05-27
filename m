Return-Path: <mcrowe@brightsign.biz>
X-Greylist: delayed 902 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 27 May 2014 16:44:20 UTC
Received: from relay.appriver.com (unknown [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 3D2F46FB29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 16:44:20 +0000 (UTC)
Received: from [86.30.57.232] (HELO elite.brightsigndigital.co.uk)
	by relay.appriver.com (CommuniGate Pro SMTP 6.0.8)
	with ESMTPS id 396260280; Tue, 27 May 2014 12:29:19 -0400
Received: from chuckie.brightsign ([172.30.1.25])
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1WpKFT-0001fL-VY; Tue, 27 May 2014 17:29:12 +0100
Received: from mac by chuckie.brightsign with local (Exim 4.82)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1WpKFT-0005e5-Ua; Tue, 27 May 2014 17:29:11 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 May 2014 17:28:43 +0100
Message-Id: <1401208123-21656-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.0.0.rc2
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [RESEND PATCH] cmake: Avoid accidentally including libacl.h
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
X-List-Received-Date: Tue, 27 May 2014 16:44:21 -0000

The cmake recipe doesn't depend on libacl yet cmake will detect libacl.h
and use it by default. This risks build failures if libacl.h is unstaged
during the build and it also means that the build cmake will sometimes
support ACLs and sometimes not.

This can be avoided by setting ENABLE_ACL=0 but until the fix for
http://cmake.org/Bug/view.php?id=14866 is released we also need to set
HAVE_ACL_LIBACL_H=0.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb | 1 +
 1 file changed, 1 insertion(+)

(Originally submitted in http://lists.openembedded.org/pipermail/openembedded-core/2014-April/091619.html )

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
index 638c074..cd6b1d8 100644
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
@@ -14,4 +14,5 @@ SRC_URI[sha256sum] = "8c6574e9afabcb9fc66f463bb1f2f051958d86c85c37fccf067eb1a44a
 # Disable ccmake since we don't depend on ncurses
 CMAKE_EXTRACONF = "\
     -DBUILD_CursesDialog=0 \
+    -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
 "
-- 
2.0.0.rc2


