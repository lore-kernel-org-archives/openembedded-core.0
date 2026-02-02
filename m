Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C3BE7DF1A
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 17:08:19 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57906.1770052090528147308
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Feb 2026 09:08:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZMuPgNUw;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8c9f6b78ca4so425285685a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 09:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770052089; x=1770656889; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTfTYoHocKI09OXRkp1x5HUyp1pHMtWG2Rk6iKiyZFo=;
        b=ZMuPgNUwli9nqIuqpZt3XNXyb6k6EnFHgBWw7PW+Fq6FNS/fQ7lQPNcPfMiZUnzA9f
         hnhWrUL7oh/kAto+PQIfQM6YcFhJnX1pdtr3uBgUETxyULQHIv0f8/3CNX/Av4bKKhl/
         xXZQmEijyda+mRVKgs6XAzIuh7zlHg9q7TiwxCsoGKk/gAHrD+uecXV1mAsAiAcvGM8o
         mWTte3MnUOuc9FVvYrCGzN+nCNGJefCIyO6ebYRe9AQI/eEuWEiVNgCiM3/rm7fhGSMQ
         b74IOBIr6RD+1pfj9r4BDUlyf3yOuq5Gy5mbW+hK1jNAMwi1WWoNo7t/AxA7BJJSDUdV
         L6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770052089; x=1770656889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kTfTYoHocKI09OXRkp1x5HUyp1pHMtWG2Rk6iKiyZFo=;
        b=Nuhl/B+gNtUHlgS3CJajG8XQQRctBIq3sbJqVjLpYphO8Tz/fCsX8UxuUfdL2KhHqc
         70QJi3I7oSgH4AlTDXYwbT5RSD+uiPf+eL6JKyiQp6pWV9i7Bh3dntYTuS5FtxpNuzSY
         tZhc3C8OwXhRcaJWrjjSKnzWKTnjp26rgrcTobbW0+wNlUBA/Tl02MjqYeXsaC88lcHa
         uLKejsDDf2jdd/J4dyLE+iFdAMPwgb+rfda1V4kmoqLEKDUdJk1N38/2GTFsKdzX9C8I
         Y+GaSWyBe8WxsxowrlM4GeBj8qsK/zIZPBdXXaMuurz4lpWCcNEls3iKjpZGlshznFnu
         5sGw==
X-Gm-Message-State: AOJu0Yxc1MYXjJivma8DYgUxYzdSgVvECkyD+UX8loZQaIKE+tHr4sPW
	703l7oXUPFDJMVETrLSvXnjKtVktI+IOVDlyfNKWQi+d6ttRJjEErxoWT7syVA==
X-Gm-Gg: AZuq6aL1pxPOpXkH8zuYYk893FmG8cQrABmcalG2HXx+0GXP9FESiepaFQaj6lIlzg3
	eSpd0G+Ap+v5DyorXIqW2hqf+o3kL2MMCM8F0/MIGCk+NL02pep8o+zfWhaw++PXSV0+205X1Ed
	DolyBkMnb6ufctPC+08WwSp5I8LMVia/mtwVh6F/oslO6MMLsR4tuE6OgE0H+BlJg6ejF5JOR+q
	LNe9tiRYx21vKK2QItesuZIAMMBzqMaxIi5zRyF5TY8KKFSiKBdn6nIg5lKhTeA7XStz2HFI08+
	8Sj5O0AyI/vFhqatP/ctsAsukzRuIf42Bly+P7L4S9wf//c0lR3/8sVwQ7MY2bm+Pvg89r0zHoZ
	T8mzU0acN5rXGa6q+d/jelvSqwn2fyIKDzHYGqy2aMg0TkdcNrPt+M7L7LkyFudFv7nXeCYrGMC
	8Q9iAs5yRep1mLV7jFFnnujG2nKpZ4hmAuGO7+CcTLn6Ri5x0LnMQ2zTWVIVACTrUG
X-Received: by 2002:a05:620a:404d:b0:8c6:a84e:2a2d with SMTP id af79cd13be357-8c9eb23d652mr1601932385a.31.1770052088529;
        Mon, 02 Feb 2026 09:08:08 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ca02f07efasm502815585a.51.2026.02.02.09.08.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 09:08:07 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [RFC][PATCH v2 3/9] add wic recipe
Date: Mon,  2 Feb 2026 12:07:54 -0500
Message-ID: <20260202170800.4172778-4-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260202170800.4172778-1-twoerner@gmail.com>
References: <20260202170800.4172778-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Feb 2026 17:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230382

