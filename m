Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53E8C83F17
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 12:31:40 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.60810.1753965096298557531
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 05:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=OMUA+H7H;
 spf=pass (domain: underview.tech, ip: 209.85.221.45, mailfrom: vince@underview.tech)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b786421e36so524998f8f.3
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 05:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1753965094; x=1754569894; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3/SbylBJBVWBfBfat9bwTd9H2np9X2+bsfBshWqYOF8=;
        b=OMUA+H7HN9INAJMw//M9UA5G7IMbfHfPLmRbdjucAaA4w6wqXN0FJY5F3uZ73ZClYA
         0smJsQ3pdedqqB5A6g7WC4elL+hCDNcDrN4h4PxozlPQs7hyfn6UaemAVJy7gNsTdsnu
         YcTrf8k69sykiw1mYSmcHYf3nudIgNdS442G6KIHzAxvP9GjFXTOnLkgTwbIk27NI6Td
         Qdk4dJ5hCuzzMfzY3YFLO+JRfJX3awKs2JC3uoQ63EcGM7tIeQ+gsPYjgvh8p7w/fOhz
         xbpSa8N+s/z9IJ8h8ownHgNRLI8wX0T7E20eaP2wnlBp0q2sWBy1+FrUPc1rzaK5oAL0
         9MeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753965094; x=1754569894;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/SbylBJBVWBfBfat9bwTd9H2np9X2+bsfBshWqYOF8=;
        b=aLqAMEzOhs188D1K7T5IzoAfd8UaseC+gm5qw7bImltrUtJfxhXNTTqaYKsaHv1PWn
         SiiKBCmhC7tWY09huI8UedaAn0jkXHuxWq7tpDdaWmiqfcRxeYL74pgPTjHUx6fQ4dmC
         qu8aZt4aAsxKMy5vdKSPUPKT2yzO545g/YjnABk7o3UTjF+35uBlwV64Nrko0+k1VDjL
         uuFDoMYqEDK01PGZcl9Q8eNLbCYmZjCnMHaI9Ov/bR3PnwOXH3erWpCLhbgXaGd+1p+E
         qqiHRz/t3ZrdIpdQyJOkK1L85UoCOw9q9EMxiYQdczO6S/kzLiyECet/Gq96hCbTksZq
         OfTQ==
X-Gm-Message-State: AOJu0YznKYgjjIJN1sfaJlzhTBf2PLflcXQsdAbL2a7xNQ0Xvc3xnLkY
	Qw+nxe0/k5zUr/61t8sGthoIshVtbjKt8dyjqVLbUZ+4Bn6Eh3GdcaM4Uq5+FWiBSaT+3ozzZtk
	ACzdWJgUwnFUG44x4wQaCa87fe1ThEHvGhG2CvkV9cw==
X-Gm-Gg: ASbGncvhsQ3adlZRJz6pvA1rzuLeJMCyakuZxCAghMBhLZdFk6ShrVBk96NLoUUZh1P
	FnryQyavT2tsF+fv7fg343XtT6qyo3rC7v49+c5h68IqUTK104DsEMssOYjygqc/fDAqhSJpQIL
	qtqIe4pgu65gpsQ6TQ5Wm+q6mvN8jddsdn9Dw0yqv/icjbgwTsbZh1urjEsL4o5i6OB+FDBiIUc
	Tw6R0W4dFkCW8Ce6P4MXWhnGUg8IVSicNpUn3ii
X-Google-Smtp-Source: AGHT+IE1bZX5KyWFSLxGmw8teJbb+AGiJLE+301Bkphc2A/QjAK3CBev5+XkMni8dTj3sKmuvTuajwCWtnGCGZNZfxo=
X-Received: by 2002:a05:6000:64a:b0:3b7:95bc:a7ea with SMTP id
 ffacd0b85a97d-3b795bcaacamr4576399f8f.22.1753965094368; Thu, 31 Jul 2025
 05:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250726014655.3377745-2-vince@underview.tech>
 <20250726014655.3377745-4-vince@underview.tech> <5672524081b3323b718c5bb819faa1588745cd49.camel@linuxfoundation.org>
In-Reply-To: <5672524081b3323b718c5bb819faa1588745cd49.camel@linuxfoundation.org>
From: Vincent Davis <vince@underview.tech>
Date: Thu, 31 Jul 2025 08:31:22 -0400
X-Gm-Features: Ac12FXz1DQGe59zf4Dv6bbf8rMJx6SbVeVSVr-h40CWBoBEwpIPcc3qH1L8owVs
Message-ID: <CAPQx_gML05aGg764QibrnqxiCAi4X3NbMVT0SQH82L_QfqZK8w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 2/3] wks: add loader-bios to bootimg_pcbios source_params
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000660b65063b38d210"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 12:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221194

--000000000000660b65063b38d210
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Yeah, I originally had it to where it defaulted to syslinux then decided to
change it because from my experience usually have to update layers to
account for latest changes in OE-Core anyways.

No I don't work for intel. Will make requested changes.

Vincent

On Thu, Jul 31, 2025, 4:39=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2025-07-25 at 21:46 -0400, Vincent Davis Jr via
> lists.openembedded.org wrote:
> > source_params['loader-bios'] is required
> > for newer updates to bootimg_pcbios wics
> > plugin.
>
> Would it make sense to have a default so that older code doesn't need to
> be changed?
>
> Cheers,
>
> Richard
>

--000000000000660b65063b38d210
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello,<div dir=3D"auto"><br></div><div dir=3D"auto">Yeah,=
 I originally had it to where it defaulted to syslinux then decided to chan=
ge it because from my experience usually have to update layers to account f=
or latest changes in OE-Core anyways.</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">No I don&#39;t work for intel. Will make requested changes.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Vincent</div></div><br><d=
iv class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Thu, Jul 31, 2025, 4:39=E2=80=AFAM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, 2025-=
07-25 at 21:46 -0400, Vincent Davis Jr via <a href=3D"http://lists.openembe=
dded.org" rel=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedde=
d.org</a> wrote:<br>
&gt; source_params[&#39;loader-bios&#39;] is required<br>
&gt; for newer updates to bootimg_pcbios wics<br>
&gt; plugin.<br>
<br>
Would it make sense to have a default so that older code doesn&#39;t need t=
o be changed?<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--000000000000660b65063b38d210--

