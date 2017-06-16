Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 38A5F7845A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:38:56 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id u62so381135pgb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 05:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=TraOGVqJPLRWchRrPOj+FayXMBZR08OzB7BhtjjJQOc=;
	b=OCbUH6bRjZ95VdzXJlzG7CDOztSiLl05rgAmNhbSIkvgwoUsgg/F8JZS5SYZM16+rc
	qgqge8HvBv3djvu576/YArWoqejGBLgBXYEAWJzq1MlMqrEAOTW4KBdq2UesPys9EnI4
	D3SQW+SxBpJ7vDSvXsY7RXOHaA7d+a5arBbnb1uZ9zF2zHdrw6ahyu45sZJOiM1Cy7oE
	IB6+EZdNJrV0oq7GrTntgj+VgXgIvOSroFd1RCSwYFddizpmfQqfUCAPbGK4u/ZNPtzN
	TNGBiDqW1k5Ax4Ca5kxDksCtsmkZpu4kpA5rymAc1gyl7l728nxZ1nNAY4z1P0vKrZ5A
	yq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject:mime-version
	:content-transfer-encoding;
	bh=TraOGVqJPLRWchRrPOj+FayXMBZR08OzB7BhtjjJQOc=;
	b=khWFJg/q+4B3Mc5prVJIwb7d4QQOrPmJBZxWDh82bMFY9Ia/Tu2QsKLsbeKXY7LrBm
	FSd+4mEP2LL+M/h2oYyyoUEP7BLpWI56C1znEwqAqUCL7rL7eo9WfOwXX91RO1Tm1Pz6
	tk2xvW9QcD0wESUcn3gTwsI91WVkX86MUbqM9pvLOWp5Oly+ZKkK+Mwz95lh6MFi+HlZ
	RCYdr2xOXC0CPUOmJ1xFK83u/0zMG6Og6YvV2hi0um6rEuHJadlMpq77BkUG027SzWlM
	uTubGb/YwtiLXSIkhBExfZ0UPJItGmkUBvjJ+sN2LBGzQM3IYETpIuojx9DzlyLd9Nmn
	F+RQ==
X-Gm-Message-State: AKS2vOxBywozWrWlkAU5JFd1nkHRD+HqVLZqZgE8PxrtgQ+VS2NfN+L1
	cLLhoHWv8Z2wcdzM0ByRZQ==
X-Received: by 10.99.149.14 with SMTP id p14mr11242382pgd.148.1497616738220;
	Fri, 16 Jun 2017 05:38:58 -0700 (PDT)
Received: from [127.0.1.1] (CPE-123-211-74-254.lnse4.cha.bigpond.net.au.
	[123.211.74.254]) by smtp.gmail.com with ESMTPSA id
	189sm4441828pgi.66.2017.06.16.05.38.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Jun 2017 05:38:57 -0700 (PDT)
Date: Fri, 16 Jun 2017 22:38:49 +1000
Message-Id: <20170616123849.32150-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH] kernel-uimage.bbclass: Fix up generation of uImage from vmlinux
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
X-List-Received-Date: Fri, 16 Jun 2017 12:38:57 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

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
2.11.0


