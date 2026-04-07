Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 584DCFF5130
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 18:14:27 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.88053.1775585659701019014
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 11:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=EdtIt5zi;
 spf=pass (domain: mvista.com, ip: 209.85.208.54, mailfrom: vanusuri@mvista.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so5051441a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 11:14:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775585658; cv=none;
        d=google.com; s=arc-20240605;
        b=AoS6ImIiTuHobrz2hsYvKjRsrgtneF2l7+AIofA7RCnyqrmeMPYfdYQI4GnK8ES6lk
         wYMCexLDbkoku/D4xcswkYcWDlQJRCZK1TVBYPieG3OoZ/bN0yRFllWyTzuLyjOyqDur
         SRiZbnP8H2FtXUwffhWUnvw6Mqv1pKuzMMXkoEqWOeobHr7JxBclMGPlnY1v4/lKel3k
         6NFZKdHd1yL7jctUkmZSm6/cN7/3HBfUlbB0hF/pTLnNeBiw3Qe40vY29/VR6u2bmObO
         1KpisZ1xFKQ5R7nor9e5XZdnUQMeyGXDSPcE49iuSPEBWR4kr4JKdUFwPzsf3UZ97r5o
         GAuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Enhpfz3cUclV7PuRaW+SROANbmOcV9MMOtuKRaq5wUE=;
        fh=asqV5XwkQ3j1DNjI0AxRPYfk3NtHNhY/iAvm1HVGsgw=;
        b=aAP1xbkIvGybfpgn/xvxkrlhlx+OVrfClvr/t4rk0i2cB2Z5S8ETBfICi8ZAsYa6y7
         LzzCisL7ao2IRb+byhvKr6ixbr2BXZNpNHDItHaO7D2pzP3onL0rns7fW2fFIdxc4TZH
         5gFAEQ6YdNnpDzhjSMuYg4kUAwJmEPAo49VTY2Uz0RZDgM8Mtm6cQVKRwiiz9rUEvrWi
         M9uIZ+A4UbVSNqRs3m778jwlMP3UIE7nEUrILEcTSDCSl6scIHZwBEzwJ4L3nSK+2940
         ymvTQ/DFW5cX9Lo7dxojBaOXRCPxCxqIZwurfBUrVd4tNwI/JnQcM+Q06y72jpyQJn+O
         A8dg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775585658; x=1776190458; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Enhpfz3cUclV7PuRaW+SROANbmOcV9MMOtuKRaq5wUE=;
        b=EdtIt5ziqgBPq6m6T0zItrp/tvQJOiaad5hJUg2OLbvNQdqo/r7U5ZE8qZGRlBRyY/
         TZs90w/cxex9f4h8FDZ8YRXvsVvorBuxOOPxubnlFuAljMJUy5hwiniFsDRXgBeBWESh
         aau2rfgexguQqkgBOTB/qhyknDYRUmN8kf4wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775585658; x=1776190458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Enhpfz3cUclV7PuRaW+SROANbmOcV9MMOtuKRaq5wUE=;
        b=eQL+6PhBj+oWW4nbXOI3q95V+5Swo9m6rR6oz9H8pRQnYLuFNmOMyZpjILu1X8CRKN
         GNFc6BD63YvMNY5J+C4vWjDpK7vgyQK8rsvKQbXG7MeyhgMdBVdDJVcWlo15h4C2R2sz
         4I5fVBEUbpgRN8/kGQH4mWYuzmwX+u2BhFZAk6ry5rp38nb/pT02+AmQ0C3ZOw87COrO
         vx2gm28UHe2QLStHot9gFEJVii7cDrSDqsWymlsFMeKc6BoWev+sJlrJlKvlyUmIyS9r
         76MQ4l4//wcKM/+OF2bEOf6+yQseuADmuPuEF74OC9Wcl87/AU3HEuwS/EO1C+dxT8RX
         8nqQ==
X-Gm-Message-State: AOJu0YxNM2eMzR8HIRkRjYfKtCROMWGQCJ62laI+7yZnsbu/Sd4q/T9s
	DaVtppdj/f6ycjxJ7FUwS3ssnL/xnvPkkFNXzS0hjH6uWCctg3rw1uBRII+shufNT8HsEYVCaaQ
	Sok3eK4Qj20eO9T7ls5F7UQtzkoef7bKQl0B7X8GW2w==
X-Gm-Gg: AeBDievZjNya7j4jyGnY4ZQt+YbuLNMaI8JQT6FKDd2C6JNRf4xoGCxI/z0R37+hbfB
	Ybp059p9mki2DkX2jsjYGnxuzg0jmn6rkoePi70g5VyWszGX++Kes0C4b5gT9DDJdH8dJIr1Djr
	9qbndMb29yZeYtVQiTyFsGegEFBpZMyy5TcmAkzDQ6MY9oBnaPnvIfx75YYKPSGIK31I+wovnpW
	rtfEpEpU+TVB0CRHX5FbZ1TnwiV49shkdqifB0efOkB+/Ssp5Mgcyv9zYEzvXKcsril/uCyAz/j
	fWVMh6wu6YUdphixXLoGZ+JCykRUiB1AC2dLP5oT
X-Received: by 2002:a05:6402:2349:b0:66e:6f10:82e0 with SMTP id
 4fb4d7f45d1cf-66e6f108339mr6249768a12.7.1775585657795; Tue, 07 Apr 2026
 11:14:17 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1775578386.git.yoann.congal@smile.fr>
In-Reply-To: <cover.1775578386.git.yoann.congal@smile.fr>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Tue, 7 Apr 2026 23:44:05 +0530
X-Gm-Features: AQROBzCh-vOUcjmOcSvvZRm8EQDNIl5uHYgyNV4XWGkAISpQO3o5tHQ7Yd0qPQM
Message-ID: <CANQUz18ce-pbkn8-N6AorS8a5w5B8FJAtt9_dFXKnCUMSncvMQ@mail.gmail.com>
Subject: Re: [OE-core][kirkstone v3 00/19] Patch review
To: Yoann Congal <yoann.congal@smile.fr>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000066c30f064ee2c0fa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 18:14:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234776

--00000000000066c30f064ee2c0fa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,



On Tue, 7 Apr, 2026, 9:46=E2=80=AFpm Yoann Congal via lists.openembedded.or=
g,
<yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:

> Please review this set of changes for kirkstone and have comments back by
> end of day Wednesday, April 8.
>
> Please note:
> - This will be the last review cycle for kirkstone.
> - If you expect a patch to get merged and it is not in this series ping
>   me as soon as possible.
> - Some patches look OK to me and are included here but will only be
>   merged if some patches are sent/fixed in more recent branches:
>   - Pending an equivalent patch sent for scarthgap:
>     - ncurses: fix for CVE-2025-69720
>   - Pending an equivalent patch sent for whinlatter:
>     - libarchive: Fix CVE-2026-4111
>
> --> Libarchive 3.8.6 upgrade patch submitted for whinlatter. This upgrade
> fixes CVE-2026-4111 .
>

Passed a-full on autobuilder:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3612
>
> v2->v3:
> - Added ncurses:=C2=B7fix=C2=B7for=C2=B7CVE-2025-69720 to the series
>
> v1->v2:
> - replaced "python3: Fix CVE-2025-15282" with
>   "python3: upgrade 3.10.19 -> 3.10.20"
> - Those patches are not held anymore since equivalent patches have been
>   sent to more recent branches:
>     - curl: patch CVE-2026-3784
>     - curl: patch CVE-2026-3783
>     - curl: patch CVE-2026-1965
>     - vim: Fix CVE-2026-33412
>
> The following changes since commit
> c4194cadb1180da37514c55cd97827eb0269c8e2:
>
>   build-appliance-image: Update to kirkstone head revision (2026-03-20
> 09:58:53 +0000)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib
> stable/kirkstone-nut
>
> https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/ki=
rkstone-nut
>
> for you to fetch changes up to 94df79c304f692b0108155e04905180cdf92b2cd:
>
>   scripts/install-buildtools: Update to 4.0.34 (2026-04-07 09:14:47 +0200=
)
>
> ----------------------------------------------------------------
>
> Bruce Ashfield (2):
>   linux-yocto/5.15: update to v5.15.200
>   linux-yocto/5.15: update to v5.15.201
>
> Fabien Thomas (1):
>   README.OE-Core: update contributor links and add kirkstone prefix
>
> Hitendra Prajapati (2):
>   vim: Fix CVE-2026-33412
>   ncurses: fix for CVE-2025-69720
>
> Jinfeng Wang (1):
>   tzdata/tzcode-native: upgrade 2025c -> 2026a
>
> Paul Barker (1):
>   create-pull-request: Keep commit hash to be pulled in cover email
>
> Peter Marko (1):
>   libtheora: mark CVE-2024-56431 as not vulnerable yet
>
> Vijay Anusuri (10):
>   tzdata,tzcode-native: Upgrade 2025b -> 2025c
>   python3: upgrade 3.10.19 -> 3.10.20
>   python3-pyopenssl: Fix CVE-2026-27448
>   python3-pyopenssl: Fix CVE-2026-27459
>   libarchive: Fix CVE-2026-4111
>   sqlite3: Fix CVE-2025-70873
>   curl: patch CVE-2025-14524
>   curl: patch CVE-2026-1965
>   curl: patch CVE-2026-3783
>   curl: patch CVE-2026-3784
>
> Yoann Congal (1):
>   scripts/install-buildtools: Update to 4.0.34
>
>  README.OE-Core.md                             |  10 +-
>  .../ncurses/files/CVE-2025-69720.patch        |  42 ++
>  .../ncurses/ncurses_6.3+20220423.bb           |   1 +
>  .../python3-pyopenssl/CVE-2026-27448.patch    | 125 ++++++
>  .../python3-pyopenssl/CVE-2026-27459.patch    | 106 +++++
>  .../python/python3-pyopenssl_22.0.0.bb        |   5 +
>  .../python/python3/CVE-2025-12084.patch       | 171 --------
>  .../python/python3/CVE-2025-13836.patch       | 163 --------
>  .../python/python3/CVE-2025-13837.patch       | 162 --------
>  .../python/python3/CVE-2025-6075.patch        | 364 ------------------
>  ...{python3_3.10.19.bb =3D> python3_3.10.20.bb} |   6 +-
>  .../libarchive/CVE-2026-4111-1.patch          |  32 ++
>  .../libarchive/CVE-2026-4111-2.patch          | 308 +++++++++++++++
>  .../libarchive/libarchive_3.6.2.bb            |   2 +
>  meta/recipes-extended/timezone/timezone.inc   |   6 +-
>  .../linux/linux-yocto-rt_5.15.bb              |   6 +-
>  .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
>  meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
>  .../libtheora/libtheora_1.1.1.bb              |   3 +
>  .../curl/curl/CVE-2025-14524.patch            |  42 ++
>  .../curl/curl/CVE-2026-1965-1.patch           |  98 +++++
>  .../curl/curl/CVE-2026-1965-2.patch           |  29 ++
>  .../curl/curl/CVE-2026-3783-pre1.patch        |  66 ++++
>  .../curl/curl/CVE-2026-3783.patch             | 157 ++++++++
>  .../curl/curl/CVE-2026-3784.patch             |  73 ++++
>  meta/recipes-support/curl/curl_7.82.0.bb      |   6 +
>  .../sqlite/files/CVE-2025-70873.patch         |  33 ++
>  meta/recipes-support/sqlite/sqlite3_3.38.5.bb |   1 +
>  .../vim/files/CVE-2026-33412.patch            |  61 +++
>  meta/recipes-support/vim/vim.inc              |   1 +
>  scripts/create-pull-request                   |   2 +-
>  scripts/install-buildtools                    |   4 +-
>  32 files changed, 1224 insertions(+), 893 deletions(-)
>  create mode 100644 meta/recipes-core/ncurses/files/CVE-2025-69720.patch
>  create mode 100644
> meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27448.patch
>  create mode 100644
> meta/recipes-devtools/python/python3-pyopenssl/CVE-2026-27459.patch
>  delete mode 100644
> meta/recipes-devtools/python/python3/CVE-2025-12084.patch
>  delete mode 100644
> meta/recipes-devtools/python/python3/CVE-2025-13836.patch
>  delete mode 100644
> meta/recipes-devtools/python/python3/CVE-2025-13837.patch
>  delete mode 100644
> meta/recipes-devtools/python/python3/CVE-2025-6075.patch
>  rename meta/recipes-devtools/python/{python3_3.10.19.bb =3D>
> python3_3.10.20.bb} (98%)
>  create mode 100644
> meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-1.patch
>  create mode 100644
> meta/recipes-extended/libarchive/libarchive/CVE-2026-4111-2.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-1.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-2.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783-pre1.pat=
ch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783.patch
>  create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784.patch
>  create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-70873.patc=
h
>  create mode 100644 meta/recipes-support/vim/files/CVE-2026-33412.patch
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#234753):
> https://lists.openembedded.org/g/openembedded-core/message/234753
> Mute This Topic: https://lists.openembedded.org/mt/118710539/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000066c30f064ee2c0fa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi Yoann,<div dir=3D"auto"><br></div><br><br><div class=
=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Tue,=
 7 Apr, 2026, 9:46=E2=80=AFpm Yoann Congal via <a href=3D"http://lists.open=
embedded.org" target=3D"_blank" rel=3D"noreferrer">lists.openembedded.org</=
a>, &lt;yoann.congal=3D<a href=3D"mailto:smile.fr@lists.openembedded.org" t=
arget=3D"_blank" rel=3D"noreferrer">smile.fr@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">Please review this set of c=
hanges for kirkstone and have comments back by<br>
end of day Wednesday, April 8.<br>
<br>
Please note:<br>
- This will be the last review cycle for kirkstone.<br>
- If you expect a patch to get merged and it is not in this series ping<br>
=C2=A0 me as soon as possible.<br>
- Some patches look OK to me and are included here but will only be<br>
=C2=A0 merged if some patches are sent/fixed in more recent branches:<br>
=C2=A0 - Pending an equivalent patch sent for scarthgap:<br>
=C2=A0 =C2=A0 - ncurses: fix for CVE-2025-69720<br>
=C2=A0 - Pending an equivalent patch sent for whinlatter:<br>
=C2=A0 =C2=A0 - libarchive: Fix CVE-2026-4111<br>
<br>--&gt; Libarchive 3.8.6 upgrade patch submitted for whinlatter. This up=
grade fixes CVE-2026-4111 .<br></blockquote></div><div dir=3D"auto"><br></d=
iv><div class=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Passed a-full on autobuilder:<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/buil=
ds/3612" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https:/=
/autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/3612</a><br>
<br>
v2-&gt;v3:<br>
- Added ncurses:=C2=B7fix=C2=B7for=C2=B7CVE-2025-69720 to the series<br>
<br>
v1-&gt;v2:<br>
- replaced &quot;python3: Fix CVE-2025-15282&quot; with<br>
=C2=A0 &quot;python3: upgrade 3.10.19 -&gt; 3.10.20&quot;<br>
- Those patches are not held anymore since equivalent patches have been<br>
=C2=A0 sent to more recent branches:<br>
=C2=A0 =C2=A0 - curl: patch CVE-2026-3784<br>
=C2=A0 =C2=A0 - curl: patch CVE-2026-3783<br>
=C2=A0 =C2=A0 - curl: patch CVE-2026-1965<br>
=C2=A0 =C2=A0 - vim: Fix CVE-2026-33412<br>
<br>
The following changes since commit c4194cadb1180da37514c55cd97827eb0269c8e2=
:<br>
<br>
=C2=A0 build-appliance-image: Update to kirkstone head revision (2026-03-20=
 09:58:53 +0000)<br>
<br>
are available in the Git repository at:<br>
<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib" r=
el=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://git.opene=
mbedded.org/openembedded-core-contrib</a> stable/kirkstone-nut<br>
=C2=A0 <a href=3D"https://git.openembedded.org/openembedded-core-contrib/lo=
g/?h=3Dstable/kirkstone-nut" rel=3D"noreferrer noreferrer noreferrer" targe=
t=3D"_blank">https://git.openembedded.org/openembedded-core-contrib/log/?h=
=3Dstable/kirkstone-nut</a><br>
<br>
for you to fetch changes up to 94df79c304f692b0108155e04905180cdf92b2cd:<br=
>
<br>
=C2=A0 scripts/install-buildtools: Update to 4.0.34 (2026-04-07 09:14:47 +0=
200)<br>
<br>
----------------------------------------------------------------<br>
<br>
Bruce Ashfield (2):<br>
=C2=A0 linux-yocto/5.15: update to v5.15.200<br>
=C2=A0 linux-yocto/5.15: update to v5.15.201<br>
<br>
Fabien Thomas (1):<br>
=C2=A0 README.OE-Core: update contributor links and add kirkstone prefix<br=
>
<br>
Hitendra Prajapati (2):<br>
=C2=A0 vim: Fix CVE-2026-33412<br>
=C2=A0 ncurses: fix for CVE-2025-69720<br>
<br>
Jinfeng Wang (1):<br>
=C2=A0 tzdata/tzcode-native: upgrade 2025c -&gt; 2026a<br>
<br>
Paul Barker (1):<br>
=C2=A0 create-pull-request: Keep commit hash to be pulled in cover email<br=
>
<br>
Peter Marko (1):<br>
=C2=A0 libtheora: mark CVE-2024-56431 as not vulnerable yet<br>
<br>
Vijay Anusuri (10):<br>
=C2=A0 tzdata,tzcode-native: Upgrade 2025b -&gt; 2025c<br>
=C2=A0 python3: upgrade 3.10.19 -&gt; 3.10.20<br>
=C2=A0 python3-pyopenssl: Fix CVE-2026-27448<br>
=C2=A0 python3-pyopenssl: Fix CVE-2026-27459<br>
=C2=A0 libarchive: Fix CVE-2026-4111<br>
=C2=A0 sqlite3: Fix CVE-2025-70873<br>
=C2=A0 curl: patch CVE-2025-14524<br>
=C2=A0 curl: patch CVE-2026-1965<br>
=C2=A0 curl: patch CVE-2026-3783<br>
=C2=A0 curl: patch CVE-2026-3784<br>
<br>
Yoann Congal (1):<br>
=C2=A0 scripts/install-buildtools: Update to 4.0.34<br>
<br>
=C2=A0<a href=3D"http://README.OE-Core.md" rel=3D"noreferrer noreferrer nor=
eferrer" target=3D"_blank">README.OE-Core.md</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 10 +-<br>
=C2=A0.../ncurses/files/CVE-2025-69720.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 42 ++<br>
=C2=A0.../ncurses/ncurses_6.3+<a href=3D"http://20220423.bb" rel=3D"norefer=
rer noreferrer noreferrer" target=3D"_blank">20220423.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../python3-pyopenssl/CVE-2026-27448.patch=C2=A0 =C2=A0 | 125 ++++++<=
br>
=C2=A0.../python3-pyopenssl/CVE-2026-27459.patch=C2=A0 =C2=A0 | 106 +++++<b=
r>
=C2=A0.../python/<a href=3D"http://python3-pyopenssl_22.0.0.bb" rel=3D"nore=
ferrer noreferrer noreferrer" target=3D"_blank">python3-pyopenssl_22.0.0.bb=
</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 +<br>
=C2=A0.../python/python3/CVE-2025-12084.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
71 --------<br>
=C2=A0.../python/python3/CVE-2025-13836.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
63 --------<br>
=C2=A0.../python/python3/CVE-2025-13837.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0| 1=
62 --------<br>
=C2=A0.../python/python3/CVE-2025-6075.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 3=
64 ------------------<br>
=C2=A0...{<a href=3D"http://python3_3.10.19.bb" rel=3D"noreferrer noreferre=
r noreferrer" target=3D"_blank">python3_3.10.19.bb</a> =3D&gt; <a href=3D"h=
ttp://python3_3.10.20.bb" rel=3D"noreferrer noreferrer noreferrer" target=
=3D"_blank">python3_3.10.20.bb</a>} |=C2=A0 =C2=A06 +-<br>
=C2=A0.../libarchive/CVE-2026-4111-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 32 ++<br>
=C2=A0.../libarchive/CVE-2026-4111-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 308 +++++++++++++++<br>
=C2=A0.../libarchive/<a href=3D"http://libarchive_3.6.2.bb" rel=3D"noreferr=
er noreferrer noreferrer" target=3D"_blank">libarchive_3.6.2.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +<br>
=C2=A0meta/recipes-extended/timezone/timezone.inc=C2=A0 =C2=A0|=C2=A0 =C2=
=A06 +-<br>
=C2=A0.../linux/<a href=3D"http://linux-yocto-rt_5.15.bb" rel=3D"noreferrer=
 noreferrer noreferrer" target=3D"_blank">linux-yocto-rt_5.15.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0.../linux/<a href=3D"http://linux-yocto-tiny_5.15.bb" rel=3D"noreferr=
er noreferrer noreferrer" target=3D"_blank">linux-yocto-tiny_5.15.bb</a>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A06 +-<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.15.bb" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">linux-yocto_5.15.bb=
</a> |=C2=A0 26 +-<br>
=C2=A0.../libtheora/<a href=3D"http://libtheora_1.1.1.bb" rel=3D"noreferrer=
 noreferrer noreferrer" target=3D"_blank">libtheora_1.1.1.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A03 +<br>
=C2=A0.../curl/curl/CVE-2025-14524.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 42 ++<br>
=C2=A0.../curl/curl/CVE-2026-1965-1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 98 +++++<br>
=C2=A0.../curl/curl/CVE-2026-1965-2.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 29 ++<br>
=C2=A0.../curl/curl/CVE-2026-3783-pre1.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
=C2=A0 66 ++++<br>
=C2=A0.../curl/curl/CVE-2026-3783.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 157 ++++++++<br>
=C2=A0.../curl/curl/CVE-2026-3784.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 73 ++++<br>
=C2=A0meta/recipes-support/curl/<a href=3D"http://curl_7.82.0.bb" rel=3D"no=
referrer noreferrer noreferrer" target=3D"_blank">curl_7.82.0.bb</a>=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A06 +<br>
=C2=A0.../sqlite/files/CVE-2025-70873.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 33 ++<br>
=C2=A0meta/recipes-support/sqlite/<a href=3D"http://sqlite3_3.38.5.bb" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">sqlite3_3.38.5.bb</=
a> |=C2=A0 =C2=A01 +<br>
=C2=A0.../vim/files/CVE-2026-33412.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 61 +++<br>
=C2=A0meta/recipes-support/vim/vim.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0scripts/create-pull-request=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A0scripts/install-buildtools=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
=C2=A032 files changed, 1224 insertions(+), 893 deletions(-)<br>
=C2=A0create mode 100644 meta/recipes-core/ncurses/files/CVE-2025-69720.pat=
ch<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE=
-2026-27448.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/python/python3-pyopenssl/CVE=
-2026-27459.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-1208=
4.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-1383=
6.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-1383=
7.patch<br>
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3/CVE-2025-6075=
.patch<br>
=C2=A0rename meta/recipes-devtools/python/{<a href=3D"http://python3_3.10.1=
9.bb" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">python3_3.=
10.19.bb</a> =3D&gt; <a href=3D"http://python3_3.10.20.bb" rel=3D"noreferre=
r noreferrer noreferrer" target=3D"_blank">python3_3.10.20.bb</a>} (98%)<br=
>
=C2=A0create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-20=
26-4111-1.patch<br>
=C2=A0create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-20=
26-4111-2.patch<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patc=
h<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-1.pat=
ch<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2026-1965-2.pat=
ch<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783-pre1.=
patch<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783.patch=
<br>
=C2=A0create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3784.patch=
<br>
=C2=A0create mode 100644 meta/recipes-support/sqlite/files/CVE-2025-70873.p=
atch<br>
=C2=A0create mode 100644 meta/recipes-support/vim/files/CVE-2026-33412.patc=
h<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#234753): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/234753" rel=3D"noreferrer noreferrer noreferrer" ta=
rget=3D"_blank">https://lists.openembedded.org/g/openembedded-core/message/=
234753</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118710539/730=
1997" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://li=
sts.openembedded.org/mt/118710539/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" rel=3D"noreferrer noreferrer" target=3D"_blank">openembedded-core+own=
er@lists.openembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://l=
ists.openembedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:vanu=
suri@mvista.com" rel=3D"noreferrer noreferrer" target=3D"_blank">vanusuri@m=
vista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000066c30f064ee2c0fa--

