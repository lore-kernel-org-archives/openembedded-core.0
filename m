Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1REMZ3-0001Ig-Lf
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 16:47:18 +0200
Received: by gyc15 with SMTP id 15so82885gyc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 07:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=FpyqBM+pvhWXkFOv2c1R/OKt2NMaJqMFEy2uEriYebk=;
	b=CSG3yEFGXoSyAwoqyJLhXyvwHxBdPsG3Auj9sQY4uDMFV11dwRR+pleTlTchKIaVfw
	jU8FdylLwudNp3+SEr3Xjj8o/ZuB8BKXpbkwN4l4nNNlIFrNYpjA72n+TB+LDKYjvYam
	LP6ea4h0L5F5jxsmIS18Bj4RH+kdIl2Qk0tWw=
Received: by 10.100.103.20 with SMTP id a20mr788824anc.78.1318516893361;
	Thu, 13 Oct 2011 07:41:33 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id v20sm122509anv.17.2011.10.13.07.41.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 07:41:32 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 14:41:16 +0000
Message-Id: <e72fa431a383ecf1e234819301f4dbe4a3664a55.1318516840.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1318516840.git.otavio@ossystems.com.br>
References: <cover.1318516840.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1318516840.git.otavio@ossystems.com.br>
References: <cover.1318516840.git.otavio@ossystems.com.br>
Subject: [PATCH 1/4] image-live.bbclass: allow override of initrd image
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
X-List-Received-Date: Thu, 13 Oct 2011 14:47:18 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/image-live.bbclass |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index 1d184a1..e85ac1e 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -1,13 +1,14 @@
 
 AUTO_SYSLINUXCFG = "1"
-INITRD ?= "${DEPLOY_DIR_IMAGE}/core-image-minimal-initramfs-${MACHINE}.cpio.gz"
+INITRD_IMAGE ?= "core-image-minimal-initramfs"
+INITRD ?= "${DEPLOY_DIR_IMAGE}/${INITRD_IMAGE}-${MACHINE}.cpio.gz"
 APPEND += "root=/dev/ram0 "
 TIMEOUT = "10"
 LABELS += "boot install"
 
 ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
 
-do_bootimg[depends] += "core-image-minimal-initramfs:do_rootfs"
+do_bootimg[depends] += "${INITRD_IMAGE}:do_rootfs"
 do_bootimg[depends] += "${IMAGE_BASENAME}:do_rootfs"
 
 inherit bootimg
-- 
1.7.2.5



