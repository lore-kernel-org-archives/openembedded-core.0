Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17CAAFF6E70
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:33:36 +0000 (UTC)
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86491.1773779611158061121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 13:33:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XEhYEt6+;
 spf=pass (domain: gmail.com, ip: 74.125.224.45, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64ad79df972so6761321d50.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 13:33:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773779610; cv=none;
        d=google.com; s=arc-20240605;
        b=CwrUNHHkPluUSUc+nJeJ8cnfqborPSEHgd3ndha5GjeMULL+LBnPJnExlqXGWLFqZM
         M6CYau3OKHaSZhm/LfDi2nDrcbyLvVjCq3Jl2R+La9sfrRPTi8MAmrGTEmCIkXWXlpXk
         0QS85pYDfKSccan18ja1eR7OFFfTQv9Eh8niEZulJ2SOj82eS3OL9diwwxcv9F0c7Uad
         Ai7jRzehTkt+qmcO2WijUhgJyUPjuGlWzG5Fvl+JxF8xLIpIEb0oxXWATbGUXVwVlpuO
         mxVvdYLyFbFIIMFaYAQab2l6BijDuhBQLe3B8gKoKuTRkn41e97GfsMem4w/cHT27PlH
         CliQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+50ldS8QmRD8lFZl0OR331yaZJmE7c0E5mlMj4sL97Q=;
        fh=Bwcj6kAs3AYnqc6ZaGzuuA5GE2EyA/HuIyUMiAHm0WI=;
        b=Z57m63xg7AK28Cv/TN8HJW2ClGapHvwwdCulVcIeQ5uRwVnSHk5GDMDVejOzx/K06D
         S2kbZ4EW9LbuYDzcYa7S+Mt6jC0F+m/ukDlcRH90d13dNhdlymEfdyidctbD5IcSaGjp
         n7wxkourx4ijhJd7NpTivqJMjiETg2P06k7SDb6Lue+lisnkzqB0veF/8OaUmCtNusWi
         3Ry/nNu8MBhvugfZaOuAnmnQ4if+LLvWFCxJuAAcKiOe/+QcMhfalL9/s8aLasqwWhCp
         tmjfHH+eNuHGDGIIy9b9NY8eiYSp1s7Z2hmHded1JV+yXX9B6QkbPbFG1tP4YF8xzR0b
         3m1w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773779610; x=1774384410; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+50ldS8QmRD8lFZl0OR331yaZJmE7c0E5mlMj4sL97Q=;
        b=XEhYEt6+RyzoDnmfcc4RRyoUBFDXj6Q5OGD6msJBIi77t0aqWLxocwfBBPqDvyPoT2
         d0RnAstfhG0U2GtE94ImCcnq2uolAgA40ZKaFHGd7VdMowelQj8n10js34puR0YPJd7e
         yWNuHqDmTmdZP0z5wtN+3ixbz23SCz5ikydtdBUa6IcrFU89dIHBHbTWfWv/6pMuczwQ
         JsvpWDAZonXCOm4Ygp8c6+mvCieuKbPsDcoNoZKVmxd26fnkW1do1NjhvO6Fa8Nhz0fx
         YHk886bCaXskQdsZAanbMmQ9nkUrUJDiYGf/DwyzRMmtkg3rClz5caqhn/ffjjZ4IRrp
         Wh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779610; x=1774384410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+50ldS8QmRD8lFZl0OR331yaZJmE7c0E5mlMj4sL97Q=;
        b=Az+l7RDDq/yBcNUj9p/VTdmb9eXkibZNYsc/XL5ztGnM4UWOVohztIdN63EemHZaJQ
         ovBODC07vB4xyazE9VbhtIJnTdusVzE7dQ+NQust3M9n5RQdO1nGEzoINCC/pCi3peXQ
         xDGzRj2u2lDgFpep0AnXze3YtxCaJlhMM9/DUGgRSMdXEQ7cI9V3HnNGD4il3C5Zy9fA
         f0yY9ldAjavggscJ3z2QUOEL9vBM+UKO/NV1rgoetj79PrZoNCLs1e/uQu91eay8u8zN
         zYgGo+rzz7DkDXCVC+gRzAGVyAMEeEq47gXhgf5k4v1UgOJBfO3PpS+G3DVDmYAA6Qjt
         TjDA==
X-Gm-Message-State: AOJu0YzDCsoALLIzPfhTKosm5Lk0GF1KOgy4al+JwoLOI4Gx4J1AsvJB
	t4U/i/xege3JUXRPXeM0I6Jbj8m739a8YIK9aAiuHtQOnLEnKjGHWIjPCW0In9C1XfcD13V2l3W
	p0chl8L7Dc0XTci/41M+/QTF1oLZtiI/Ppg==
X-Gm-Gg: ATEYQzw1WQFU7lwvZZgc2jqqBXM0+V69/R8gidw3BvwCgU0s3nPj/hS2RB0UbFn1Tfu
	nKMLyfZGbgugh7O/lBjDn1Lhw6Rmut0bUQ27DDg7RWof1MtMq7segPyKSgXn6VMgUORQ4ltSAL7
	UoZhon3W/1sTh//NOUCB0g+MNoj9BtmOEYfhe0iwjz4nCohNFSnS9XLEsVdYOAUWCDwuJJd5N7/
	3YdFpEA8QqxaXmeLiBxT3TOd4gN1RhS8geyzV4Fr2gY+3bVAcj64W/4RUA+yITOf+V5ufDt5qg/
	iIi2VkRKGKZ0iRbCY+Uh5jAJVXwptOEYNF5vTZPB+brvcz6OoaOLZAKs5OUUdrAaNeoHSQ2m//o
	iLtp/ksFYvHWlS/mn0OTgMAHO
X-Received: by 2002:a05:690e:1762:b0:64a:d6b4:94af with SMTP id
 956f58d0204a3-64e912ef069mr959667d50.14.1773779609979; Tue, 17 Mar 2026
 13:33:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Mar 2026 13:33:03 -0700
X-Gm-Features: AaiRm51j-Vbs3bYakU9ktFG9X6kCChJ52qfs3up4-KWEVA8WTQgKg87eUFW9m6s
Message-ID: <CAMKF1sq9FRNLwqQoQNuBRxVY5o3AduD02Bs3ZMgpqNJ_jeHyhA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 00/13] Confusing and invalid conditional appends
To: michalwsieron@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009010c4064d3e3fe5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 20:33:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233349

