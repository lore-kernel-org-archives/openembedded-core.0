Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web11.21412.1600260900783094153
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 05:55:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HoDqUNmk;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id w1so6191135edr.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 05:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tLj6l8uhaLQ7fVJzxaHj5i1/cMuZLa0VyDcMU4REO6o=;
        b=HoDqUNmkZQ9Z/avcLGxysI6VLReR6h7zgb3QnqpAoJsFc66as8imHP6b3ZFP7ZU1je
         KRKOLSaMyjVqvda+9wFbp9IeO7DSTDASQ9hwFBHp6H0DjMkaTbsHCp6/B/6UTWL/l5rv
         ETQVZPSIO1WN+6EGJzAhReI3MD9O03bv7ICBuQNb+twfy/k6JtbOW9XS6fZ8MKUOx+oT
         JSQRjHpKZ66xr4+sH/vXCg4IGXtwWp8fLiAmUnnF9wMzIJq3LXsriKPLFVyLnbK0c8ht
         fvJajn5pZKtWjPYfqcnkw8iR5zLPxpAtBGdpsSBZjptARmCuOVPUgJpBQ5JjfPjaciYF
         MSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tLj6l8uhaLQ7fVJzxaHj5i1/cMuZLa0VyDcMU4REO6o=;
        b=BSMEXlgqxG8edA0BTAb4UKXfd8JSLOhCeE5Pw84SDEfMKKP8CIVwHJet1GgddckQce
         62fdpZBFs3JAF2+CtoLJYSn3Zm+d6Pg98XuCkcvNHpb1HpPT0nc2Z+tKXnx3JqFf6Nw8
         4OZ6swjsNZ0/XELq/AxpEUP3iJxIMPuazml41Gj1RP0tYF/nPyk3AP3b6EM7R3vLuV2W
         20KhHVmBobT3X+JN7H2PvcEDE73dFZKXhy5IerbWt6CQ/syM9uJ9lQdVu47v8gFNhqGe
         DNViOjZFsqfl016Agr7osnsH3p4K4/yF6GvPuHV50E5L7DUPmvIL+vZLh4+4Y84BmvYW
         ENww==
X-Gm-Message-State: AOAM531e2b7Jl2uX1pmdvwZfc0sFJLzJwicrXqI2nnMD5Fvb3GQJftwT
	K0w5ZSao9fLWRF2wdcToimpuHXpE1sg=
X-Google-Smtp-Source: ABdhPJxTIAVUg6JqZTgNJU53KeMPlNrTN2Fj/3DjoNAI9ueR5go8nVRSINCHeqtYif1eSLpsTmhUsw==
X-Received: by 2002:a50:e3c4:: with SMTP id c4mr28262904edm.90.1600260899007;
        Wed, 16 Sep 2020 05:54:59 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id v17sm12736044ejj.55.2020.09.16.05.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 05:54:58 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 4/5] kernel.bbclass: use camelCase notation for bash variables in do_deploy
Date: Wed, 16 Sep 2020 14:54:48 +0200
Message-Id: <20200916125449.1564380-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200916125449.1564380-1-Martin.Jansa@gmail.com>
References: <20200916125449.1564380-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* to match other variables there like deployDir imageType

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index fbd2959341..48135b3d41 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -716,10 +716,10 @@ kernel_do_deploy() {
 	fi
 
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-		base_name=$imageType-${KERNEL_IMAGE_NAME}
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$base_name.bin
-		ln -sf $base_name.bin $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}.bin
-		ln -sf $base_name.bin $deployDir/$imageType
+		baseName=$imageType-${KERNEL_IMAGE_NAME}
+		install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$baseName.bin
+		ln -sf $baseName.bin $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}.bin
+		ln -sf $baseName.bin $deployDir/$imageType
 	done
 
 	if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
@@ -740,9 +740,9 @@ kernel_do_deploy() {
 			if [ "$imageType" = "fitImage" ] ; then
 				continue
 			fi
-			initramfs_base_name=$imageType-${INITRAMFS_NAME}
-			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.initramfs $deployDir/$initramfs_base_name.bin
-			ln -sf $initramfs_base_name.bin $deployDir/$imageType-${INITRAMFS_LINK_NAME}.bin
+			initramfsBaseName=$imageType-${INITRAMFS_NAME}
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.initramfs $deployDir/$initramfsBaseName.bin
+			ln -sf $initramfsBaseName.bin $deployDir/$imageType-${INITRAMFS_LINK_NAME}.bin
 		done
 	fi
 }
-- 
2.25.1

