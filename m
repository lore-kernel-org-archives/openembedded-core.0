Return-Path: <zboszor@pr.hu>
Received: from mail9.pr.hu (mail9.pr.hu [87.242.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 46F3771B99
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 09:06:30 +0000 (UTC)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <zboszor@pr.hu>) id 1iDPjL-0001NU-5Q
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Sep 2019 11:06:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=i4lR9K824mHuyU1SA0DVul/4Uy/WtGhkiJPNstwbAu0=;
	b=LfsUWnlZS3csclMTHLshSqSrfz
	+h+d35Kg0Ff+USp2TeCegjuzPTCsfEaMv4UGaD1zIeixzHoE3Vno3s1c4rwJcTs0FB8jDz0FD0daD
	NLgSODzOUE3q2iBurSj5zAQCxooNuv5teo+4YFUW+GqVdrGvRH8/Xn1AcSBFEx057FGVYwZIwcWj4
	6Tf3w+hxZhAH0vyJon1I4wJ+jxleW68lMdiVpAy/YbiQmlL9vbFMrlpncKY2sSLaFj/DDj1S+J6V6
	VEEolt29MVkdohggYEYwAUk2a56O0smgQvH9zgSNtVJrYj63qH7Siz29mba8lZ+7l//CSr0IaQ4s/
	Rplaq3JA==;
Received: from host-87-242-20-26.prtelecom.hu ([87.242.20.26]
	helo=zolilaptop.sicom.com) by mail.pr.hu with esmtpa (Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1iDPiT-0002bb-Hk; Thu, 26 Sep 2019 11:06:29 +0200
From: =?UTF-8?q?B=C3=B6sz=C3=B6rm=C3=A9nyi=20Zolt=C3=A1n?= <zboszor@pr.hu>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Sep 2019 11:05:32 +0200
Message-Id: <20190926090532.4131-1-zboszor@pr.hu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Score: -1.8 (-)
X-Scan-Signature: d715e2383c66dfab752a5ffb3bca881e
X-Spam-Tracer: backend.mail.pr.hu -1.8 20190926090629Z
Subject: [PATCH] classes/image-live.bbclass: Don't hardcode cpio.gz
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
X-List-Received-Date: Thu, 26 Sep 2019 09:06:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There's INITRAMFS_FSTYPES that can be set differently.

Signed-off-by: Böszörményi Zoltán <zboszor@pr.hu>
---

With the hardcoded initrd filename suffix but INITRAMFS_FSTYPES
set to cpio.lzma, this error occurs:

ERROR: sicom-pos-image-1.0-r0 do_bootimg: .../deploy/glibc/images/intel-core2-32/core-image-minimal-initramfs-intel-core2-32.cpio.lzma is invalid. initrd image creation failed.
ERROR: sicom-pos-image-1.0-r0 do_bootimg: Function failed: build_hddimg (log file is located at .../tmp-sicom-glibc/work/intel_core2_32-sicom-linux/sicom-pos-image/1.0-r0/temp/log.do_bootimg.32210)
ERROR: Logfile of failure stored in: .../tmp-sicom-glibc/work/intel_core2_32-sicom-linux/sicom-pos-image/1.0-r0/temp/log.do_bootimg.32210
ERROR: Task (.../layers/meta-sicom/images/sicom-pos-image.bb:do_bootimg) failed with exit code '1'

 meta/classes/image-live.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index af71be5093..54058b350d 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -37,7 +37,7 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
 LABELS_LIVE ?= "boot install"
 ROOT_LIVE ?= "root=/dev/ram0"
 INITRD_IMAGE_LIVE ?= "${MLPREFIX}core-image-minimal-initramfs"
-INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-${MACHINE}.cpio.gz"
+INITRD_LIVE ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE_LIVE}-${MACHINE}.${INITRAMFS_FSTYPES}"
 
 LIVE_ROOTFS_TYPE ?= "ext4"
 ROOTFS ?= "${IMGDEPLOYDIR}/${IMAGE_LINK_NAME}.${LIVE_ROOTFS_TYPE}"
-- 
2.21.0


