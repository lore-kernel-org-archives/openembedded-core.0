Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.39170.1615222141032515967
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 08:49:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DhlALGV+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id w203-20020a1c49d40000b029010c706d0642so8252653wma.0
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 08:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OVS7QANS6QTkgVZu/mV0AxYhplIIcLWkTDLPe/U/EH8=;
        b=DhlALGV+9q+RLlRiOUKRilanUeD4PnwjSMkYr2rRxd2ExrZeuk8eUSXjKjXd8aBH92
         v/AkSWEy0h+/DhTnhfP7x94i+kcpTiv6xZfXZoFHTQDCPFb8RdbsPFHA8KP+a6jymiDz
         sKMXEhZcwPzRORADmVAvOd6iTe1p+cDd4tWhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OVS7QANS6QTkgVZu/mV0AxYhplIIcLWkTDLPe/U/EH8=;
        b=NqsjmQW0U8TIlZA4oqlqKnWRPbcK2MFCFdj+pp6b5jxZUGN4zJqRob3jU+XRXgGbj8
         yKlcDbfj4uwpIsXYVVkR0nnJ1uX33p0NAaJo4m0yS6cmrj5Dr2Dk2HROo6704syJR0xc
         r5dJikJYTUS90Ac8VzSiLqeUwW0pXUuq27OXjQZhU/P3qcaWRP6rpZPFDfAfwppkAqBc
         MaDpolzm5qnpSX63vx6xmY13I6yBbh66mzMjnrgdm0LK4sDC6ZWrdxIwjlNrsO1LnkCK
         eqARyN5epRDyD7d1CJe3zYE2pGkefBrOO1ZcfG0Iq6loCL9ZRbaR6A+NcQJbossc90yN
         DLeQ==
X-Gm-Message-State: AOAM530RK3xB+kO8WVgixqmNfPDonr0XhvCfSrpBOaMGB971hIMxici6
	mB6tlmABD6CbNVbQLsNz6TpcBOI6anHQWA==
X-Google-Smtp-Source: ABdhPJyRknE97eZ1kYgd041yPd6GyPkl+bNad4t8X93DKzN1Gc1WHziYz6x1rUIUuUwFtG5D6ZN8xg==
X-Received: by 2002:a1c:9849:: with SMTP id a70mr23920556wme.48.1615222138878;
        Mon, 08 Mar 2021 08:48:58 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:3242:e265:217d:9509])
        by smtp.gmail.com with ESMTPSA id r7sm20220243wre.25.2021.03.08.08.48.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 08:48:58 -0800 (PST)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] build-appliance-image: Drop kernel module handling
Date: Mon,  8 Mar 2021 16:48:58 +0000
Message-Id: <20210308164858.2413350-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel-devsrc is a dependency of the image so we no longer need the symlink
creation code or the module-base inherit/dependency as it is included in
that recipe. The KERNEL_VERSION usage was broken anyway as the module
usage would have needed a:

do_image[depends] += "build-appliance-image:do_configure"

which wasn't present so it was indeterminate if KERNEL_VERSION was set
correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/images/build-appliance-image_15.0.0.bb | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
index 705ff63cf7f..2bb8d6da560 100644
--- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
+++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
@@ -22,7 +22,7 @@ APPEND += "rootfstype=ext4 quiet"
 DEPENDS = "zip-native python3-pip-native"
 IMAGE_FSTYPES = "wic.vmdk wic.vhd wic.vhdx"
 
-inherit core-image module-base setuptools3
+inherit core-image setuptools3
 
 SRCREV ?= "e56305dd709ae2af2da7a7599984b3ad18c4970f"
 SRC_URI = "git://git.yoctoproject.org/poky \
@@ -61,12 +61,6 @@ fakeroot do_populate_poky_src () {
 	# Place the README_VirtualBox_Toaster file in builders home folder.
 	cp ${WORKDIR}/README_VirtualBox_Toaster.txt ${IMAGE_ROOTFS}/home/builder/
 
-	# Create a symlink, needed for out-of-tree kernel modules build
-	if [ ! -e ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build ]; then
-		rm -f  ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build
-		lnr ${IMAGE_ROOTFS}${KERNEL_SRC_PATH} ${IMAGE_ROOTFS}/lib/modules/${KERNEL_VERSION}/build
-	fi
-
 	echo "INHERIT += \"rm_work\"" >> ${IMAGE_ROOTFS}/home/builder/poky/build/conf/auto.conf
 	echo "export LC_ALL=en_US.utf8" >> ${IMAGE_ROOTFS}/home/builder/.bashrc
 
-- 
2.27.0

