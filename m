Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4130BC3DA63
	for <webhook@archiver.kernel.org>; Wed, 24 Jul 2024 16:36:51 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.15524.1721839007689028491
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jul 2024 09:36:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HJ3eTXjx;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52f01afa11cso5865450e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 09:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721839006; x=1722443806; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O28IOg4+hMdh3CkMGZqLSbrTXqODt+kaJq/8F7+ufDk=;
        b=HJ3eTXjxE5CubczI51aOySnRl3Ih4hM7ys4IrSremniezGg6V/7rT70bgf4ZhH8uM8
         Bk8B29ma0kQfV1v79MkxqoIcMaLLZ3jUh/IHESFFGsw05nhVfI1SPfY7ME1ZpdHyU6Ki
         dEwnAH20zQ9NTrPNhzt0qCZWNj1Fv5THu2BOivE2l5X0Om53mKr9+XiU8khOYHiM7+CC
         Gaz7W+aeOf2rq0wPhjY/fWShqpikXPhO7oWBfPIzjo10SAto45pNafT1ucwpj1ns3AXk
         PXb6aLX5pj4b71SIqlnGcJuAjNd6tnWs2oMQfLVfewB0ZH+8fHBA4RubljAR5oqnBGv2
         kSgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721839006; x=1722443806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O28IOg4+hMdh3CkMGZqLSbrTXqODt+kaJq/8F7+ufDk=;
        b=XxYve3AzPVdM8gsBhSNdnUEFWYlJi4TxThyJhdFSiZ1RHXkdVGnGbyJcdKpBETeeq0
         I19g4UCOrdPZ7STi/6qJpZUbZ09YYRcW8unY4YniBPYJabkpBh1I9dF96zm6PA2WtDwy
         54GJN6kEmLdRwuiP9LYu/ngZD6tXDkepBlCshZXs4pGOMFXS2b+8lox27+4yogX2z21q
         vLnV8RevlqCcJzm4EVmXPZoVZHdCJwJHuMRUozkkVzCMfVoOmgT61MEEFp/vPOkJ4NDz
         VzpIn8a+ORVthKqeQqHautWq4BarlAIZN9vtG6WO5PzSyAdfhoRzrxvzqY3ckWnROHit
         0B6w==
X-Forwarded-Encrypted: i=1; AJvYcCWvK8YhzeaZGV0qZHPZgG8ueCmapttO5ItzqweSRL2dtzb5h0/uywaNf5gGyj8zgKLqeFd1ylNdJGFHh1Cw6YmJ8dJggkqkDUAg48YKe+b6xoWPztFYhxXk
X-Gm-Message-State: AOJu0YygM+pUBkSAtffqXjdnRVoClGAn0NFhtj4baes0q5nNgMnsavdT
	oUnjm7hsl7bRo+FN6+Jv1BrQg7OBqdstNRYerj5VwEdzeX2rC+S/gFZJTearoUPQdQSfD5gaA10
	rSQeqIHed923S0yBvJXU/pRgOD8s=
X-Google-Smtp-Source: AGHT+IG9+9Y/Y4dQ5ALHiUnVIbul1+h+wwkjNJJ8bx9SrlzTxy0NJbK2mJTeaCAE5bpXiA+8RpLSpkz0Mvr+G8PhBMc=
X-Received: by 2002:a05:6512:23aa:b0:52c:c174:4bc3 with SMTP id
 2adb3069b0e04-52fd3f3c367mr208419e87.35.1721839005565; Wed, 24 Jul 2024
 09:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240717023201.861394-1-jiaying.song.cn@windriver.com>
 <78ec945a12ed570b274041fe8b14568e270fab06.camel@linuxfoundation.org> <CANNYZj8JHCp1O9LoKxKMzfy2vACWn7GZLzBTrBHrmFk44bDM_w@mail.gmail.com>
In-Reply-To: <CANNYZj8JHCp1O9LoKxKMzfy2vACWn7GZLzBTrBHrmFk44bDM_w@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 24 Jul 2024 18:36:16 +0200
Message-ID: <CA+chaQeJKAckDR385NGM_5Pba=NYkYadPseB=iRZdXnNc+b-pQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][master][PATCH] python3: provide
 /usr/bin/python as a symlink to python3
To: alex.kanavin@gmail.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Jiaying.Song.CN@windriver.com, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jul 2024 16:36:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202468

Doesn't https://peps.python.org/pep-0394/ recommend the current status
quo anyway?

Distributors may choose to set the behavior of the python command as follow=
s:
python2,
python3,
not provide python command, allow python to be configurable by an end
user or a system administrator.

When packaging third party Python scripts, distributors are encouraged
to change less specific shebangs to more specific ones. This ensures
software is used with the latest version of Python available, and it
can remove a dependency on Python 2. The details on what specifics to
set are left to the distributors; though. Example specifics could
include:
Changing python shebangs to python3 when Python 3.x is supported.
Changing python shebangs to python2 when Python 3.x is not yet supported.
Changing python3 shebangs to python3.8 if the software is built with Python=
 3.8.

My preference would be to keep it as is and not merge this change as RP sai=
d.

If we drop the patches then we go against the recommendation to use
more specific shebangs and if we don't drop them then
python-is-python3 recipes or package shouldn't be needed.

Cheers,

On Wed, Jul 24, 2024 at 6:18=E2=80=AFPM Alexander Kanavin via
lists.openembedded.org <alex.kanavin=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On Wed, 24 Jul 2024 at 18:01, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>
> > Having listened to the discussions and given this is pretty much a
> > solved problem for the majority of our current metadata, I'm in favour
> > of maintaining the status quo and not taking this change, even if we
> > have to carry a few patches. It does at least make the situation quite
> > clear and explicit.
>
> I'm fine with this. We have significantly bigger issues in oe-core
> (e.g. the rust situation where the slide behind upstream is constantly
> growing).
>
> I think the really correct solution is a coordinated effort by common
> distributions to convince python upstream to add the symlink directly
> in cpython installation. Or make an official statement that it is not
> going to happen, which would explicitly mean that scripts *have* to be
> written with python3 shebang.
>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202465): https://lists.openembedded.org/g/openembedde=
d-core/message/202465
> Mute This Topic: https://lists.openembedded.org/mt/107264938/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

