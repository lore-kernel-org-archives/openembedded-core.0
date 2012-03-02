Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S3RTg-0007LB-DP for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 13:20:52 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22CCMXm030650
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 12:12:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29319-10 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2012 12:12:12 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q22CCAw7030603
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Mar 2012 12:12:11 GMT
Message-ID: <1330690334.15224.9.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 02 Mar 2012 12:12:14 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] image_types.bbclass: We need to preserve order in the types variable and avoid set()
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Mar 2012 12:20:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If we don't do this, the order can be changed and the variable is
sensitive to the ordering.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index f756c39..5da2961 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -3,20 +3,24 @@ def get_imagecmds(d):
     old_overrides = d.getVar('OVERRIDES', 0)
 
     alltypes = d.getVar('IMAGE_FSTYPES', True).split()
-    types = d.getVar('IMAGE_FSTYPES', True).split()
+    types = []
     ctypes = d.getVar('COMPRESSIONTYPES', True).split()
     cimages = {}
 
     # Filter out all the compressed images from types
-    for type in types:
+    for type in alltypes:
+        basetype = None
         for ctype in ctypes:
             if type.endswith("." + ctype):
                 basetype = type[:-len("." + ctype)]
-                types[types.index(type)] = basetype
+                if basetype not in types:
+                    types.append(basetype)
                 if basetype not in cimages:
                     cimages[basetype] = []
                 cimages[basetype].append(ctype)
                 break
+        if not basetype and type not in types:
+            types.append(type)
 
     # Live and VMDK images will be processed via inheriting
     # bbclass and does not get processed here.
@@ -33,7 +37,7 @@ def get_imagecmds(d):
     if d.getVar('IMAGE_LINK_NAME', True):
         cmds += "	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.*"
 
-    for type in set(types):
+    for type in types:
         ccmd = []
         subimages = []
         localdata = bb.data.createCopy(d)




