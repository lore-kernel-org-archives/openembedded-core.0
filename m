Return-Path: <leon@sidebranch.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0D38B6086F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 21:57:00 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id k14-v6so17678024edr.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 14:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sidebranch-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=33fUlPFTDIB6iCy0Hvv1cRNDlaif59EMzP0eAKiKz5A=;
	b=pGA6+fINvpMdsbdPLk6+Ak+L/vg7LdpOUjPksO+nOrJy2qFetjKC7jtxCbz+2esx42
	G8ZIe8rvjlt7GGuYY12GfVjUgFEIFrt/YLsRcLGpFme6miADaF5OgQWzNQbeH5spOssE
	TAhd2lFkJ3FmYmaGlGuMYBe0jIITtI0EjxMxlyntUIcxJl/Qo9fvVhVrHON3k0bM2fPA
	zbXkgDWcjYWd2lhYo63GHMck23TBiyoVPZ61w+H/7OFIZv8jc+h23p17QqVD7O2V66/x
	NtSwStsIgZVlphotoJEQ6745xtVAp22wj8diwnTxxC4IETjUw6lZTD2b2RQ9qHNnHx5T
	WQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=33fUlPFTDIB6iCy0Hvv1cRNDlaif59EMzP0eAKiKz5A=;
	b=frXhzH01LnBomE9EFt9xru7FxsakTBxOWj6zXqv9TgnDu/P1PiciIqDos2w8W3WXLF
	TPtE/ooLI1nR6ibkqb4JSwmsAk481f2VsoJX00Vu5hMhVoXqv315iX/EUV2ML5eNUw31
	T1e4agnKSoQKXnAIE2OuR2qV/FtnwsNN7dIAkVCFlDvjcat3xTZzxfcWbQbjghHg56l9
	yn6S4TbJGIy8zYnIbwCbNdbORdNLlD+i05pbzvb/qKwJkTBWfvNqLoQeFckeCo0NrYcH
	fMGvYj1clAmKHE8E1TYMVFTjJFb6/mR5fIHW8BWSkNP99ldcC08W2LrP0tQKZa9vHloC
	3OrA==
X-Gm-Message-State: APzg51BLjPyeFGMY2PfLRS3xeD+uZqebyGfpKrAX6B26uQuV4vluaa9W
	bRXRgs7+wYE65p7/wKxPbuEEVB99vZAr0w==
X-Google-Smtp-Source: ANB0VdZYqAbkjng3a4pRlWvxrWivzroS+tezGH2Tu4bsXlRviKe0hz04JCZ0yEKbSPx3HOywBfATTw==
X-Received: by 2002:a50:a7a2:: with SMTP id
	i31-v6mr25697957edc.296.1536616621413; 
	Mon, 10 Sep 2018 14:57:01 -0700 (PDT)
Received: from localhost.localdomain ([145.130.96.189])
	by smtp.gmail.com with ESMTPSA id
	c28-v6sm10521658edc.52.2018.09.10.14.57.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 10 Sep 2018 14:57:00 -0700 (PDT)
From: Leon Woestenberg <leon@sidebranch.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Sep 2018 23:56:43 +0200
Message-Id: <1536616603-9502-1-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v3] kernel.bbclass: do not deploy fitImage; kernel-fitimage.bbclass does that.
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
X-List-Received-Date: Mon, 10 Sep 2018 21:57:01 -0000

kernel-fitimage.bbclass replaces an occurance of "fitImage" in
KERNEL_IMAGETYPE_FOR_MAKE by an image type that is buildable for the
architecture (such as zImage). The kernel-fitimage.bbclass packs that
image as sub-image in a flattened image tree image (fitImage) and
deploys this fitImage along with the image tree source file (.its).

kernel-fitimage.bbclass does not alter KERNEL_IMAGETYPES, which thus
also contains "fitImage", which kernel.bbclass will also deploy
redundantly with different naming.

The result is a dual deployment with slightly different naming,
each with a set of symlinks.

The solution chosen is to have fitImage deployment be handled by
kernel-fitimage.bbclass, and have kernel.bbclass ignore fitImage
types during deployment.

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 meta/classes/kernel.bbclass | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index b57832c..1f69091 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -669,8 +669,11 @@ kernel_do_deploy() {
 	fi
 
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-		base_name=${imageType}-${KERNEL_IMAGE_NAME}
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deployDir/${base_name}.bin
+		# kernel-fitimage class deploys fitImages, skip here
+		if [ "$imageType" != "fitImage" ]; then
+			base_name=${imageType}-${KERNEL_IMAGE_NAME}
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deployDir/${base_name}.bin
+		fi
 	done
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
 		mkdir -p ${D}/lib
@@ -687,10 +690,13 @@ kernel_do_deploy() {
 
 	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
 		for imageType in ${KERNEL_IMAGETYPES} ; do
-			initramfs_base_name=${imageType}-${INITRAMFS_NAME}
-			initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
-			install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${initramfs_base_name}.bin
-			ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
+			# kernel-fitimage class deploys fitImages, skip here
+			if [ "$imageType" != "fitImage" ]; then
+				initramfs_base_name=${imageType}-${INITRAMFS_NAME}
+				initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
+				install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${initramfs_base_name}.bin
+				ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
+			fi
 		done
 	fi
 }
-- 
2.7.4


