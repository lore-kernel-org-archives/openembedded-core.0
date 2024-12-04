Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DE8E77178
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:54:45 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.21196.1733334877404854001
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:54:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=Lqx62FrX;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7fcdb53d849so60528a12.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334877; x=1733939677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R86+1f2BqeCIyUrkGojdMpZUbYnS7SgJ/6IrCorA8tI=;
        b=Lqx62FrXk5YkvOAmnjMvDQVwY6BHs4/zXCfvDZdqhUxBw4KpuzJu1hJzOl3/Px5CZD
         dXbDP+1mxRvB+ekGEjTqpekAGc2k0EEACqcbcm+jSBA3MBsZ8inD74WZpC2nFqiELU2k
         LRdRxmMpp+Dk7IRmBAOsRRb38MIefikSMOOYlIvCzm2l/dXYXpGg80HmunnKmpBerX0z
         O44Sq1Wi2RCQANIRp/E/eeOB8OjALAhEjlMn/SwJ2+MzOn+uo+5AZy/G2dnFshQrE6EK
         NSjmVWtGnBjFMQLoxnArO6TCUbeF/W3Xf+l+opsryp9pAApYqnOTfbIauxptvpHhFTTO
         np9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334877; x=1733939677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R86+1f2BqeCIyUrkGojdMpZUbYnS7SgJ/6IrCorA8tI=;
        b=dh5BB7r6wtlN34ujIQK/T7QQiSLDKcEYoj5/Vb36EKoNSfg6flIeOVJA9B53NT3k1h
         ZR8fqASBXg6Z2+QldA5Ai+Gy2H5hKrkvq0pfx/YWbVZS8QF3Pwyf1Ycrcn77Ri/QhsQs
         uhrST7sxEWOqs7qupIRv2yE4Q2rL0csz2KUP3wromeJFGCDFdxVAc1AQzdoyvuzkDh+r
         ctUtVQA+ENOLU9Dk49EdTXzXQ/k8cSgGrThHgeEDT+cO2e1671nGkcb1QjZ5btsXIg3D
         CsDjuCpIW1Km4Z0Q78m+BRUQByVhXNPUryWa/SLnirJk9so5N07zxUF5anTg17MixKvO
         joBg==
X-Gm-Message-State: AOJu0YyifkgcKsc7FHFWGeR2gW6nUQianNdolGpoVamE08M7t4ECjmXa
	7F6t5mKrFdEvWAId/qobHszqn07qVpPEZGaiANrXY712FhCMi5w59NlW6rUukkziU62hwXvSRO9
	p
X-Gm-Gg: ASbGncshk+hPUXVerE85+ZzMPuEjCQL+XjkOzl79q8WJXF2scRaqCP8TJVzwlKoMHQ7
	dUi9Qb+QbXkQMl687E9uXvpX8oLSZFWE2G9ZZyFpX22Bu7U12vBRYtb6r3CCzRylf01mGk5Ztny
	oE4LNPqFZXQnZ9w1g7ZZst39tDRtvfkAFYaRT+6V28CYBZep1d6M8n4xkrswLPQ1h5rKyLWS9MT
	X5dj8rS5y2aRyHJtT/RVotEEgJmZ7wA3mbLyZU=
X-Google-Smtp-Source: AGHT+IEoM4Oip0z1/rNHLWzqOSWA4nIkRKp5H7eaVml2VJSQBAlnC1+UXZQDfxNONjuv6fDlbhuS5A==
X-Received: by 2002:a05:6a21:33a4:b0:1db:e82e:c802 with SMTP id adf61e73a8af0-1e16bef4882mr8821724637.41.1733334876633;
        Wed, 04 Dec 2024 09:54:36 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.54.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:54:36 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 12/38] ovmf: fix CVE-2024-38796
Date: Wed,  4 Dec 2024 09:53:39 -0800
Message-Id: <c3d1be52b4dc18e6980bf6c3f2e2cb7fba9f986e.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208295

From: Hongxu Jia <hongxu.jia@windriver.com>

Backport a fix from upstream to resolve CVE-2024-38796

    https://github.com/tianocore/edk2/commit/c95233b8525ca6828921affd149614=
6cff262e65

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...-Fix-overflow-issue-in-BasePeCoffLib.patch | 37 +++++++++++++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-is=
sue-in-BasePeCoffLib.patch

diff --git a/meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-issue-in-=
BasePeCoffLib.patch b/meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-=
issue-in-BasePeCoffLib.patch
new file mode 100644
index 0000000000..8d36bdf1c1
--- /dev/null
+++ b/meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-issue-in-BasePeC=
offLib.patch
@@ -0,0 +1,37 @@
+From c4d6af8428375c0343fcfd20bf1465e6d4be4690 Mon Sep 17 00:00:00 2001
+From: Doug Flick <dougflick@microsoft.com>
+Date: Fri, 22 Nov 2024 17:44:27 +0800
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
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ MdePkg/Library/BasePeCoffLib/BasePeCoff.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/MdePkg/Library/BasePeCoffLib/BasePeCoff.c b/MdePkg/Library/Ba=
sePeCoffLib/BasePeCoff.c
+index 6d8d9faeb8..2339b111b5 100644
+--- a/MdePkg/Library/BasePeCoffLib/BasePeCoff.c
++++ b/MdePkg/Library/BasePeCoffLib/BasePeCoff.c
+@@ -1014,7 +1014,7 @@ PeCoffLoaderRelocateImage (
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
index 1dba709824..e626d306a4 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -53,6 +53,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://CVE-2022-36765-0001.patch \
            file://CVE-2022-36765-0002.patch \
            file://CVE-2022-36765-0003.patch \
+           file://0001-MdePkg-Fix-overflow-issue-in-BasePeCoffLib.patch \
            "
=20
 PV =3D "edk2-stable202202"
--=20
2.34.1


