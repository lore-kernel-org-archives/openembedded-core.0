Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED57C64ED6
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 08:10:06 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web10.17202.1677658199001033506
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 00:09:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ghfQXx1i;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id n27-20020a4ad63b000000b005252709efdbso1963334oon.4
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 00:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=318HlOWPiImk1nhiAuHqcP432W1HXAgyWMORrVy4SMg=;
        b=ghfQXx1iIrWe2zlaNAbOhRToPAx0PoGTjrRnCUJM9NkXnC+MWnlBuNDnO/UI7kNFh0
         4JFfM4NgLNrnpcMD9q9e3NIFsS9gCabv1UoeDFEjepgS7l27rLFfnkCJfhv4jeSlewnC
         PkNPC87gRkdVHH2siqUFth+lxF716gvLSRAUi9+vD8o4zg/E3KyVHKnJyS0nWglpi5wG
         hHj2VFaFK8jcD+6imyueL1e7wtEqQaOvT1VUvn/z1Iqlmqo60d2Wswf7JshF8ll16iey
         4+Pl0+HhZ2wMuWbMbi/g6GYVj74bal/A1dv5rNMph8Qta/JlQ6l9no5cC3KILZn2cvOg
         OhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=318HlOWPiImk1nhiAuHqcP432W1HXAgyWMORrVy4SMg=;
        b=d9a1TIKk70YsXz2zyFIXJ8CmEG9G7sIWPofgEZ6KpYH0eAiX5hYmK+aZXXEpstuKHg
         VF4vSOMVkPvqhVsaQX0MOKTCJ1HS07Jm9ERVZER6LTV0fIWl4elOhfMBLcsqd7wRDRzM
         BY8Anm5TLomrADZquQgJBY6jMFOBMVqvspTWq+KQIbr99Raj9Ut+696LIcm3MtimmZcz
         QjFCXZ5bnQh4HTlBrUC6vbj535d3/yDbeV8YiFpwj/UCSBprp7xrDkFDMI613Jtg8omX
         C++GvhwLkUQGVLC4CBr9qgN9BVAuEEr2Fc7v8hBaSgzu/bYw6F8gkwyEnQZCrp2AAp4f
         Uf/g==
X-Gm-Message-State: AO0yUKWbdiiknr12FnlvC0kJ2fKWAxajaW09kmyAtR4DPbja2CYG1N9n
	5Ndn0QBkoj3rEmx6OAyLo8qoIbjaBIUBdrpwpmw=
X-Google-Smtp-Source: AK7set8Dhz9T/azdVqEOUfyy80BP5Vdl2smLtNLbGLrOapaHP91ecEpKVRDjL10z83bHw/9R6FNGbAR4HoXnvhp5OgY=
X-Received: by 2002:a4a:ab04:0:b0:525:2b3b:7453 with SMTP id
 i4-20020a4aab04000000b005252b3b7453mr1820222oon.0.1677658198176; Wed, 01 Mar
 2023 00:09:58 -0800 (PST)
MIME-Version: 1.0
References: <20230301071703.24640-1-bindudaniel1996@gmail.com>
In-Reply-To: <20230301071703.24640-1-bindudaniel1996@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Mar 2023 00:09:31 -0800
Message-ID: <CAMKF1sroUDeD4B0guXLOHw1uM=bTDL+hb_qoPVYpmsMYTp64ug@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] gcc: Fix inconsistent noexcept
 specifier for valarray in libstdc++
To: BINDU <bindudaniel1996@gmail.com>
Cc: openembedded-core@lists.openembedded.org, bhabu.bindu@kpit.com, 
	ranjitsinh.rathod@kpit.com, Virendra Thakur <virendrak@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 08:10:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177872

lgtm

