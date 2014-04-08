Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 1678865DC0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 13:51:52 +0000 (UTC)
Received: from [86.30.57.232] (HELO elite.brightsigndigital.co.uk)
	by relay.appriver.com (CommuniGate Pro SMTP 6.0.8)
	with ESMTPS id 377310218; Tue, 08 Apr 2014 09:51:53 -0400
Received: from chuckie.brightsign ([172.30.1.25])
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1WXWRH-0005a3-Jx; Tue, 08 Apr 2014 14:51:47 +0100
Received: from mac by chuckie.brightsign with local (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1WXWRH-00048b-JD; Tue, 08 Apr 2014 14:51:47 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Apr 2014 14:51:23 +0100
Message-Id: <1396965083-15863-2-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1396965083-15863-1-git-send-email-mac@mcrowe.com>
References: <1396965083-15863-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 2/2] cmake: Avoid accidentally including libacl.h
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
X-List-Received-Date: Tue, 08 Apr 2014 13:51:53 -0000

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
1.9.1


