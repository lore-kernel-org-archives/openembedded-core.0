Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFBA9D6ACFD
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 18:24:41 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web11.78496.1732731871427173643
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Nov 2024 10:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=z7LlVZkY;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.181, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e396e33d47dso312268276.0
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 10:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1732731870; x=1733336670; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MzJRsotlahE097GnstD9jvlmDoenssM1MRrhtBmctHY=;
        b=z7LlVZkYTtuOtt6cW1kuQ/yH4aCJCbh+qqVL7chdogvp5rVSoSEoKaOhMY3UUJ/UGo
         toF/yT5nI3lL4YpsQDJXoLhz/nW4ihDMWzIfc5VAzfoHFY7LTX58yO8PQ7zVB3LOSk6U
         38Sni0l33wfAFh5+fnVtaQnMDuGOOFQd/uQGprockVvypfcGSGECXA+pgWG41lsb0jSR
         fyvLqugI6KYjNhpL7E73C7GihWVsv+lcO1NoMOABW8+2mHZOv4OJMT5H5V/w4By8y2Gu
         /icZagEKdWLGvtWUYazLR+16X/vcKdcWjTU9jg1iyoEV3hyLKKhzaDTDMyGY2wjU6f+G
         iiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732731870; x=1733336670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MzJRsotlahE097GnstD9jvlmDoenssM1MRrhtBmctHY=;
        b=T9OU0VorjHEUHoleY99thyKLxEii934Cu0RrH7iI9BPwf33zAY9kkbq2RKEH1qDgco
         VxtBQiBW/V9+2WQlIVx8ZfhVPOKUjZkXD+G+APcqLnJakst2IJoC9RqCXgdjKdfY66Rg
         b792oKq5EYdhYJaB4kfLA/WLSdPBaI7mF1MFs55Pcw0KPE2HcOrJowQL9Rx6cpqMZLlO
         WcvjTnk6uUMRbC4alvonmW9KLMBwDVrSPH/FTFTseYVibWknfTL+R1Dx5VSZODiPrlAb
         huypIXknMQAZCOuBRhulfZivMWe1DNOjBuGm+luKNd83nDsKdZggr+TJ1MV0vQxDDvW9
         VYAA==
X-Gm-Message-State: AOJu0Yx9GyB3Ht/YNoy+QNRBHG8xbBJboJ93oMqqCjjsJv8ihL0PTWjj
	RRxhNHMc66FiEU6Q6YjC1cYsxnr9Y6yqweOC1oGPKhAZJokr0WfGhEq/gVlaUh/f5X/0FR57NqF
	9xn4Do9oADabrvdv5xDdhceL03iN9pi9msDw9VsGDviJ9GXKB4TQ=
X-Gm-Gg: ASbGnctTR4RwgstMsPzVNgPBDCbq5oljGbxhS7b4WVBsZZFTXSGN6SmMBwBBb6K3M+2
	k386KviSCYVKZRirHfrpWy8CG8KkpEyk=
X-Google-Smtp-Source: AGHT+IHR4icaQ6jDwCViFGe0221UfXfeYHDc9Ak43NYHts0RzXCp9LIElYSnmtZXX0+ROzYDzK+lxP8f0nzmYWkmqhs=
X-Received: by 2002:a05:6902:1008:b0:e38:f293:5b72 with SMTP id
 3f1490d57ef6-e395b86a147mr4205249276.5.1732731870483; Wed, 27 Nov 2024
 10:24:30 -0800 (PST)
MIME-Version: 1.0
References: <20241126032653.326194-1-hongxu.jia@windriver.com>
In-Reply-To: <20241126032653.326194-1-hongxu.jia@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 27 Nov 2024 10:24:19 -0800
Message-ID: <CAOSpxdYdYuymtPpcXGtp2FfjwJXuZQYh4jNxqb-fE4mg-X=_yg@mail.gmail.com>
Subject: Re: [scarthgap][PATCH V2 1/2] ovmf: fix CVE-2024-38796
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Nov 2024 18:24:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207941

I'm also getting build time errors on the scarthgap version (also
seems to be line ending related):

https://errors.yoctoproject.org/Errors/Details/836555/

Steve

On Mon, Nov 25, 2024 at 7:26=E2=80=AFPM Hongxu Jia <hongxu.jia@windriver.co=
m> wrote:
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
> 2.25.1
>

