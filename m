Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6ABF078276
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 19:14:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7IJE9Dd006731
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Aug 2017 12:14:09 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 18 Aug 2017 12:14:08 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Aug 2017 14:12:33 -0500
Message-ID: <1503083553-115231-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH] prelink: Change the behavior to avoid checking USER_CLASSES
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
X-List-Received-Date: Fri, 18 Aug 2017 19:14:08 -0000
Content-Type: text/plain

The behavior before this change was to check USER_CLASSES and adjust
the install script to return either exit 0 (don't do anything) or
exit 1 (run on first boot).  This enabled a user to include the prelink
package without enablign the image-prelink bbclass and get a first boot
prelink.

Checking USER_CLASSES is not desired, as an image should be able to simply
inherit the image-prelink and get the same type of behavior.  Modifying
the recipe based on the inclusion of a class is a bad idea as it makes
this style work more difficult.  So we move to a more defined strategy
based on exist uses.  (That we know of...)

If we ae doing a cross install, we want to avoid prelinking.
Prelinking during a cross install should be handled by the image-prelink
bbclass.  If the user desires this to run on the target at first boot
they will need to create a custom boot script.

[YOCTO #11169]

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/prelink/prelink_git.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index 4529dbf..b739af0 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -150,13 +150,15 @@ do_install_append () {
 	install -m 0644 ${WORKDIR}/macros.prelink ${D}${sysconfdir}/rpm/macros.prelink
 }
 
-# If we're using image-prelink, we want to skip this on the host side
-# but still do it if the package is installed on the target...
+# If we ae doing a cross install, we want to avoid prelinking.
+# Prelinking during a cross install should be handled by the image-prelink
+# bbclass.  If the user desires this to run on the target at first boot
+# they will need to create a custom boot script.
 pkg_postinst_prelink() {
 #!/bin/sh
 
 if [ "x$D" != "x" ]; then
-  ${@bb.utils.contains('USER_CLASSES', 'image-prelink', 'exit 0', 'exit 1', d)}
+  exit 0
 fi
 
 prelink -a
-- 
1.8.3.1


