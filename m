Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F1EC61D92
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 06:31:35 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.13848.1700634687565169430
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Nov 2023 22:31:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FPU0si18;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-7b34e7c829fso33969539f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Nov 2023 22:31:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700634686; x=1701239486; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZykXYiM7uMxrJdPXzAN+yTEmwI0wqhDDRrap0uVrKM=;
        b=FPU0si18oRsCet6k1iBcT8RpsiTlKIE16HG0UfaqSHvq8vQrh9oup5zFA9qQmlkgBt
         OXfr8tn1RKAnyXgorV3kzCNd4PNBWfsY1fjhcChuhfnqHLRTIzLHWrrRSyMLyZbVvxtY
         +iCrhEtQDK4RAyUYqk7Sw5yfsRgpOldC4DUxsChPw0J6VI/IHCUis+PhqNc2dZjBOp9z
         R4yw23ARFBmaQzuO7dYaxyK8h9PZbJWQdRIWQRdcoMa4CCLwOard25A9RQm2wt/7/mSX
         kGRiRrqSx73P3mGRPHtxGVkloLbNVu/0Tos3dH9BcqhQSqsI6KGowTLaXfHE+S68dGOD
         RJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700634686; x=1701239486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZykXYiM7uMxrJdPXzAN+yTEmwI0wqhDDRrap0uVrKM=;
        b=oh3aTzjbDaJeD9rudh3stnzkDuusv3h+My5Ss2Hek9GlmuTr2uvGmGcHS/XZ/QWMfU
         2XORDq/160rLrtzYG0TIJWeEmMdB+QOZXo4gTDLiCS2yrYLWzrPIbOyHd6EfL+dvTBJB
         7QNae1Sb9boOK7aMHxPDy0doL6WWayHOz6ITyHHTj1gsFvOZVbE0MhNv0gBBkFsxSVva
         TY+vGNhGuGFqx4KgA+5cJs7/GPu8jtV4UiQ4tGO1benEuobkt3lqo52OuIpxOxpihW9R
         8eWcgb/OHBHLVHbce5PF6tugz+X6yBGeqLxNJHwfGvfPY6yLChuT9m3iumjpjAlnp7T9
         HGGQ==
X-Gm-Message-State: AOJu0YycWoptLnpLOFXWJGVqRQtbvCavIbcZQ4dVfaiKOZ8itKdG9bpB
	ufhP7kXbRL11eCqmXz2K587QzB2PMmI3Mg==
X-Google-Smtp-Source: AGHT+IECBBLqyeQDyGzBRpQzj5OG2V8ZnygOQM7Od6utjnUkiM2jrykZxCjAitKVw1YyIwCrA1nmLg==
X-Received: by 2002:a92:c685:0:b0:358:104:679d with SMTP id o5-20020a92c685000000b003580104679dmr1404267ilg.28.1700634686537;
        Tue, 21 Nov 2023 22:31:26 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::2c3f])
        by smtp.gmail.com with ESMTPSA id m12-20020a056a00080c00b006cb6fa32590sm6224874pfk.148.2023.11.21.22.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 22:31:24 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [PATCH v9 3/3] image.bbclass: Add glib-2.0/schemas to MULTILIBRE_ALLOW_REP
Date: Tue, 21 Nov 2023 22:31:18 -0800
Message-ID: <20231122063119.3620722-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231122063119.3620722-1-raj.khem@gmail.com>
References: <20231122063119.3620722-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 06:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191020

This helps in allowing duplicate files for glib-2.0 schemas

Fixes
ERROR: core-image-sato-1.0-r0 do_rootfs: Multilib check error: duplicate files /mnt/b/yoe/master/build/tmp/work/qemux86_64-yoe-linux/core-image-sato/1.0/multilib/lib32/usr/share/glib-2.0/schemas/gschemas.compiled /mnt/b/yo
e/master/build/tmp/work/qemux86_64-yoe-linux/core-image-sato/1.0/rootfs/usr/share/glib-2.0/schemas/gschemas.compiled is not the same

[YOCTO #15291]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
v9: Rebased

 meta/classes-recipe/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image.bbclass b/meta/classes-recipe/image.bbclass
index 7231fad940d..ace0441adbd 100644
--- a/meta/classes-recipe/image.bbclass
+++ b/meta/classes-recipe/image.bbclass
@@ -609,7 +609,7 @@ python create_symlinks() {
             bb.note("Skipping symlink, source does not exist: %s -> %s" % (dst, src))
 }
 
-MULTILIBRE_ALLOW_REP =. "${base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${libexecdir}|${sysconfdir}|${nonarch_base_libdir}/udev|/lib/modules/[^/]*/modules.*|"
+MULTILIBRE_ALLOW_REP =. "${datadir}/glib-2.0/schemas|{base_bindir}|${base_sbindir}|${bindir}|${sbindir}|${libexecdir}|${sysconfdir}|${nonarch_base_libdir}/udev|/lib/modules/[^/]*/modules.*|"
 MULTILIB_CHECK_FILE = "${WORKDIR}/multilib_check.py"
 MULTILIB_TEMP_ROOTFS = "${WORKDIR}/multilib"
 
-- 
2.43.0


