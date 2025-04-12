Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 857BDC369AB
	for <webhook@archiver.kernel.org>; Sat, 12 Apr 2025 18:02:39 +0000 (UTC)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
 by mx.groups.io with SMTP id smtpd.web10.15624.1744480958304819110
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Apr 2025 11:02:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OlWMdZwS;
 spf=pass (domain: gmail.com, ip: 209.85.161.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-601a8b6c133so1829675eaf.1
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Apr 2025 11:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744480957; x=1745085757; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrZS+snVlFnr/3VDls6ZmHGouZk+BwdJxh8UG/7i1Z8=;
        b=OlWMdZwS86eY6rMLDmaTbWvlMV8Q8HM1e9FXCMFQXpt9TE/zbJbTjzYwIdcr37eWVx
         LcxKUMbd2H9yYkeD+0MAN+CaafWglLVRWPfsQl/BOAYnQsjZVz7HZiMDNW1yFEUlEHNO
         uAyuqhnJBD42Y3rTdh/W9rvYDV/ev+0fz0dQGRju5zkETCCjuX5v/diG7Iq7EA9qb4uo
         e4HSRNXWyv+Tn3J8B1dQFhMdHdLeUX7Git2xtAMajbi43wyvavC+lYoUajF59loNNBDO
         lvwub2/wFeVCw6khHBSxQv5Qaf/bikbzD4vE177flr/6PcVOPLR+jKl1E1lsBOxkjv9y
         EOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744480957; x=1745085757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nrZS+snVlFnr/3VDls6ZmHGouZk+BwdJxh8UG/7i1Z8=;
        b=YOsp4LU0Z5edMn0F0HrtoKGkjnLJc72BSpLDRalionRnXwCnAzPSU8twwFNNV0FUFX
         69BVX+7b7dIsf3rf8orWmHECtjz7N0ebNHgrJ0N1cFbwe3BHPWSy1t+tK6C0SzcPFhvN
         6RhpSmfKTanU4wlHbwcmbx1CqH3D6Zmr25XoO2fqckWqdyPyWxD+0bHMTmjBn/d6r/7+
         rzmADqNRBYQA95u3ewmBULGsxOr0LPo70aVpFho9Eon+cox9q22BzttKvKttPnYW1XIa
         hNpw82PeYK0+up5Em6l+CpYMH6WGtOLm5o9JUSDmVD3nGH42kRFRJa2SKKaivIxdXahL
         ry3A==
X-Gm-Message-State: AOJu0YxM+BGIgIwK3gFwaSoccCvS+kYknAhiNGg4u5m75LtwGRtMJ2I8
	nINixTKapW26ofsBoNLjmYOdA/x5mRrR3ESKIkSsFosKHhWwF6m4rgicREdrHZt2OlN3QKvSRfG
	eR9RJ6QLooZfKpi8wg7dtJaWtkYM=
X-Gm-Gg: ASbGncswZS3WEG2Dgvz+EcbT20uP1M/bY6+ctYMUkcBiItqPfDPGg1+78nRnmrACQpx
	yX+Kj+U3hOxcOAEIv1PTQGbQjpfvJAqwoXdHz8dBsECoH/bYdz+lsZdF/I+h0moqvk3Jstp8ble
	NPnfSlWn4sbFVSIEbvGcoI
X-Google-Smtp-Source: AGHT+IExWVQc6ncxepLuLI1q6pGweadhNsc9Jpb5VqHhaJaiU7VaJfox/gmIKk2e37CWcbsKFK68xPbi0t5H95eekwI=
X-Received: by 2002:a05:6820:8107:b0:604:a5f:a1ff with SMTP id
 006d021491bc7-6046f01a80amr4073507eaf.4.1744480957340; Sat, 12 Apr 2025
 11:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250412-mesa-25-fixes-v1-0-791840391271@oss.qualcomm.com>
 <20250412-mesa-25-fixes-v1-2-791840391271@oss.qualcomm.com>
 <CAMKF1sqFzfsPgr0LJbGY3djKGGBa9hJD6rYNVC+oT9eP9Cjpsw@mail.gmail.com> <7df3cee7-99e4-464f-9638-befaab4a097f@oss.qualcomm.com>
In-Reply-To: <7df3cee7-99e4-464f-9638-befaab4a097f@oss.qualcomm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Apr 2025 11:02:11 -0700
X-Gm-Features: ATxdqUFqX_55p4ozpN1FP46-uWPBkzuVdgZfTaIvRjCj4Xb1v5yli5gGMDP-rkQ
Message-ID: <CAMKF1sqZNHB+AV7_FLBzJfonLTxtrBo_+d5yfC+cF3_eChW6EA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/7] meson: pass -target and -I to bindgen calls
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Apr 2025 18:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214779

On Sat, Apr 12, 2025 at 9:29=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On 12/04/2025 01:53, Khem Raj wrote:
> > On Fri, Apr 11, 2025 at 3:09=E2=80=AFPM Dmitry Baryshkov via
> > lists.openembedded.org
> > <dmitry.baryshkov=3Doss.qualcomm.com@lists.openembedded.org> wrote:
> >>
> >> In order to properly generate Rust bindings for the target systems, we
> >> need to pass '-taget foo-linux-gnueabi' flags and a correct include
> >> target include path (${STAGING_INCDIR}) to the bindgen. Add those
> >> flags to the generated meson target file.
> >>
> >> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >> ---
> >>   meta/classes-recipe/meson.bbclass | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/m=
eson.bbclass
> >> index cbfc45b94bbd076735847134a0976b6b30784d50..ef45a034a767e979a45553=
ba08e46dc90e34f33f 100644
> >> --- a/meta/classes-recipe/meson.bbclass
> >> +++ b/meta/classes-recipe/meson.bbclass
> >> @@ -93,6 +93,7 @@ cpp_link_args =3D ${@meson_array('LDFLAGS', d)}
> >>   [properties]
> >>   needs_exe_wrapper =3D true
> >>   sys_root =3D '${STAGING_DIR_HOST}'
> >> +bindgen_clang_arguments =3D ['-target', '${@d.getVar('RUST_HOST_SYS')=
}', '-I${STAGING_INCDIR}']
> >
> > I think its better to use ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS}
> > --target=3D${TARGET_SYS}
>
> Using ${TOOLCHAIN_OPTIONS} breaks x86-64 build with the compiler being
> unable to find headers. I'd rather stick to the patch I have posted.

You have to use ${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} and --target=3D${TARGET=
_SYS}
together, OE's compilers do not deal with 'hf' from target tuple but
TOOLCHAIN_OPTIONS decide
the ABI, please try both of them together.
>
> > here
> >
> >>
> >>   [host_machine]
> >>   system =3D '${@meson_operating_system('HOST_OS', d)}'
> >>
> >> --
> >> 2.39.5
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#214764): https://lists.openembedded.org/g/openembe=
dded-core/message/214764
> >> Mute This Topic: https://lists.openembedded.org/mt/112219030/1997914
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>
>
> --
> With best wishes
> Dmitry