--0000000000009010c4064d3e3fe5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this version looks good.

On Tue, Mar 17, 2026 at 1:29=E2=80=AFPM Michal Sieron via lists.openembedde=
d.org
<michalwsieron=3Dgmail.com@lists.openembedded.org> wrote:

> This patchset fixes several findings for variable assignments of form:
>     A:someoverride +=3D "foo"
> and transforms them into:
>     A:append:someoverride =3D " foo"
>
> In most of those cases I assume the original intent was to have a
> conditional append, but what was actually happening was append to
> a conditional override.
>
> I first noticed such problem in our internal recipes and bbappends, but
> then I decided to check if similar issue exists upstream and turns out
> it does.
>
> ---
> Changes in v3:
> - Use normal assignment in libffi and expat instead
> - Fix package name typo in musl-locales
> - Link to v2:
> https://lore.kernel.org/r/20260317-fix-invalid-appends-v2-0-5c65ae5787d9@=
gmail.com
>
> Changes in v2:
> - Split initial single commit into smaller ones
> - Described actual impact on the overriden variables
> - Added some recipes that I missed last time
> - Link to v1:
> https://lore.kernel.org/r/20260314-fix-invalid-appends-v1-1-03ec0bff6942@=
gmail.com
>
> ---
> Michal Sieron (13):
>       libffi: Convert confusing append to assignment
>       coreutils: Convert confusing append to override syntax
>       expat: Convert confusing append to assignment
>       tune-power[567]: Remove confusing overrides
>       no-gplv3.inc: Convert confusing appends to override syntax
>       bootchart2: Convert confusing appends to override syntax
>       pigz: Convert confusing append to override syntax
>       systemtap: Convert confusing append to override syntax
>       ovmf: Convert confusing append to override syntax
>       dnf: Convert confusing append to override syntax
>       qemu: Convert confusing append to override syntax
>       recipes-devtools/python: Convert confusing appends to override synt=
ax
>       musl-locales: Fix locale-base-sr-sr typo
>
>  meta/conf/distro/include/no-gplv3.inc                    |  4 ++--
>  meta/conf/machine/include/powerpc/tune-power5.inc        |  3 +--
>  meta/conf/machine/include/powerpc/tune-power6.inc        |  3 +--
>  meta/conf/machine/include/powerpc/tune-power7.inc        |  3 +--
>  meta/recipes-core/coreutils/coreutils_9.10.bb            |  4 ++--
>  meta/recipes-core/expat/expat_2.7.4.bb                   |  2 +-
>  meta/recipes-core/musl/musl-locales_git.bb               |  2 +-
>  meta/recipes-core/ovmf/ovmf_git.bb                       |  2 +-
>  meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb    | 10 +++++-----
>  meta/recipes-devtools/dnf/dnf_4.24.0.bb                  |  2 +-
>  meta/recipes-devtools/python/python3-asn1crypto_1.5.1.bb |  2 +-
>  meta/recipes-devtools/python/python3-bcrypt_5.0.0.bb     |  2 +-
>  meta/recipes-devtools/python/python3-chardet_5.2.0.bb    |  2 +-
>  meta/recipes-devtools/python/python3-cython_3.2.4.bb     |  4 ++--
>  meta/recipes-devtools/python/python3-ply_3.11.bb         |  2 +-
>  meta/recipes-devtools/python/python3-pyasn1_0.6.2.bb     |  2 +-
>  meta/recipes-devtools/python/python3-pycparser_3.0.bb    |  4 ++--
>  meta/recipes-devtools/python/python3-pysocks_1.7.1.bb    |  2 +-
>  meta/recipes-devtools/python/python3-pytz_2025.2.bb      |  2 +-
>  meta/recipes-devtools/qemu/qemu_10.2.0.bb                |  2 +-
>  meta/recipes-extended/pigz/pigz_2.8.bb                   |  2 +-
>  meta/recipes-kernel/systemtap/systemtap_5.4.bb           |  2 +-
>  meta/recipes-support/libffi/libffi_3.5.2.bb              |  2 +-
>  23 files changed, 31 insertions(+), 34 deletions(-)
> ---
> base-commit: 2dc4d2f8b5c7a6e87291385fb860436593767199
> change-id: 20260314-fix-invalid-appends-cf5197ef2f07
>
> Best regards,
> --
> Michal Sieron <michalwsieron@gmail.com>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#233335):
> https://lists.openembedded.org/g/openembedded-core/message/233335
> Mute This Topic: https://lists.openembedded.org/mt/118372180/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000009010c4064d3e3fe5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">this version looks good.</div><br><div class=3D"gmail_quot=
e gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar =
17, 2026 at 1:29=E2=80=AFPM Michal Sieron via <a href=3D"http://lists.opene=
mbedded.org">lists.openembedded.org</a> &lt;michalwsieron=3D<a href=3D"mail=
to:gmail.com@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This p=
atchset fixes several findings for variable assignments of form:<br>
=C2=A0 =C2=A0 A:someoverride +=3D &quot;foo&quot;<br>
and transforms them into:<br>
=C2=A0 =C2=A0 A:append:someoverride =3D &quot; foo&quot;<br>
<br>
In most of those cases I assume the original intent was to have a<br>
conditional append, but what was actually happening was append to<br>
a conditional override.<br>
<br>
I first noticed such problem in our internal recipes and bbappends, but<br>
then I decided to check if similar issue exists upstream and turns out<br>
it does.<br>
<br>
---<br>
Changes in v3:<br>
- Use normal assignment in libffi and expat instead<br>
- Fix package name typo in musl-locales<br>
- Link to v2: <a href=3D"https://lore.kernel.org/r/20260317-fix-invalid-app=
ends-v2-0-5c65ae5787d9@gmail.com" rel=3D"noreferrer" target=3D"_blank">http=
s://lore.kernel.org/r/20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.=
com</a><br>
<br>
Changes in v2:<br>
- Split initial single commit into smaller ones<br>
- Described actual impact on the overriden variables<br>
- Added some recipes that I missed last time<br>
- Link to v1: <a href=3D"https://lore.kernel.org/r/20260314-fix-invalid-app=
ends-v1-1-03ec0bff6942@gmail.com" rel=3D"noreferrer" target=3D"_blank">http=
s://lore.kernel.org/r/20260314-fix-invalid-appends-v1-1-03ec0bff6942@gmail.=
com</a><br>
<br>
---<br>
Michal Sieron (13):<br>
=C2=A0 =C2=A0 =C2=A0 libffi: Convert confusing append to assignment<br>
=C2=A0 =C2=A0 =C2=A0 coreutils: Convert confusing append to override syntax=
<br>
=C2=A0 =C2=A0 =C2=A0 expat: Convert confusing append to assignment<br>
=C2=A0 =C2=A0 =C2=A0 tune-power[567]: Remove confusing overrides<br>
=C2=A0 =C2=A0 =C2=A0 no-gplv3.inc: Convert confusing appends to override sy=
ntax<br>
=C2=A0 =C2=A0 =C2=A0 bootchart2: Convert confusing appends to override synt=
ax<br>
=C2=A0 =C2=A0 =C2=A0 pigz: Convert confusing append to override syntax<br>
=C2=A0 =C2=A0 =C2=A0 systemtap: Convert confusing append to override syntax=
<br>
=C2=A0 =C2=A0 =C2=A0 ovmf: Convert confusing append to override syntax<br>
=C2=A0 =C2=A0 =C2=A0 dnf: Convert confusing append to override syntax<br>
=C2=A0 =C2=A0 =C2=A0 qemu: Convert confusing append to override syntax<br>
=C2=A0 =C2=A0 =C2=A0 recipes-devtools/python: Convert confusing appends to =
override syntax<br>
=C2=A0 =C2=A0 =C2=A0 musl-locales: Fix locale-base-sr-sr typo<br>
<br>
=C2=A0meta/conf/distro/include/no-gplv3.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0meta/conf/machine/include/powerpc/tune-power5.inc=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 3 +--<br>
=C2=A0meta/conf/machine/include/powerpc/tune-power6.inc=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 3 +--<br>
=C2=A0meta/conf/machine/include/powerpc/tune-power7.inc=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 3 +--<br>
=C2=A0meta/recipes-core/coreutils/<a href=3D"http://coreutils_9.10.bb" rel=
=3D"noreferrer" target=3D"_blank">coreutils_9.10.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0meta/recipes-core/expat/<a href=3D"http://expat_2.7.4.bb" rel=3D"nore=
ferrer" target=3D"_blank">expat_2.7.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-core/musl/<a href=3D"http://musl-locales_git.bb" rel=3D"=
noreferrer" target=3D"_blank">musl-locales_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-core/ovmf/<a href=3D"http://ovmf_git.bb" rel=3D"noreferr=
er" target=3D"_blank">ovmf_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/bootchart2/<a href=3D"http://bootchart2_0.14.9.=
bb" rel=3D"noreferrer" target=3D"_blank">bootchart2_0.14.9.bb</a>=C2=A0 =C2=
=A0 | 10 +++++-----<br>
=C2=A0meta/recipes-devtools/dnf/<a href=3D"http://dnf_4.24.0.bb" rel=3D"nor=
eferrer" target=3D"_blank">dnf_4.24.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-asn1crypto_1.5=
.1.bb" rel=3D"noreferrer" target=3D"_blank">python3-asn1crypto_1.5.1.bb</a>=
 |=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-bcrypt_5.0.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-bcrypt_5.0.0.bb</a>=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-chardet_5.2.0.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-chardet_5.2.0.bb</a>=C2=A0=
 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-cython_3.2.4.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-cython_3.2.4.bb</a>=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-ply_3.11.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-ply_3.11.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-pyasn1_0.6.2.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-pyasn1_0.6.2.bb</a>=C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-pycparser_3.0.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-pycparser_3.0.bb</a>=C2=A0=
 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-pysocks_1.7.1.=
