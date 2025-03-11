Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E40C28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 09:35:19 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web11.4770.1741685710364824862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 02:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vaq7ig6w;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7be8f281714so524823885a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 02:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741685709; x=1742290509; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8grU14naS54Sw+Eb81IK5vdCFEipGpuSyGZmApagGvs=;
        b=Vaq7ig6w4qbHyli2yRq297ReV4lODijRMof0MdVhvjWZUQq7fPptLNWN5norXuWyxE
         q0y5u76EJoHKL8RPLU3FmfK9R7l472MkUSgju8IwjcxCTAfLQaRINlq3y/YwQXOLA1XN
         FuTuE6PYhEyRBq/sehFU0Lm0gLBqqnp+l23JctNTB0ggOyxFtJZ6X2HYTsh+6/VWLqJE
         2HQiBMeB/NJ8V6E9BDZZVdeFJKZXQ7zrYgMar+pmECvrZhb2U2d8m1oDT4qihdy6/7V9
         sAfhNF9xET9dgKx3DuasOwaE77pB04cVyPAg1zlk2ZBSQGCjgvIaNFWm6KVInjBNKCd/
         w9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741685709; x=1742290509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8grU14naS54Sw+Eb81IK5vdCFEipGpuSyGZmApagGvs=;
        b=JjfhRhZ2NqG5VezeJxuXyNDGVyx4ak8RhnDCIgGLOYpt8NicloDVO7I3Lmi1vgIJTY
         y36KbJEGK1HiqsJ7fro/YaueVslRQRTCuoe5nQrbWbBbKT72k9KI5Xs+Foq91qaHqApT
         i5fMH1tbRgopNY5Pc7xj0wxzKerhoKXBzoTs78xYdmE5nYAq5TxKCvV5IwpfVRl19WEF
         0uNcVtSNlV74BXu1CrRiAzaZotYTo7rqjSp27LMd8hHvP4BRlWbBh+N1x3PXY5Ix0YXC
         VUPgnlPAzIPLBRhYJvU/Qa7E/pz2OF4eFuHmlu1ifNBFZ+rWMxZQCOxzNVHfPSFF+KkW
         auNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ8TeFCpKITOcZWJ1th4JWtNZk7Ty4bjg2dFFctNxyPyFMXzLBIT8KU5gSStcR+udK7DtM/TOUe1Etj+xpU7p0ew==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy+Yaj2DO+DX2C79yuZZ0B2rTyCM9Z6XyP+S+SWON3g+GYrjoxJ
	yYeg2exa3l8UmStZ1Q/LOiFrT//n6OVeqT2T3OmfOpy102JazwTsm5lwRyNJVSGVTmHpLmw29vk
	3jcNx4ymPKShFefTopK7yp9dMz/I=
X-Gm-Gg: ASbGnct2w0tFAuj3Z18Wopw+5oI/JRzRkWPn2xV6BKk6TKcDdOpL8NEB4iMw7t/ulf9
	752uhlW5osicA7ecplLajw9OTPqwz6vEw5P5V0rOKWUC8Ni1VOI4L/lrORLC1ULK0xIwIMlRYQp
	uKP3e493QsopUtxeTHxLTiwrqo
X-Google-Smtp-Source: AGHT+IEa83Ynn38HRIDJfRGVGay94vo3P0C6YUU4wHq9Jb5y06ht+Zx/XKCufNe4s4KTEjrMZbIfq/WVZVrr/Ls928E=
X-Received: by 2002:a05:620a:260e:b0:7c5:59d9:fe0b with SMTP id
 af79cd13be357-7c559d9feacmr866895585a.54.1741685709347; Tue, 11 Mar 2025
 02:35:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250311045911.3023271-1-hongxu.jia@windriver.com>
 <CAApg2=Sh+nbwEdX0B19GqFwzfYP=6LHqPRdrvmhvxfnbSyE35g@mail.gmail.com>
 <CANNYZj_uBe3wZ8gOqU1QRkbacBeF68TiJ1nrE0vFcCkx_namEA@mail.gmail.com> <CAApg2=QFSNxibC2A9rGKVi1YYdsX3=T9So3+v1=9bqgEWZegmg@mail.gmail.com>
In-Reply-To: <CAApg2=QFSNxibC2A9rGKVi1YYdsX3=T9So3+v1=9bqgEWZegmg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 11 Mar 2025 10:34:58 +0100
X-Gm-Features: AQ5f1Jo3EYXY1A6Xhb6vnR4r8trPyIaAn67Bk8Pl49Qu0D_3KhRGhjjqvfmI334
Message-ID: <CANNYZj_bc4atGBBEsRSpS2L-spgtK=vvPqHmX4DLM2dMxpuTtQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] gnupg: 2.5.4 -> 2.5.5
To: Marta Rybczynska <rybczynska@gmail.com>
Cc: hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org, 
	Steve Sakoman <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Mar 2025 09:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212549

