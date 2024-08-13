Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F5D1C52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 13:05:43 +0000 (UTC)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web11.71532.1723554336798155821
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 06:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eg7IF8ue;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.49, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-70940c9657dso2785158a34.1
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 06:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1723554336; x=1724159136; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXBGdM9PbPBpJ8WvXvUkYI9/7IuMvKspS97FuokW6qM=;
        b=eg7IF8ueVc3DH7lpgHD5qXE6Vwe3Huv/iL5uhuTt3VMclHT6c5XZmPbhkmcuYIim4e
         wP57UqFFep2lWOawMdSq2L/s/goGISTNbc4GKEzdHJplb80uGHwc6qNYZ/5Bwc+msal7
         qpeN1QY2uEEcn8z4nIFwBBJoZOzHFNaf2ojw3AQRvowSsFMKEFgIatv4nnGJG3DYc/Xo
         D/4d9/uPy7rF24Te/c8d6PmdrXMMvf/sU9GwfocN1BLdnqjjE/p/dpUNMBNwazF5UsK+
         4ntH7PBJtPfzgPPugdp/bf9sh2fRHbBjLhZcix283iICgLKId9gYWqJgt+dbQAVQNKwO
         vkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723554336; x=1724159136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXBGdM9PbPBpJ8WvXvUkYI9/7IuMvKspS97FuokW6qM=;
        b=vRSweI4xWR/8A9R9fpo/4lOX77ljOALE5B32/UiMFeJvSkfxAnFRA26ausxziCUonL
         PG9E/FUiQj52AmzWdQtt9yIKciPBeYC6wgiASUjeaIhyNbYqvBf0J+H4to9UsbKkMVQY
         OWLUH1NxGUAg2jhx+7oaG65G2ULWWHOMKvbHDE2jReDx+VFKgxYwbuMK8U67Tup8B61V
         0Aob1ePrkjuttgfAbBx34H99rGuSenwx6KpZEWp9Ll5Z/hCJv3E+dl1s+pUWmBl+BXy3
         ENUHxMQ2QN2gE+Nfi0XAdDTIF6pGD9Gz5JOEz7QVib4GgAG0QG1QRHoStTiI15NF28nR
         W22w==
X-Gm-Message-State: AOJu0YzSyyf74HbZIhrgHsu+B7fzDsH5v5xNWY5VUtzzadGL4YEWaJqg
	IBeauSVrcMKBkl+Xv+O8sXEHFwIE8DgsCKNj8IFM0kFnB41W2wQpq3sIkp3OwzouhSt6Md9hvsO
	PCLIkfN1R7ORcitdmh3q2hsPN/DCo5KF38gAn7L/cZCGll9kQQLw=
X-Google-Smtp-Source: AGHT+IECjpEtIM8FL7fOqQ78Qh2WSetZlDJJ4Z/rsMMHubBak01owXpCp3KqgD60ZVLXdB1/ZshT3y0VxfXWFSTGxX4=
X-Received: by 2002:a05:6830:4197:b0:703:6989:5b04 with SMTP id
 46e09a7af769-70c939a6e77mr4270648a34.31.1723554335964; Tue, 13 Aug 2024
 06:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240807215441.11715-1-peter.marko@siemens.com> <AS1PR10MB5697AEF7EB765B0AE980CD5DFD862@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697AEF7EB765B0AE980CD5DFD862@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 13 Aug 2024 06:05:24 -0700
Message-ID: <CAOSpxdYNXuipjF2kB0nsZ7Bc7um-h9L=TqGS=rcVFgSG0a0txg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] libyaml: ignore CVE-2024-35326
To: "Marko, Peter" <Peter.Marko@siemens.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 13:05:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203277

On Tue, Aug 13, 2024 at 5:45=E2=80=AFAM Marko, Peter <Peter.Marko@siemens.c=
om> wrote:
>
> Gentle ping
> maybe this was missed because of title similarity with the CVE-2024-35328=
?

Sorry!  I've got it in my test queue now.

Steve

> Peter
>
> > -----Original Message-----
> > From: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> > Sent: Wednesday, August 7, 2024 23:55
> > To: openembedded-core@lists.openembedded.org
> > Cc: Marko, Peter (ADV D EU SK BFS1) <Peter.Marko@siemens.com>
> > Subject: [OE-core][kirkstone][PATCH] libyaml: ignore CVE-2024-35326
> >
> > From: Peter Marko <peter.marko@siemens.com>
> >
> > This is the same problem as already ignored CVE-2024-35328.
> > See laso this comment in addition:
> > https://github.com/yaml/libyaml/issues/298#issuecomment-2167684233
> >
> > Signed-off-by: Peter Marko <peter.marko@siemens.com>
> > ---
> >  meta/recipes-support/libyaml/libyaml_0.2.5.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/libyaml/libyaml_0.2.5.bb b/meta/recip=
es-
> > support/libyaml/libyaml_0.2.5.bb
> > index f7c29e7e0f..e30dc5a43f 100644
> > --- a/meta/recipes-support/libyaml/libyaml_0.2.5.bb
> > +++ b/meta/recipes-support/libyaml/libyaml_0.2.5.bb
> > @@ -19,6 +19,6 @@ DISABLE_STATIC:class-nativesdk =3D ""
> >  DISABLE_STATIC:class-native =3D ""
> >
> >  # upstream-wontfix: Upstream thinks there is no working code that is
> > exploitable - https://github.com/yaml/libyaml/issues/302
> > -CVE_CHECK_IGNORE +=3D "CVE-2024-35328"
> > +CVE_CHECK_IGNORE +=3D "CVE-2024-35326 CVE-2024-35328"
> >
> >  BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.30.2
>

