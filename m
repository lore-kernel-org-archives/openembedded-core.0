Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Skdda-00056h-Dw for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 18:01:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5TFoguL003174
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 16:50:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02039-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 16:50:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5TFoVMq003165
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2012 16:50:33 +0100
Message-ID: <1340985035.23146.171.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Jun 2012 16:50:35 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] image.bbclass: Add EXTRA_IMAGEDEPENDS to the do_build task, not do_rootfs
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
X-List-Received-Date: Fri, 29 Jun 2012 16:01:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From 1e4d50a269791129ea5ec357b90ebb53be0131e8 Mon Sep 17 00:00:00 2001
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 13 Jun 2012 10:38:16 +0000
Subject: 

EXTRA_IMAGEDEPENDS is used to ensure things like qemu-native are built and
these are not strictly dependencies of the do_rootfs task. This patch
moves them to the do_build task allowing bitbake a little more flexibility
about when things need to get built by.

I noticed this when qemu-native failed to build and a rootfs was not generated
which is not the intended behaviour.

Also update the syntax to use appendVarFlag instead of get/setVarFlag

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 0772363..7e4bb69 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -81,11 +81,13 @@ IMAGE_TYPE_vmdk = '${@base_contains("IMAGE_FSTYPES", "vmdk", "vmdk", "empty", d)
 inherit image-${IMAGE_TYPE_vmdk}
 
 python () {
-    deps = d.getVarFlag('do_rootfs', 'depends') or ""
-    deps += imagetypes_getdepends(d)
+    deps = " " + imagetypes_getdepends(d)
+    d.appendVarFlag('do_rootfs', 'depends', deps)
+
+    deps = ""
     for dep in (d.getVar('EXTRA_IMAGEDEPENDS', True) or "").split():
         deps += " %s:do_populate_sysroot" % dep
-    d.setVarFlag('do_rootfs', 'depends', deps)
+    d.appendVarFlag('do_build', 'depends', deps)
 
     # If we don't do this we try and run the mapping hooks while parsing which is slow
     # bitbake should really provide something to let us know this...




