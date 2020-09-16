Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.21728.1600260898725917455
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 05:54:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mxsiqUGg;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id z23so10132511ejr.13
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 05:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9uLV26Ty2lubmoaqFIPtxRugmHXSZTmZ9tgJvxptw5c=;
        b=mxsiqUGga99Az1781gByv8dqIgcv0y5X1rg0V4Ci+6hiOdPdCLv+bwCGo2RICix8Le
         QPlGoHcycR4w7S5qTidm+uvZ6JE5FKYcznmG2pJGKuxd83+hDk4t6COYUjNIZkeWCJQS
         PhbKSrc/Ou3t9PvNAOciAGJR7V0fWcqVXg3LpeSuMXVqu1eRv4FKT78HQkoLVeyD8qzV
         Gydg6TTzmx/77B562IMoeOnJF9FexQIXfX3qJ7stu1qk5GnaaEETeX94Sr2rjCWXBUgp
         Nti7w6VnljzK4TKzEJ32cAKgag55u6zH98X6zDr81hfbH2NT+bgNaUqxAuL3c/wv3sOe
         E0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9uLV26Ty2lubmoaqFIPtxRugmHXSZTmZ9tgJvxptw5c=;
        b=UwQay9B6LZQAMPP/0IK6yPMSSYp7OWfJeFo3Blfmdx6/zoDuPsHLAM3dWB54SPgrFV
         8jnighCJlBzMOpznSQuY29zCRLT+0VBOfH3+YDeQTZK75mrHL6vxzG0a5dDrfUAGb6R5
         nrkkBWoba+X68v+pFcSAWl7S1+HPIYv2bi2Vc6ldhMHV+P5u3gdvkeHlVbARXYz3u7cL
         hx6NALiFV5PWkga7xnctyimMO9mpxUqx8sKSuE5VzMLBJlN7YbEZzAESRgZW034tMr0n
         9fL/X0pQDW99Wl25ZnDMiXqyBgSZZePEOHbnw/YxXGfGjRm/tjPh7ueHuwy+BQJcvm/q
         oBSw==
X-Gm-Message-State: AOAM531tsci4FEGnz3MTk2LOLKO+2CHfwrmXpHk4W0rpu0wEQ+UOOkj8
	7vYC9r2cXd0u9jOYTNBTZpTOVfzRW+Q=
X-Google-Smtp-Source: ABdhPJz0gDLWa/JX7jSrhw6uZiqgf9vEeHXhrBiBIgiM3HnEBm/9YEeuLmOYxFwPoRzwL0ALxW0MHw==
X-Received: by 2002:a17:906:a947:: with SMTP id hh7mr24230962ejb.126.1600260896827;
        Wed, 16 Sep 2020 05:54:56 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id bm2sm14166575edb.30.2020.09.16.05.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 05:54:56 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 2/5] kernel.bbclass: use bash variables like imageType, base_name without {}
Date: Wed, 16 Sep 2020 14:54:46 +0200
Message-Id: <20200916125449.1564380-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200916125449.1564380-1-Martin.Jansa@gmail.com>
References: <20200916125449.1564380-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* just to make sure it looks like bash variable not bitbake variable in
  run.do_* scripts

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 14c22da306..10e734a19e 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -407,7 +407,7 @@ kernel_do_install() {
 	install -d ${D}/${KERNEL_IMAGEDEST}
 	install -d ${D}/boot
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
+		install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType ${D}/${KERNEL_IMAGEDEST}/$imageType-${KERNEL_VERSION}
 	done
 	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
 	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
@@ -716,11 +716,11 @@ kernel_do_deploy() {
 	fi
 
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-		base_name=${imageType}-${KERNEL_IMAGE_NAME}
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} $deployDir/${base_name}.bin
-		symlink_name=${imageType}-${KERNEL_IMAGE_LINK_NAME}
-		ln -sf ${base_name}.bin $deployDir/${symlink_name}.bin
-		ln -sf ${base_name}.bin $deployDir/${imageType}
+		base_name=$imageType-${KERNEL_IMAGE_NAME}
+		install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$base_name.bin
+		symlink_name=$imageType-${KERNEL_IMAGE_LINK_NAME}
+		ln -sf $base_name.bin $deployDir/$symlink_name.bin
+		ln -sf $base_name.bin $deployDir/$imageType
 	done
 
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
@@ -741,10 +741,10 @@ kernel_do_deploy() {
 			if [ "$imageType" = "fitImage" ] ; then
 				continue
 			fi
-			initramfs_base_name=${imageType}-${INITRAMFS_NAME}
-			initramfs_symlink_name=${imageType}-${INITRAMFS_LINK_NAME}
-			install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs $deployDir/${initramfs_base_name}.bin
-			ln -sf ${initramfs_base_name}.bin $deployDir/${initramfs_symlink_name}.bin
+			initramfs_base_name=$imageType-${INITRAMFS_NAME}
+			initramfs_symlink_name=$imageType-${INITRAMFS_LINK_NAME}
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.initramfs $deployDir/$initramfs_base_name.bin
+			ln -sf $initramfs_base_name.bin $deployDir/$initramfs_symlink_name.bin
 		done
 	fi
 }
-- 
2.25.1

