Return-Path: <hayashi.kunihiko@socionext.com>
X-Greylist: delayed 596 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 30 Mar 2017 01:08:58 UTC
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
	by mail.openembedded.org (Postfix) with ESMTP id 20EA560017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 01:08:58 +0000 (UTC)
Received: from unknown (HELO kinkan-ex.css.socionext.com) ([172.31.9.52])
	by mx.socionext.com with ESMTP; 30 Mar 2017 09:59:03 +0900
Received: from mail.mfilter.local (unknown [10.213.24.61])
	by kinkan-ex.css.socionext.com (Postfix) with ESMTP id 65574180B90;
	Thu, 30 Mar 2017 09:59:02 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP;
	Thu, 30 Mar 2017 09:59:02 +0900
Received: from plum.e01.socionext.com (unknown [10.213.132.32])
	by kinkan.css.socionext.com (Postfix) with ESMTP id 0CB6F1A17B5;
	Thu, 30 Mar 2017 09:59:02 +0900 (JST)
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 09:57:23 +0900
Message-Id: <1490835443-23652-1-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
Cc: Jassi Brar <jaswinder.singh@linaro.org>, masami.hiramatsu@linaro.org
Subject: [PATCH] kernel.bbclass: Use the correct path of kernel build image file except for vmlinux
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
X-List-Received-Date: Thu, 30 Mar 2017 01:08:59 -0000

Use the correct path of kernel build image file except for vmlinux when
producing gzipped kernel image.

The kernel_do_compile() function produces the gzipped kernel
image from the original kernel image when an image types included in
KERNEL_IMAGETYPES has a suffix .gz.

Although the original kernel image file is usually built on the
directory arch/${ARCH}/boot/ except for vmlinux, the name of image types
included in KERNEL_IMAGETYPES doesn't have a path of
'arch/${ARCH}/boot', then bitbake fails to produce the gzipped kernel
image which type has a suffix .gz.

This fixes above failure by using 'arch/${ARCH}/boot/' prefix for image
path unless ${typeformake} is "vmlinux".

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Signed-off-by: Jassi Brar <jaswinder.singh@linaro.org>
---
 meta/classes/kernel.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 244087a..5e26965 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -268,7 +268,11 @@ kernel_do_compile() {
 		for type in ${KERNEL_IMAGETYPES} ; do
 			if test "${typeformake}.gz" = "${type}"; then
 				mkdir -p "${KERNEL_OUTPUT_DIR}"
-				gzip -9c < "${typeformake}" > "${KERNEL_OUTPUT_DIR}/${type}"
+				if test x${typeformake} = x"vmlinux"; then
+					gzip -9c < "${typeformake}" > "${KERNEL_OUTPUT_DIR}/${type}"
+				else
+					gzip -9c < "arch/${ARCH}/boot/${typeformake}" > "${KERNEL_OUTPUT_DIR}/${type}"
+				fi
 				break;
 			fi
 		done
-- 
2.7.4


