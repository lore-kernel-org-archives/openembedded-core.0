Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA8D4C49EA1
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 12:29:08 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.59577.1721996942530790327
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 05:29:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kwiHqNDS;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: rybczynska@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-70d23caf8ddso838720b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 05:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721996942; x=1722601742; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9WMVeYaHDSEDeGAZ5boaHplZO+3Xuuy6B0KEZJxnRG4=;
        b=kwiHqNDSaxl0Q8bEO6UfNkUeY8CJw0Au2sMno8DEE6LTE2qtwQPcmVA4dN6aHsEfya
         w7pGver8GcGiDt0E+zD6dM/myLVjbLvl0E286HIIFn9I4tYS1IH14IpveU8S11yJMpMu
         qW+ZdnHqRFknCbaoA/3MJiIVbw596CkGZitTy2rCRcvd5/ibjstIUkAKshtQ3EYXa6ja
         6KfeV4obVzZU4ltNT+PQj0uXbTpHfYKwyaPmHMi25X2kmn//U9+fFeCIHNiFRoNpQ44k
         YEGYbt9WO+QpGI+4PQDB4P/kf6y+9lCU4Lw6Hg5rQeQIFYS78wgbP45m7cTzyxKbVlKD
         pUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721996942; x=1722601742;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9WMVeYaHDSEDeGAZ5boaHplZO+3Xuuy6B0KEZJxnRG4=;
        b=d193vvyxFpZgoUhM//ThSyWSsaaXh4dZSy5fWhTlo4DbfCA/lIIQ//mygZlZfM/xVU
         /b7Rz5o4P1akCIEth+YEHo+f98Pw3AVuJaiWs3eHTJOy9BbYT0hMS3ocl2MQ3hBbTRBp
         L9W/IecLld9L7ZVNtPXvhWuypIi7iYGNQh/l9wQKf581E9Kky8pJNexMPxVnPO6K9rI2
         lDDyzXH/FJHaC2bQoguPH+pcjwmdQJMqUFscD+kpZQkrQmyIGFpbPcIVENCNRAld+jkJ
         8rmZc3B+ETubJJk/se5wUTtA0kFwI965Hud7dGhPoIaWKWOidTZRzM4CLmc8d1wQeriR
         wl5g==
X-Gm-Message-State: AOJu0Yy33Ib5h6YsLMxyOeQU9FbBzeyRLKDypve324tYeapsG0H1Srlk
	HK9rGax0Aq4VFNAeeNZUWRAFobk5TJVpuJyHquD4Auy2wdwncicfmOnCGcw8/knv9SSa6vMNStL
	KEflqjlwgmkxI5XCRXlGrM2G0Z0wd4A==
X-Google-Smtp-Source: AGHT+IG/p40bpRS2ReTAFjciMAwSlIxkw97OKgpxXgjNR06M4nVmVj0EGkGbDRhTu8sP1vr5lOgGZ3ve5vDWmUiKlRI=
X-Received: by 2002:a05:6a20:a112:b0:1c3:b1b3:75cf with SMTP id
 adf61e73a8af0-1c47b178807mr6033842637.14.1721996941865; Fri, 26 Jul 2024
 05:29:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240724152530.25856-1-marta.rybczynska@syslinbit.com>
 <20240724152530.25856-5-marta.rybczynska@syslinbit.com> <44B6F27C-F828-46B0-8DCB-FCE37FB8DC9D@arm.com>
In-Reply-To: <44B6F27C-F828-46B0-8DCB-FCE37FB8DC9D@arm.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Fri, 26 Jul 2024 14:28:50 +0200
Message-ID: <CAApg2=S_2uiyd=g2Zn6RQBvBxDc-iRKFSZmpWBZWJx1M0RjYgQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH v3 5/5] cve-extra-exclusions.inc: add deprecation notice
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Marta Rybczynska <marta.rybczynska@syslinbit.com>
Content-Type: multipart/alternative; boundary="000000000000063b6f061e25a815"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 12:29:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202535

--000000000000063b6f061e25a815
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 2:24=E2=80=AFPM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 24 Jul 2024, at 16:25, Marta Rybczynska via lists.openembedded.org
> <rybczynska=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > This file contains CVE_STATUS without machine-readable information on
> which
> > recipe it applies to. All entries should be verified and, if appropriat=
e,
> > moved to their corresponding recipes.
>
> The point of this file was to be an opt-in for more exclusions where we
> didn=E2=80=99t feel 100% confident asserting the issues could be ignored.
>
> How much of a problem is it if this file contains a a limited number of
> CVEs?  We can review what is in there and move/remove as needed to cut it
> down.
>

With the vex class (and with SPDX too, I think) they end up copied present
in every single package of the build. This brings enormous confusion.
Impossible to filter them out as there is no information about the affected
recipe/package.

Kind regards,
Marta

--000000000000063b6f061e25a815
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 26, 2024 at 2:24=E2=80=AF=
PM Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 24 Jul 2024, at 16:25, Marta Rybczynska via <a href=3D"http://lists.op=
enembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org=
</a> &lt;rybczynska=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" t=
arget=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; This file contains CVE_STATUS without machine-readable information on =
which<br>
&gt; recipe it applies to. All entries should be verified and, if appropria=
te,<br>
&gt; moved to their corresponding recipes.<br>
<br>
The point of this file was to be an opt-in for more exclusions where we did=
n=E2=80=99t feel 100% confident asserting the issues could be ignored.<br>
<br>
How much of a problem is it if this file contains a a limited number of CVE=
s?=C2=A0 We can review what is in there and move/remove as needed to cut it=
 down.<br></blockquote><div><br></div><div>With the vex class (and with SPD=
X too, I think) they end up copied present in every single package of the b=
uild. This brings enormous confusion.</div><div>Impossible to filter them o=
ut as there is no information about the affected recipe/package.</div><div>=
<br></div><div>Kind regards,</div><div>Marta <br></div></div></div>

--000000000000063b6f061e25a815--

