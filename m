Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by mail.openembedded.org (Postfix) with ESMTP id C2C537E8B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 13:17:33 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id d5so7172073lja.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2019 06:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=lAXZ3xq1zRNovZQu4hqbqc+RfpdrG8sFWXWso9GOhtI=;
	b=i1qtN4NhF6aaMrh9VaKCQWkhDN3ZDJBXb1qihz/LYzY/um2T0xUa/jQ8iYcxk2QJDO
	ZqCAUsMNHizgJ/oGVHmY2nVl+xrxPkQDzYGrke3OD+0Uz0nHviWATCtaTRvyNerBXMeR
	MIBeRV24YVXzZSxce/o05F1dI2MILE7vHGxfAjwEdRHlVuoCl4jnp2p2Dum5F2jpijvd
	SguaZFi0tzjx0ov1+oHAhF1zKot4cjI2SiNpONw2V+Fp0WC5XdufLtLw/BZCKs0OBVuq
	rsdiVoKDGZnmeAIEuNoUlEBkcRhQ55wNW9mjMZkHNgS8LG4cKYoWUk+j39IgW353Cy77
	A97A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lAXZ3xq1zRNovZQu4hqbqc+RfpdrG8sFWXWso9GOhtI=;
	b=jh6VJYjZgqA+xbVJEBjSEFQ93D+gE6LFttQISk/os2fsm7nW5FeC81SYoKZImHy4iC
	eKlrCb3qBvZLeBQq+Bqqa3nCCzQYwpfyr5gnxlquvj+PATSS13gtDQVxAWmmxx2k8Qt5
	VtOop2BjP3tt4zpujaVNM0vZY3SueKARyhQDQbTJUn12MgMi0v8PrWNbuNFSucgEysBV
	4r7Zs5+wEWuCg0oZUcTjMJ8UMj9BkhiUvJlb+zZf13unKhMqTZvwpi8Tlsm+6+/EWyAj
	l4XJL+7KZ+tdEH3CwIsaqhh36wxTJ1WGua3OqiYuK8jasOA9Tn33lRciJ/mgGRKqwRGV
	vRGA==
X-Gm-Message-State: APjAAAXFbknxHUCPmuNd6Bb9TnG9AETQiHtWOQe132lrrs99p+wdHZof
	19Ua+UaPOfzYOFh9wcQYVUygL8px
X-Google-Smtp-Source: APXvYqxu4+6H9ikCV2s5lHZtiDqbeOUrizqa5mzSyxk2NMrm8AZLKylTy711WUJ2KT9RQ9ToAHBsrw==
X-Received: by 2002:a2e:3618:: with SMTP id d24mr2187775lja.179.1568812653765; 
	Wed, 18 Sep 2019 06:17:33 -0700 (PDT)
Received: from localhost.localdomain ([94.25.229.37])
	by smtp.gmail.com with ESMTPSA id u10sm999466lfk.34.2019.09.18.06.17.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 06:17:32 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Sep 2019 16:12:45 +0300
Message-Id: <20190918131247.26488-5-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190918131247.26488-1-dbaryshkov@gmail.com>
References: <20190918131247.26488-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v3 5/7] systemd-boot: switch to image-uefi.conf
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
X-List-Received-Date: Wed, 18 Sep 2019 13:17:34 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Use variables from image-uefi.conf instead of hardcoding them in the recipe.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/recipes-core/systemd/systemd-boot_243.bb | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_243.bb b/meta/recipes-core/systemd/systemd-boot_243.bb
index 56a25c35babc..515abc289bef 100644
--- a/meta/recipes-core/systemd/systemd-boot_243.bb
+++ b/meta/recipes-core/systemd/systemd-boot_243.bb
@@ -1,6 +1,8 @@
 require systemd.inc
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
 
+require conf/image-uefi.conf
+
 DEPENDS = "intltool-native libcap util-linux gnu-efi gperf-native"
 
 # NOTE: These three patches are in theory not needed, but we haven't
@@ -33,16 +35,13 @@ python __anonymous () {
     import re
     target = d.getVar('TARGET_ARCH')
     prefix = "" if d.getVar('EFI_PROVIDER') == "systemd-boot" else "systemd-"
-    if target == "x86_64":
-        systemdimage = prefix + "bootx64.efi"
-    else:
-        systemdimage = prefix + "bootia32.efi"
+    systemdimage = prefix + d.getVar("EFI_BOOT_IMAGE")
     d.setVar("SYSTEMD_BOOT_IMAGE", systemdimage)
     prefix = "systemd-" if prefix == "" else ""
     d.setVar("SYSTEMD_BOOT_IMAGE_PREFIX", prefix)
 }
 
-FILES_${PN} = "/boot/EFI/BOOT/${SYSTEMD_BOOT_IMAGE}"
+FILES_${PN} = "${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}"
 
 RDEPENDS_${PN} += "virtual/systemd-bootconf"
 
@@ -61,10 +60,8 @@ do_compile() {
 }
 
 do_install() {
-	install -d ${D}/boot
-	install -d ${D}/boot/EFI
-	install -d ${D}/boot/EFI/BOOT
-	install ${B}/src/boot/efi/systemd-boot*.efi ${D}/boot/EFI/BOOT/${SYSTEMD_BOOT_IMAGE}
+	install -d ${D}${EFI_FILES_PATH}
+	install ${B}/src/boot/efi/systemd-boot*.efi ${D}${EFI_FILES_PATH}/${SYSTEMD_BOOT_IMAGE}
 }
 
 do_deploy () {
-- 
2.23.0


