Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web11.21411.1600260899762370133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 05:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d9PtnZtQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id i22so10204813eja.5
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 05:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yI9I677c6Tc8rwkS3U4ymEvGTggxPXAeaxZmDvIuOYs=;
        b=d9PtnZtQcxceA4vi2Qkqwn48/8OyB2kYnMP4omkypqGiZz+e+k5dxCLPVKRzHsCeej
         NmpakRmG/nbS9UU2woQU+gsG8JH5gijiWXiclRLqPlK+fJ82hFz1eIM6k11C2HaNDhab
         OE4Yu10Gsd7ZvFcc6Ivu8pcP+/GJK7A1nArIZwumuFUsEMsso6/yUasLLACXnqO7gtd5
         foDHxLRpJXBMu9OVp7a72A8oUrgydx8SdWni3Xy/qg8WXv6NM790cQrC4SxLdsn2UaDV
         wqknoGdjVQ34jA/SPOcGq6LJmV0idM6+iRQfiSQ+EigX0tetVGub05e+x/dKbk7pBhnN
         miuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yI9I677c6Tc8rwkS3U4ymEvGTggxPXAeaxZmDvIuOYs=;
        b=siunWMCTLvCTP+TaAQqFJa1NQ2IV7DOuy40QVrJ6Jmdsnzb9WQubDaZPcYVanU4kM3
         AZ5lC/b1Z6/oTmr0GDAl9U27gmYa7V7G4gM53n2MG8Ke7d0awpdEVwbDJNEsV3S5+HiX
         hzcPlAXp9f2N69QfdO8F7xMqH6xRVpppQkTVrG0VubwyGjurvHF9YBxzicZg+Gx1HByJ
         FQjrFAKqj/mqFFDDN0LPkIgjpbqXmeRSU+0B/Jx6oIrFJRIu6Xal0uuf/n/wgCUg42Mm
         FnnUeAZJzt9JNBJIb1MeiwvdGa+l+TcOAX9b2kEqsapcRJEvncOVU3kk9uNDWFz9fUj2
         43mQ==
X-Gm-Message-State: AOAM533l8ikd8sbJ0GsIYnVEpST1wCzL3AA1ycflbraS+w3nJR3L4hQ1
	JNRskgG1jwwtN4W68XzAgan67DgRoB4=
X-Google-Smtp-Source: ABdhPJzTj1NqYfBw4w2dkyHmh2gbfwHGN4JYa8fWJtJ979uiqk9jG4IDTpTsX5Cbl8UXd2JOfCITpw==
X-Received: by 2002:a17:907:4037:: with SMTP id nk7mr24732951ejb.84.1600260897998;
        Wed, 16 Sep 2020 05:54:57 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id os15sm12599599ejb.61.2020.09.16.05.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 05:54:57 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 3/5] kernel.bbclass: eliminate (initramfs_)symlink_name variables
Date: Wed, 16 Sep 2020 14:54:47 +0200
Message-Id: <20200916125449.1564380-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200916125449.1564380-1-Martin.Jansa@gmail.com>
References: <20200916125449.1564380-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* they are used only once, we can use the value directly
* notice that .bin extension isn't part of the variable values

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/kernel.bbclass | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 10e734a19e..fbd2959341 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -718,8 +718,7 @@ kernel_do_deploy() {
 	for imageType in ${KERNEL_IMAGETYPES} ; do
 		base_name=$imageType-${KERNEL_IMAGE_NAME}
 		install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType $deployDir/$base_name.bin
-		symlink_name=$imageType-${KERNEL_IMAGE_LINK_NAME}
-		ln -sf $base_name.bin $deployDir/$symlink_name.bin
+		ln -sf $base_name.bin $deployDir/$imageType-${KERNEL_IMAGE_LINK_NAME}.bin
 		ln -sf $base_name.bin $deployDir/$imageType
 	done
 
@@ -742,9 +741,8 @@ kernel_do_deploy() {
 				continue
 			fi
 			initramfs_base_name=$imageType-${INITRAMFS_NAME}
-			initramfs_symlink_name=$imageType-${INITRAMFS_LINK_NAME}
 			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType.initramfs $deployDir/$initramfs_base_name.bin
-			ln -sf $initramfs_base_name.bin $deployDir/$initramfs_symlink_name.bin
+			ln -sf $initramfs_base_name.bin $deployDir/$imageType-${INITRAMFS_LINK_NAME}.bin
 		done
 	fi
 }
-- 
2.25.1

