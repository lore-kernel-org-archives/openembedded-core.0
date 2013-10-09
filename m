Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id D5BD16CD4E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2013 22:42:37 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r99MgXDg007506 for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Oct 2013 23:42:33 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id L9yiXIzTFP-P
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2013 23:42:33 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r99MgT8B007497
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Oct 2013 23:42:31 +0100
Message-ID: <1381358545.29912.50.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 09 Oct 2013 23:42:25 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] utils.bbclass: Fix override ordering for FILESPATH
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
X-List-Received-Date: Wed, 09 Oct 2013 22:42:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Currently the overrides are being applied backwards. This means something which is
platform specific is overriding something which is machine specific which
is clearly not intended.

This patch corrects the ordering to match the normal expected behaviour of
OVERRIDES.

Secondly, all overrides are being searched for each path in turn. What should
really happen is that we should look for the highest priority override (e.g. distro
or machine) in each layer, then move on to platform/tune (e.g. armv7a) and
then to arch (e.g. arm). This patch therefore also reverses the for loops
to achieve this behaviour and give the result the user would expect.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index d1f6563..0a533af 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -307,10 +307,11 @@ def base_set_filespath(path, d):
     if extrapaths != "":
         path = extrapaths.split(":") + path
     # The ":" ensures we have an 'empty' override
-    overrides = ((d.getVar("FILESOVERRIDES", True) or "") + ":").split(":")
-    for p in path:
-        if p != "": 
-            for o in overrides:
+    overrides = (":" + (d.getVar("FILESOVERRIDES", True) or "")).split(":")
+    overrides.reverse()
+    for o in overrides:
+        for p in path:
+            if p != "": 
                 filespath.append(os.path.join(p, o))
     return ":".join(filespath)
 



