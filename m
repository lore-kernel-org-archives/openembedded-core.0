Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EB081731A1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 14:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KET5Sg030339; Fri, 20 Jan 2017 14:29:05 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id pgOe8acnDtr0; Fri, 20 Jan 2017 14:29:05 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0KET0ZD030333
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 20 Jan 2017 14:29:01 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cUaBY-00083y-Dl; Fri, 20 Jan 2017 14:29:00 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 14:28:56 +0000
Message-Id: <1484922537-30954-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] utils: Factor out common multilib datastore creation function
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
X-List-Received-Date: Fri, 20 Jan 2017 14:29:07 -0000

This code is already used in two places and we need it in others so
turn it into its own function.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/utils.bbclass | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index d834a8a..549e4b8 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -349,6 +349,14 @@ def multilib_pkg_extend(d, pkg):
         pkgs = pkgs + " " + v + "-" + pkg
     return pkgs
 
+def get_multilib_datastore(variant, d):
+    localdata = bb.data.createCopy(d)
+    overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + variant
+    localdata.setVar("OVERRIDES", overrides)
+    localdata.setVar("MLPREFIX", variant + "-")
+    bb.data.update_data(localdata)
+    return localdata
+
 def all_multilib_tune_values(d, var, unique = True, need_split = True, delim = ' '):
     """Return a string of all ${var} in all multilib tune configuration"""
     values = []
@@ -361,11 +369,7 @@ def all_multilib_tune_values(d, var, unique = True, need_split = True, delim = '
             values.append(value)
     variants = d.getVar("MULTILIB_VARIANTS") or ""
     for item in variants.split():
-        localdata = bb.data.createCopy(d)
-        overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
-        localdata.setVar("OVERRIDES", overrides)
-        localdata.setVar("MLPREFIX", item + "-")
-        bb.data.update_data(localdata)
+        localdata = get_multilib_datastore(item, d)
         value = localdata.getVar(var) or ""
         if value != "":
             if need_split:
@@ -411,11 +415,7 @@ def all_multilib_tune_list(vars, d):
         values[v].append(localdata.getVar(v))
     variants = d.getVar("MULTILIB_VARIANTS") or ""
     for item in variants.split():
-        localdata = bb.data.createCopy(d)
-        overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
-        localdata.setVar("OVERRIDES", overrides)
-        localdata.setVar("MLPREFIX", item + "-")
-        bb.data.update_data(localdata)
+        localdata = get_multilib_datastore(item, d)
         values[v].append(localdata.getVar(v))
         values['ml'].append(item)
     return values
-- 
2.7.4


