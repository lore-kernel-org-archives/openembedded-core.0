Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B61FCE7716D
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 20:36:36 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.25142.1733344591208253196
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 12:36:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=S2uhsWtT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7251331e756so247646b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 12:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733344590; x=1733949390; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h+mbgeuOb4sdkmC/N3++cFgqYxyRXrffzVp8sNa9NBI=;
        b=S2uhsWtTAMNAvqoYMd24KBgkIx/zXGeAx9gyGs78RDsvMKsPBfmR7An8m6/I2Pwwsi
         Lg62zi5Z5wWarH8nBDAgovVFhSmgZrq/3sBrNFQ9z00RtRaCWuBBWa9LiNpSSNGFKE81
         b7Bxy/Uycl3ufuTIQ3Lv+qQ6wQYB2izxkfdexSJvsyGu5xBW3qXrK9j49ttRRLa1s9rR
         PaDhiYXU8IqGwlsWcR0Bvwn1YdichlUAnVg6nTxet+XDN1PmAwm7ASBjlBZi9weIo5cf
         90ktDNFAzdtd1bD0BO24Y8AN2cD9tUh5ejb+QfdnOaRtMqL8lIW6njAXwxWk5yFjV5tN
         cNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733344590; x=1733949390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+mbgeuOb4sdkmC/N3++cFgqYxyRXrffzVp8sNa9NBI=;
        b=grcknj3TTHGqMbo/XYLUkMAVTiu/u/QmphSIq0zdDvHjNb64+wmrgrlDFf4WyyH162
         havrvYVSrjrrraxIsqEs1Up+AVi17d+tzfGwMfJlLQxA0IPN0BU1yDm7wDMazv6/1jzC
         nl4cbQ6aP0NX7m/VU0TAPYLqohTTv2ot1CFlLwDJwxFRx8EE4h8wbLC+N1LqQfyKrSK1
         zD6WV6urdDtnhMqUPCr7aT8Q63gXNfl6koVifoSiI7smaXc2WT0lHUt6J40fGsKfTyyd
         fQpeXz6c+KC+LBle023YZ7hL0CUxfstww5yAjY5zdRp7YT/kwUHuoLB8KGTVmMy1K+LZ
         CKLQ==
X-Gm-Message-State: AOJu0YzP8I01a7gVDN7U43vNV/c9bMxv96Ci3VwHM75H3wJd5Rwx3hiI
	PKESoHLqflHD3cN3TI54YBMCLvDnyHrYCNljuDio8TqpBPHLwHEvU1jXA+NSObJpuhe3bqAu/75
	u
X-Gm-Gg: ASbGnctRYTw0awXpDqXpf/rzzM25P4XMoPwg4Y5w1k0pDgS75oLTfYDgXhjxBw748g9
	bBnqba20Hhi+2ml4I3xeh2+WlQ7F7YvTAcr1ZpP0DSR3+hyo05uiWPRVVN9PpGqmMYvM16Q5460
	NRChUEqxBYSnmjDgZ05K4RCP+O3dZiMJj3NX+TkURNP+TF3Gr74gfE1UlDTVWWiZcIXUHT144Fk
	zd49oWSXWo0r9WpiMfpmSAL0z735t8KYYo1KIg=
X-Google-Smtp-Source: AGHT+IGWci49NEZjPmqHVxwrBPCcdkD4H+Y2XiUc2e774WSafGqb9c/yDjwOVDOg4vuwEvmeZmfP0Q==
X-Received: by 2002:a05:6a00:3c88:b0:725:973f:9d53 with SMTP id d2e1a72fcca58-725973fa0b5mr2935484b3a.15.1733344590475;
        Wed, 04 Dec 2024 12:36:30 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176f3d7sm12827805b3a.55.2024.12.04.12.36.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 12:36:30 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/15] ovmf: fix CVE-2024-38796
Date: Wed,  4 Dec 2024 12:36:08 -0800
Message-Id: <01743182b7a4bcbd47157a49da7af7b41546434c.1733344462.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733344462.git.steve@sakoman.com>
References: <cover.1733344462.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 20:36:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208329

From: Hongxu Jia <hongxu.jia@windriver.com>

Backport fix from upstream to resolve CVE-2024-38796

  https://github.com/tianocore/edk2/commit/c95233b8525ca6828921affd1496146c=
ff262e65

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-Fix-overflow-issue-in-BasePeCoffLib.patch | 36 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-is=
sue-in-BasePeCoffLib.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-issue-in-=
BasePeCoffLib.patch b/meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-=
issue-in-BasePeCoffLib.patch
new file mode 100644
index 0000000000..c6e15c5069
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-issue-in-BasePeC=
offLib.patch
@@ -0,0 +1,36 @@
+From 5f7bd3f3c4747d5bb2733f017f8c5b93b63a74e3 Mon Sep 17 00:00:00 2001
+From: Doug Flick <dougflick@microsoft.com>
+Date: Fri, 22 Nov 2024 13:03:33 +0800
+Subject: [PATCH] MdePkg: Fix overflow issue in BasePeCoffLib
+
+The RelocDir->Size is a UINT32 value, and RelocDir->VirtualAddress is
+also a UINT32 value. The current code does not check for overflow when
+adding RelocDir->Size to RelocDir->VirtualAddress. This patch adds a
+check to ensure that the addition does not overflow.
+
+Signed-off-by: Doug Flick <dougflick@microsoft.com>
+Authored-by: sriraamx gobichettipalayam <sri..@intel.com>
+
+CVE: CVE-2024-38796
+Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/c95233=
b8525ca6828921affd1496146cff262e65]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ MdePkg/Library/BasePeCoffLib/BasePeCoff.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/MdePkg/Library/BasePeCoffLib/BasePeCoff.c b/MdePkg/Library/Ba=
sePeCoffLib/BasePeCoff.c
+index 86ff2e7..128090d 100644
+--- a/MdePkg/Library/BasePeCoffLib/BasePeCoff.c
++++ b/MdePkg/Library/BasePeCoffLib/BasePeCoff.c
+@@ -1054,7 +1054,7 @@ PeCoffLoaderRelocateImage (
+     RelocDir =3D &Hdr.Te->DataDirectory[0];=0D
+   }=0D
+ =0D
+-  if ((RelocDir !=3D NULL) && (RelocDir->Size > 0)) {=0D
++  if ((RelocDir !=3D NULL) && (RelocDir->Size > 0) && (RelocDir->Size - 1=
 < MAX_UINT32 - RelocDir->VirtualAddress)) {=0D
+     RelocBase    =3D (EFI_IMAGE_BASE_RELOCATION *)PeCoffLoaderImageAddres=
s (ImageContext, RelocDir->VirtualAddress, TeStrippedOffset);=0D
+     RelocBaseEnd =3D (EFI_IMAGE_BASE_RELOCATION *)PeCoffLoaderImageAddres=
s (=0D
+                                                   ImageContext,=0D
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ov=
mf_git.bb
index 35ca8d1834..cc2ac4268c 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -24,6 +24,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0002-BaseTools-makefile-adjust-to-build-in-under-bitbake=
.patch \
            file://0003-debug-prefix-map.patch \
            file://0004-reproducible.patch \
+           file://0001-MdePkg-Fix-overflow-issue-in-BasePeCoffLib.patch \
            "
=20
 PV =3D "edk2-stable202402"
--=20
2.34.1


