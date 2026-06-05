Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89B0ACD6E74
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 12:52:28 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7530.1780663944917481965
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2026 05:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YEvdwDvI;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8ced8f44da0so19543606d6.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 05:52:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780663944; cv=none;
        d=google.com; s=arc-20240605;
        b=aZW9MmuocR09PIS1FxL9cTnTkWPdGfSq6mr58H6Uqal1VZu1O+MgsuSiZwMcLZ5+RT
         URK2A+2pFJ/qG2QK2Iy1PL4LnhfMnvoC/MTTAbtkQs0vgFMz2AULfmCPbtclNOrqONSm
         fXEDueyNG5AMBAaBaNC1cq+3AYrrtxMFYBfZf2PJOCNZsyJqasMKGFUCKwAq4dcdUUqS
         FnDzjmvMZQrC19SnstFuV64mLNn85TjDc/OPYT/ShzdakjG8YpWOnU1k5MXQKZ0G2L/6
         anA/6lQUtr0PCki4p5wDqm7CeLB/9FDcpY8rTDGORo9zuwiihHDUt8zTLcNjWcXJbgzP
         AuBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hfyUXaV8fYonHCF9sKR7nIyEL7TWseR6jZxI3At3V1w=;
        fh=gjyEbVptKpW7HZ/B4Ygk+lE43ujcGsfIf8ddS2iWD48=;
        b=g1xEXx2tseurYlYQD5FBoZ3TZJd+flXwjYMAXhXWOdZxPIqGZ5T3nhCq3xti7cDE9g
         nT4sEBbGQ68XfF3aiwswaahss5yC8c7UuxUb25kXtUu9+lBLhOQQcvHWyc0qq0Z7u/G7
         wao9sqaL4VzApObc2Nsl1EOrnwNygAxv2FsnCjFcLvSW0xDCOPElvf7ZRpht1CjzxqBo
         Vd1K45ImgJxjhKD3z3RtFp6vd9nHV9QyJPRD474gxkJAHA4TpbHzAY86xFfE1W5yjGDV
         D+DoCDt2Z5snC3Q2EEKfziLz7KJmQkFmJdEekD/yrGjEmtraBRQaTPg0xBsKkAdfjpgA
         YLTQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780663944; x=1781268744; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfyUXaV8fYonHCF9sKR7nIyEL7TWseR6jZxI3At3V1w=;
        b=YEvdwDvIXU6pZ3yPvXzilrYzTytnkCQeJte9eFqGLvdjhTA79A7kg9NNVXhn4X1ZA6
         yngzM+LcCh4GIkpBfW3t/2bhwalk8CYhurwQ6nI3bvPuhmw7XRM/FBy0yi1ydXlw5Fwo
         NY5TMy8OucJpRAecM7/wnq4QVhrukOVGMVA8q1t7/W9Rm5tMfRBJ6Jy6vrF6ZQ/nQD4+
         Koas1SeBXDPOpxUmc3peZqaf8xz8QDqccrnN72MrEdabfahjBNtaeum8w4pD6jaVdAgk
         4Bw+ld+1/XRnxCJbTJsFNp9oF/LeXfsxlvKjcY6xO0D38+H2Wige6Cr7fn6pZKeOPrn0
         Wrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780663944; x=1781268744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hfyUXaV8fYonHCF9sKR7nIyEL7TWseR6jZxI3At3V1w=;
        b=d6yb6MjEPn7fICiuS8X00AHngkeDsi3uwQB8eGnQiOfYpBHUZyTrzncgBE5CNyGtm+
         aIFNqXmby0RjZOgKa/FrvE/leGF4zaulsbgESIURl9dMvQH5rGGncKLD4F4hXxFs45Gg
         gfZKOO9PoJ5+9FjyhKx61WkE+dGy1terV1Nq4+N7+9Xl5O6NK/7AgNPtta5q1z5z4mXh
         tVuKMlKfQ6raVYjdyujg7S8WT4m2D3whQwKHJUIGZ2X4H4CniLhbQfijDy3KNfaSZi1A
         wXN+u9gYYX0f0ATg0AErOn2xEItK8Fx/KiPWBbLzpDPEbhISIkzRwlKo89Yy4Zq6/O69
         hODw==