On Tue, Feb 28, 2023 at 11:17=E2=80=AFPM BINDU <bindudaniel1996@gmail.com> =
wrote:
>
> From: Virendra Thakur <virendrak@kpit.com>
>
> Backport of gcc upstream commit 2b2d97fc545635a0f6aa9c9ee3b017394bc494bf
> to gcc release 9.5.0. This fix is available to all release-branches
> except releases/gcc-9 because upstream do not support gcc-9 now.
>
> Signed-off-by: Virendra Thakur <virendrak@kpit.com>
> ---
>  meta/recipes-devtools/gcc/gcc-9.5.inc         |  1 +
>  ...nsistent-noexcept-specific-for-valar.patch | 44 +++++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-9.5/0002-libstdc-Fix-in=
consistent-noexcept-specific-for-valar.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-9.5.inc b/meta/recipes-devtool=
s/gcc/gcc-9.5.inc
> index 6a0a892b10..ec28246bf3 100644
> --- a/meta/recipes-devtools/gcc/gcc-9.5.inc
> +++ b/meta/recipes-devtools/gcc/gcc-9.5.inc
> @@ -69,6 +69,7 @@ SRC_URI =3D "\
>             file://0037-CVE-2019-14250-Check-zero-value-in-simple_object_=
elf.patch \
>             file://0038-gentypes-genmodes-Do-not-use-__LINE__-for-maintai=
nin.patch \
>             file://0039-process_alt_operands-Don-t-match-user-defined-reg=
s-o.patch \
> +           file://0002-libstdc-Fix-inconsistent-noexcept-specific-for-va=
lar.patch \
>  "
>  S =3D "${TMPDIR}/work-shared/gcc-${PV}-${PR}/gcc-${PV}"
>  SRC_URI[sha256sum] =3D "27769f64ef1d4cd5e2be8682c0c93f9887983e6cfd1a927c=
e5a0a2915a95cf8f"
> diff --git a/meta/recipes-devtools/gcc/gcc-9.5/0002-libstdc-Fix-inconsist=
ent-noexcept-specific-for-valar.patch b/meta/recipes-devtools/gcc/gcc-9.5/0=
002-libstdc-Fix-inconsistent-noexcept-specific-for-valar.patch
> new file mode 100644
> index 0000000000..506064bfc2
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-9.5/0002-libstdc-Fix-inconsistent-noe=
xcept-specific-for-valar.patch
> @@ -0,0 +1,44 @@
> +From 60d966708d7cf105dccf128d2b7a38b0b2580a1a Mon Sep 17 00:00:00 2001
> +From: Jonathan Wakely <jwakely@redhat.com>
> +Date: Fri, 5 Nov 2021 21:42:20 +0000
> +Subject: [PATCH] libstdc++: Fix inconsistent noexcept-specific for valar=
ray
> + begin/end
> +
> +These declarations should be noexcept after I added it to the
> +definitions in <valarray>.
> +
> +libstdc++-v3/ChangeLog:
> +
> +       * include/bits/range_access.h (begin(valarray), end(valarray)):
> +       Add noexcept.
> +
> +(cherry picked from commit 2b2d97fc545635a0f6aa9c9ee3b017394bc494bf)
> +
> +Upstream-Status: Backport [https://github.com/hkaelber/gcc/commit/2b2d97=
fc545635a0f6aa9c9ee3b017394bc494bf]
> +Signed-off-by: Virendra Thakur <virendrak@kpit.com>
> +
> +---
> + libstdc++-v3/include/bits/range_access.h | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/libstdc++-v3/include/bits/range_access.h b/libstdc++-v3/inc=
lude/bits/range_access.h
> +index 3d99ea92027..4736e75fda1 100644
> +--- a/libstdc++-v3/include/bits/range_access.h
> ++++ b/libstdc++-v3/include/bits/range_access.h
> +@@ -101,10 +101,10 @@ _GLIBCXX_BEGIN_NAMESPACE_VERSION
> +
> +   template<typename _Tp> class valarray;
> +   // These overloads must be declared for cbegin and cend to use them.
> +-  template<typename _Tp> _Tp* begin(valarray<_Tp>&);
> +-  template<typename _Tp> const _Tp* begin(const valarray<_Tp>&);
> +-  template<typename _Tp> _Tp* end(valarray<_Tp>&);
> +-  template<typename _Tp> const _Tp* end(const valarray<_Tp>&);
> ++  template<typename _Tp> _Tp* begin(valarray<_Tp>&) noexcept;
> ++  template<typename _Tp> const _Tp* begin(const valarray<_Tp>&) noexcep=
t;
> ++  template<typename _Tp> _Tp* end(valarray<_Tp>&) noexcept;
> ++  template<typename _Tp> const _Tp* end(const valarray<_Tp>&) noexcept;
> +
> +   /**
> +    *  @brief  Return an iterator pointing to the first element of
> +--
> +2.25.1
> \ No newline at end of file
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177870): https://lists.openembedded.org/g/openembedde=
d-core/message/177870
> Mute This Topic: https://lists.openembedded.org/mt/97309533/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

