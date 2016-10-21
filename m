Return-Path: <bounce+05c21e.62d95b-openembedded-core=lists.openembedded.org@nathanrossi.com>
Received: from rs224.mailgun.us (rs224.mailgun.us [209.61.151.224])
	by mail.openembedded.org (Postfix) with ESMTP id 9939471D45
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 12:07:49 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=nathanrossi.com;
	q=dns/txt; 
	s=pic; t=1477051670; h=References: In-Reply-To: Message-Id: Date:
	Subject: Cc: To: From: Sender;
	bh=GqQpjS1nMcMaWPv9eYJYBUgquJNdo+lkSedEH2vVI+A=;
	b=HDzEZnrSizey6GWlte9p+jHLA6aTejxcddjL52BRX4Q5zh5ZPscuVu0YS9UvH+bJUurW5Sh0
	rz5npBi2xerr7STWbvj5FWexSawOt93lw6f4bdcHBrPUg4Tq41p9FdVJZRxfpZgAMtTc9dLf
	JlWjqcLFZiLF8oGNbqddiOyh0Gk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=nathanrossi.com; s=pic;
	q=dns; h=Sender: From: To: Cc: Subject: Date: Message-Id: In-Reply-To:
	References;
	b=Fkh7LvVO6l6/cTzXDEOBY/WYRz0iOXf1M7Zwn2BFQE9+hExHA6NKy/pPPnygxpYQ9YEOuI
	uEohz2WcqToyBaOVUUatkXBeStvDyS6Jjv6rh4af+MWISTFB/3g0W4RtcJjV/jXllRFVlgPh
	K4jtzGIovpl3qXqBGRFR+N8j/rd3E=
Sender: nathan@nathanrossi.com
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyI4NjhkNiIsICJvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIiwgIjYyZDk1YiJd
Received: from nathanbox.home.rossihq.com
	(CPE-1-121-165-196.qwl9.woo.bigpond.net.au [1.121.165.196])
	by mxa.mailgun.org with ESMTP id 580a050c.7f22f408da30-in1;
	Fri, 21 Oct 2016 12:07:40 -0000 (UTC)
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 22:07:28 +1000
Message-Id: <20161021120728.22639-3-nathan@nathanrossi.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161021120728.22639-1-nathan@nathanrossi.com>
References: <20161021120728.22639-1-nathan@nathanrossi.com>
Subject: [PATCH] kernel-fitimage.bbclass: Don't assume KERNEL_IMAGETYPE == fitImage
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
X-List-Received-Date: Fri, 21 Oct 2016 12:07:51 -0000

The name of the output image for a fitImage that contains a ramdisk
should match the same as for the fitImage that does not contain a
ramdisk. As such it should not be assumed that KERNEL_IMAGETYPE is
"fitImage". This change explicitly sets the name of the output
ramdisk/initramfs to start with fitImage as does the non-ramdisk output.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/kernel-fitimage.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 5c9e76b9ac..55529b161f 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -419,11 +419,11 @@ kernel_do_deploy_append() {
 
 		if [ -n "${INITRAMFS_IMAGE}" ]; then
 			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source file..."
-			its_initramfs_base_name="${KERNEL_IMAGETYPE}-its-${INITRAMFS_IMAGE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
-			its_initramfs_symlink_name=${KERNEL_IMAGETYPE}-its-${INITRAMFS_IMAGE}-${MACHINE}
+			its_initramfs_base_name="fitImage-its-${INITRAMFS_IMAGE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
+			its_initramfs_symlink_name=fitImage-its-${INITRAMFS_IMAGE}-${MACHINE}
 			install -m 0644 fit-image-${INITRAMFS_IMAGE}.its ${DEPLOYDIR}/${its_initramfs_base_name}.its
-			fit_initramfs_base_name="${KERNEL_IMAGETYPE}-${INITRAMFS_IMAGE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
-			fit_initramfs_symlink_name=${KERNEL_IMAGETYPE}-${INITRAMFS_IMAGE}-${MACHINE}
+			fit_initramfs_base_name="fitImage-${INITRAMFS_IMAGE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
+			fit_initramfs_symlink_name=fitImage-${INITRAMFS_IMAGE}-${MACHINE}
 			install -m 0644 arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} ${DEPLOYDIR}/${fit_initramfs_base_name}.bin
 		fi
 
-- 
2.9.3

