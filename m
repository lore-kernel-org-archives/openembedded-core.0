Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TPE4T-0006vc-Gw for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 17:01:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9JEln6A031789
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 15:47:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 31641-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 15:47:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q9JElcJ2031783
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 15:47:39 +0100
Message-ID: <1350658057.2520.27.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Oct 2012 15:47:37 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: lib/oe/packagedata: Use the PKGMLTRIPLETS variable
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
X-List-Received-Date: Fri, 19 Oct 2012 15:01:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
index ce92a7e..62fd718 100644
--- a/meta/lib/oe/packagedata.py
+++ b/meta/lib/oe/packagedata.py
@@ -24,30 +24,10 @@ def read_pkgdatafile(fn):
     return pkgdata
 
 def all_pkgdatadirs(d):
-    archs = []
-    tos = []
-    tvs = []
-
-    archs.append(d.getVar("PACKAGE_ARCHS", True).split())
-    tos.append(d.getVar("TARGET_OS", True))
-    tvs.append(d.getVar("TARGET_VENDOR", True))
-
-    variants = d.getVar("MULTILIB_VARIANTS", True) or ""
-    for item in variants.split():
-        localdata = bb.data.createCopy(d)
-        overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + item
-        localdata.setVar("OVERRIDES", overrides)
-        bb.data.update_data(localdata)
-
-        archs.append(localdata.getVar("PACKAGE_ARCHS", True).split())
-        tos.append(localdata.getVar("TARGET_OS", True))
-        tvs.append(localdata.getVar("TARGET_VENDOR", True))
-
     dirs = []
-    for i in range(len(archs)):
-        for arch in archs[i]:
-            dirs.append(arch + tvs[i] + "-" + tos[i] + "/runtime/")
-    dirs.reverse()
+    triplets = (d.getVar("PKGMLTRIPLETS") or "").split()
+    for t in triplets:
+        dirs.append(t + "/runtime/")
     return dirs 
  
 def get_subpkgedata_fn(pkg, d):