Sadly, in this situation the promise of security directly clashes with
other promises we make to users.

Styhead and kirkstone need TSC approval. Component versions are simply
never shifted like this in stable releases.

Master cannot have an older version of something than a stable release does=
.

Alex

On Tue, 11 Mar 2025 at 10:13, Marta Rybczynska <rybczynska@gmail.com> wrote=
:
>
> 2.4 already has patches that smell CVEs.
>
> I forgot they use that versioning scheme... In this case, from a security=
 perspective, it would be reasonable to move master and styhead back to 2.4=
. I would even hesitate with kirkstone. Gnupg CVEs can cause much harm and =
there will be security fixes. Let's make the update path easier.
>
> My 0.02
>
> Marta
>
> On Tue, Mar 11, 2025 at 9:53=E2=80=AFAM Alexander Kanavin <alex.kanavin@g=
mail.com> wrote:
>>
>> We erroneously updated gnupg from stable (2.4.x) to development series
>> (2.5.x) in master and styhead, as it actually follows the odd-even
>> version scheme. So for styhead it's not that straightforward.
>>
>> Scarthgap is on 2.4.x (which is fine and supported, but needs to be
>> updated to latest 2.4.x), kirkstone is on 2.3.x, sadly, which has the
>> same issue as styhead.
>>
>> Alex
>>
>> On Tue, 11 Mar 2025 at 06:32, Marta Rybczynska via
>> lists.openembedded.org <rybczynska=3Dgmail.com@lists.openembedded.org>
>> wrote:
>> >
>> > Thanks for the update patch. First two items from the changelog looks =
like CVE material (haven't been released as CVEs as of today).
>> > I vote for a backport to stable branches (with Steve in copy).
>> >
>> > Kind regards,
>> > Marta
>> >
>> > On Tue, Mar 11, 2025 at 5:59=E2=80=AFAM hongxu via lists.openembedded.=
org <hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>> >>
>> >> Noteworthy changes in version 2.5.5 (2025-03-07)
>> >> ------------------------------------------------
>> >>
>> >>   * gpg: Fix a verification DoS due to a malicious subkey in the
>> >>     keyring.  [T7527]
>> >>
>> >>   * dirmngr: Fix possible hangs due to blocking connection requests.
>> >>     [T6606, T7434]
>> >>
>> >>   * w32: On socket nonce mismatch close the socket.  [T7434]
>> >>
>> >>   * w32: Print more detailed diagnostics for IPC errors.
>> >>
>> >>   * GPGME is not any more distributed with the Windows installer.
>> >>     Please install gpg4win to get gpgme version.
>> >>
>> >>   See-also: gnupg-announce/2025q1/000491.html
>> >>   Release-info: https://dev.gnupg.org/T7530
>> >>
>> >> https://dev.gnupg.org/source/gnupg/browse/master/NEWS
>> >>
>> >> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> >> ---
>> >>  meta/recipes-support/gnupg/{gnupg_2.5.4.bb =3D> gnupg_2.5.5.bb} | 2 =
+-
>> >>  1 file changed, 1 insertion(+), 1 deletion(-)
>> >>  rename meta/recipes-support/gnupg/{gnupg_2.5.4.bb =3D> gnupg_2.5.5.b=
b} (97%)
>> >>
>> >> diff --git a/meta/recipes-support/gnupg/gnupg_2.5.4.bb b/meta/recipes=
-support/gnupg/gnupg_2.5.5.bb
>> >> similarity index 97%
>> >> rename from meta/recipes-support/gnupg/gnupg_2.5.4.bb
>> >> rename to meta/recipes-support/gnupg/gnupg_2.5.5.bb
>> >> index e6a7e3fb407..a9ab486f6bf 100644
>> >> --- a/meta/recipes-support/gnupg/gnupg_2.5.4.bb
>> >> +++ b/meta/recipes-support/gnupg/gnupg_2.5.5.bb
>> >> @@ -23,7 +23,7 @@ SRC_URI:append:class-native =3D " file://0001-confi=
gure.ac-use-a-custom-value-for-
>> >>                                  file://relocate.patch"
>> >>  SRC_URI:append:class-nativesdk =3D " file://relocate.patch"
>> >>
>> >> -SRC_URI[sha256sum] =3D "f8cb2ac6c9f17f81e3541c62158764910fad5c3a0765=
e00b398c41a32bc4e0ea"
>> >> +SRC_URI[sha256sum] =3D "7afa71d72ff9aaff75a6810b87b486bc492fd752e4f7=
7b07c41759ce4ef36b31"
>> >>
>> >>  EXTRA_OECONF =3D "--disable-ldap \
>> >>                 --disable-ccid-driver \
>> >> --
>> >> 2.34.1
>> >>
>> >>
>> >>
>> >>
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#212542): https://lists.openembedded.org/g/openembe=
dded-core/message/212542
>> > Mute This Topic: https://lists.openembedded.org/mt/111634573/1686489
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[alex.kanavin@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

