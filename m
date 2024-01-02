Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7561C46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 16:43:48 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web10.33215.1704213824299678492
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jan 2024 08:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E48chui8;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ccc5fca3f6so70322201fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 08:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704213822; x=1704818622; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GvjpsXFu4jv+Nba10gmHla/NfmCxnpVi+Ubivu28xs=;
        b=E48chui8cR6E1tXIaKlocqzaPG+4dxV9TY5KA3i9RLxvTRZ79syt17yqSdtH2uF8hq
         ndC0xx7+mvV3IgsrpJkaeh+RXoSlu874bsgRSnfYGsJNOivRvDAYaJMRQv3jROWXf/js
         00OMczNOsS6CdPh9fLzCIyjf4arkn8qa4G2AaYeY5bmSFrUJPQQ+ixRqVz/s4OxPEJck
         4eSsKh/YZ0C+uHXGa88EtnvbKj7CkwpGedlgStbms5TvIKf4fsag5AxEffMni7uBzjsZ
         c06IKxEtcxqrRr8ZjDPiB93eX5cA4T02x2oyNmEllCCj0Mj1lIIH/4TiG9MR4JejQoJd
         GdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704213822; x=1704818622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GvjpsXFu4jv+Nba10gmHla/NfmCxnpVi+Ubivu28xs=;
        b=Kg2tjNyt0MfNVeItKXzEa960p0QgYSL+Hht0RExvoC1HXuXXHc/6IOPDQCxBopc4xe
         nvFLYDcYnkrPH9EtnOLZZlp/22+EdgkUN6i/t9BxiNGzxUQudom+YboCxqHwwkhM3mB1
         543oa+Q1RxUQm/zs+hHfdNmDE0nFB0BuT8GDvGY0rL0nZoP7SmQmiZASishPx5V35R6i
         twjknMWlJYVNFjt8PnNRZvqX7Lzwo38WeiEm6H3zeSer10ZBikixqx2EFExCuC69iUYI
         OYCggN2/fk1auUXBVi+HE3pbIfoKwU7BtfZTg2JnkxEYHqQ+6psxO+/r7BsnerpPhp9F
         Pwyg==
X-Gm-Message-State: AOJu0Yw5lWPlXDnoPv+tC5mkAXVeRv0NQjQcHm9HtfReErNs2yIA88ke
	QHAHvSU6+cqIaJOQ5GtZ2W+rjYpUDV/+MgYrhdI=
X-Google-Smtp-Source: AGHT+IH+VAWwiSq0k6uXP1I+f//dCKAxESC4HJh+zEc/VqXQb/PSbp87654H+2WCNF0cJAaNPm6TcUjFKrIEF4fhhME=
X-Received: by 2002:a05:6512:3582:b0:50e:7a04:2229 with SMTP id
 m2-20020a056512358200b0050e7a042229mr5079314lfr.25.1704213822244; Tue, 02 Jan
 2024 08:43:42 -0800 (PST)
MIME-Version: 1.0
References: <17A68917D46BD8C6.19767@lists.openembedded.org> <QIXM6S.ZGI08VQ09CW21@t-online.de>
In-Reply-To: <QIXM6S.ZGI08VQ09CW21@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 2 Jan 2024 17:43:31 +0100
Message-ID: <CANNYZj9Lfxtbh+Uc05xbNyC5PuHX5S51tvVBPV7H50eMUSuKug@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCH] utfcpp: add recipe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jan 2024 16:43:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193245

I wonder if we even need a separate recipe at all. Perhaps just list
this in SRC_URI for taglib and copy the needed file out of its tree
into where taglib can pick it up?


Alex

On Tue, 2 Jan 2024 at 14:01, Markus Volk <f_l_k@t-online.de> wrote:
>
> The documentation states:
>
> This is a header-only library and the supported way of deploying it is:
>
> Download a release from https://github.com/nemtrif/utfcpp/releases into a=
 temporary directory
> Unzip the release
> Copy the content of utfcpp/source file into the directory where you keep =
include files for your project
>
> The CMakeList.txt file was originally made for testing purposes only, but=
 unfortunately over time I accepted contributions that added install target=
. This is not a supported way of installing the utfcpp library and I am con=
sidering removing the CMakeList.txt in a future release.
>
> This statement doesn't make a lot of sense to me but maybe it would be a =
good idea to install the files manually instead of using cmake?
>
>
> On Tue, Jan 2 2024 at 01:52:14 PM +01:00:00, Markus Volk <f_l_k@t-online.=
de> wrote:
>
> utfcpp will be a required dependency for the upcoming taglib-2.0 update. =
Signed-off-by: Markus Volk <f_l_k@t-online.de> --- meta/conf/distro/include=
/maintainers.inc | 1 + meta/recipes-devtools/utfcpp/utfcpp_4.0.4.bb | 13 ++=
+++++++++++ 2 files changed, 14 insertions(+) create mode 100644 meta/recip=
es-devtools/utfcpp/utfcpp_4.0.4.bb diff --git a/meta/conf/distro/include/ma=
intainers.inc b/meta/conf/distro/include/maintainers.inc index 8dc63b138e..=
f0a39beffd 100644 --- a/meta/conf/distro/include/maintainers.inc +++ b/meta=
/conf/distro/include/maintainers.inc @@ -824,6 +824,7 @@ RECIPE_MAINTAINER:=
pn-unzip =3D "Denys Dmytriyenko <denis@denix.org>" RECIPE_MAINTAINER:pn-upd=
ate-rc.d =3D "Ross Burton <ross.burton@arm.com>" RECIPE_MAINTAINER:pn-usbin=
it =3D "Alexander Kanavin <alex.kanavin@gmail.com>" RECIPE_MAINTAINER:pn-us=
butils =3D "Alexander Kanavin <alex.kanavin@gmail.com>" +RECIPE_MAINTAINER:=
pn-utfcpp =3D "Markus Volk <f_l_k@t-online.de>" RECIPE_MAINTAINER:pn-util-l=
inux =3D "Chen Qi <Qi.Chen@windriver.com>" RECIPE_MAINTAINER:pn-util-linux-=
libuuid =3D "Chen Qi <Qi.Chen@windriver.com>" RECIPE_MAINTAINER:pn-util-mac=
ros =3D "Unassigned <unassigned@yoctoproject.org>" diff --git a/meta/recipe=
s-devtools/utfcpp/utfcpp_4.0.4.bb b/meta/recipes-devtools/utfcpp/utfcpp_4.0=
.4.bb new file mode 100644 index 0000000000..9cbea94c63 --- /dev/null +++ b=
/meta/recipes-devtools/utfcpp/utfcpp_4.0.4.bb @@ -0,0 +1,13 @@ +SUMMARY =3D=
 "UTF-8 with C++ in a Portable Way." +HOMEPAGE =3D "https://github.com/nemt=
rif/utfcpp" +LICENSE =3D "BSL-1.0" +LIC_FILES_CHKSUM =3D "file://LICENSE;md=
5=3De4224ccaecb14d942c71d31bef20d78c" + +SRC_URI =3D "git://github.com/nemt=
rif/utfcpp.git;protocol=3Dhttps;branch=3Dmaster" + +SRCREV =3D "aed58281cf4=
5838bdb7296e3109bd5a633d677ed" +S =3D "${WORKDIR}/git" + +inherit cmake + +=
FILES:${PN}-dev +=3D "${datadir}/utf8cpp/cmake"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193232): https://lists.openembedded.org/g/openembedde=
d-core/message/193232
> Mute This Topic: https://lists.openembedded.org/mt/103480458/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

