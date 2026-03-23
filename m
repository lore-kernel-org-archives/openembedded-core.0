Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A96D3F46129
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 14:05:06 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18225.1774274697379231644
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2026 07:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aa6Kjf2g;
 spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94ac7f22d23so621024241.3
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 07:04:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774274696; cv=none;
        d=google.com; s=arc-20240605;
        b=FgFLshxJ547tS0AjMPooqJy0YLqvGg5kJZ5a4OhtpAV3n4qOUNp+HhKQnvEI4YFKvy
         44Fmdc58qOVLaP3YttJOWDFK/pZ8x9ci2YXkedwByqPQgQxRR956U+Ec88OVDODH+0j6
         XXPYJMaaS+9us392e0jF/sIYkeYrsL11zCqyrUjzwRONSgWcFxwyTga2xfhjGRBMohNR
         mGu1nWzepOx0OydEIZfODvNjmb7aPTWuBrTqKxoSyQYe+a/LqpgLDy99KlDtQtE8HINN
         cxKzawJHuz3Qm1f5av55SXqherF2hKP5ETYRIpzXj50A7jshDlQR6I9hmRrNDtwzTke7
         W0zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BEZIo5h2uZp+J1fZLxIcpHQ1KxKkYOlzNL4OAgKnwPk=;
        fh=SxgNHLrax/cwrFkLzJW9XUvR9y3rd2TQ2sOLDGVC3fs=;
        b=e8QrlDMMGIWIuSh9N7V1JA47OE6cB+gMh5/SRDSY7WSLX9cH4ywN/xjMaF4fCdFekw
         dbQLaEAjapnp1oWakrwHJDmjGkE5O5XnSMsbRATgkrV2IHjXTX6GMq8vMHIQbZGm50R7
         ZjuOSwAvHhzJricnOvOIhXw3wjrEFsxu+WSL9IwHW+0KB5FfMkG5ys15fgosTMhdjIVp
         9bmyuu01Dhp6dTzlf1ZD5O9GaBausO9iF6/cEkU+IU1zqyYKDg0P4glX37kKZPuNWKQ+
         bu63Wdn7b8OJcK6Hwxe2pJqfSvRQsIwM4hTpWfur7dV6D8RwE4jzSk6xJ5a4g07QIiM3
         C5/w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774274696; x=1774879496; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BEZIo5h2uZp+J1fZLxIcpHQ1KxKkYOlzNL4OAgKnwPk=;
        b=aa6Kjf2g+bjhurFeLKQhagAEmFji3uo/4Y04ImjnyIWFElbqBua7hvKDNVRRngm3xc
         nthcf7f8VGyCGDQiWKqpZA9vn1P2OKqDdvPKCqncAYCQdCDP4xFf4e+qsp7SunSB9XbK
         L6/AlZ27iOfJ6iYbZW6JvoWKSeTKE1Li091cMPaepQceI9G5wrFaYw0MnQQT3S7P2UPq
         LN5u4ACOzOecGgX1+PjJKi8nJeOI6cMl5pnrWvNJ3AdpoH/TVOIhr0V6yOR6SVcHD2xt
         7cNF9WcjrJDsrX4QYmMWDbCD0Bim58AWIwsS/bdZ2PdNdnLqE1pMpNShd4nmwqfd0Ybf
         7+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774274696; x=1774879496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BEZIo5h2uZp+J1fZLxIcpHQ1KxKkYOlzNL4OAgKnwPk=;
        b=DLuGRwmZW6Nbo8jVa+ZT1JS2C3qGatt0NSv6OPYn7ikoFckv/MDY1EhdnWChF9lGF6
         zgF4mTvxWePZndx6tJhAT7XiBrgyO+OWRNQ5vpdO5Hb12UpjskWFkoSQA9NUTvbVsIOc
         zL4DremumUmVfBi2DWVsa+Dz7ip/FJZnt9xTGnt54OjybgVAft5BwccPNs+GEZN+/WXV
         +3m+geN2QqD4A2kLELMOgub2MMJXg/uIwK8qut//KNdOukNWO7VZ8GNrPPJ4vXH2PU6g
         LndVQruHiH0oDSstCJeDXWQtdrvi106OJJHWXV7nJ1l7QwpXOpbf1yWrJgvzsFpeE5qR
         NRUw==
