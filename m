Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE2F8D19519
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 20:18:39 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30789.1769458716433958025
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jan 2026 12:18:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZWSarapp;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-89478e429afso44348056d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 12:18:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769458715; cv=none;
        d=google.com; s=arc-20240605;
        b=dpTJzEr+RYCHC3L1/zLMHFhclounrpw0Hd309Cs6wab/Y0RpeExmON54s1b6e4L/33
         7FvIl1a27jOxUnKRlMEt8UMhNcWuCvnnffmHgxSziYMy5eUna0AWz2NvjdB7x8Kdh2WY
         eh2HAYjIPFVown/LdKc525tZMgMOS/NyvHyu+d+njC/Kl4LOLVUMjzH4Wd6pGNO6yd6/
         DcKpYqqFCngCkHcwEJd8YBHbc8hPE9M98RbfnJ4S4IeCJ4BjcAtTArgmTD/mE3eFE14C
         FMeWrwsD6/1TOG3ItnNSLeTYVvOk6kdswSe3QtFLVlv60FMpqQsFYoZe5y1eIhZxBW4y
         ds4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yKBWnkJawlu8fSYYZez4oM4PrC8SLNIsEVnnBDijpds=;
        fh=aZLIios+//Dx4+e3pug2Prppro110KFj1xESBWfuH4g=;
        b=bj7GZY4FBh1KfmD1c83OVAo3roxvH4o97ywy53IHWKbc2hQ7XsrEalAZvI4auvJ+gS
         4itS/Y4kts5mIWStPvbyawaxJwpW2+rZff7XwzMpl6eo9rxYyZtmC2BLPW4h4gcqkwPe
         VQV4NMG1X7Lk+XpOj7LMLaUB2BNmFbE2M3NMiblfJsgFbINSxDqFkG16Zj/5QZMHZ6LX
         0+sTWTSd+dagDnMnzp72M9e+e13repdCDevbdSbsp2aqWqdPa1rNC9DGi7dKvXgNvWZ3
         ZyPimXepQW4QWlzS5AAOaXYwg2tA9eNpCRsjaP0Mf5viKuDv0yLLHGIZxJddwKmb2S5p
         S2ug==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769458715; x=1770063515; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yKBWnkJawlu8fSYYZez4oM4PrC8SLNIsEVnnBDijpds=;
        b=ZWSarappwaPG30dnT0pk5XXyDfRzuDE4Jvvw+9qOBCa71qKQbqeohEQ/BwgUh9EaBH
         GxkiMIURtSWFsjD4OxRsngqG3kufgUzS2K1P6tESTPbNyAwmzYFRDj6/+g9hFFKx4vah
         jAmUeOgRPjhoZmJDOzZD0JNNSj9QIAk1Ijm1iMoyeNpCXfsYfcxRvZFecYYK+bth7btA
         i1MgI+NSmu9RMm+bMqSHCW/Uujjt6kNtgVADOqvzlNGrd2QxilILS01nPlUy+lHN7vbm
         TeLQWtVwJ+NaAVb2uKwNdAhLiupPzsl+svI1nwne3w2/x/Cb7z924R+84+YME88g/Xb+
         +uAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769458715; x=1770063515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKBWnkJawlu8fSYYZez4oM4PrC8SLNIsEVnnBDijpds=;
        b=an9Yfv2WhN3yHUyWsx1kelEXpF5xyYoPGQ3binSCs0vIVtmPCC8OT75SEx0mXvm6Wm
         3m5jeofKZnOmbY5VXe6Oqsnc98ah8vIkAXtx6wL/aJDSgGm16I4dJgcytLwuqa3rXMqu
         6XDOzeBF9+WScJis7w4tEwK2SmijS+waKUIGLDGK0qvNemz7hFgXkjuL7txlQPFy0Ii7
         PgP3QAwu/Cigp/51yDGqmyILVwg65B+IKOMsBcFezXyqE0/rP+7TbJHb/Q/gbmRRVf9j
         yvN/3NijvYgZFzyTWPgIUUGHVoTf4AohCdplZ8bGcKYDs5M9SMzjLGIvEJW/tk1eRrmI
         wZIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMZyrN/S3dCRusIrmOM2Z/y8sLaBdODwL0bys9zZJKBFUIZrp6cjhvZkBasBbU/PGWRyKbAhxWi477zoDgWyPYFg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzVeo1rJepvgRDo0n6/0B06ojxw8qfqpnXCV3RdqS80AJiJAoM6
	/8BquW0ER2rAJF6jU5cqIxclfy2rkRb+J8Jg1gd16ERuVjzeRuJk8HZkHyoDD0Ih3zCvUQ0wgF+
	qP64RLWEKF11h/ja2Mwi+RUcLtcsGa/I=
