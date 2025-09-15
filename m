Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B11CCA101F
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 05:15:34 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web11.25600.1757913324352921510
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 22:15:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=C+7wVEQc;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-71d60110772so29741847b3.0
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 22:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757913323; x=1758518123; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPCEpOB2B1kj9s+LyZm8IbqoFFvVyFMQC6klxecgf80=;
        b=C+7wVEQcPA8ApYnrMzxdFcc0GG+t6j1UgInS43BqwLrfWs8euStyceG+fvYRkMuI+t
         ikhfjVM6C3yoekBqqW0I1n8izQ7XEpAiTDkNwF+uNEDq/wXAhV0+sm21YP6Cyd+FYh6Z
         u9QDEFj8Xst1PPF3ZkcQyvVM01SN2TDqE9RbeP3vWFD+dJ9QsQcOYHrYS2UKP8WMmRXF
         rloeWAdA24hhYUzGCG4uFSx8grI54AkYiRyZFLP+inK+AXCWRNf7H2FfJRepu2w2phkT
         jtNMLFXqW8PevmPds9idQbdqAeMkFWp8CJZ7UwwH3NYFWKu4c7fTt6N9/r22rMjPkNSD
         GfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757913323; x=1758518123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPCEpOB2B1kj9s+LyZm8IbqoFFvVyFMQC6klxecgf80=;
        b=uSswX/zPwL5ETpDWhkz4lAO5RhgBSNLneT6PFFXotXeQlBJbROhQBiI6WRDGpwqz39
         RR1qc2swrTB/OY3EYq4bcnbxUgZGjchy5hcbzFvaKDVDpW946It/1RqN9uJRltYMbjqE
         SuwPWxhO7AvvOJQA3XYnODFu4dzQc54ioOsDEI1MROGugoakm4cl5IGmVonO8GvKtT9C
         XeziQcEWky/zJ4VRdri/UX2Y8O8zFHVeVT7V+/NY5bKz1mzZNq1S5gV8Ceh14vqE3SGc
         0bws2R7WfmH7ROB0e+YqGAR71jpER/DYaYQRF0S4r8JIoMrgeudlziebXULINtDt/HKP
         Guwg==
X-Gm-Message-State: AOJu0YwAmzYeIRpYV56gT4VrqDUriHqhJDIbG0jgrSlC1OGGnPrsya+v
	OcGyeTIqA8Io+WJNZtp5hYEBaCuAmbAFgaoMxiHMNzC4vtF90BuP2JhBRX8/nII4/qc2Erdx/3b
	KOT3YZNCgANq29+1V28pws4Azpk6YBtUU5TuD
X-Gm-Gg: ASbGnctvJCYxT8oaGW4w5Lq+tcxKydGkkIXHSKMCbxpvGrR5z1hlrjWm+z6pzPDtHvI
	rSTRYW4tg1ldc51Sj0QIlljtX6pv3wtlBNSKgn/jkQuM9Ig0/KCwJcgDDfpsmGC/8PhQ77ty9ly
	n/nMUbrCG4tXyv+UjvHZ4XWZ6W5kD5dfm+lYpoiaRYUpSP+NugMpRkvy+xG5xdan7Ylhd4OdHJz
	DCQNCKefQzAEDCHRFnhSRloZTb08I2ntQgcI+9aNLfXITp3HpPpFsqFHmU5We5FECoZQpmeN6ZS
	6astoIe9FmAbp4Z+pzyrmGVxNy/cAsz52d/t/NqC2Vl06kVNsc4pX5uEB3uChHkxtGeJ
X-Google-Smtp-Source: AGHT+IGYmJ4XFyuuymkA1lgyscHqvudMcs+vLlKlA+pu3Nh+6oBY3i1U5FnALH2boupPO9bklswk1bUXYPtrMa+EmmQ=
X-Received: by 2002:a05:690c:6811:b0:71f:b944:1019 with SMTP id
 00721157ae682-730652d819amr89973487b3.52.1757913323369; Sun, 14 Sep 2025
 22:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250912143038.3345369-1-ross.burton@arm.com> <20250912143038.3345369-2-ross.burton@arm.com>
In-Reply-To: <20250912143038.3345369-2-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 14 Sep 2025 22:14:57 -0700
X-Gm-Features: Ac12FXwIRUirYNVWrVmsud0NBWD2qBGXdcVtPUntGEkXrkJlk_apLXM63BVwB-4
Message-ID: <CAMKF1soLyDVzZ6ridzFtqTBzNX7qwOiJcxh0u0q=7JgVsZuNbQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/6] clang: disable all test targets
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 05:15:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223373

On Fri, Sep 12, 2025 at 7:30=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> We don't install the tests, or run them in the build tree, so tell cmake
> not to generate the targets at all. This removes internal dependencies
> which means we can turn off more components that we don't want.
>

Hmm, there is a plan to enable running ptest support to clang, it will be g=
ood
to keep that in mind while we add this, so we do not have to redo things ag=
ain.

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/clang/clang_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devt=
ools/clang/clang_git.bb
> index f53ecbfe398..09dda563bd3 100644
> --- a/meta/recipes-devtools/clang/clang_git.bb
> +++ b/meta/recipes-devtools/clang/clang_git.bb
> @@ -120,6 +120,7 @@ EXTRA_OECMAKE +=3D "-DLLVM_ENABLE_ASSERTIONS=3DOFF \
>                    -DLLVM_EXPERIMENTAL_TARGETS_TO_BUILD=3D'${LLVM_EXPERIM=
ENTAL_TARGETS_TO_BUILD}' \
>                    -DLLVM_NATIVE_TOOL_DIR=3D${STAGING_BINDIR_NATIVE} \
>                    -DLLVM_HEADERS_TABLEGEN=3D${STAGING_BINDIR_NATIVE}/llv=
m-min-tblgen \
> +                  -DLLVM_INCLUDE_TESTS=3DOFF \
>  "
>
>  EXTRA_OECMAKE:append:class-nativesdk =3D "\
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223314): https://lists.openembedded.org/g/openembedde=
d-core/message/223314
> Mute This Topic: https://lists.openembedded.org/mt/115206857/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

