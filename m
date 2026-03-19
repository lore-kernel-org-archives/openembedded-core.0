Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C702108E1FB
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 12:00:37 +0000 (UTC)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9387.1773921636674098162
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 05:00:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YEhG0uRj;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: rybczynska@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-128d2e3074fso657685c88.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 05:00:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773921636; cv=none;
        d=google.com; s=arc-20240605;
        b=SXUvY1KNV0dxYWxfYLF94csr4hTANNh7Exket6hLKvtoChEer3/BctIv4gof4CN8pt
         9VA1XTorcJMpvR/gs7VwrYWGHOs2ByYSt/pYDjn+rLOv+KMMH5NOVm4IIdmPvnm5mip7
         2qYkNylb5EmT+6QwR8pk6G01UYocfkSfY8KQ/vCkxHeTBcdExrh75Z1T14j/1FEoll67
         H74FnlNihI4nr2HD1SfALWPKnLP4dshfk5lkKtmVlE1ASvuwb2D7Zi5sltNvSOEobK1p
         ZepoxS9NOGtBYu+CUKiWbooarY7wLQBU7AvhxWwShTYd9YTzrTdnZSe8ouq+5d1o5Aew
         3jUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l2t4e80esJx5XQkyw6r5es5sRYijSKiNhEWm+dQTkDc=;
        fh=5XBvIyAltxsjrvvWzUgTCI1FW86NaX9Eq34i21B+KJY=;
        b=Dssnq4xchYPpJycmxz/3kUf95c+Z0buwoKmze1WkgUnaqJQKHZ5lQHCry3KXgeZjOs
         5mRgnqRRmSyJ5aIiYW3leNKJiXlzvOe1EgS2MAnevnnMorvAcJ5EHLR7qBc8qJlblBqv
         opsAEgfOxF1AvA6dYa8fGHaGd+HkscZ330CCFdRQjVdL6uvf+oMDb5ynHCwtUSod7mPB
         vtm75+hFFlUJSqLBy4N87S9ND9f85TnVOYVSE/wp0tKtV2Q4LgJNsei1f1VGV4qwcLId
         yIwqkKaF1zQ7mtwRYBsx3UmN3HHSsY4T/waY8Zf6uln4GDPSsjJ/fHCrSppLHxL/T0d5
         hVmQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773921636; x=1774526436; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l2t4e80esJx5XQkyw6r5es5sRYijSKiNhEWm+dQTkDc=;
        b=YEhG0uRjQpuVQrxEz+rVNgaz2PgliL1ZKr5Ef8eFhhc6Au3HUPmG5ftBRI5nRrap0K
         uIQa0y1M2qF3a/w1hk6wO/oHEi2xAffMapRFZcSiBkrsq0pEEFQiBjfViHiBfAOxwamW
         DYYK43xXPWqmpKG3pl4GVbfo/TLo7knnCgGtHhO98DkiY21ELu3JbtOGCV3/OTBS2fgo
         rBbiiZXwp+K90HehhJHo1gaaLZ5zWhH/6MWtBWoprMmGCJ/OVOd0Bjur2bjl3f5jcr73
         w+U2EXFzP3VVRVvp9lQoMMens0o/JUB9+dArt8zy5pg3vNmrWwsnZ0aF6fQbh56q+GLf
         Wo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921636; x=1774526436;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2t4e80esJx5XQkyw6r5es5sRYijSKiNhEWm+dQTkDc=;
        b=OmYhSqwSPwdm8Ltc/zv1I2PAjcqqvaSKeOLS+liKHCtw+TsiP05EAE5ZDPXANRfQAu
         bo3dZOzDUN/pAwITpMMcT63etzjhlxdh5HCZVJhyPbIUsdFYJiyjnjyvRz+FiO7fYIbh
         SLEU4DpmesimIqBemHU3Yh04+UbPBMiXfbUviFyVNdFWS2l4i46pUMNhdVDVKv/QfTvw
         mcWK4F32Bfs32WfDT51qta2J71jSBKYLMRoyNklhYvwzmqStmImCsks8tL63sbN5IAIo
         szsA/qBvQ2GzumBfexfTNj3WUGmCGCHuUF1Iz2C5zYE64SHkBpPv0d85BOZJnP0hg9pO
         YU8w==
