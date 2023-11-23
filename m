Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFF1C624B4
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 14:50:08 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.92393.1700751003643017383
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 06:50:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=amkxS31X;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.41, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a04196fc957so131710466b.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 06:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700751002; x=1701355802; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uxSyc3zN8mt9SRGmtrhG2Uv9rL/fbr2ZxtZ7rWFX4zY=;
        b=amkxS31Xsx3p/85BbF/OMD0JwlnmLq6Uoj2Th+R9b21A9oCnw1PIHajczCByjZM2yr
         mWEkKz9/aMcpeh1WBaPv2T3ykWIRXvD1LvEXcomsY3KsVqMzNpgD/5yAKjGKfFaF5ukD
         jKUPmosKCCVDyaRnzZq081MtfOAKejpsZOuRz/Zh5qZZ3JttvMfKrSBrB9mGrrCi4Ibs
         AzdEEuCUJLEdKiuEM4Bbelxc97LqyQ/kQ5qmj220zQtbUv3pb0YTw9uRggYGGCZDSuTx
         EtNJ8MkhbDaP9XwrU8Gxv8g4SlI51wml+xxiys5pm3LyJdqHeznAIejg/qeQzjVFYA2z
         xZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700751002; x=1701355802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uxSyc3zN8mt9SRGmtrhG2Uv9rL/fbr2ZxtZ7rWFX4zY=;
        b=oOrUGQeSWAEBL97sQuHJNTC/nylstcDsJ25nZnsoSfAPKFVqf4P8IlaJVF9LkHPFeR
         FsvxHxFtXFjaHHHs2GfpDpKzXGbMV2LE9WEJyYvxi4p+Mww6hvtdOJYlxjIG9Fv1NgjN
         o6Z7XyXZp4BDRjEEjYCntrn20g4q8/AvuBufvBjZXtJN4FHpw4ZEiOHbYnlyce6XdoiL
         ecBA2KINzsUpHRM0tQA4IrfIFSDABgZRMaelR0z9aqU87ITHnbE+8VnAEoFnuy+lJuS6
         gdSkwn2Kxa7uxnaNqaCABP02AjjniYtGIwYhNd2vn4uX+eevam5uI9omkMWs+rrVYshi
         Vwxg==
X-Gm-Message-State: AOJu0Yxcp6uMJrd1mIe2+nfq1dgE8BxyrDbn9ccimnvOfSdONX3kMTtB
	7t2lAFM5ouTXflIbykTcr1h9pQ0gKxfCXRw4ivBAUw==
X-Google-Smtp-Source: AGHT+IEW59WH4SZ/+GnKnjqjWVyxrihy0nHCIwWi96kWiZ+JEUvGxF1rGD/Pk5CMHQBN0n0ClqJodMeJXjug4SPO9X4=
X-Received: by 2002:a17:906:11c:b0:a03:a1e6:2c70 with SMTP id
 28-20020a170906011c00b00a03a1e62c70mr3611473eje.46.1700751002037; Thu, 23 Nov
 2023 06:50:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1700620126.git.steve@sakoman.com> <03e6ea59d82e613ba3b5d388fa87317cef982f2b.1700620126.git.steve@sakoman.com>
 <e41e538ce6ebbe4c30af4de9c6a1f4e02fd9f359.camel@linuxfoundation.org>
In-Reply-To: <e41e538ce6ebbe4c30af4de9c6a1f4e02fd9f359.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 23 Nov 2023 04:49:51 -1000
Message-ID: <CAOSpxdbYSdnkLCb0Qyh9w1ZdwbZsEgsvKQfMCaNk8j=0d6d=7w@mail.gmail.com>
Subject: Re: [OE-core][kirkstone 09/16] binutils: Fix CVE-2022-47007
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 14:50:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191164

On Thu, Nov 23, 2023 at 2:41=E2=80=AFAM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2023-11-21 at 16:31 -1000, Steve Sakoman wrote:
> > From: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> >
> > Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  .../binutils/binutils-2.38.inc                |  1 +
> >  .../binutils/0033-CVE-2022-47007.patch        | 34 +++++++++++++++++++
> >  2 files changed, 35 insertions(+)
> >  create mode 100644 meta/recipes-devtools/binutils/binutils/0033-CVE-20=
22-47007.patch
> >
> > diff --git a/meta/recipes-devtools/binutils/binutils-2.38.inc b/meta/re=
cipes-devtools/binutils/binutils-2.38.inc
> > index 43cc97f1ef..dc29141812 100644
> > --- a/meta/recipes-devtools/binutils/binutils-2.38.inc
> > +++ b/meta/recipes-devtools/binutils/binutils-2.38.inc
> > @@ -67,5 +67,6 @@ SRC_URI =3D "\
> >       file://0031-CVE-2022-47695.patch \
> >       file://CVE-2022-48063.patch \
> >       file://0032-CVE-2022-47010.patch \
> > +     file://0033-CVE-2022-47007.patch \
> >  "
> >  S  =3D "${WORKDIR}/git"
> > diff --git a/meta/recipes-devtools/binutils/binutils/0033-CVE-2022-4700=
7.patch b/meta/recipes-devtools/binutils/binutils/0033-CVE-2022-47007.patch
> > new file mode 100644
> > index 0000000000..cc6dfe684b
> > --- /dev/null
> > +++ b/meta/recipes-devtools/binutils/binutils/0033-CVE-2022-47007.patch
> > @@ -0,0 +1,34 @@
> > +From: Alan Modra <amodra@gmail.com>
> > +Date: Thu, 16 Jun 2022 23:30:41 +0000 (+0930)
> > +Subject: PR29254, memory leak in stab_demangle_v3_arg
> > +X-Git-Tag: binutils-2_39~237
> > +X-Git-Url: https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit=
diff_plain;h=3D0ebc886149c22aceaf8ed74267821a59ca9d03eb
> > +
> > +PR29254, memory leak in stab_demangle_v3_arg
> > +
> > +     PR 29254
> > +     * stabs.c (stab_demangle_v3_arg): Free dt on failure path.
> > +
> > +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gd=
b.git;a=3Dcommitdiff_plain;h=3D0ebc886149c22aceaf8ed74267821a59ca9d03eb]
> > +
> > +CVE: CVE-2022-47007
> > +
> > +Signed-off-by: Deepthi Hemraj <Deepthi.Hemraj@windriver.com>
> > +---
> > +
>
> This has not merged to master yet. It probably will but...

This CVE shouldn't affect master, it is for binutils versions 2.34
thru 2.38, while master is 2.41

See: https://nvd.nist.gov/vuln/detail/CVE-2022-47007

Steve

