Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D507C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 12:42:04 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.14097.1745498517346186634
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 05:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kg4oEzUP;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6ecf99dd567so13871746d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 05:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745498516; x=1746103316; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5njBBAfDhkOOx4uVsJhHQY1g9KUcKI3V43uQOmVD10I=;
        b=Kg4oEzUPLz8MI2mAShriE5en0g3emNwSASdXkKsVKvx/ysz/uo1Yb8xs7fP6+YUMFo
         wvO8Jrg41HYR/3SKjOJSDRZU+L4YiTqDv1kajHO3tp3n2fahyNmVc6naN2wke9Lib4pm
         vLHLVWoNiDxkfigtoGlznB0eKE0RBlLmVjLUcKYX5fuLDGTfIWmV8MmaoIJbx00b0lC8
         bKYjxPaHXvOpgXEo5jwI+Fd56wuRMJaz+yVvZVmgLyyX3iIQ3VvCFtecPBxDkv1xycC+
         KGzTeYLYtRMQVwbOq0brcTE1PEpQvhMeUmE5WiwrIV+5B3fKkMfCMGqHIQQiVh2/CsRm
         SktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745498516; x=1746103316;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5njBBAfDhkOOx4uVsJhHQY1g9KUcKI3V43uQOmVD10I=;
        b=CckYL27PfuHlg2+MKTY8LGju7CL3L1J7i+XKd5Xik0HawilWVUk6+494EfsnA6j4v7
         f6GH5UPDyPYM2STv7kZNLYxaVQwuCCffpg5fSPMWaSKdZQDCFUO0bUkinjJhNJFyZ1dd
         MHgj2NYPt2nyYNOTVnY/uzsDvz1ArtwtNCI14Z/e3EEm4em8NCJ8ZmqKZRFqx1yYtBBw
         tY/gYDjR1VjhYA3JwYcga5Vg9kLCsoZ/fGrlh3KPJ9VmBeOY3v3ZMsYy5JeHl3YiVIGI
         +DHKVip178LNBke7KEay1MXO+R0kw6gRy9GukNMW9Rp2TlKeNU9oo6uytHWIG/qYRdS4
         u6hA==
X-Gm-Message-State: AOJu0Yxh9ewEYqUYSDiTdmTWKqUT6/s2XI4myqXO/KiDOABqXyoMXX95
	QWQAyQGiRgd7QpMUZySj4AS4fLOz1WE5uSFiSAaVJrlKjYCz3+3L5EvGaaU2miDUlONhZ9Ysnwc
	9VmWFo5etAyrp2Te9KQXljj12bTk=
X-Gm-Gg: ASbGncty0uoXtUTiHxVgeW+m1wzIPA6BfO3/b7P68qN1yJGuKqP/72mRyHt7eCm8qas
	rkJlNK7mLqSQZQBRg9NFePRK8DmPfK46QnB4xWJjPwK97KMnBj2ogB5Ierpft39bawYVENu4e2j
	UKf2VlNW+GAahUpwnBY+NNaCl1Bznz7/MzKbnSOT3WS/om2e6cyo2O/pyR
X-Google-Smtp-Source: AGHT+IHQ37X1oPNDtHB8kWAEhmk+h9k7PBw2fzEqKZodjUAY5QcT6RmMmATcIC1v9XllbLgEHtalG933OyR194fdQVg=
X-Received: by 2002:a05:6214:3004:b0:6e6:6a6e:7596 with SMTP id
 6a1803df08f44-6f4bfc93a44mr40478056d6.39.1745498516343; Thu, 24 Apr 2025
 05:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250424111014.905507-1-alex.kanavin@gmail.com>
 <cf05b37db043dd939ec540a24ae0343376e5a830.camel@linuxfoundation.org>
 <CANNYZj9hiQ41Boji0OH5ecRbktL-5nH3q3o0=k4+XxRZ=nu2ZQ@mail.gmail.com>
 <18394019E7982924.8448@lists.openembedded.org> <64802f57b85b524ef1bab88b07a116e5af228d5c.camel@linuxfoundation.org>
In-Reply-To: <64802f57b85b524ef1bab88b07a116e5af228d5c.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 24 Apr 2025 14:41:44 +0200
X-Gm-Features: ATxdqUG-yZrigHu3FwaQs0TFePLQZOmEPj2apJVGyU8e5JdXEcHVktEGUOC7knY
Message-ID: <CANNYZj8eA1vnm6hO-AAn=xNEyMxrBGf48GTtiQOzW7w3yCqHKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] devtool: account for sources in UNPACKDIR
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 12:42:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215370

On Thu, 24 Apr 2025 at 14:14, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > In the two examples above, what is UNPACKDIR set to?
>
> Sorry, let me be more specific. What are the actual values of S and
> WORKDIR for the different cases?

Can we step back for a bit? The original error is that 'devtool
upgrade' breaks cryptically on recipes that set:

S = "${UNPACKDIR}/git" (instead of the usual WORKDIR/git).

(everything else being the defaults from oe-core).

Devtool, in this case, calculates the 'top level source' to be the
same as UNPACKDIR, and breakage follows.

An example of such recipe in core is
meta/recipes-devtools/rpm-sequoia/rpm-sequoia_1.7.0.bb

Alex

