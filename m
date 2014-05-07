Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 478AB605B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 14:03:32 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s47E3SK3001112 for <openembedded-core@lists.openembedded.org>;
	Wed, 7 May 2014 15:03:28 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7PBC0y-AojzL
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 May 2014 15:03:28 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s47E3OOe001055
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 May 2014 15:03:25 +0100
Message-ID: <1399471398.31891.34.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 07 May 2014 15:03:18 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] base.bbclass: Fix multilib PREFERRED_VERSION handling
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
X-List-Received-Date: Wed, 07 May 2014 14:03:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Now that gcc-cross, gcc-crosssdk and others have expanded variables in
their names, the code that previous just applied to cross-canadian needs
expanding to cover the other cases. Improve the conditional and also
fix a bug where the multilib prefix wasn't being added into the generated
versions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 5c2d6a2..899629b 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -157,15 +157,15 @@ def preferred_ml_updates(d):
     for v in versions:
         val = d.getVar(v, False)
         pkg = v.replace("PREFERRED_VERSION_", "")
-        if pkg.endswith(("-native", "-crosssdk")) or pkg.startswith(("nativesdk-", "virtual/nativesdk-")):
+        if pkg.endswith("-native") or "-crosssdk-" in pkg or pkg.startswith(("nativesdk-", "virtual/nativesdk-")):
             continue
-        if 'cross-canadian' in pkg:
+        if '-cross-' in pkg and '${' in pkg:
             for p in prefixes:
                 localdata = bb.data.createCopy(d)
                 override = ":virtclass-multilib-" + p
                 localdata.setVar("OVERRIDES", localdata.getVar("OVERRIDES", False) + override)
                 bb.data.update_data(localdata)
-                newname = localdata.expand(v)
+                newname = localdata.expand(v).replace("PREFERRED_VERSION_", "PREFERRED_VERSION_" + p + '-')
                 if newname != v:
                     newval = localdata.expand(val)
                     d.setVar(newname, newval)



