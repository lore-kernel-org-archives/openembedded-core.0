Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 94627731C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 11:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0FBo9XB018611 for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 11:50:09 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id i90tXk4t8UvB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 11:50:09 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0FBo5RY018607
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 11:50:07 GMT
Message-ID: <1452858605.28375.144.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jan 2016 11:50:05 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] image/image-live: Add back IMAGE_TYPES_MASKED support
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
X-List-Received-Date: Fri, 15 Jan 2016 11:50:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

IMAGE_TYPES_MASKED support was accidentally removed. The original 
idea behind it was to remove some of the hardcoding in the core 
image code, so do that for image-live and ensure the dependency 
and masked variables correctly reflect the needs of the class. 
This means we can remove all the hardcoded special cases since 
image-vm already has the needed markup.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 624ff38..d2e8b85 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -15,4 +15,6 @@ do_bootimg[depends] += "${PN}:do_image_complete"
 inherit bootimg
 
 IMAGE_TYPEDEP_live = "ext4"
-IMAGE_TYPES_MASKED += "live"
+IMAGE_TYPEDEP_iso = "ext4"
+IMAGE_TYPEDEP_hddimg = "ext4"
+IMAGE_TYPES_MASKED += "live hddimg iso"
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 8a09db1..0b73965 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -297,8 +297,6 @@ python () {
     old_overrides = d.getVar('OVERRIDES', 0)
 
     def _image_base_type(type):
-        if type in ["vmdk", "vdi", "qcow2", "live", "iso", "hddimg"]:
-            type = "ext4"
         basetype = type
         for ctype in ctypes:
             if type.endswith("." + ctype):
@@ -337,18 +335,23 @@ python () {
             _add_type(dep)
             basedep = _image_base_type(dep)
             typedeps[baset].add(basedep)
-        
+
     for t in alltypes[:]:
         _add_type(t)
 
     d.appendVarFlag('do_image', 'vardeps', ' '.join(vardeps))
 
+    maskedtypes = (d.getVar('IMAGE_TYPES_MASKED', True) or "").split()
+
     for t in basetypes:
         vardeps = set()
         cmds = []
         subimages = []
         realt = t
 
+        if t in maskedtypes:
+            continue
+
         localdata = bb.data.createCopy(d)
         debug = ""
         if t.startswith("debugfs_"):



