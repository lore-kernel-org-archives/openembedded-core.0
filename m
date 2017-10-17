Return-Path: <vomegaz@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id CEBDE78306
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 16:54:29 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id i124so5107410wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 09:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=wdWN1Rt+BbxjUALTPnY3pVCDRy+g75cqUgnCicZw7oY=;
	b=msQ6c2znrduf/qkhhyb3KM2uX9EgQ2UoTDAikCaZw3HW/zXe5Nwn8rMbGZgCS6/35M
	NdpRSsdw+7sbUQByZFhOu8go3GTQw6vbK/D0P8knDb/wO+ES5ZBM0dg+NfZw1LkYmgzG
	396kynqgyLAAdpA0kUI+UvZsT5yb+Ehr11Z7SaXP98mPN1CmuKBeRwM5pqdjpNwOtWRw
	1VKupjFKtbrVYmEWYnZaVe+GpzRI3AkiD+VMGdWPzoHM0NFEIgpY0xpTF8JYJyKTUAc6
	ZKOfq24mR5x2q44Jf45BKVH3YtdYstbfo4b1RCMeBFLPdviiqdGJkhi9E9HTrYAPHEfy
	PLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=wdWN1Rt+BbxjUALTPnY3pVCDRy+g75cqUgnCicZw7oY=;
	b=rs7OP8kEf4rfo+cVGUkckp6aU96AdEUthad1x8ASOIXSmvlFbK/CO+P3REqm9LXJ0m
	eRp/AZV5EI0ku/av8buDuac1YV0b4bfaxkRzV+LxVwEZClvaj+VVxSKQLZOtaX+FfT0S
	0GcpQfZ0zY8VQWYtOeMfWONCQ2ceASJm7M9r1dpIMyLAfgFQ9jj4I1BxoxJcnMELmcX0
	pJUNv5PpzM6QlyRQButpY1HXMnj4q+SlaJqjw3ZC+mh+wzmAMZImvNSy8f8RtidyyYxs
	FbYuVAkkTar6uYy3BI1/QzbFPyFqo5HZslRUAoOD83lr4/mLvw8QTU60T209QaosVhRM
	bH8Q==
X-Gm-Message-State: AMCzsaX0ANKiVpGpKqx+yWt4h4I+7P8BLEMgdcTCTPZ6WHh+1cT/w3BH
	U0c3eUnO5SGkJQur+BUSRoAopR1k
X-Google-Smtp-Source: ABhQp+Qh0RikeAJU0mOHvHLTxWSFbkYr+Ff3cXzPrkd/oRFOlnNtPbAUm5pD3nOkJ+16cwk6vC/93w==
X-Received: by 10.28.60.68 with SMTP id j65mr3846405wma.16.1508259269870;
	Tue, 17 Oct 2017 09:54:29 -0700 (PDT)
Received: from sgxcmp483.sigfox.io ([217.114.201.133])
	by smtp.gmail.com with ESMTPSA id
	c37sm19317000wra.73.2017.10.17.09.54.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 17 Oct 2017 09:54:29 -0700 (PDT)
Sender: Thomas PERROT <vomegaz@gmail.com>
From: Thomas Perrot <thomas.perrot@tupi.fr>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Oct 2017 18:54:24 +0200
Message-Id: <20171017165424.22887-1-thomas.perrot@tupi.fr>
X-Mailer: git-send-email 2.13.6
Subject: [meta][pyro][PATCH] Fix some issues in the fitImage generation
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
X-List-Received-Date: Tue, 17 Oct 2017 16:54:30 -0000

- Bad image type replacement for aarch64
- Fix DTB path in fitimage.its
- Ignore fitImage type during the packaging of the initramfs

Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
---
 meta/classes/kernel-fitimage.bbclass | 6 +++++-
 meta/classes/kernel.bbclass          | 4 +++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 2630b47316..abbc309b09 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -7,8 +7,11 @@ python __anonymous () {
         depends = "%s u-boot-mkimage-native dtc-native" % depends
         d.setVar("DEPENDS", depends)
 
-        if d.getVar("UBOOT_ARCH") == "x86":
+        uarch = d.getVar("UBOOT_ARCH")
+        if uarch == "x86":
             replacementtype = "bzImage"
+        elif uarch == "arm64":
+            replacementtype = "Image"
         else:
             replacementtype = "zImage"
 
@@ -351,6 +354,7 @@ fitimage_assemble() {
 				DTB_PATH="arch/${ARCH}/boot/${DTB}"
 			fi
 
+			DTB=$(echo "${DTB}" | tr '/' '_')
 			DTBS="${DTBS} ${DTB}"
 			fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}
 		done
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index ce2cab65ae..a8b0d0a061 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -219,7 +219,9 @@ do_bundle_initramfs () {
 		# Backing up kernel image relies on its type(regular file or symbolic link)
 		tmp_path=""
 		for type in ${KERNEL_IMAGETYPES} ; do
-			if [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
+			if [ "$type" == "fitImage" ] ; then
+				continue
+			elif [ -h ${KERNEL_OUTPUT_DIR}/$type ] ; then
 				linkpath=`readlink -n ${KERNEL_OUTPUT_DIR}/$type`
 				realpath=`readlink -fn ${KERNEL_OUTPUT_DIR}/$type`
 				mv -f $realpath $realpath.bak
-- 
2.13.6