X-Gm-Message-State: AOJu0YxVZs80BeXbrxMbgfHevxy8jA9txiICERgwJkYADo0FBArZf/Vk
	7Mn846n+a9pevjfrFQtRUJZlKVcSCSrfkHxR5tOd86lpFtlkBGc5oLb8cqAI5w+nH2y0X9ebyjI
	Fwc444YI/SN6F3MB1Hry73gkcZRuruJw=
X-Gm-Gg: ATEYQzwp7I8Z2ikFlRPoMTMWVwGfo4UMi3LFuav3rTIG2s8bATM4z4xvVQjhgYoiFJg
	4PoyIOUE2gNwoS1qo5Gikod4MatUIG3V1+FzcTPrfMdO1X5kvMi5LnGhPQouA8HT7QeWC8EyjPd
	uTtq1ahCS7nx+rB8r02VKbnqVVdWHUCx1SVpxATX4CsDuX+FhuASSNFPJHWRWC1fC+ugDXcqHMX
	e4W3xPOujISGPYqE+6MX7WQGOA4AWGjS96DgLkdO8EGw+2TiLWUUN79VhPISKDFbQ2IrhvfAQi1
	A+VVdbnupUb6DZMx7KisFwdjxccQOYjKf2ZO2dPW
X-Received: by 2002:a05:7022:eb54:20b0:12a:6a64:81ee with SMTP id
 a92af1059eb24-12a6a648378mr730342c88.3.1773921633225; Thu, 19 Mar 2026
 05:00:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260309-add-sbom-cve-check-p2b-v1-0-09165cddfcf1@bootlin.com>
 <8711656.T7Z3S40VBb@brobin-bootlin> <CAApg2=SHFU13o9EwuAe+NepU1CqEy2zO-xnBYoSmn2YaktXfxQ@mail.gmail.com>
 <2750263.Lt9SDvczpP@brobin-bootlin>
In-Reply-To: <2750263.Lt9SDvczpP@brobin-bootlin>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Thu, 19 Mar 2026 13:00:19 +0100
X-Gm-Features: AaiRm525KpURrv8d8R3f0rX_3qJB69zGvG3q_mFKVtTkccn-wzHS2sg9MU5skrA
Message-ID: <CAApg2=SpoAyoJrwL_f6jfX5Putwj_dzeYH1FnBnqJQOsKSQbGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH RFC 0/2] sbom-cve-check: Download CVE DB using
 BitBake fetcher
To: Benjamin Robin <benjamin.robin@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, ross.burton@arm.com, 
	peter.marko@siemens.com, jpewhacker@gmail.com, olivier.benjamin@bootlin.com, 
	antonin.godard@bootlin.com, mathieu.dubois-briand@bootlin.com, 
	thomas.petazzoni@bootlin.com
Content-Type: multipart/alternative; boundary="000000000000cece3c064d5f508e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 12:00:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233523

--000000000000cece3c064d5f508e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 10:48=E2=80=AFAM Benjamin Robin <benjamin.robin@boo=
tlin.com>
wrote:

> Hello Marta,
>
> On Thursday, March 19, 2026 at 9:58=E2=80=AFAM, Marta Rybczynska wrote:
> > On Thu, Mar 19, 2026 at 9:45=E2=80=AFAM Benjamin Robin via
> lists.openembedded.org
> > <benjamin.robin=3Dbootlin.com@lists.openembedded.org> wrote:
>
> > > I have just a slight implementation "detail" if we are using BitBake
> > > fetcher. What is the license that we should use for the sources?
> > > How to declare that in the recipes?
> > >
> > > Because the license of the repositories:
> > >  - https://github.com/CVEProject/cvelistV5 : Their is none
> > >  - https://github.com/fkie-cad/nvd-json-data-feeds/tree/main/LICENSES
> > >    It looks like custom license.
>
> > The CVE project repo does not have a licence included, but it is covere=
d
> by
> > https://www.cve.org/legal/termsofuse (the usage part). It is basically
> MIT.
> >
> > NVD has the specific,  licence, the one that is in the repo. A warning =
on
> > the
> > needed disclosure sentence in all documentation.
>
> So for you, it is fine to declare that the CVE databases are MIT?
>

