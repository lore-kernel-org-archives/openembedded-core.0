Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9276ECE564
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 09:22:53 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web11.18559.1725960172242316682
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 02:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NpceTz8H;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f752d9ab62so49157701fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 02:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725960170; x=1726564970; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xeXg8dXGLYeVOpAclOkjldlETYQ7Q544CGq7Rexooe4=;
        b=NpceTz8H+gQgeGrXycnARBRRgHdQxYZ26tYGs1PYEV32WFppvzkCxOL8xeTbrEp4qs
         Y7h5aggQyxGl5ofDEyS+aN6A/fhYKRJmVBDURFMsL07CT2Fnij5E7WMUUhzFZSxAXJGd
         1GrWEw0QZVAVtHpmlc8OhjBc+CHPHpkQ732GN4U5/xYBMw5wTig534QFoq+QnebKbX6+
         rB1mqIxILwf09YnRE3cqcv4UwybisBt3PKILcp+xJTbaiLI7a9tKXi47S4xYwhqxLljY
         NNV2yHUzVFHt9RETC/tzeMalGfsnVSe8uNyu1fLt38CN67MjBUmqLnzt23Hj+q4gWpBr
         YCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725960170; x=1726564970;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xeXg8dXGLYeVOpAclOkjldlETYQ7Q544CGq7Rexooe4=;
        b=BnOzpngPpmzbCaKtiLX8rgXbnwv+lHouU64vI7Rit3ted96X3KltK2a88ZpJxym4e+
         p3jWH/eq3LgR3R+/nhBMTT2CUMxV/6IiFpRDta78qgzLjZf44nSZR+fLwxud2it6JGeQ
         OGs0b5p37MAGfA4z+iIrW2ws597y8MfQLT7qa3xQ9emFQwYRgZfecw8zeiZajCpX45ll
         NZgfCYWrFPjnhOAXT8m5xiOCChhK62b3OKTWxhY5laN9gPLxushPbaeNDUH0c+fc+q2b
         WSfyVfk/mjJMgClD9gv0ng6Ur4mrbyH80GgJOqiMkU7JfsWrhMqyCda+fnWK4FrPrzHV
         0mcg==
X-Gm-Message-State: AOJu0Yxpy33yNpHa9r5PHbuWvhJXwFT5yNnJ7eMYF/MGiY9VgwhawDDD
	qZrYyKLhiD2RgB8H2+YlTwyG8N+hqDoWSYOHEkWWhSPDgQYRUipXiVXqUevgFJPwc4gzlVrwPlR
	TAw8CVessHQm6kka/Q9WTRHk9yy0=
X-Google-Smtp-Source: AGHT+IHYScWwkAT3kzv8h3vyFdty8JFhdCd6VVtyiBNa0ulrheX6/LK0Cr90aCpimq/5Y6I/02TC20M0WMJrz+TLvIM=
X-Received: by 2002:a2e:a589:0:b0:2f7:6bab:efea with SMTP id
 38308e7fff4ca-2f76babf1a8mr37101351fa.44.1725960169728; Tue, 10 Sep 2024
 02:22:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240910072006.3938401-1-ejo@pengutronix.de> <20240910072006.3938401-3-ejo@pengutronix.de>
 <CANNYZj_zpBOjperL-mxO+D5rEM768Sed8VFohUkTJbnR6piDNQ@mail.gmail.com>
 <4f6f8ac030656c18edb7972c5d8e6f0574683daa.camel@pengutronix.de>
 <CANNYZj8nzNzpGRqqSkYtKEuxu6hbBapNQSGkMh8HjRUVLb7GsA@mail.gmail.com> <528047d8da240c9bc9833efca62d7728ee0d1dcc.camel@pengutronix.de>
In-Reply-To: <528047d8da240c9bc9833efca62d7728ee0d1dcc.camel@pengutronix.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Sep 2024 11:22:38 +0200
Message-ID: <CANNYZj9DVV7ak=KnfJhE9+H3sA9tputtgRz68yPuU=-KwS=50A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v4 2/7] barebox-tools: add initial barebox tools support
To: =?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>
Cc: openembedded-core@lists.openembedded.org, yocto@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 09:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204345

On Tue, 10 Sept 2024 at 11:02, Enrico J=C3=B6rns <ejo@pengutronix.de> wrote=
:
> My impression was that the actual amount of things to share would not jus=
tify another file.
> It is mainly license information, SRC_URI and a bit of metadata where I f=
ound it more obvious to
> have them in the respective recipe.
>
> If having shared parts in a barebox-common.inc is actually preferable, I =
could rework this of
> course.

It is yes. They are the same between recipes, and so should be specified on=
ce.

> > Also there should be a good DESCRIPTION in there. Why
> > barebox, and not u-boot, for example?
>
> Trying to outdo other projects was not my intention.
> So I would like to omit such comparisons from the description.
>
> My current summary:
>
>   "barebox is a bootloader designed for embedded systems.
>   It runs on a variety of architectures including x86, ARM, MIPS, PowerPC=
 and others."
>
> does not yet get the point of a bootloader?
> I also thought that adding too much information would make the summary to=
o long.
> But in case something important is missing, I am open to further suggesti=
ons.

There's a SUMMARY (which is ok), but there's no DESCRIPTION, and they
are two different texts. We do require a DESCRIPTION that contains a
paragraph or two, with multiple sentences that properly introduce the
project. You don't have to directly compare to u-boot, but you do need
to highlight the best features and advantages of the component. Being
terse or generic in DESCRIPTION is not a good thing, and no
DESCRIPTION at all is even worse.

Alex