X-Forwarded-Encrypted: i=1; AFNElJ8OBf/sNKo+Pzb8VsILtzlw1kO6tOkdOCEiEKaZmqvIY4ykw2HAa0UfDRVAyZSzHTTAYHLTU5zDNgQHAnKgonIqyA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzmiRqX6xEDRG5Oino7158qMN45Y2oWcbGNpsi2PDu/Feni8BsF
	meUx95wefcHrO8TUyAc0X+DTt6tNp6/PtrX26AKgg/3SReC2pAS6rOpIxjBTijL5Z2HpoVwd/l3
	uIlWCUFEsjJKV55tbbvdw2A/7LfVM1Vo=
X-Gm-Gg: Acq92OEhW28JcPyT4w8rqWhPZvLO3v35gMcEa32xfzUY+YltOVZMj+YUBfg5Zdz1Ju9
	uEDlo7WYjSpQMtYST8OXOlyH0e/ABUqBdkI6+ePewmqI25UKqm8DQ1AIk+uFxYxzoRpwVMu9787
	tebOZrDzvzEN7Ub7o6WcvD7kBAoYUd3Q6kYGs05q1AqXUV/mALZ0fIAt/H/WviCSGXMC49k08I4
	UQymKQdqMYibU0hhsjnGZv563C5jwhf34oRLB1vrTXQfYbUrq+IIfLm6ZvxVMC0ZsfANEs8YWkn
	HQML60KnCV2rfhdVOtasYx89rA4EK7Q73GTtmoExCMJCBZK/mQrD
X-Received: by 2002:a05:6214:4904:b0:8ca:268b:13b2 with SMTP id
 6a1803df08f44-8cee61597a5mr60696296d6.32.1780663943782; Fri, 05 Jun 2026
 05:52:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260528202639.4097815-1-Quan.Sun@windriver.com>
 <DIV636CRY5LQ.2KV03HIYY2WKI@bootlin.com> <be287797-1941-4afa-8aef-b015ca194476@windriver.com>
 <CANNYZj8gMc8PdWMse=g1J7goZC5Ga=nwN5hA+uX02-G+LNHEwQ@mail.gmail.com>
 <7da33301e8a0bae93a33695b4fd41f67a08e1b9f.camel@linuxfoundation.org>
 <3bde2ef8-5565-4495-9904-dd3db839de1d@windriver.com> <CANNYZj8St8Foj7C1RZnGPFmzsAFyCEjvXVZa9DD5Wv6YQ8u1TQ@mail.gmail.com>
 <237df978-b1f2-4c66-ab4c-5894f7a44a02@mailo.com> <aiKEeH2UZgdePzjX@redhat.com>
In-Reply-To: <aiKEeH2UZgdePzjX@redhat.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 5 Jun 2026 14:52:12 +0200
X-Gm-Features: AVVi8CcR5KsWpI7uOyNhPpbQvEgUZiTknSJbHZMgUqw4a3XtxMJ61nz8_kCBsd4
Message-ID: <CANNYZj-x8efUVB9Z5d2T9Ye4so6v3zamHVTexRCGmzOmkB6EuA@mail.gmail.com>
Subject: Re: ui: Regression calling eglInitialize() since v11.0.0
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>, 
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org, Quan.Sun@windriver.com, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 12:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238168

On Fri, 5 Jun 2026 at 10:10, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
> > > It's the same issue, I assure you. Qemu 10.x prints nothing and simpl=
y
> > > starts, while qemu 11.x first tries glx/dri3 , then wayland/egl/vgem
> > > (even though there's no wayland running on the build hosts), and then
> > > finally crashes, with the traceback that RP provided.
> > >
> > > I don't think it's a race condition, as the failure is deterministic,
> > > but I agree that something has changed in qemu's GL initialization
> > > sequence.
> >
> > Cc'ing Marc-Andr=C3=A9 & Akihiko
> >
> > Context:
> >
> > https://lore.kernel.org/openembedded-core/7da33301e8a0bae93a33695b4fd41=
f67a08e1b9f.camel@linuxfoundation.org/
>
> If it is an suspected regression between 10.2 and 11.0, then
> I'd suggest someone who is able to reproduce the issue reliably
> should do a 'git bisect' to narrow it down precisely.

I've done additional testing, and I can confirm:

1. Reverting the following commit fixes the issue:

commit 52053b7e0a0e285ce3448b830053b05fb0a9b1a8
Author: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Date:   Wed Mar 4 16:50:30 2026 +0000

    ui/sdl2: Implement dpy dmabuf functions

2. Updating to 11.0.1 does not fix the issue. It includes a fix for a
different, but related problem:

674221887f ui/sdl2: Fix assumption of EGL presence at runtime

Note that the environment we run in is X11 without wayland, e.g. a
XTigervnc server that provides a X11 display.

Thanks,
Alex

