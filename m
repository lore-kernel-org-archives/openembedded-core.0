Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C019C780B5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 12:13:20 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id q124so7270706wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 05:13:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=j9W9iXL66ck+DPTfr4DNMURPVQEHc3dns3D6hP3h93s=;
	b=M93CDJIPMWsFBDV23i3VoGzgsGGUrrTJOWVmoI+bcCpnBxPegRYFE2cKbEh2oghGyy
	MD0WGt5X81esV5LE1eu/dQcG6n+4rXLM9kLdmYV/EK+PY1iqBtVpIQT8NnnsAU18fX7R
	HaWV5COrXhn2tBzmV2JXHTra309cXjXF2MdApns1r2f6GxtytWPLA29hld0BOwuq2sR1
	Vxjz1z5izlNQEnF2s3AfyIHdvnaqyMWdJAyCJyx40/C8EhW/vpI1X5dbR2Q/LPVM4MT/
	KNOESSp3LsFgeh2UhCuM6HNCymQba+6tqQDA1faKEdFMalndUj6PR+PlwyNEeQ99by2/
	P/gA==
X-Gm-Message-State: AMCzsaX+KbPzH0nMfIZGpSvJGmuvFohi5tIBROwCLZsnVU6q+XERDH4g
	PKEHHZuZrcHmhWmqG1RSqIrBAvdW
X-Google-Smtp-Source: AOwi7QB2KTjIctr8VDJVe697McjQ9cpXpZmXgI41dpRSIlVAyvXug5xYElRrCxt5LGnYmy09fr54yA==
X-Received: by 10.28.183.67 with SMTP id h64mr1577617wmf.76.1507292001265;
	Fri, 06 Oct 2017 05:13:21 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id r15sm994045wrc.30.2017.10.06.05.13.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 05:13:20 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Oct 2017 13:12:52 +0100
Message-Id: <20171006121259.5817-11-git@andred.net>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006121259.5817-1-git@andred.net>
References: <20171006121259.5817-1-git@andred.net>
MIME-Version: 1.0
Subject: [pyro][PATCH 10/17] kernel-uimage.bbclass: Fix up generation of uImage from vmlinux
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
X-List-Received-Date: Fri, 06 Oct 2017 12:13:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Nathan Rossi <nathan@nathanrossi.com>

Fix up the generation of uImage from vmlinux when KEEPUIMAGE != 'yes'.
This fixes up the working directory that do_uboot_mkimage is run from,
such that it is run from the ${B} directory to access built artefacts.

Simplify the logic in the task so that the parse step either adds the
task or not if the conditions are met. This reduces the need for the
task to run in cases when it is not used. The task is also changed to
depend on the kernel_link_images task as arch/<arch>/boot/* is not
available until after kernel_link_images in certain cases (e.g.
vmlinux/uImage only KERNEL_IMAGETYPES).

Fix up the use of ${S}/vmlinux when pulling the entry symbols
address so that it accesses the vmlinux in ${B}.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>

(cherry picked from commit e0b4f018d1c2a65e66c81e5be1da8894e9a6c132)
Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/classes/kernel-uimage.bbclass | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
index 19c6ade507..7c026abf0b 100644
--- a/meta/classes/kernel-uimage.bbclass
+++ b/meta/classes/kernel-uimage.bbclass
@@ -15,23 +15,21 @@ python __anonymous () {
             typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE") or ""
             if "uImage" in typeformake.split():
                 d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('uImage', 'vmlinux'))
+
+            # Enable building of uImage with mkimage
+            bb.build.addtask('do_uboot_mkimage', 'do_install', 'do_kernel_link_images', d)
 }
 
+do_uboot_mkimage[dirs] += "${B}"
 do_uboot_mkimage() {
-	if echo "${KERNEL_IMAGETYPES}" | grep -wq "uImage"; then
-		if test "x${KEEPUIMAGE}" != "xyes" ; then
-			uboot_prep_kimage
-
-			ENTRYPOINT=${UBOOT_ENTRYPOINT}
-			if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
-				ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
-					awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
-			fi
+	uboot_prep_kimage
 
-			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
-			rm -f linux.bin
-		fi
+	ENTRYPOINT=${UBOOT_ENTRYPOINT}
+	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
+		ENTRYPOINT=`${HOST_PREFIX}nm ${B}/vmlinux | \
+			awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
 	fi
-}
 
-addtask uboot_mkimage before do_install after do_compile
+	uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin ${B}/arch/${ARCH}/boot/uImage
+	rm -f linux.bin
+}
-- 
2.14.2


