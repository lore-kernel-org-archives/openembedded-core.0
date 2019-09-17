Return-Path: <dbaryshkov@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2F8287F6D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 15:36:21 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id b24so3724462wmj.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2019 08:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=9srYr7IT3/X2qSU5HbXhcEx4KPCdvcb4hDihSlUdWII=;
	b=X4Coy1EA3PXq2WOZDIJQCOlB74svAyPndzMMwKu2+1dOEEQ3beKAdKI5IKopX1Zuyu
	UIjj1eVk0f/4qZa9Uf5uoLNY4SjqVqzCqeX9p9BjeVvhnb2k5V+Gr8ZtnRQDxP/1dfJD
	054BgWq9F0dq34+ALJz+nUCO5aW2yr6mlwTElndJm8LKdC2PeL3gDFAs45MdJvGPxGqb
	1ltg2ntFe9aDR1IYosXVHZJpgfK+7ZM9s9mHnopvc+AKGxYiY76/vj+okhocx/Cuy11P
	9Ec7zoF42pC9muqgtYtyKJSlCLHxMzRyuQuoQwjaieIk2NpHJ2aI/i7p6AG8/S6NyWck
	qcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=9srYr7IT3/X2qSU5HbXhcEx4KPCdvcb4hDihSlUdWII=;
	b=dE3SMNkd6I5zhjjiLsQfR2jTEOJiYebu6ykVmExAAM9OC+QnK4R9UBULJwKjnq6mia
	4MwuxqFvGQxowahTQEmYEFc64I52OtsmMQ1Y4ZpE0Qat4+WZwOrTlJEGB1618JDco60K
	VWCM+N+wVboProQboGxRDCKubCAcw9Hj/PP/ORKRxQBtnw749oEG7ezFSAlYmVSsgw8S
	a20GUqIsd54bRozusiOPipvHn8nenR33vwZ0cv4DmSVKzOSwl0sZY5Xxyh+yA4nV9xhp
	/s75J1h8pnrFM/wYJvL8urkIlbA9b1iNsHAdN0awwx789a5MdNF4rIeUgL36l5zICyxf
	qpGg==
X-Gm-Message-State: APjAAAWsMtnHCrRKGYnPnBac96HIN1nPNEq3tg57ZapTa1eQg/hNarT1
	nOD0DjEjJ112tis0c33AChLfjATv
X-Google-Smtp-Source: APXvYqyxn7kiA4ZWUJ9DW1uKI0bQxRxonnm89GlkN2fHfzpwiobxgBqFbVroDTMG5l1R93wF14ZBpw==
X-Received: by 2002:a7b:c182:: with SMTP id y2mr4116377wmi.156.1568734582242; 
	Tue, 17 Sep 2019 08:36:22 -0700 (PDT)
Received: from lothlann.rup.mentorg.com (nat-min.mentorg.com. [139.181.32.34])
	by smtp.gmail.com with ESMTPSA id
	o9sm4605245wrh.46.2019.09.17.08.36.20
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 17 Sep 2019 08:36:21 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Sep 2019 18:36:09 +0300
Message-Id: <20190917153613.4954-5-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190917153613.4954-1-dbaryshkov@gmail.com>
References: <20190917153613.4954-1-dbaryshkov@gmail.com>
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH v3 5/9] systemd-boot: switch to uefi.conf
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
X-List-Received-Date: Tue, 17 Sep 2019 15:36:22 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Use variables from uefi.conf instead of hardcoding them in the recipe.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/recipes-core/systemd/systemd-boot_243.bb | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_243.bb b/meta/recipes-core/systemd/systemd-boot_243.bb
index 56a25c35babc..8e5d00bbec91 100644
--- a/meta/recipes-core/systemd/systemd-boot_243.bb
+++ b/meta/recipes-core/systemd/systemd-boot_243.bb
@@ -1,6 +1,8 @@
 require systemd.inc
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemd:"
 
+require conf/uefi.conf
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


