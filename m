Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBEAC531FC
	for <webhook@archiver.kernel.org>; Fri, 24 Jul 2026 09:02:07 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15304.1784883724146743392
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 02:02:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NAOl1q+n;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: twoerner@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8edda5d56a5so2136846d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 02:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784883723; x=1785488523; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UxweUe6WjW2oWNzgu240lk3VTlDTqDbL+WGW85m4wug=;
        b=NAOl1q+nYLP7MzEwwp66SvBoitK33OIY/rvfam2MJLtXD/F9OQxVV9Ea4fLxPewbir
         D081O8/zWgTXIrPD9+23Q+J1lNDQxkrUeNITy+R0/hZhMg0+xXDaLccWi/UVhE0IJiyw
         BB/HkI0clFCsRk3wnKfpDyH5Y4c90+n1vXH4ZB6VoWckONjZDOpOHMkxhXLblCvrG8ya
         K7yoRqqije4xflHgSQcPQ/Gkkqpllidrpz5ZcRRzVyMhyQgvBlqdXLt9IFOsZmoC/gyN
         8/ECxTfhSxVNwJChbepul9v0MpQj93Xj91ZA/jo1zGDc/3wXiIfpJ1mZdWDQS5f1ZlGN
         4b/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883723; x=1785488523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UxweUe6WjW2oWNzgu240lk3VTlDTqDbL+WGW85m4wug=;
        b=fZfhD6xB8NuylqtfwExwW9SldGrXddNVujsCH2L2/Wsgj21xLDhTJKkIzrmcnAlTqB
         be/uhApZJzrkjd5qyQQBfu92AhsNTDttfGI2KtSAiNDSc0428Z9lC5GODSChlA1A1xNU
         fKhGrs3fqW+ArcfOJWawmus73Byl1zmBMd3UVcUXtUD/h0hDENcFeU4u/s98tDlZeQ8G
         jT82VXzrSvjZQ974C0UAOBv31gFbzsAygkaGeXSpju/YkSnlNhdKRe50+u9KQbP54+yV
         H9D+CDXYxVTEVfQuZ/degw2f2xNt9sEWiDRiZQXxhMzXJdIfPJbBUAhjdi/wNcu6ZOza
         8VNQ==
X-Gm-Message-State: AOJu0YxCEV9Z1mXk20H1dWazYWPF9FMLCyultHD4tzHl6ceOIMbgkMwR
	DDiwbxnPvgXAJEAUNMAourP3IO2/7AUmuvy3wwr6IFwi10bqOPOsqt5EcwzyvQ==
X-Gm-Gg: AR+sD11v3ZGrzpau1V9kz8V707hODB8xjOPGnKKnTa0B4162EkXK5gSM0RxPXewVQ/D
	F/RO5YsCccDnesg1Mes6sQdeZGh+kpIZ8F9RFppTUkLeLSgqaIPhfhKn3oY4FYmZp6gfnG1Zg8f
	8v1duSVBIs6pFwDtoBuN7hSGMuPWqNA2B+J3OuqGJfTi3vD5hD/g2Ya/s0Z0SzmEN47SZY6H+4+
	Kzrw8DWxlyWuPKc+RM4tIi+TLp1g6/fjh5LVizX/N8awgzkFn8IwZvnyiLaM/z2zZAEM/9gnV8q
	0KnzXNb7w7OSRxlR4yPmZeInN9hPBnLBYUIuJu2uQ6t+A7OlurFPx/bA+uVuDFUfpHBkhGMuuiR
	5B3uh9VwT34P1f3V6iH+DqZCiYxeqJ4gcGUVtvxNfQAXDiY1gP/NhowyPps2WX/IWJQhCghl/CT
	n6KLcDVkwPQPf2+RY1mj2e0pSTOEDRTZ2U9MmAjQX7eQw7
X-Received: by 2002:a05:6214:5016:b0:8fd:6e32:2bfc with SMTP id 6a1803df08f44-907ca58b582mr65701476d6.61.1784883722997;
        Fri, 24 Jul 2026 02:02:02 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907baa27cf1sm63968326d6.46.2026.07.24.02.02.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 02:02:01 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v4 02/10] wic: add runtime dependencies on the tools it invokes
Date: Fri, 24 Jul 2026 05:01:38 -0400
Message-ID: <20260724090146.19924-3-twoerner@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260724090146.19924-1-twoerner@gmail.com>
References: <20260724090146.19924-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241912

wic shells out to a number of host-side tools to do its work: parted,
mkdosfs, mcopy, the mkfs.* family, sfdisk, e2fsck, resize2fs, debugfs,
blkid and more, depending on the operation and on the partition types
in the image.

