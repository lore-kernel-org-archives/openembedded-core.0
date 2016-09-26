Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 842706074F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 16:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8QGLi2T032197 for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 17:22:27 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id zr4T1LUj2j6y
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 17:22:27 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8QGMOCR032278
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 17:22:25 +0100
Message-ID: <1474906944.30475.11.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Sep 2016 17:22:24 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] utils: Add all_multilib_tune_list function
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
X-List-Received-Date: Mon, 26 Sep 2016 16:22:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Its useful to be able to query a list of variables to obtain the values
in each multilib context. This adds such a function which works even
if called in the non-default recipe context.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index 3c2a14f..74c5059 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -382,3 +382,36 @@ def all_multilib_tune_values(d, var, unique = True, need_split = True, delim = '
     else:
         ret = values
     return " ".join(ret)
+
+def all_multilib_tune_list(d, var):
+    """
+    Return a list of ${var} from each multilib tune configurations
+    Is safe to be called from a multilib recipe/context as it can
+    figure out the original tune and remove the multilib overrides.
+    """
+    values = []
+
+    localdata = bb.data.createCopy(d)
+    overrides = localdata.getVar("OVERRIDES", False).split(":")
+    newoverrides = []
+    for o in overrides:
+        if not o.startswith("virtclass-multilib-"):
+            newoverrides.append(o)
+    localdata.setVar("OVERRIDES", ":".join(newoverrides))
+    localdata.setVar("MLPREFIX", "")
+    origdefault = localdata.getVar("DEFAULTTUNE_MULTILIB_ORIGINAL", True)
+    if origdefault:
+        localdata.setVar("DEFAULTTUNE", origdefault)
+    bb.data.update_data(localdata)
+    value = localdata.getVar(var, True)
+    values.append(value)
+    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
+    for item in variants.split():
+        localdata = bb.data.createCopy(d)
+        overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
+        localdata.setVar("OVERRIDES", overrides)
+        localdata.setVar("MLPREFIX", item + "-")
+        bb.data.update_data(localdata)
+        value = localdata.getVar(var, True)
+        values.append(value)
+    return values



