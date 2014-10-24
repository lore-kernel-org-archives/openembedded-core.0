Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 826 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 24 Oct 2014 07:55:13 UTC
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id D8DD565D40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 07:55:13 +0000 (UTC)
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.14.3/8.14.3) with ESMTP id s9O7fLXm008064
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 09:41:21 +0200
Received: from localhost.localdomain (MD159NTC.ww002.siemens.net
	[139.16.76.77])
	by mail1.siemens.de (8.14.3/8.14.3) with ESMTP id s9O7fK7N031619;
	Fri, 24 Oct 2014 09:41:21 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Oct 2014 09:41:10 +0200
Message-Id: <1414136470-3075-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] image.py: Fix error in graph sorting
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
X-List-Received-Date: Fri, 24 Oct 2014 07:55:19 -0000

The graph sorting algorithm for image dependencies does a look for an
occurrence of a searched string instead of comparing the chunk to the
searched string. This leads to the problem that ubifs is recognized as ubi aswell.

This fixes this by splitting up the string into chunks.

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/lib/oe/image.py |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/image.py b/meta/lib/oe/image.py
index c9b9033..5e07187 100644
--- a/meta/lib/oe/image.py
+++ b/meta/lib/oe/image.py
@@ -109,7 +109,7 @@ class ImageDepGraph(object):
         # remove added nodes from deps_array
         for item in group:
             for node in self.graph:
-                if item in self.graph[node]:
+                if item in self.graph[node].split():
                     self.deps_array[node][0] -= 1
 
             self.deps_array.pop(item, None)
-- 
1.7.10.4


