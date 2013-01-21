Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TxQQe-0006cw-J2 for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 00:05:25 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0LMntH6020871
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 22:49:55 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16855-03 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 22:49:51 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0LMnnxP020865
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 22:49:50 GMT
Message-ID: <1358808590.14265.73.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Jan 2013 22:49:50 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] packagedata: Add warnings if multiple recipes try to write the same package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2013 23:05:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If multiple recipes try and write the same package it resulted in a
rather confusing traceback and unintuitive error. This patch
prints a human readable error instead.

[YOCTO #3645]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/packagedata.bbclass b/meta/classes/packagedata.bbclass
index 790d874..120cd64 100644
--- a/meta/classes/packagedata.bbclass
+++ b/meta/classes/packagedata.bbclass
@@ -1,7 +1,8 @@
 python read_subpackage_metadata () {
     import oe.packagedata
 
-    data = oe.packagedata.read_pkgdata(d.getVar('PN', True), d)
+    pn = d.getVar('PN', True)
+    data = oe.packagedata.read_pkgdata(pn, d)
 
     for key in data.keys():
         d.setVar(key, data[key])
@@ -9,5 +10,9 @@ python read_subpackage_metadata () {
     for pkg in d.getVar('PACKAGES', True).split():
         sdata = oe.packagedata.read_subpkgdata(pkg, d)
         for key in sdata.keys():
+            if key == "PN":
+                if sdata[key] != pn:
+                    bb.fatal("Recipe %s is trying to create package %s which was already written by recipe %s. This will cause corruption, please resolve this and only provide the package from one recipe or the other or only build one of the recipes." % (pn, pkg, sdata[key]))
+                continue
             d.setVar(key, sdata[key])
 }




