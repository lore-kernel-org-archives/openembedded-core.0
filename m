Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F16FD9E33
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 00:38:40 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.150261.1772411918498654324
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 16:38:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eELgPwDz;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-506a019a7f3so50588281cf.3
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 16:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772411917; x=1773016717; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HEW10zPetEP8wHTnW4krvhuldQO9QsmqdP3IMIQelAA=;
        b=eELgPwDzDoioIw1RUOjAyuQw5XQ1aJUC5b4kLQ2hV52hbn2st9YweqnlZJy6gaGpER
         hQtLLPSREGeLNYasK8rwicQHCjRlRvp74OvjFtcg92i/pj8m6zRiPeBlGFsKRId9xiWK
         FR2dfbwxeXQYWXrlgqUxMUG8FDnGMqGaBGhtovEbPjOItMUKrBu9gCHav8bQvTFmNJ0I
         yul90fEcM9w3CMN0T7b3U88wVGCPhCSWnXcq8On4A5pi75JnH0DgYLGbCVUeEIB+7dU1
         2w6zLprhGR/6OphdObMnsZqdW2EjiROLOgFmUfsbhxul7XmLQgG/fthBZ9C8OQYSICPM
         Yyng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772411917; x=1773016717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HEW10zPetEP8wHTnW4krvhuldQO9QsmqdP3IMIQelAA=;
        b=iJboU4miwFrVpLlpQWqXYZ/6yW9XMEeM0YhYQBFTBnUKhoIskBEnEUU347dF3DoIv0
         91RW5OXgC7Y6JyNhn3r3oWW1jsNlJpuZrBy/+UrlKZYyW42+G+vk0rzbTMxjFp/zZ7Jb
         BGa4SMPvTklfTslDZjFDyPhxMqVUyTZ1S8R8t0cwGYRf26U1Wcz4+jZ4TO508LZYQmgs
         ZFEEzzJEtD7wMxmLwZavP3vZbH/R9OA0x4938TwzVkgOICMWW5weNLwMaJKXH2ksY5YZ
         KVm8qWTguwsHxbkxBwpFTp5TTONqDaQfMe9S9TKnON0xGIkRoRinErmosT2SwQTpuB0n
         YfCg==
X-Gm-Message-State: AOJu0YzspSeqVJgSgmgLgofKTuQyVwG5lqmkM4httOlJSOd0bgH0t9yv
	siw/Sf/EG799qEdILrE5tVX9ffSf2H7u9QKJo+VHI79Fcsrzpe+7U3MpPXiLjoAO
X-Gm-Gg: ATEYQzxxCw/ClmtYcuKv52Rm1oWXJFB8wa9/d8SVzCt7vJQ/5mZXtGPj+hp9DgQDkqO
	GZ99qe2n9ZeMtpL985Z8jpXQi0tboJNjFqaIrAYGucuRxQDepn3IMhQP6zaSUSPjgtcMNyYLe6Y
	5ilJ+FQnnrVIS7QxVQELQTD+IBf+ceEyiFjBpScAONJVbclgiOU+O0hW1wgfzmC6UUg2QNA1vyv
	TNoGyxTGi3YHHN2PhraEf1tZLI8xPBWyi3JQHOWETyq9nONkUIHqG2g3nHu0RQmmhB5PcBtbWI3
	eNVne/YmyYi228+NM1ajIXFwVINi/rGKl4E1YJbqhx9+93Z6jSTCEGyjahq0nQ6h6GUjuQKAsk8
	6+EuMBKKR5G3uxy0RFi98hpwKUN/HrjNo0E84XAxTmNr+M536BBeFUILsLnDPt0x3JG3/kZURZL
	qB1kuVcPYft7griJhZa30I9SQ4n10+gCmq+futNDwpZRy8x01ugA+EhmcpQm8ULfkP6A==
X-Received: by 2002:ac8:5a4b:0:b0:506:70e:96fe with SMTP id d75a77b69052e-5075276eed4mr132018351cf.18.1772411916668;
        Sun, 01 Mar 2026 16:38:36 -0800 (PST)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899ebb09772sm33710356d6.12.2026.03.01.16.38.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 16:38:36 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v7 4/9] wic: add recipe
Date: Sun,  1 Mar 2026 19:38:21 -0500
Message-ID: <20260302003826.3995222-5-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260302003826.3995222-1-twoerner@gmail.com>
References: <20260302003826.3995222-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 00:38:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232149

Add a recipe to pull in the newly-externalized wic utility. Add wic to
the list of native wic-tools, and make it a dependency of the image
bbclass for wic images.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v7:
- bump SRCREV to include a fix for wic.Wic2.test_expand_mbr_image
- changelog:
	exec_cmd(): allow multiple success codes

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
index c9baf35ed35d..3ebcaf390480 100644
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
index 000000000000..65f96cfb7e87
--- /dev/null
+++ b/meta/recipes-support/wic/wic_0.3.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "OpenEmbedded Image Creator (wic) standalone CLI"
+HOMEPAGE = "https://git.yoctoproject.org/wic"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ee23c52855c222cba72583d301d2338"
+
+SRC_URI = "git://git.yoctoproject.org/wic.git;branch=master;protocol=https"
+SRCREV = "15a50b871047538f2f98daf2a8d6f155eb146880"
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


