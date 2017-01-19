Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D144871C7A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 16:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JGDC2F002522; Thu, 19 Jan 2017 16:13:12 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wlCK7cSg1VEm; Thu, 19 Jan 2017 16:13:12 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0JGD67t002507
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 19 Jan 2017 16:13:07 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cUFKk-0000lM-9z; Thu, 19 Jan 2017 16:13:06 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2017 16:13:00 +0000
Message-Id: <1484842382-2821-9-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1484842382-2821-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1484842382-2821-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 09/11] multilib_global: Drop pointless event mask/code filtering
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
X-List-Received-Date: Thu, 19 Jan 2017 16:13:14 -0000

This code was pointless so cleanup, drop the unused event and the
filtering is no longer needed.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/multilib_global.bbclass | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index aba0371..c9869fd 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -137,13 +137,11 @@ addhandler multilib_virtclass_handler_vendor
 multilib_virtclass_handler_vendor[eventmask] = "bb.event.ConfigParsed"
 
 python multilib_virtclass_handler_global () {
-    if not e.data:
-        return
-
     variant = e.data.getVar("BBEXTENDVARIANT")
+    if variant:
+        return
 
-    if isinstance(e, bb.event.RecipeParsed) and not variant:
-        if bb.data.inherits_class('kernel', e.data) or \
+    if bb.data.inherits_class('kernel', e.data) or \
             bb.data.inherits_class('module-base', e.data) or \
             (bb.data.inherits_class('allarch', e.data) and\
              not bb.data.inherits_class('packagegroup', e.data)):
@@ -177,5 +175,5 @@ python multilib_virtclass_handler_global () {
 }
 
 addhandler multilib_virtclass_handler_global
-multilib_virtclass_handler_global[eventmask] = "bb.event.RecipePreFinalise bb.event.RecipeParsed"
+multilib_virtclass_handler_global[eventmask] = "bb.event.RecipeParsed"
 
-- 
2.7.4


