Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75212D75E59
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 14:32:06 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.25776.1732285923726929770
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 06:32:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=E9x3SPik;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.180, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e38158560d4so2104886276.2
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 06:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732285923; x=1732890723; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+JQ60k0tLFcpSLxciBYovsCpZvwa0mY2IEyV1enGcs=;
        b=E9x3SPikOOYp2OkTYcxet/S6pYVHU0Nu4s57LVLKuf4M2v9em5p76ATW37Xm2zGgNr
         qNZ1O+BDpBftsoZD60LF8M7KjkWQ/hC7odk6e+0w1dftCpcgbBufDDp4wJRR/k50dLFr
         RXXlm++WhSWEO19FPMZS1kVtebFTc33CTyvSmaWvQwXr922dbkArWyxDdo5Gi9XWLhsR
         Fyyq7DS/XGkiTY2/U9mBFZM9SFXNuNbVyPqR+jqe42L5KuTOCMqnqOz0VYLE2pfVwZe6
         MElsla10Xmao96OKcOwO8LCcmGEc+HJB8W+hSwgPBMJT7JBy8a857Zp0HEoD1Faf0qdX
         7Xcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732285923; x=1732890723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+JQ60k0tLFcpSLxciBYovsCpZvwa0mY2IEyV1enGcs=;
        b=Zj9lwSWtxlcLEPcqTnGooSuo4DgBvM8Jl5/27u30oDZ196tdLkjyZcAd8F33j2/9W2
         gb48yT7ZKF75PliCAoYOWRhE8TD4M5IcTKHSfTZa2H9qnX5s03rC2E5pIngyUvW7rxyv
         m3mB7rqH29JclMBrl/9joA7qRR62eJrxtJ7sQxpM3RyqApo1LYwRRxDW8KbQRtsR4pCM
         hE4TPV3eHSf+kCyxvqtw2A9IEHyviX10h5SunJGvLB+ycePt5fk54Nt8GTYz/CbqmB7R
         zM1oWXNmk9k8WW5AMqRTiAPV3mrFsmF8hineRQM5etrYCd6dxKus/bxizZrdsHbCo7Ua
         pihw==
X-Gm-Message-State: AOJu0YywJtpUNQeHM+aeFQb2JPr+27JpJUavSQXhcGjgwk5/0Lx9573Q
	sH1SI8lQFyrHjr+i4zA00W9Se6sH8vWKTRS3Yks1Jh4N8wU8k9RgbplERYTWta4+fsjgCg9dHZ+
	17f5YAqHAgoixA1Y1BNb+f24ORYNqO51uh4RAAIzNoR5IGrOG
X-Gm-Gg: ASbGncvKylSSbFLYJ8ZlXQpt7uQrNJi4ecaLD9ueQBB2s6L4j9VRHJu5oTCyBby9GSh
	fp9v5z9yuvJM8YJ5f+b2KNv3bfDLltl8=
X-Google-Smtp-Source: AGHT+IFQK+YA1jwOELZInAA428TK3wP233E6J0XBV5ECVl1h06DKjxZc6PMzeH0if/EuWi5nI/uLo4rv5cvo0VUgXUc=
X-Received: by 2002:a05:6902:1501:b0:e25:ca37:b669 with SMTP id
 3f1490d57ef6-e38f8b21571mr2716437276.24.1732285922835; Fri, 22 Nov 2024
 06:32:02 -0800 (PST)
MIME-Version: 1.0
References: <20241122051749.1260019-1-hongxu.jia@windriver.com>
In-Reply-To: <20241122051749.1260019-1-hongxu.jia@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 22 Nov 2024 06:31:52 -0800
Message-ID: <CAOSpxdaLUbcJ7UZv15VYQG1s=HgRWa9huu-az9ekiy1dxCADbA@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH 1/2] ovmf: fix CVE-2024-38796
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 14:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207621

These patches don't apply to the specified branches.

I *think* you may have swapped the branch names in the subject line.
Could you please verify and resubmit a v2?

Thanks,