bb" rel=3D"noreferrer" target=3D"_blank">python3-pysocks_1.7.1.bb</a>=C2=A0=
 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/python/<a href=3D"http://python3-pytz_2025.2.bb=
" rel=3D"noreferrer" target=3D"_blank">python3-pytz_2025.2.bb</a>=C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/recipes-devtools/qemu/<a href=3D"http://qemu_10.2.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">qemu_10.2.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A0meta/recipes-extended/pigz/<a href=3D"http://pigz_2.8.bb" rel=3D"nore=
ferrer" target=3D"_blank">pigz_2.8.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-kernel/systemtap/<a href=3D"http://systemtap_5.4.bb" rel=
=3D"noreferrer" target=3D"_blank">systemtap_5.4.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A0meta/recipes-support/libffi/<a href=3D"http://libffi_3.5.2.bb" rel=3D=
"noreferrer" target=3D"_blank">libffi_3.5.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
=C2=A023 files changed, 31 insertions(+), 34 deletions(-)<br>
---<br>
base-commit: 2dc4d2f8b5c7a6e87291385fb860436593767199<br>
change-id: 20260314-fix-invalid-appends-cf5197ef2f07<br>
<br>
Best regards,<br>
-- <br>
Michal Sieron &lt;<a href=3D"mailto:michalwsieron@gmail.com" target=3D"_bla=
nk">michalwsieron@gmail.com</a>&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#233335): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/233335" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/233335</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118372180/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118372180/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000009010c4064d3e3fe5--

