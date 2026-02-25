Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D93F4BB93
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 07:49:50 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40952.1772005786788216019
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 23:49:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RLl3x+Bi;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-50335b926c2so59671801cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 23:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772005785; x=1772610585; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w/ISTSS96SBGdiOR7CO/Lr2zoPdaDcvfgVBunhq+LGE=;
        b=RLl3x+BifSZ5YISOJyb1rGWvm+bQJRO6kfk9NuHD6P5QQl/9F4V8MvDFGxkPwrf2W0
         BjqKRVLQw7gem5hnoN/9oheEMH5pxvRPgjvMUS2HP8Zrq2gdUx1MWRZHYmGcGiSMzSDY
         gAZ2AH245T6cTrrRiR+IsZzNxNDO2EI+srzs+vXv4ZSHk9XpjDC6PQqSsAD5SGMBF3/q
         BDPB26jGEIG0Xgthk72K82sK/zrITtuODvLIJ7W8QgWC8xTa4Ob2C8e8yielUY5ZeyYY
         4+jKTbaFLojwUWEZGr0/Hduhg3X+RPvnLii/romBsLh0vFKQ4fhEnxCfbDMUDwAO4Zbi
         KYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772005785; x=1772610585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w/ISTSS96SBGdiOR7CO/Lr2zoPdaDcvfgVBunhq+LGE=;
        b=s1H3K11paonzS3Qpt8IS+fcdHvRvqs9f9++q9RQLcQecSSZP/k6OrpxHpXiTlVbCYY
         yGeXmdh6G5aj5cZjSQdch+YOzSgf1ehBqCdSAt3egyFtVa7cwqEW/r2C4gmRfIntYzX/
         JXuxdf/p8Sz28yXGCUTXUwsPPOmUdtq5oPTV2L4mxley0cwhraEre2hEWDhonHznkvi/
         QZkAYdcSKN8/SnYZWS/SvfxTomPI7tVZ4wUeghuXP5qyS0Vtl2tNEEroxTjpETuxnqzH
         HAVRAtFMNdEY4eYMAbxPZBPXpE1TbOYGsSCNpdNvwjazjvBhmljrfMqiEIgtph3cvjHP
         3+Zg==
X-Gm-Message-State: AOJu0YyZN45ioqB6d9RkGm+nRYCOCEaVYW53fWpgx54MkDeSduMHdQmp
	baz4RrPn2Y+qv+9cre1YUVaJVGCwt/3kB07Vuxw15BhBBR70ZsZJ50XgkETCivue
X-Gm-Gg: ATEYQzy1R5lsdmS5nwv+ZNkwQdszHZnkyu/9ol+RzOU0KKjRQgL7NaxWe5BAzQMLrbQ
	DLrdgnBQOGj95CinMdqSFGjeBt2u4xYYooVS6He1AZF30TNIEWLFj9Fjum6JK3RsPQCutUmZQW6
	CA4ZntrrMaCDOU/o8AIprTKVxwisn2Rwmo1MFGUvadFf6ESynnwNZOG/24Cl5gbKy6cRZKqPvqk
	W0UEQAbhZgKe8m+oTEF6Zma/igOIEafT3evJjd1znjzJRw/CENVOw0Kbcn//LAKlfs69I3ro19W
	HMOk839J8c0jPqydCT4rIHTncOZr2Y03Bytud0ODhrE9PFiRHS4jSVxMzcNie8PS8WAHAKV3zog
	X9+Z/HcuLS4GPkkFoyvIZZuj1laE/VDFmI+q/rcNKow92wo+G0y3liJHb5+gZOaOIY9VfM3tf2J
	lcLGn+kyBw3ZOG5uNsybjF1sVU+9FLECtyzwdqDUuEHxgNW2nkJ9iZ1Nb3g6xmNEkOcQ==
X-Received: by 2002:a05:622a:347:b0:501:147a:a215 with SMTP id d75a77b69052e-5070bced844mr191921471cf.73.1772005784843;
        Tue, 24 Feb 2026 23:49:44 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb8d0614fbsm1390089785a.17.2026.02.24.23.49.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:49:44 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6 4/9] wic: add recipe
Date: Wed, 25 Feb 2026 02:49:26 -0500
Message-ID: <20260225074931.1661345-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260225074931.1661345-1-twoerner@gmail.com>
References: <20260225074931.1661345-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Feb 2026 07:49:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231932

Add a recipe to pull in the newly-externalized wic utility. Add wic to
the list of native wic-tools, and make it a dependency of the image
bbclass for wic images.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v6:
- the SRCREV was updated since any changes/revisions before the removal
  need to be reflected in the repository

changes in v5:
- rebase with master
- split patch set back out into smaller patches
- do not add TOPDIR and WIC_SECTOR_SIZE to image_types_wic.bbclass
  if a user wants them, they can add them to WICVARS in their config

v4: skipped to align/combine with other patch set

changes in v3:
- squashed into 1 large patch

changes in v2:
- add wic as a native dependency of the image_types_wic.bbclass
---
 meta/classes-recipe/image_types_wic.bbclass |  4 ++--
 meta/conf/distro/include/maintainers.inc    |  3 ++-
 meta/recipes-core/meta/wic-tools.bb         |  1 +
 meta/recipes-support/wic/wic_0.3.0.bb       | 18 ++++++++++++++++++
 4 files changed, 23 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/wic/wic_0.3.0.bb

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index f2fd00e6d7ec..3a4c497de19a 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -111,14 +111,14 @@ do_image_wic[cleandirs] = "${WORKDIR}/build-wic"
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
index b5ab35d92a06..46bd48117910 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -884,7 +884,8 @@ RECIPE_MAINTAINER:pn-weston = "Denys Dmytriyenko <denis@denix.org>"
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
index 000000000000..0fb49f083e52
--- /dev/null
+++ b/meta/recipes-support/wic/wic_0.3.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "OpenEmbedded Image Creator (wic) standalone CLI"
+HOMEPAGE = "https://git.yoctoproject.org/wic"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ee23c52855c222cba72583d301d2338"
+
+SRC_URI = "git://git.yoctoproject.org/wic.git;branch=master;protocol=https"
+SRCREV = "eb1ea917c1790b3cb719e4526eec75531b727bcf"
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