CVE database is MIT
NVD (so also FKIE) is custom


>
>
> > AUTOREV isn't great here because it will re-fetch for each build. So if
> > you're
> > building multiple images or platforms (in CI or so), you will get
> > potentially different
> > results. cve-check has a set of variable to handle such use cases. You
> pin
> > to one specific release and do the whole checking with one single commo=
n
> > version.
>
> Yes, that is why I initially pushed to use my custom fetcher that is
> doing a git pull / shallow clone. With this fetcher I have a full control
> on the update period.
>
> But if we want to use BitBake fetcher, an user could pin to a specific
> version instead of using AUTOREV. But the user needs to to that manually.
>
>
I agree with Richard that using a git fetcher (or other existing fetcher)
is a better
idea than developing a custom fetcher.

Regards,
Marta

--000000000000cece3c064d5f508e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 19,=
 2026 at 10:48=E2=80=AFAM Benjamin Robin &lt;<a href=3D"mailto:benjamin.rob=
in@bootlin.com">benjamin.robin@bootlin.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">Hello Marta,<br>
<br>
On Thursday, March 19, 2026 at 9:58=E2=80=AFAM, Marta Rybczynska wrote:<br>
&gt; On Thu, Mar 19, 2026 at 9:45=E2=80=AFAM Benjamin Robin via <a href=3D"=
http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.o=
penembedded.org</a><br>
&gt; &lt;benjamin.robin=3D<a href=3D"mailto:bootlin.com@lists.openembedded.=
org" target=3D"_blank">bootlin.com@lists.openembedded.org</a>&gt; wrote:<br=
>
<br>
&gt; &gt; I have just a slight implementation &quot;detail&quot; if we are =
using BitBake<br>
&gt; &gt; fetcher. What is the license that we should use for the sources?<=
br>
&gt; &gt; How to declare that in the recipes?<br>
&gt; &gt;<br>
&gt; &gt; Because the license of the repositories:<br>
&gt; &gt;=C2=A0 - <a href=3D"https://github.com/CVEProject/cvelistV5" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/CVEProject/cvelistV5</=
a> : Their is none<br>
&gt; &gt;=C2=A0 - <a href=3D"https://github.com/fkie-cad/nvd-json-data-feed=
s/tree/main/LICENSES" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/fkie-cad/nvd-json-data-feeds/tree/main/LICENSES</a><br>
&gt; &gt;=C2=A0 =C2=A0 It looks like custom license.<br>
<br>
&gt; The CVE project repo does not have a licence included, but it is cover=
ed by<br>
&gt; <a href=3D"https://www.cve.org/legal/termsofuse" rel=3D"noreferrer" ta=
rget=3D"_blank">https://www.cve.org/legal/termsofuse</a> (the usage part). =
It is basically MIT.<br>
&gt; <br>
&gt; NVD has the specific,=C2=A0 licence, the one that is in the repo. A wa=
rning on<br>
&gt; the<br>
&gt; needed disclosure sentence in all documentation.<br>
<br>
So for you, it is fine to declare that the CVE databases are MIT?<br></bloc=
kquote><div><br></div><div>CVE database is MIT</div><div>NVD (so also FKIE)=
 is custom</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><br>
<br>
&gt; AUTOREV isn&#39;t great here because it will re-fetch for each build. =
So if<br>
&gt; you&#39;re<br>
&gt; building multiple images or platforms (in CI or so), you will get<br>
&gt; potentially different<br>
&gt; results. cve-check has a set of variable to handle such use cases. You=
 pin<br>
&gt; to one specific release and do the whole checking with one single comm=
on<br>
&gt; version.<br>
<br>
Yes, that is why I initially pushed to use my custom fetcher that is<br>
doing a git pull / shallow clone. With this fetcher I have a full control<b=
r>
on the update period.<br>
<br>
But if we want to use BitBake fetcher, an user could pin to a specific<br>
version instead of using AUTOREV. But the user needs to to that manually.<b=
r><br></blockquote><div><br></div><div>I agree with Richard that using a gi=
t fetcher (or other existing fetcher) is a better</div><div>idea than devel=
oping a custom fetcher.</div><div><br></div><div>Regards,</div><div>Marta=
=C2=A0</div></div></div>

--000000000000cece3c064d5f508e--

