Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SIGKG-0001kh-GH for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 11:28:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3C9J5BQ020331
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 10:19:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20273-01 for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 10:19:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3C9Ivwd020325
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 10:18:58 +0100
Message-ID: <1334222338.31685.26.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Apr 2012 10:18:58 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] linux-dtb: Ensure dtb files are covered by sstate
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
X-List-Received-Date: Thu, 12 Apr 2012 09:28:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The dtb files were not being installed into a location compatible with sstate and
the do_deploy task. This means in builds just using sstate, the dtb files disappeared.

This patch fixes the code to use the correct location for deploy files.

[YOCTO #2190]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index 2f0c918..9188cee 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -17,9 +17,9 @@ do_install_append() {
     if test -n "${KERNEL_DEVICETREE}"; then
 	dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o devicetree ${KERNEL_DEVICETREE}
 	install -m 0644 devicetree ${D}/boot/devicetree-${KERNEL_VERSION}
-	install -d ${DEPLOY_DIR_IMAGE}
-	install -m 0644 devicetree ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.dtb
-	cd ${DEPLOY_DIR_IMAGE}
+	install -d ${DEPLOYDIR}
+	install -m 0644 devicetree ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.dtb
+	cd ${DEPLOYDIR}
 	rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
 	ln -sf ${KERNEL_IMAGE_BASE_NAME}.dtb ${KERNEL_IMAGE_SYMLINK_NAME}.dtb
     fi




