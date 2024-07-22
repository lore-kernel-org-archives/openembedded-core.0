Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0554DC3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 16:41:26 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.22991.1721666481113710292
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jul 2024 09:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WwCzjMqL;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5c69848ca98so2330259eaf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 09:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721666480; x=1722271280; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L8iEEf2AABzRwnNZTPGedG4tn5LhsE9JrkdnH6zM4MA=;
        b=WwCzjMqLLzGfn+fjrRb7qfFUEkFVGHKo5wZzv5FLlPdAsqSLWpjqUo/qaVT05/2IK1
         AL7p5Foou11cCYiDfcOI1x24iSMLaxKZF/fTjQAZN69Ba97cVOptKeBBeR+kHaWQjw+Z
         gnkKXGF+nPP6psbER19gdwIeWKjkouZLhUdBklIsAQ+V3pJ4Sxl95OqiMOXP+punOOXW
         ptAFhtKRr9Vxi/CYMVQ/viPKMrmxH08ffY76qw6FAnROUA4uBUjkLxANsEOeJMelCQcl
         9DpCmRD2WlcFxKMnxX1vkLVLGBT3qGoJYkPxtYdu4DSbQqUfRTyfAlASRhh4bFT4dLb9
         J90Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721666480; x=1722271280;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L8iEEf2AABzRwnNZTPGedG4tn5LhsE9JrkdnH6zM4MA=;
        b=mMvusMOLh4wsBrdaZc9/OqoLHPK72nXKBelBMx9CcX3AdQX5LlBXuHgPemyIwtfGea
         HE49pKwxr8ubGcoRSBsHFiq0wT/cSr9D3riEsjvdOPVEx4DJb4eHces8Wd9b4P5KAPkl
         1Mz5s7yQ065psspjbzA0deZPwHwxCtinIBqiL9T1fV7DkdYByc+gNZS+dtkXJhwlitXv
         XCjMkeWFWz7ufZgDmlpHLRpF7353KZ13fCA5rDWNu2ynxdOvEDgfAgRwoGaXF6aZxwEm
         E41gcAlcLCZwbevl7rxUlHHB36q3DVGNSZXzGk8HXybCzmlVUbKvyhW9pwKETrfSLr+c
         /a4A==
X-Gm-Message-State: AOJu0YyWzatjLKbOFUYS1cexrrIgS2XuCbRrv3V/q2Pm1nUej7UtH1MQ
	0cLQ0WXTns3DEET5N9q9ZteXXS2OLaX/UsvMKffbKqQleS2fLPna3kuJSpJSKtMAFFwa7mQHRMk
	V34puFVG9YGJRZPpyOCCZClVvirQ=
X-Google-Smtp-Source: AGHT+IFZHSOKUgkeCP5IuGlnV1bZ1ZodO7i1IH6pDZk+5id8m4ZSTuaTOcrFNcuoqV+UnYvR8MothYBZj9pGhuWAcWM=
X-Received: by 2002:a05:6870:f151:b0:25e:1976:37b8 with SMTP id
 586e51a60fabf-2638df92737mr6565262fac.29.1721666480323; Mon, 22 Jul 2024
 09:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240721180336.2642270-1-raj.khem@gmail.com> <f4d52025ba8c00ceaf60819d21ebf62532e8b535.camel@linuxfoundation.org>
 <CAMKF1sroJs_73HtyVYszWog2dr3zrUgsJqmF5+SourfUcg9+ow@mail.gmail.com> <90ef6669ed9ada15d6db57cdb24059178bf86207.camel@linuxfoundation.org>
In-Reply-To: <90ef6669ed9ada15d6db57cdb24059178bf86207.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Jul 2024 09:41:08 -0700
Message-ID: <CAMKF1soD4RDa6G=3COqsoCEtz8CFtra6j_8Rgo1+O9Y_Psb4FQ@mail.gmail.com>
Subject: Re: [OE-core] [RFT][PATCH 1/2] glibc: Upgrade to 2.40
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fb451b061dd8b6e6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 16:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202319

--000000000000fb451b061dd8b6e6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks good, thanks!

On Mon, Jul 22, 2024 at 9:36=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2024-07-22 at 07:18 -0700, Khem Raj wrote:
> >
> >
> > On Mon, Jul 22, 2024 at 2:22=E2=80=AFAM Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > > On Sun, 2024-07-21 at 11:03 -0700, Khem Raj via lists.openembedded.or=
g
> wrote:
> > >
> > > Thanks Khem. I ran this through the autobuilder and there were only t=
wo
> > > failures. One expected as it tests the buildtools libc which doesn't
> > > work until we upgrade uninative. The other looks to be an intermitten=
t
> > > qemuarm failure. From my perspective I think we're looking good to
> > > merge this!
> > >
> >
> >
> >
> > Cool yeah and today the release also came out so I am not expecting to
> make any more changes to the RFT series
> >
>
> I've gone ahead and merged it which lets us proceed with a uninative
> build/release.
>
> Cheers,
>
> Richard
>
>

--000000000000fb451b061dd8b6e6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Looks good, thanks!</div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Jul 22, 2024 at 9:36=E2=80=AFAM Richa=
rd Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard=
.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">On Mon, 2024-07-22 at 07:18 -0700, Khem Raj wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Mon, Jul 22, 2024 at 2:22=E2=80=AFAM Richard Purdie &lt;<a href=3D"=
mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.purdie=
@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; On Sun, 2024-07-21 at 11:03 -0700, Khem Raj via <a href=3D"http:/=
/lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openemb=
edded.org</a> wrote:<br>
&gt; &gt; <br>
&gt; &gt; Thanks Khem. I ran this through the autobuilder and there were on=
ly two<br>
&gt; &gt; failures. One expected as it tests the buildtools libc which does=
n&#39;t<br>
&gt; &gt; work until we upgrade uninative. The other looks to be an intermi=
ttent<br>
&gt; &gt; qemuarm failure. From my perspective I think we&#39;re looking go=
od to<br>
&gt; &gt; merge this!<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; Cool yeah and today the release also came out so I am not expecting to=
 make any more changes to the RFT series=C2=A0<br>
&gt; <br>
<br>
I&#39;ve gone ahead and merged it which lets us proceed with a uninative<br=
>
build/release.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000fb451b061dd8b6e6--