X-Forwarded-Encrypted: i=1; AJvYcCWDUAqcQBRRmA8pO7+/n4hbHWpYVtsooHCVf120EM1DXC+NOM/aEa34/mgUlTMtSll1Xy1VmeDVAcXDzOb2b2pVvA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyiAW1RUO8gLb4Vnaq/YKKVjGiPn2GdsEY9bNYkTdahv+NvrBel
	SjYLil1Ja61PMeRRG58tUig9/bDYfdl0nsprPvsjBtuT+GJZ8RR9L8t3OgWt8OnhWQbDnP3XmGZ
	jmwRCAuuYnx1DHJDsVzvRMvepbcaal8w=
X-Gm-Gg: ATEYQzzZNPtRyDY7H/dTwVkhdF0Kg0juham37ebWWzGqyTYDYDw+tVWPz+pCd5QvB4b
	9rxlZyFwPJu5lDqWPY/Jz7mNJ7RGpzqnvl8EuHMmoTuO9hZimPH6F33/e1nsa+q9hbo4mUtWgab
	hjIBhliG7tQ3lA6/XVaQeyguPzY2KWODmFtBScEEdgDcMJcNFIIKOhxhKg4BB82HuU0cq3K094n
	LUjMP2cegYU9mxsqN45ELSA2Hxkyidzwio+rJOqD+Un6BPbYfGzPzYxXgaBUY0VL6oLIdpGqrYy
	d72YTr2TRzn0Hgh+0PGFUp8AAHLvTUIX+v43fcFU6A==
X-Received: by 2002:a05:6102:6892:b0:5f9:39e6:cb04 with SMTP id
 ada2fe7eead31-602aeafde99mr5795255137.9.1774274696235; Mon, 23 Mar 2026
 07:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260312120024.3745232-1-zboszor@gmail.com> <CAMRc=MeFZMGjW-KXngLwq3kjbA9ic4KaOaPjhPd4Be0DMJ+yTg@mail.gmail.com>
 <CANNYZj-DEfSop2zjDmqh5JjKq805hySTZQ29NSAjoJFskHP34Q@mail.gmail.com> <CAMRc=Mfp+OfKzsUGF-JLsmuvRpoH7dqjqn+vJf1S146zZ=tU8Q@mail.gmail.com>
In-Reply-To: <CAMRc=Mfp+OfKzsUGF-JLsmuvRpoH7dqjqn+vJf1S146zZ=tU8Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 Mar 2026 15:04:44 +0100
X-Gm-Features: AQROBzBt4UK6jolQmfyR9_KIIiMMPxKaZZaTEs8g_ETfKbE2WDtYJOwwyf0Sano
Message-ID: <CANNYZj_kOfbycTx4ZkOVESoRX_euMLJmShuozAeWKBHaA_WWcw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] python3: Add a new PACKAGECONFIG knob for
 free threading
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: zboszor@gmail.com, 
	"Zoltan Boszormenyi via lists.openembedded.org" <zboszor=gmail.com@lists.openembedded.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2026 14:05:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233735

On Mon, 23 Mar 2026 at 14:48, Bartosz Golaszewski <brgl@kernel.org> wrote:
> > > ERROR: python3-3.14.3-r0 do_install: oe_multilib_header: Unable to
> > > find header python3.14/pyconfig.h.

^^^ This.

> > > Any hints on what could be wrong? The same config builds fine without the
> > > new option. It's just a core-image-minimal on poky with a few python packages
> > > from meta-openembedded.
> >
> > This is the error? ^^^
> >
>
> As in: pulling in packages from meta-openembedded? Not sure what you
> mean, this shouldn't have any impact as the offending recipe is python
> itself.
>
> But ok, I disabled meta-openembedded and it fails the same with the
> only additional package being python3.

No. This error:

ERROR: python3-3.14.3-r0 do_install: oe_multilib_header: Unable to
find header python3.14/pyconfig.h.


Alex



Alex

