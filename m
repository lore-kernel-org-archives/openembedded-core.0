Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 737E2CCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 19:00:41 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5617.1762455637896861827
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Nov 2025 11:00:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ACN3N8nZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-4500a6fb71aso306768b6e.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 11:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762455637; x=1763060437; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1rxGIvzs2028HmpidwcTMDS5UmAPA+b6QBxffm7Kz8=;
        b=ACN3N8nZG2LH0DXCid+81cxKUyXyykRvSUpjacFhxYz6XAlBC0GdmaDo5JTKVkRMkn
         7o4zZy1oP1mji+hV5JJ24W/9Za/jinOnIdlKp2VTBWUgSBy96HOv9TqhZ9h3WZxajEA5
         LLO33buRbCt+w8+ythoEqKtYPsur7DAjLG1NKmVx7JboB7Oc8Pbcf5MMKs8CxXKHUjNp
         c1BBhOPwC8PkdmvntTKLm2YMHpCq4fwD9BfkvQnUwj+Qzk7YTd7dMDtYQcb0/Zc5D/cJ
         cb+PaDJr9sSRgekc5BBtWcpCWbgzBaE6sy4CMvO6arPZlqncO3+OyHF+RwZiIXz9Awm6
         WSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762455637; x=1763060437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b1rxGIvzs2028HmpidwcTMDS5UmAPA+b6QBxffm7Kz8=;
        b=C1TKLo7NkH3T94XqRoiuqg5z2kpOh998hm6F6hLfCTUxag2udrj1vdfPjFj8BoBbjn
         Gr71Mh48RKtg0MqnRsvs4IXYseV3QK5ybbHCisyEx3UghgxLo4lFv8x72lN/MzfY4lJh
         gEkZb9RP72fsMy+SmoQcyd7MbrOLo/eZz3mjnOcAaJ3SjkEPEOGX67b06xoWO3/Fs8pG
         Gk3QLzD1wbJjNCku9p19pQAM2dOVfe20ZDdGK68yKQV5oJWf+Qc3GfKFaMX/u3SoC5WY
         3VARAJLKRxFrJ/xyrw7wHpxMTrNxeKdqk1ByP7dEcwXiQs4xJNwG9szsK4qQE4iyxOtt
         mYyg==
X-Gm-Message-State: AOJu0Yy6wqzyGSt/QPT/Cg3PCampvrLwapp4ueF21YdXRgr7jyu03cvw
	UHPz14MAssx829B4B8egmh8nQgDjsTJ5nmHUSvUFKvlgpjE2wuXFIRVppUYOQrg/QtMETYcN42D
	+dj//EDDdeCBzchziDwRa5K2otCNvaFI=
X-Gm-Gg: ASbGncvyeAt7NKj79AusMmhjhDCRgWBhP0qN+moN2L+6VxNMaHwre7zfBG41s9o0gl9
	NnjVQXFhPHpBRPvnSMA3apYZymWeziWfMF3S7ukZ3rgou8KCNtOWonrOzsi7B82R2P+xeTOe/AL
	18si9As2B+rIIesZytklOIZYk96tvNoQudoBi5qlQe/NRokL5L2WHYR5Vn48ireVdIr5s9hix2K
	u5Ssvzg/eN0piUCTQUWDoxnNtgUfz0xXiJz31r59hoE7cochve4yDkELBqN+OU7Wv6KIa11jA==
X-Google-Smtp-Source: AGHT+IHWCQlFMpluO4PbDoZTLyI2fBRwZH2ytZJjjPcFqdNofPxQ+IEroR1FFIx4XBhHaN0PYC/EghkXvqgZxxm3Xy0=
X-Received: by 2002:a05:6808:30aa:b0:44d:aa8b:58f4 with SMTP id
 5614622812f47-45015f4105emr232045b6e.45.1762455637042; Thu, 06 Nov 2025
 11:00:37 -0800 (PST)
MIME-Version: 1.0
References: <20251106181103.515146-1-raj.khem@gmail.com>
In-Reply-To: <20251106181103.515146-1-raj.khem@gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 7 Nov 2025 08:00:26 +1300
X-Gm-Features: AWmQ_blB95zE1P2vi1aWvdldnv-3uqekH2rANtxfrPkWF3b1mi0kTNrzMpv0kMk
Message-ID: <CADySD0G4DAJ2Cjudf_jx0=vBR23W6LB-qxRNqXeL-m5Uas+7rA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libclc: Add misssing quotes around target list
To: raj.khem@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Nov 2025 19:00:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225988

On Fri, Nov 7, 2025 at 7:44=E2=80=AFAM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> Defualt for LIBCLC_TARGETS is `all` so a single

there is a typo -> "Defualt"

> target is ok but when its overidden with a semi-colon
> separated list to use a subset of targets, e.g.
>
> LIBCLC_TARGETS:class-nativesdk =3D "amdgcn--;amdgcn--amdhsa;nvptx--;nvptx=
64--;nvptx--nvidiacl;nvptx64--nvidiacl"
>
> cmake rejects it.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/clang/libclc_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/clang/libclc_git.bb b/meta/recipes-dev=
tools/clang/libclc_git.bb
> index 60909339e70..c4b4881542f 100644
> --- a/meta/recipes-devtools/clang/libclc_git.bb
> +++ b/meta/recipes-devtools/clang/libclc_git.bb
> @@ -21,7 +21,7 @@ B_NATIVE =3D "${B}-native"
>  # Semicolon-separated list of targets to build
>  LIBCLC_TARGETS ?=3D "all"
>
> -EXTRA_OECMAKE +=3D "-DLIBCLC_TARGETS_TO_BUILD=3D${LIBCLC_TARGETS}"
> +EXTRA_OECMAKE +=3D "-DLIBCLC_TARGETS_TO_BUILD=3D'${LIBCLC_TARGETS}'"
>  EXTRA_OECMAKE:append:class-target =3D " -DPREPARE_BUILTINS=3D${B_NATIVE}=
/prepare_builtins"
>  EXTRA_OECMAKE:append:class-nativesdk =3D " -DPREPARE_BUILTINS=3D${B_NATI=
VE}/prepare_builtins"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225985): https://lists.openembedded.org/g/openembedde=
d-core/message/225985
> Mute This Topic: https://lists.openembedded.org/mt/116157847/3619737
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [an=
kur.tyagi85@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

