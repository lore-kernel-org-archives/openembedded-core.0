Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SLyDy-00080m-Hm for openembedded-core@lists.openembedded.org;
	Sun, 22 Apr 2012 16:57:14 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3MElgX1009627
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Apr 2012 15:47:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09111-03 for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Apr 2012 15:47:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3MElVUg009621
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Apr 2012 15:47:32 +0100
Message-ID: <1335106050.12692.29.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 22 Apr 2012 15:47:30 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] initramfs-live-boot: Disable unionfs until its issue with the system rootdir are resolved
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
X-List-Received-Date: Sun, 22 Apr 2012 14:57:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There are issues with the current unionfs when making a union mount over "/".
Until these are resolved we can't use unionfs for live booting so disable this
temporarily as a workaround.

unionfs is usable in other circumstances.

[YOCTO #2331 workaround]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index 8f7511e..137a401 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -5,12 +5,13 @@ RDEPENDS = "udev"
 DEPENDS = "virtual/kernel"
 SRC_URI = "file://init-live.sh"
 
-PR = "r9"
+PR = "r10"
 
 do_compile() {
-	if grep -q "CONFIG_UNION_FS=y" ${STAGING_KERNEL_DIR}/.config; then
-		sed -i 's/UNIONFS="no"/UNIONFS="yes"/g' ${WORKDIR}/init-live.sh
-	fi
+	#if grep -q "CONFIG_UNION_FS=y" ${STAGING_KERNEL_DIR}/.config; then
+	#	sed -i 's/UNIONFS="no"/UNIONFS="yes"/g' ${WORKDIR}/init-live.sh
+	#fi
+	:
 }
  
 do_install() {