None of these are declared as dependencies of wic. For the bitbake
do_image_wic task this is handled by the wic-tools recipe, which builds
the tools into a native sysroot. Wherever else wic is installed as a
package it gets none of them, and its offline lookup (wic ls/cp/write)
resolves each tool over a search path that falls back to the host PATH,
so on a machine that happens to have the tool installed system-wide wic
succeeds while on a machine without it wic fails:

  wic.WicError: Can't find executable 'mcopy'

Falling back to the host is unreliable even when the tool is found: wic
depends on specific minimum versions of some of these tools, and an
arbitrary host copy may be too old, so wic can pick up a tool that does
not behave as it needs. Declaring the tools as dependencies pins
known-good versions instead of trusting whatever the host provides.

Add the tools wic runs as RDEPENDS so they are installed alongside it.
resize2fs is listed on its own because e2fsprogs packages it separately
as e2fsprogs-resize2fs, which e2fsprogs does not pull in, and wic needs
it for the cp/write resize path.

grub (grub-mkimage) is used to assemble EFI boot images, and is only
compatible with, and only used by wic on, x86 and aarch64. In particular
grub is not in COMPATIBLE_HOST on arm hard-float, so an unconditional
dependency makes wic unbuildable there and breaks "bitbake world"
(Nothing RPROVIDES 'grub'). Gate grub to the hosts that can build and
use it.

syslinux is only available on x86, so it is gated to those hosts too.
Its bits are split across packages: the syslinux package provides the
isohybrid helper wic runs, syslinux-misc carries the ldlinux.sys,
isohdpfx.bin and ldlinux.c32 data files, and syslinux-isolinux carries
isolinux.bin; wic copies all of these into a hybrid ISO, so all three
are listed. cdrtools (mkisofs) is native-only with no nativesdk variant
and is only needed for ISO images, so it is not listed here.

AI-Generated: codex/claude-opus 4.8 (xhigh)
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v4:
- gate grub to x86 and aarch64 (it is not in COMPATIBLE_HOST on arm
  hard-float, which made wic unbuildable and broke bitbake world); move
  syslinux into the same arch-gated appends
- also depend on syslinux-isolinux, which carries isolinux.bin that wic
  copies into a hybrid ISO; the syslinux/syslinux-misc pair alone missed
  it

changes in v3:
- list the tools on all variants rather than only the nativesdk variant

changes in v2:
- merge the tool list from the v1 "wic-tools.inc: add" patch into this
  recipe as RDEPENDS; the separate .inc is dropped
- list the tools inline rather than via a shared WIC_TOOLS variable
- note in the commit log that a host tool may also be the wrong version,
  not merely absent
---
 meta/recipes-support/wic/wic_0.3.1.bb | 30 +++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/meta/recipes-support/wic/wic_0.3.1.bb b/meta/recipes-support/wic/wic_0.3.1.bb
index d9b4cc05c4bd..75fa734a9761 100644
--- a/meta/recipes-support/wic/wic_0.3.1.bb
+++ b/meta/recipes-support/wic/wic_0.3.1.bb
@@ -17,4 +17,34 @@ RDEPENDS:${PN} += " \
     python3-misc \
     "
 
+# wic shells out to these host-side tools when it runs, so they must be
+# installed alongside it.
+RDEPENDS:${PN} += " \
+    parted \
+    gptfdisk \
+    dosfstools \
+    mtools \
+    bmaptool \
+    btrfs-tools \
+    squashfs-tools \
+    e2fsprogs \
+    e2fsprogs-resize2fs \
+    util-linux \
+    tar \
+    erofs-utils \
+"
+
+# grub (grub-mkimage) assembles EFI boot images; it is only compatible
+# with, and only used by wic on, x86 and aarch64, so gate it to those
+# hosts. In particular grub is not compatible with arm hard-float, so an
+# unconditional dependency makes wic unbuildable there. syslinux is only
+# available on x86: its installer provides the isohybrid helper wic runs,
+# syslinux-misc carries ldlinux.sys/isohdpfx.bin/ldlinux.c32 and
+# syslinux-isolinux carries isolinux.bin, all of which wic copies into a
+# hybrid ISO.
+RDEPENDS:${PN}:append:x86 = " grub syslinux syslinux-misc syslinux-isolinux"
+RDEPENDS:${PN}:append:x86-64 = " grub syslinux syslinux-misc syslinux-isolinux"
+RDEPENDS:${PN}:append:x86-x32 = " grub syslinux syslinux-misc syslinux-isolinux"
+RDEPENDS:${PN}:append:aarch64 = " grub"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.50.0.173.g8b6f19ccfc3a


