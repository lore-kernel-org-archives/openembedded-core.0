Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62AF7EEC299
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 21:50:35 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6458.1771883430650578162
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 13:50:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VIpIIYA1;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cb38e6d164so589682885a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 13:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771883429; x=1772488229; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AsseCcXms625CqCeLs0bxdhQqq9xplOJDSdw5hf+SKM=;
        b=VIpIIYA1LgERaoAfVBro0i1xj/vy/CS7pvArVvUzm7YYs6iJjltotSk/TTAgS1gA5J
         cpqKroFDjfIAYeyrfqxIIZcL0wA7DhtgyYS+nbq/s8X7hQM1dQyDq6RVjvqus4xPWQ/2
         QaUw8meMO6/nfCUBoxmwbwmcBImXR8pqYswRvswvzciX1plbDXWP+9ElozOvliItLs/n
         LO3KM4Svf6wcBO3+3tWJgLVMGRYRMgn5pmtC+QYvoJkt+g5Lj0HSWE3i3VRYj7vitgvU
         AAl0TXouugo9KovYmNDmpacSrcScJzYYp1ntRZg0Uol81yw7/JL3fRgDszsqkyzO9eOH
         jSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771883429; x=1772488229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AsseCcXms625CqCeLs0bxdhQqq9xplOJDSdw5hf+SKM=;
        b=NfxcuYQAjJSXReA0SZGjEgHpGtEWruEvLnMcjHMOP2mUXmmBF94EU8lTYIotKTWDMP
         ACv1/tE6EtTkL6WHwbBvqKiAtSPAURH4Cg1ksyPsx+Wti36IRaIdTtXqJIP3X//2QmPW
         l+xWX2S/U2OxF/o2Nd9JZ72gh0sA2116cZXZobQePpRo50Q7z3UxHA8Dwxcl19Qp932G
         57XzQxgYbYFa2pj1fDiQZ4Sr5iiRbbu65VcQGO+QaegWTr8Gwn2Z2UlHWwP8kV26aPFy
         fhEHyd2WcAlVVRHEUVXV0Qujts6HhE62LT2Kjrn72xBlJp9Nj54U3WRCr94CFVyiWoXS
         HLRg==
X-Gm-Message-State: AOJu0Yxh1wzURuWxHzEK30AE2ri/VOWBZEMwuvHJepGQCz+xu0U6F8m8
	mV8wRddC8U8f4qXFDl1YxKYNNqDnZIH7BkphKN+JcC/VunqG7YPrJglAS4AmXVOK
X-Gm-Gg: AZuq6aJxX9fKSrGdBAneMqwWDv1zWtuRWdvC6xfpYMbXsreKtuYIBFCu4UKuxphGyf9
	mgtdbn6z9mqAPYhAn7LhrmJo+Hh8ICorkhZcCNcmo6d9vc71M+oKnc0J31W11ACTqzFDEndj5Y6
	RODtULtoKbizSCC1NJFfxQYGASPUjN5sjnSIG/f3FMoMNOqKJMPYQIQy+nnBjEXJIkKoRm35yYv
	XiI+cizpzmdiKfsL85P2WkKT9duCmD+XoarE4F9/xf3mtQwCuzfrbbcNMGMILdxQDYjGLjRAUp5
	Knz9p0GDKd4cnkllOxaShjSB321FJJahpeY/zCRZp4Brpjh/6C5tpt/Oc0rYeyg/h3wOdcLF6Th
	qyQIjKUkhJdjlhzCVUiRcJvAjvyjlRzLiGq78/CTjWO30c0A029SWR54R37QWj6htI00w3eKtle
	GP4jqUDackBiqOg5acID7o0bJQ0ThTYovYGKNy8cjhlEgYpgv+CJmxSoPzvSCag6aPEw==
X-Received: by 2002:a05:620a:4692:b0:8bb:7e56:f204 with SMTP id af79cd13be357-8cb8c9f9371mr1277930585a.20.1771883428839;
        Mon, 23 Feb 2026 13:50:28 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997c691113sm93811606d6.1.2026.02.23.13.50.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 13:50:28 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v5 05/10] wic: add recipe
Date: Mon, 23 Feb 2026 16:50:03 -0500
Message-ID: <20260223215008.2062721-6-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223215008.2062721-1-twoerner@gmail.com>
References: <20260223215008.2062721-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 21:50:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231705

Add a recipe to pull in the newly-externalized wic utility. Add wic to
the list of native wic-tools, and make it a dependency of the image
bbclass for wic images.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
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
index 000000000000..d2a2e282b2f0
--- /dev/null
+++ b/meta/recipes-support/wic/wic_0.3.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "OpenEmbedded Image Creator (wic) standalone CLI"
+HOMEPAGE = "https://git.yoctoproject.org/wic"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ee23c52855c222cba72583d301d2338"
+
+SRC_URI = "git://git.yoctoproject.org/wic.git;branch=master;protocol=https"
+SRCREV = "7e7ede0806b43503d13d96a1eb4c091e2cd527ad"
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


