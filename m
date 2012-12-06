Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TgZz8-0005Ii-T8 for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 12:51:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB6Bav2a028337
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Dec 2012 11:36:57 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28027-01 for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2012 11:36:53 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB6Banil028331
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Dec 2012 11:36:50 GMT
Message-ID: <1354793799.25268.172.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 06 Dec 2012 11:36:39 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] bootimg: Remove now unnecessary dummy inherit usage
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
X-List-Received-Date: Thu, 06 Dec 2012 11:51:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

bitbake now supports empty expansions for inherit usage so we can simplify
these statements.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/bootimg.bbclass b/meta/classes/bootimg.bbclass
index 11a29cd..17c329a 100644
--- a/meta/classes/bootimg.bbclass
+++ b/meta/classes/bootimg.bbclass
@@ -36,7 +36,7 @@ BOOTIMG_VOLUME_ID   ?= "boot"
 BOOTIMG_EXTRA_SPACE ?= "512"
 
 EFI = "${@base_contains("MACHINE_FEATURES", "efi", "1", "0", d)}"
-EFI_CLASS = "${@base_contains("MACHINE_FEATURES", "efi", "grub-efi", "dummy", d)}"
+EFI_CLASS = "${@base_contains("MACHINE_FEATURES", "efi", "grub-efi", "", d)}"
 
 # Include legacy boot if MACHINE_FEATURES includes "pcbios" or if it does not
 # contain "efi". This way legacy is supported by default if neither is
@@ -50,7 +50,7 @@ def pcbios(d):
 def pcbios_class(d):
     if d.getVar("PCBIOS", True) == "1":
         return "syslinux"
-    return "dummy"
+    return ""
 
 PCBIOS = "${@pcbios(d)}"
 PCBIOS_CLASS = "${@pcbios_class(d)}"
diff --git a/meta/classes/dummy.bbclass b/meta/classes/dummy.bbclass
deleted file mode 100644
index 8c30071..0000000
--- a/meta/classes/dummy.bbclass
+++ /dev/null
@@ -1,2 +0,0 @@
-# An empty bbclass to facilitate dynamic inherit, include,
-# and require statements.




