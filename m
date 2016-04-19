Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7626D60616
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 16:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3JGlC0q008006 for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 17:47:12 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Jnu_Uvj-FYP8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 17:47:12 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u3JGl7Jx008003
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 17:47:08 +0100
Message-ID: <1461084427.31320.25.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Apr 2016 17:47:07 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: [PATCH] image_types: Ensure rootfs dependencies cover DEBUGFS
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
X-List-Received-Date: Tue, 19 Apr 2016 16:47:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

If you configure a bz2 debugfs, pbzip2-native currently isn't built.
This patch makes sure the dependencies are added.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index e2467bd..122e080 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -17,7 +17,9 @@ def imagetypes_getdepends(d):
 
     deps = []
     ctypes = d.getVar('COMPRESSIONTYPES', True).split()
-    for type in (d.getVar('IMAGE_FSTYPES', True) or "").split():
+    fstypes = set((d.getVar('IMAGE_FSTYPES', True) or "").split())
+    fstypes |= set((d.getVar('IMAGE_FSTYPES_DEBUGFS', True) or "").split())
+    for type in fstypes:
         if type in ["vmdk", "vdi", "qcow2", "hdddirect", "live", "iso", "hddimg"]:
             type = "ext4"
         basetype = type



