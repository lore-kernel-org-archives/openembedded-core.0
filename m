Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 96F837565E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 May 2015 07:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4P7qb0o008910 for <openembedded-core@lists.openembedded.org>;
	Mon, 25 May 2015 08:52:37 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WJAb4PkKI3kf
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 May 2015 08:52:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t4P7qM7d008903
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 May 2015 08:52:33 +0100
Message-ID: <1432540342.29515.11.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 25 May 2015 08:52:22 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] native: Improve PROVIDES handling
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
X-List-Received-Date: Mon, 25 May 2015 07:52:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Since this class works on pre finalised data, the logic hasn't needed
to be exact. If we change the way the finalised data works, we find
that certain dependencies can be dropped (e.g. pn isn't in the name).

To fix this, restructure the function to alter each entry in turn
and not drop any entries.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 1f8139b..71b0572 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -154,9 +154,11 @@ python native_virtclass_handler () {
     nprovides = []
     for prov in provides.split():
         if prov.find(pn) != -1:
-            continue
-        if not prov.endswith("-native"):
+            nprovides.append(prov)
+        elif not prov.endswith("-native"):
             nprovides.append(prov.replace(prov, prov + "-native"))
+        else:
+            nprovides.append(prov)
     e.data.setVar("PROVIDES", ' '.join(nprovides))
 
     e.data.setVar("OVERRIDES", e.data.getVar("OVERRIDES", False) + ":virtclass-native")