X-Gm-Gg: AZuq6aII4+gQz81uSErdSf7rNsN5vMfTv6ENv9N+XjLr3p+DQExkbG4ZpovY2qnv1pl
	g4Y5VmIa9YtIp9p3DBBs1cmE5gTRkunmI6mtqHW87qiGFQNAEW5R4q1Y5eZlD3bBZeKg0/ZdC67
	DRFquo+Kx3zl8HsGUbR0OuxIHYKrwaWFitTvV2GycadsqByoFUqiECZHlaGtMHRhMD9JoSC1Sfa
	GvI5oi5gtDP/pKQvlIbx97WjhwkuX2K7mIgX7S0hWuv6EDgQQTZCje+29jZbgVZKHayio95Nk+s
	vvxcsMvkWDalGkKc6pP5Lk+EIklyFw==
X-Received: by 2002:a05:6214:21c6:b0:890:808f:c255 with SMTP id
 6a1803df08f44-894b06b549dmr78268196d6.14.1769458715191; Mon, 26 Jan 2026
 12:18:35 -0800 (PST)
MIME-Version: 1.0
References: <20260126073809.468495-1-adrian.freihofer@siemens.com>
 <20260126073809.468495-2-adrian.freihofer@siemens.com> <eba59226-122f-40c1-a83e-184df0e8ffcf@windriver.com>
 <CANNYZj9GrL4UTaMKz2gsmUFimRkFCqjyNmy8SPa8i_o9BqfNjg@mail.gmail.com> <a791396b22547baabda7c43fc2b2c4e57e1a2103.camel@gmail.com>
In-Reply-To: <a791396b22547baabda7c43fc2b2c4e57e1a2103.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 26 Jan 2026 21:18:23 +0100
X-Gm-Features: AZwV_QikLaplp2V83Jr_D2cBt9xebNunfirrPUf5QwWFFBwNlIEl_0j91GqTqq4
Message-ID: <CANNYZj_pMH4T8b7EN49F_aH8G-6U9PvxzWHUvXz9f0XStWTDoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 01/13] useradd_base.bbclass: do not use awk
To: adrian.freihofer@gmail.com
Cc: Qi.Chen@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jan 2026 20:18:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230025

On Mon, 26 Jan 2026 at 15:01, <adrian.freihofer@gmail.com> wrote:

>   Exception: subprocess.CalledProcessError: Command
>   '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/
>    build-st-254283/tmp/sysroots/qemux86-64/usr/bin/
>    postinst-base-passwd' returned non-zero exit status 1.
>
>   awk: error while loading shared libraries: libtinfo.so.5:
>        cannot open shared object file: No such file or directory
>
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4983396/raw_inline
> I'm not sure if this is solvable in a better way because my
> understanding is that the dependency is circular.
>
> If the task gets restarted, it works because the missing libraries are
> then available.
>
>
> Another fix is removing this dependency by not calling awk, what I
> propose here.

We've seen similar issues elsewhere (down to the same missing libtinfo
error), and they all could be eventually resolved. User management is
notoriously tricky with these tool dependencies, as it needs to work
in various different scenarios and contexts.

Anyway, can you please do these steps on the command line, and confirm
that the same error occurs without having to run the selftest with
your patches applied, and describe what exact changes need to be made
and where and what commands in what order need to run? Then I could
try to look into it.

Alex

