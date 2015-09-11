Return-Path: <milo-software@users.sourceforge.net>
X-Greylist: delayed 446 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 11 Sep 2015 17:10:20 UTC
Received: from smtp03.mail.online.nl (smtp03.mail.online.nl [194.134.25.73])
	by mail.openembedded.org (Postfix) with ESMTP id 7A0D660053
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Sep 2015 17:10:20 +0000 (UTC)
Received: from localhost.localdomain (s55969068.adsl.online.nl
	[85.150.144.104])
	by smtp03.mail.online.nl (Postfix) with ESMTP id E1DA31C0105;
	Fri, 11 Sep 2015 19:02:51 +0200 (CEST)
From: Mike Looijmans <milo-software@users.sourceforge.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Sep 2015 19:02:44 +0200
Message-Id: <1441990964-12205-1-git-send-email-milo-software@users.sourceforge.net>
X-Mailer: git-send-email 2.1.0
Cc: Mike Looijmans <mike.looijmans@topic.nl>
Subject: [PATCH] image.py: Allow IMAGE_LINK_NAME to be empty
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
X-List-Received-Date: Fri, 11 Sep 2015 17:10:20 -0000

From: Mike Looijmans <mike.looijmans@topic.nl>

When IMAGE_LINK_NAME is empty, OE will try to create a "blank" link instead
of just skipping it. The code checks for "link_name is not None" which will
never evaluate to true. Change the test to a simple "if link_name:" so it
no longer attempt to create links when the variable is an empty string.

Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 meta/lib/oe/image.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index 5b77306..2361955 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -194,7 +194,7 @@ class Image(ImageDepGraph):
 
         os.chdir(deploy_dir)
 
-        if link_name is not None:
+        if link_name:
             for type in subimages:
                 if os.path.exists(img_name + ".rootfs." + type):
                     dst = link_name + "." + type
-- 
2.1.0


