Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 761A5C28B2E
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 19:56:17 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.4551.1741809368026006171
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Mar 2025 12:56:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=I0Bvz0jP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2255003f4c6so4954615ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 12:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1741809367; x=1742414167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tBNDhtQkJL9cDjXdk13rmy12csmg52Ggtwhk+l9JMiI=;
        b=I0Bvz0jPqW/EmzveFeXBxjx36L+kKXnxs5Y7Mvgwe5Y9BxZ/xlYLKskrfxi4FhoPtl
         Q/njBpOXujF4Bvgp+weeP0UOs73Q2u2zBBK1NDjU/y/KiyI8SOgZFT1zDavAcrQ51S2p
         wt4AqRwiI2D1lDOGkGQJMgFFVi0zxZVEHEmuPVE9JxteQw1kOxXTW/+xFwWDqCG2WcXh
         ph/0SihGX/+JUUxyxM6huhwa8mtNdNF61TeREMXwivNdu8WDGFtOP+s5i2Km07sMK7yI
         UZoNr6GPAZM9f4MrIHFoY1qd/JheZsUGzFIJuo49cGiAFiIsTilKgbSG5dZM7jL+naze
         5m1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741809367; x=1742414167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tBNDhtQkJL9cDjXdk13rmy12csmg52Ggtwhk+l9JMiI=;
        b=Wpp6vyA8+ULD+D8ZHTgiCT0Xwy5IIUr6O71qJCL9wtCLkH7fggFK9eUS9NjczOvedg
         opwy17oCkvsqNb9zj1c+3tPMe6FxVtdzPIdnxzD6+/BsYxZI9FnMrOQeF9bPT44mD9hX
         Jah3n8qPUUpSq8b1pDv/6IzMO5O/7LAJcKYJ/8bm0BNvhi1cqdv9wiKADaWYvhHEV2fn
         QeTS2MmKMJeZPj8bDN0f4ITOyIgU3IU4WZZseSjmfw4RCV7+m+g95JTVh93xNF/gRp+9
         K5SPzG6B+6lEHt1kaj/FWBXCmwlJJqAPmzZupXXecZSjhyxE94ipRhvFwvhm9BY0WdYk
         Up9w==
X-Gm-Message-State: AOJu0YyQFT/e2m0UC24tIcICRrzaXog78lpWChsAf5RQtq1D3R0SOJi6
	9PDrpCAbEkP4aCtQOG3ZDl4fs4L1970kZPLuK/nRKVw8unFywrMn/O9Lq08T4geUroaFqMsKocS
	B
X-Gm-Gg: ASbGnct/Izpfpl0Jn0t320lUeXNWZIXbrOxAbZIA6tHSC3e0YbOI9V2bHjKHePNSemj
	sX5kuHAXu81+UBcv7f1oNHJGhaL+woEIUzbwyrkQACQj/nfKo+myFb/I1pr5Q03MTncxfB2fC1T
	MtygkEQtp5JNoaknOCsUhqVaZ0a6QCGPM1wRhPNNZk3r1aSDiYsRClaZfBJyWOSBg/Kw1i74hku
	G+DapN7xSYESJplTBxCi6C0AyjxQKCl3zO9USbN00oTazcyGdBdcBJrLQ50EDw+lefad1D2oeO3
	E+O9iLkCbitsRcR5YgsqI/nyg4Qoko7gr8M=
X-Google-Smtp-Source: AGHT+IFntT0FhsHYzkWYnzccZIF20wfsRAvG7/F70Yc1M+6j0QI3XXcG/hwuEVd/T1Md8CRyHDLDlQ==
X-Received: by 2002:a05:6a21:3a41:b0:1f3:3ca3:8216 with SMTP id adf61e73a8af0-1f58caefaf0mr12103972637.5.1741809367282;
        Wed, 12 Mar 2025 12:56:07 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5779:a397:ba1c:2b0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281287c10sm9830332a12.78.2025.03.12.12.56.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 12:56:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 07/28] grup: patch CVE-2024-45781
Date: Wed, 12 Mar 2025 12:55:28 -0700
Message-ID: <120d8cc7b91654557a3101a5f8fda44fb703e5b2.1741809252.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741809252.git.steve@sakoman.com>
References: <cover.1741809252.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 19:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212701

From: Peter Marko <peter.marko@siemens.com>

Cherry-pick patch mentioning this CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../grub/files/CVE-2024-45781.patch           | 35 +++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc               |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/CVE-2024-45781.patch

diff --git a/meta/recipes-bsp/grub/files/CVE-2024-45781.patch b/meta/recipes-bsp/grub/files/CVE-2024-45781.patch
new file mode 100644
index 0000000000..bd0b6aa04a
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/CVE-2024-45781.patch
@@ -0,0 +1,35 @@
+From c1a291b01f4f1dcd6a22b61f1c81a45a966d16ba Mon Sep 17 00:00:00 2001
+From: B Horn <b@horn.uk>
+Date: Sun, 12 May 2024 02:03:33 +0100
+Subject: [PATCH 2/2] fs/ufs: Fix a heap OOB write
+
+grub_strcpy() was used to copy a symlink name from the filesystem
+image to a heap allocated buffer. This led to a OOB write to adjacent
+heap allocations. Fix by using grub_strlcpy().
+
+Fixes: CVE-2024-45781
+
+Reported-by: B Horn <b@horn.uk>
+Signed-off-by: B Horn <b@horn.uk>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+
+CVE: CVE-2024-45781
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=c1a291b01f4f1dcd6a22b61f1c81a45a966d16ba]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ grub-core/fs/ufs.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/grub-core/fs/ufs.c b/grub-core/fs/ufs.c
+index a354c92d9..01235101b 100644
+--- a/grub-core/fs/ufs.c
++++ b/grub-core/fs/ufs.c
+@@ -463,7 +463,7 @@ grub_ufs_lookup_symlink (struct grub_ufs_data *data, int ino)
+   /* Check against zero is paylindromic, no need to swap.  */
+   if (data->inode.nblocks == 0
+       && INODE_SIZE (data) <= sizeof (data->inode.symlink))
+-    grub_strcpy (symlink, (char *) data->inode.symlink);
++    grub_strlcpy (symlink, (char *) data->inode.symlink, sz);
+   else
+     {
+       if (grub_ufs_read_file (data, 0, 0, 0, sz, symlink) < 0)
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index f3279f7d2b..bace594ac4 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -20,6 +20,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
            file://0001-RISC-V-Restore-the-typcast-to-long.patch \
            file://0001-misc-Implement-grub_strlcpy.patch \
+           file://CVE-2024-45781.patch \
 "
 
 SRC_URI[sha256sum] = "b30919fa5be280417c17ac561bb1650f60cfb80cc6237fa1e2b6f56154cb9c91"
-- 
2.43.0