Steve

On Thu, Nov 21, 2024 at 9:18=E2=80=AFPM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> Backport fix from upstream to resolve CVE-2024-38796
>
>   https://github.com/tianocore/edk2/commit/c95233b8525ca6828921affd149614=
6cff262e65
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  ...-Fix-overflow-issue-in-BasePeCoffLib.patch | 36 +++++++++++++++++++
>  meta/recipes-core/ovmf/ovmf_git.bb            |  1 +
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-=
issue-in-BasePeCoffLib.patch
>
> diff --git a/meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-issue-i=
n-BasePeCoffLib.patch b/meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflo=
w-issue-in-BasePeCoffLib.patch
> new file mode 100644
> index 0000000000..c6e15c5069
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/0001-MdePkg-Fix-overflow-issue-in-BaseP=
eCoffLib.patch
> @@ -0,0 +1,36 @@
> +From 5f7bd3f3c4747d5bb2733f017f8c5b93b63a74e3 Mon Sep 17 00:00:00 2001
> +From: Doug Flick <dougflick@microsoft.com>
> +Date: Fri, 22 Nov 2024 13:03:33 +0800
> +Subject: [PATCH] MdePkg: Fix overflow issue in BasePeCoffLib
> +
> +The RelocDir->Size is a UINT32 value, and RelocDir->VirtualAddress is
> +also a UINT32 value. The current code does not check for overflow when
> +adding RelocDir->Size to RelocDir->VirtualAddress. This patch adds a
> +check to ensure that the addition does not overflow.
> +
> +Signed-off-by: Doug Flick <dougflick@microsoft.com>
> +Authored-by: sriraamx gobichettipalayam <sri..@intel.com>
> +
> +CVE: CVE-2024-38796
> +Upstream-Status: Backport [https://github.com/tianocore/edk2/commit/c952=
33b8525ca6828921affd1496146cff262e65]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + MdePkg/Library/BasePeCoffLib/BasePeCoff.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/MdePkg/Library/BasePeCoffLib/BasePeCoff.c b/MdePkg/Library/=
BasePeCoffLib/BasePeCoff.c
> +index 86ff2e7..128090d 100644
> +--- a/MdePkg/Library/BasePeCoffLib/BasePeCoff.c
> ++++ b/MdePkg/Library/BasePeCoffLib/BasePeCoff.c
> +@@ -1054,7 +1054,7 @@ PeCoffLoaderRelocateImage (
> +     RelocDir =3D &Hdr.Te->DataDirectory[0];
> +   }
> +
> +-  if ((RelocDir !=3D NULL) && (RelocDir->Size > 0)) {
> ++  if ((RelocDir !=3D NULL) && (RelocDir->Size > 0) && (RelocDir->Size -=
 1 < MAX_UINT32 - RelocDir->VirtualAddress)) {
> +     RelocBase    =3D (EFI_IMAGE_BASE_RELOCATION *)PeCoffLoaderImageAddr=
ess (ImageContext, RelocDir->VirtualAddress, TeStrippedOffset);
> +     RelocBaseEnd =3D (EFI_IMAGE_BASE_RELOCATION *)PeCoffLoaderImageAddr=
ess (
> +                                                   ImageContext,
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/=
ovmf_git.bb
> index 35ca8d1834..cc2ac4268c 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -24,6 +24,7 @@ SRC_URI =3D "gitsm://github.com/tianocore/edk2.git;bran=
ch=3Dmaster;protocol=3Dhttps \
>             file://0002-BaseTools-makefile-adjust-to-build-in-under-bitba=
ke.patch \
>             file://0003-debug-prefix-map.patch \
>             file://0004-reproducible.patch \
> +           file://0001-MdePkg-Fix-overflow-issue-in-BasePeCoffLib.patch =
\
>             "
>
>  PV =3D "edk2-stable202402"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#207588): https://lists.openembedded.org/g/openembedde=
d-core/message/207588
> Mute This Topic: https://lists.openembedded.org/mt/109718092/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

