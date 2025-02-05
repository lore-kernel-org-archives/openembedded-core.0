Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C2FC02194
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 15:52:08 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.15449.1738770724181320265
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 07:52:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LzHBPHWG;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6dd049b5428so52812126d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 07:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738770723; x=1739375523; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ae4SQ0RvMVwvk5PM2JrhU25UqvvnwsUTsN2mSU23R6c=;
        b=LzHBPHWGY+MY15pntpIjIO+takSSFJFchf1NppOY+VGZ/4rlFX2RebURH7/XKPxwnD
         zzOUop8u/TUEpHHkPEFH4YdqR/OLrJPChihCJz9sMk536cJnTZNAtEZXYEgsYcaNlgdr
         5yhhdPf4rJoKA8ZvjVbwFMegPnU7R/OpCV9FkCYcubXfu97iD6PmLIjAzi1GZ0cVanld
         ce8r6VkFVVGUhbEOpdaiPVtplOnpxn+mD+sjDc/EhpuqVaG4yWGmozs/PgnMT5JHOrEB
         aBydeoe91hZuQR1dBpYxa4w4IVDG1TcU1jebgo77p29dtPGY/yq9gcmaReSajAkp8Nwf
         hRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738770723; x=1739375523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ae4SQ0RvMVwvk5PM2JrhU25UqvvnwsUTsN2mSU23R6c=;
        b=HRjPDELby4b660QSr8dli29dkQit5qShT/O2jZTHBFma49vc3hw7MDpQLJtv883TFP
         He8+tYEA0u8WgY2OtR2/yWTbX2eh7NfI8mnLQnWvqsm/wkG7SbVCVUusM3AujVfjhWqA
         d2nsna5s607jdS3hixK9+ANcaMlGsc0QJd50+RrlBgrbFxHSvwWYzVqWk+RZb79g+lw3
         7VICP7mM+dywS2zQ+IqJAnql1Fvj+3n8LuWOvpVxXIQAoF+Qg67mec6rWAXCSqrbMZf2
         g9y8JTTJWfT8iluUZyiDHcr0Dxn/WNh/o6QmmFoGgCfnsI+d6yZdSYWCdXXu/b8vochU
         PARA==
X-Gm-Message-State: AOJu0Yyjw3XTG3tI6/iG28DnIqHt6hl3GQOf6GOyZv9Kqx4Va4kh7bo3
	AxPfOnN3ssaRZZHxG5PD2aOlFtWkgZKo8w75UmVrFD4yN72pE37C0aP2HQ2DTDrCqSQ/FGlSKGS
	zlA3AMGOu7mRa9SOz2EIHVOC7hbQ=
X-Gm-Gg: ASbGncuNDtJHO7+1z6t+DlB6IaYRmNofQ+GLIZL41B6hrBLcQPBguq9q1y6vDr135HA
	zt3C9hG4mMnEUeOjSDgHOTlaZeQxOzuXKkgC7IXRHmqbZLflY5Bs0VBLMB8gcXtitYzF7B3atcg
	TS0cSzSZviknxx/az9VUMBF1sqASx+0Vg=
X-Google-Smtp-Source: AGHT+IEv/5HnjM7otFhIIjydyQ7yYUtH/SXYcuYWx/PMrQOi+bZhJB356clX7NncwXcpBuy+IJ8XOKIDinkkz0TD4CU=
X-Received: by 2002:a05:6214:cc4:b0:6d8:e5f4:b977 with SMTP id
 6a1803df08f44-6e42fb22b56mr57855356d6.5.1738770723158; Wed, 05 Feb 2025
 07:52:03 -0800 (PST)
MIME-Version: 1.0
References: <20250205043637.2649428-1-zboszor@gmail.com> <CANNYZj-t=1kCNq4UNLEnqG65n7dFBZBbNVPQYsrAXGoeb=4VMg@mail.gmail.com>
 <2cf08e42-f322-4d29-9867-85d1723480c4@gmail.com> <CANNYZj_XJzXiBD22C8iTaE2XX4bNVbZ-ScyKSUvW_Qw0r1iSGA@mail.gmail.com>
 <aa957875-3693-4136-8f94-798507ba1a41@gmail.com>
In-Reply-To: <aa957875-3693-4136-8f94-798507ba1a41@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Feb 2025 16:51:52 +0100
X-Gm-Features: AWEUYZnP_IUW3WI9S0H_khTgqSCnl8y7dBa9b0HnY4FbTW-ol3bH67DyTolyrPU
Message-ID: <CANNYZj8FPnmxv5XyNuX+jR_u7kLcKtPHRjiiY3s8reCQ_OBC-g@mail.gmail.com>
Subject: Re: [OE-core][PATCH v6 1/3] rpm-sequoia: New recipe for version 1.7.0
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 15:52:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210863

On Wed, 5 Feb 2025 at 16:45, B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zboszo=
r@gmail.com> wrote:
> > I'd be ok with a separate recipe for it.
>
> For all of the fedora-crypto-policies contents, or just for the one for r=
pm-sequoia?

We can just pick the one file we need out of it in do_install.

Alex

