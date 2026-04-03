Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA7AE85390
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 18:36:15 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2207.1775241367545642186
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 11:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CeQ/b7aS;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8a5800772f3so19234606d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 11:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775241366; x=1775846166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HfJabcS/HFAP2VeSgw36Kd+/AEJaCmCszYpeR15FKeo=;
        b=CeQ/b7aS6gzljojLwgyxeB1VoM2KLCLWzgKRQKmLJQKa4Sgs59HHIzbSqNP7MFhyF4
         B7LK2XY1IA7rDYL3pgHi+l77sCseLHzDRgE+jqyVB8aftcs/6reYoC38bTdfNcnz6aeX
         uftTTxWLkAOGsUzCogkNc7JugjmlW8DU8Uw5UDpdMbMn/zh4QRZ/iIDqxkqtSz7z/O+S
         tIjTQehlcN64OR5NX5lWtf2mw8El5XJJByfBjttJO5jOeLuVIZCDdQFGm/7Q8CxmqOBg
         A5ta0sBBjrUSzYqoPc598DR/UoCxpEfQhywnoVvK2VsUafu6y74mdIMDKFx6JwSPIzcU
         zIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775241366; x=1775846166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HfJabcS/HFAP2VeSgw36Kd+/AEJaCmCszYpeR15FKeo=;
        b=lyufi7nN6jGBW7eJy3pf+qxPxvXKO5/27NV/jy5k+aVJP+BbLSSjN8jR+ppSGOkLap
         dBaPiYXthqcg3xnedHxX5nl/oSityN5i5mDXjDH9a+cKE1r/R8dG6UdwfcZx6ftpCC8L
         zeg2V87sRLUtRKzGqTM3RoErd9w+tIPfzy9QkX/0PCHlMeZX2P9MSarUc9rcDvurAk9q
         ntfZZq6RkzQLxOGQl+091vyXi4w6NqxYvJKUiMfaOWaXdXSY4Y4H5cDGjbn9m+nCVidZ
         uUzLcEeY/35ZqiRY2BUzyVp19JSmgOb+uueYCYhz6Nt+nKvzWz/MbzZAtwDYTEhaTsL/
         qZTw==
X-Gm-Message-State: AOJu0YzXYMCtYICOFcZLX3PomrVFeKZJq5NuwmfFyo+IlDMrFsxlq+pW
	A2Pgy031+puRY9bvfehDbif2zePq+wjWe0N3kQq2pk4LtUyTSQyb36ALWJHi7w==
X-Gm-Gg: AeBDiesIbBSPH4DEunNTxPBen9iqzZtAamyyJdb74zzG5amFgnlzdAHEvQtXUulf+Ee
	n447SmQRwSJbzKVcNJOwyoJ5hIRkYvWrnbmBOgsRW4/4ZVmmV5xmuldMwVsf8XdOzv2GI8SQERR
	6g/byPoMaCMQxL+enMT7gYpnFtPL+PpOTnixT1pwe4tGM18oq/vRNE8qVPaUoxfImN+LyUAAsqo
	gNn3oPEUDPHfbLR3QpLn5HRZXzm9wnClRYN6VFaySvGYo05c6kn/vM8reuSLV/9WZUueOL1FfL4
	9240Dx4OfojdTXn+p7vG0LSPmL9UAepxTOGHe/167JSgavfVbYD1QMBqySDQQ6twkowWAuotbBD
	eLskh+XF7Et/dmxRGrH/2wCXCQqmwifX2AKY7LHm0ZF9NvNo2yHkQr/VmmagimPs4vjjSXnKhGY
	SMEs57UZUEYVB89SUULqDWu207pDmRSCiTDHj4QHH6/ZgZbL0gxTkQIDnFgkUwvxuXiw==
X-Received: by 2002:a05:6214:8093:b0:8a5:bd5b:e5f with SMTP id 6a1803df08f44-8a705879a6cmr65218526d6.51.1775241365891;
        Fri, 03 Apr 2026 11:36:05 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593ee25c9sm64627916d6.22.2026.04.03.11.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 11:36:04 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Mark Hatle <mark.hatle@kernel.crashing.org>
Subject: [PATCH v9 1/5] wic: add recipe
Date: Fri,  3 Apr 2026 14:35:37 -0400
Message-ID: <20260403183541.2631883-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260403183541.2631883-1-twoerner@gmail.com>
References: <20260403183541.2631883-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 18:36:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234593

Add a recipe for the external wic utility from
https://git.yoctoproject.org/wic. Add wic to the list of native
wic-tools, and make it a dependency of the image bbclass for wic images.

Add myself as maintainer for this new recipe, as well as the wic-tools
recipe (which did not have a maintainer).

NOTE: this patch is in preparation for removing wic from oe-core
      the wic oe-selftests work fine with this patch being added now

Reviewed-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Reviewed-by: Mark Hatle <mark.hatle@kernel.crashing.org>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v9:
- updated SRCREV as required (the standalone wic repository has
  different commits)
- updated commit message to indicate the change of maintainership

changes in v8:
- (skipped, the patch to add sector-size cmdline arg was upstreamed)

changes in v7:
- bump SRCREV to include a work-around for wic.Wic2.test_expand_mbr_image
- changelog:
        exec_cmd(): allow multiple success codes

changes in v6:
- the SRCREV was updated since any changes/revisions before the removal
  need to be reflected in the repository

changes in v5:
- rebase with master
- split patchset back out into smaller patches
- do not add TOPDIR and WIC_SECTOR_SIZE to image_types_wic.bbclass if a
  user wants them, they can add them to WICVARS in their config

changes in v4:
- (skipped)

changes in v3:
- squashed into one large patch

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
index aea61d67e3ed..f613c59b2cbc 100644
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
index 1bd43211e23d..567cd98580d0 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -892,7 +892,8 @@ RECIPE_MAINTAINER:pn-weston = "Denys Dmytriyenko <denis@denix.org>"
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
index 000000000000..b98408702300
--- /dev/null
+++ b/meta/recipes-support/wic/wic_0.3.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "OpenEmbedded Image Creator (wic) standalone CLI"
+HOMEPAGE = "https://git.yoctoproject.org/wic"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4ee23c52855c222cba72583d301d2338"
+
+SRC_URI = "git://git.yoctoproject.org/wic.git;branch=master;protocol=https"
+SRCREV = "79e2b06a1f9c97decdaf44f0806dbf3cc1e86bf9"
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