Add a recipe to pull in the newly-externalized wic utility. Add wic to
the list of native wic-tools, and make it a dependency of the image
bbclass for wic images.

Add some bitbake variables to the default list of WICVARS that will
likely be needed in the environment file when invoking wic.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/classes-recipe/image_types_wic.bbclass |  6 ++++--
 meta/conf/distro/include/maintainers.inc    |  3 ++-
 meta/recipes-core/meta/wic-tools.bb         |  1 +
 meta/recipes-support/wic/wic_0.3.0.bb       | 18 ++++++++++++++++++
 4 files changed, 25 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/wic/wic_0.3.0.bb

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index f2fd00e6d7ec..693f49ddf608 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -39,6 +39,8 @@ WICVARS ?= "\
 	STAGING_DIR_HOST \
 	STAGING_LIBDIR \
 	TARGET_SYS \
+	TOPDIR \
+	WIC_SECTOR_SIZE \
 "
 
 inherit_defer ${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', 'kernel-artifact-names', '', d)}
@@ -111,14 +113,14 @@ do_image_wic[cleandirs] = "${WORKDIR}/build-wic"
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
 WKS_FILE_CHECKSUM = "${@wks_checksums(d.getVar('WKS_FILES').split(), d.getVar('WKS_SEARCH_PATH')) if '${USING_WIC}' else ''}"
 do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
-do_image_wic[depends] += "${@' '.join('%s-native:do_populate_sysroot' % r for r in ('parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
+do_image_wic[depends] += "${@' '.join('%s-native:do_populate_sysroot' % r for r in ('wic', 'parted', 'gptfdisk', 'dosfstools', 'mtools'))}"
 
 # We ensure all artfacts are deployed (e.g virtual/bootloader)
 do_image_wic[recrdeptask] += "do_deploy"
 do_image_wic[deptask] += "do_image_complete"
 
 WKS_FILE_DEPENDS_DEFAULT = '${@bb.utils.contains_any("BUILD_ARCH", [ 'x86_64', 'i686' ], "syslinux-native", "",d)}'
-WKS_FILE_DEPENDS_DEFAULT += "bmaptool-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
+WKS_FILE_DEPENDS_DEFAULT += "wic-native bmaptool-native cdrtools-native btrfs-tools-native squashfs-tools-native e2fsprogs-native erofs-utils-native"
 # Unified kernel images need objcopy
 WKS_FILE_DEPENDS_DEFAULT += "virtual/cross-binutils"
 WKS_FILE_DEPENDS_BOOTLOADERS = ""
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e830648945f3..22f974cae890 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -885,7 +885,8 @@ RECIPE_MAINTAINER:pn-weston = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-weston-init = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER:pn-wget = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER:pn-which = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-wic-tools = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-wic = "Trevor Woerner <twoerner@gmail.com>"
+RECIPE_MAINTAINER:pn-wic-tools = "Trevor Woerner <twoerner@gmail.com>"
 RECIPE_MAINTAINER:pn-wireless-regdb = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-wpa-supplicant = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-wpebackend-fdo = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-core/meta/wic-tools.bb b/meta/recipes-core/meta/wic-tools.bb
index fa983ed5f12c..45fb873dd6bd 100644
--- a/meta/recipes-core/meta/wic-tools.bb
+++ b/meta/recipes-core/meta/wic-tools.bb
@@ -3,6 +3,7 @@ SUMMARY = "A meta recipe to build native tools used by wic."
 LICENSE = "MIT"
 
 DEPENDS = "\
+           wic-native \
            parted-native gptfdisk-native dosfstools-native \
            mtools-native bmaptool-native grub-native cdrtools-native \
            btrfs-tools-native squashfs-tools-native pseudo-native \
diff --git a/meta/recipes-support/wic/wic_0.3.0.bb b/meta/recipes-support/wic/wic_0.3.0.bb
new file mode 100644
index 000000000000..f0c58f527c70
--- /dev/null
+++ b/meta/recipes-support/wic/wic_0.3.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "OpenEmbedded Image Creator (wic) standalone CLI"
+HOMEPAGE = "https://github.com/twoerner/wic"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE.GPL-2.0-only;md5=4ee23c52855c222cba72583d301d2338"
+
+SRC_URI = "git://github.com/twoerner/wic.git;branch=master;protocol=https"
+SRCREV = "c9305099546888d17b33c16e98bb2012e36d734a"
+
+inherit python_hatchling
+
+RDEPENDS:${PN} += " \
+    python3-core \
+    python3-json \
+    python3-logging \
+    python3-misc \
+    "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.51.0


