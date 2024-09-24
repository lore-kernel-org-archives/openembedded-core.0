Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC78CF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 12:41:14 +0000 (UTC)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
 by mx.groups.io with SMTP id smtpd.web10.13029.1727181664876623374
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 05:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cAk2txjK;
 spf=pass (domain: gmail.com, ip: 209.85.161.52, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5e1bf327af8so2574546eaf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 05:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727181664; x=1727786464; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HhQ7eg7b/ercIkwY6mN6NJVNQgMEABIYtNUtjX0ioys=;
        b=cAk2txjK+g1EuNrJR+WlrThtLCwrQjcnADVgciHg8rqqek2PvMm05aa6HFArq0REXz
         OEE5xt/EhoJTKwZEi2Ei9a0TeWJuKzcMdVvPayP7v7BlHFd0OO3odgRrar/bomX0WMch
         ap8zIWqnTYWwdYPENdi4wCt17Wvf7WzfLE/Tenw99BvrifsDUp96te+6Tkq+tq2kPl0J
         wxVYSkc3JO+tiaUZbjcYFjElSV7CV5qw503+T0UVMT1IpKs2PSdyAwqfFlzwRkRy7CAm
         q1Y664Y81Qp5PjDtAhtr6eu860nwg7Dm7F/UeIxY2QoK6sA6AnuhjWP/nXrZm1ibUdLD
         Zt/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727181664; x=1727786464;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HhQ7eg7b/ercIkwY6mN6NJVNQgMEABIYtNUtjX0ioys=;
        b=C+8obS07phDBFpMpI6Of41Ccy9wd/wF19O71DB91AnyHsqZTH95y/4nqJfCesvDg8n
         DWJ71c/sB07L4TSY7/3WnhnI9ixNLnajm5r+tet99eR1KElfABWl4JwQNyse/QRuHGn5
         FUhL3zs/8HoDL/fPxv9ibeeFxe4rMDKCXmB3d844TyzlPGj1tPz4N6Pzfo158n2gNL4D
         sjrTG6PRbWSkWcftnpxOttOJtDwQOJt5XKaYXplWlOQPS5QXq9ny6K1TPIaYBAHfkRP6
         By9LTlaKygou4lEq/8bcQbQa9pst+/iCclNJJ0CvhBCTVhq6VVgpz3CXZ2/KFAD+QYW9
         MlrQ==
X-Gm-Message-State: AOJu0Ywwk+CzU3WJQQg1RZEU4MTVsVDkxPk9iStV3B96j5cwZskcqd9d
	+YGuY/A/wDjcZvC36kNpL2qKU+dmY0Uc/y4g/fXG2NLNg4mHJ0uHYpBTTtH7C0HoXFDRJdrQ7MF
	jeCiOWr/BPxWxXGsZnyBGxthrBxw=
X-Google-Smtp-Source: AGHT+IGpU6bESN/LbK06xDe6N5KyWR2VO8zYSjXhA191X/zSVrc6o79A6svnPqIafrwSY55UOIURKyuru1rRXIGXFp8=
X-Received: by 2002:a05:6820:1c98:b0:5d8:e6a:236 with SMTP id
 006d021491bc7-5e58ba5d1fbmr6826776eaf.3.1727181663911; Tue, 24 Sep 2024
 05:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240924002124.93673-1-raj.khem@gmail.com> <572CADAB-0455-487A-B8B3-66375FE05F37@arm.com>
In-Reply-To: <572CADAB-0455-487A-B8B3-66375FE05F37@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Sep 2024 05:40:52 -0700
Message-ID: <CAMKF1spJpvoJZfPHumr=Re1yprr3B=X+5N_WbvBUuuWqNHJSdA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd-boot: Enable on all arches except x32
To: Ross Burton <Ross.Burton@arm.com>
Cc: ",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Mikko Rapeli <mikko.rapeli@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000008a49500622dcd1d1"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 12:41:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204859

--0000000000008a49500622dcd1d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 4:32=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:

> On 24 Sep 2024, at 01:21, Khem Raj via lists.openembedded.org <raj.khem=
=3D
> gmail.com@lists.openembedded.org> wrote:
> >
> > Add other architectures as and when found not working
>
> Have you tested this on an architecture which wasn=E2=80=99t in the compa=
tible
> host list?  Being a bootloader, it=E2=80=99s not like it will just work e=
verywhere.
>

That seems to be the expectation with latest changes I have tested it on
riscv

>
> Ross

--0000000000008a49500622dcd1d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Sep 24, 2024 at 4:32=E2=80=AFAM Ross Burton &lt;<a =
href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-co=
lor:rgb(204,204,204)">On 24 Sep 2024, at 01:21, Khem Raj via <a href=3D"htt=
p://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.open=
embedded.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.openembed=
ded.org" target=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<=
br>
&gt; <br>
&gt; Add other architectures as and when found not working<br>
<br>
Have you tested this on an architecture which wasn=E2=80=99t in the compati=
ble host list?=C2=A0 Being a bootloader, it=E2=80=99s not like it will just=
 work everywhere.<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">That seems to be=
 the expectation with latest changes I have tested it on riscv=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rg=
b(204,204,204)"><br>
Ross</blockquote></div></div>

--0000000000008a49500622dcd1d1--

