Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42DBBC30653
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 11:34:58 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.169851.1719315290134140800
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jun 2024 04:34:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EhL65uws;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ec0f3b9cfeso63871201fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 04:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719315288; x=1719920088; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BG/6y+HTIFoQp4fZALC+EnoArcCNuQUpNjMp/nKAYHE=;
        b=EhL65uwsUnLLRPv5gL+K7rRK1FgYAvWYISEeNHl2VOkvSsvyimD4JHipwSyt+Ppijq
         ONDay2pjmzMNjq1jjscXj8hbs9KD8W3oL350MDmR2uKNBvj/EeIB6pdjXo9faoFLpWlV
         wP+jqJwjGhGX7LiAmZIjibTIdvVpSERBxLIlF4vPmcuP7w+YewaAw1o2vYq0yOaS83a1
         Ac5UKz9dpHiizGLiUhotCPi98tby0vbHuF4QopoN150VFCZCtgrwivYpziQdEl+cNcci
         CEVN5MyGvCoKiaYJ5yZf5BG64PAE9P3nSaSNWnTU0O8m1JWoa7XQQKAJiyNOJYXgLs9q
         Njkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719315288; x=1719920088;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BG/6y+HTIFoQp4fZALC+EnoArcCNuQUpNjMp/nKAYHE=;
        b=JGA7O1Q3Z0ERQsw1WwRRvxMCGxMY/eaay7iA1/6xjuz0WodYEnftqerA9FxvRopOBv
         EXno+rYRbO1Cx627IzjK9VdG9qXh0iYwJ1b+UmJDtelBRkFjkDbIieSn4nRbIVms33/S
         Fgi6kAL1rM96q0AaspXLNboGKz7Wpw3hcbhT133m3yLx5dyI/jy1mSjTmXcA3zraZVVB
         ZjA1SkrQOZBAe3+2sooUP28bfAbRGonJHlT341InELTrhEbJS00cMhdh+PXFv5v5SLEg
         ZTsPtKIFQooxuuk+2C4GNH/9ABhAyT/baK3m73Jh3AoqjbyMkFEW7BkkzYXItpd08w5U
         /ggQ==
X-Gm-Message-State: AOJu0Yy2g+GlWg8DUTVhmUjEC2fj3NBQnDSMNg2NR7QcWOa6NYjBk6i1
	lO5D+SPsGwg0vFi7piCqS40A24fDWIwNryugGpoFrMEz7o++I5NNSE0K0j9VSLfxDADQ0Oi8KSn
	dtjKhPuulii/wrIZ5nFyCG0sTNyg=
X-Google-Smtp-Source: AGHT+IHAtzMNkVYeVr82gYXXJb6Rkq6Y2SVk2EHDbOF/2UNWewqiaUGrda0Zx10jecnvbdyjP9gQHBWAR+aaSqmuI0I=
X-Received: by 2002:a2e:9209:0:b0:2eb:ea62:179c with SMTP id
 38308e7fff4ca-2ec59587b4amr41892301fa.53.1719315287996; Tue, 25 Jun 2024
 04:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240621103414.2842509-1-alex.kanavin@gmail.com>
 <20240621103414.2842509-2-alex.kanavin@gmail.com> <de66e3216fb54cf24171e800ea032770517fab69.camel@linuxfoundation.org>
 <CANNYZj9hXzes_pH_tH1P4wVUsLOKiQpRnucds-YpVtJDQRTMuA@mail.gmail.com> <f9d0520c75c0144cb6f7a433769b593ddcf9091c.camel@linuxfoundation.org>
In-Reply-To: <f9d0520c75c0144cb6f7a433769b593ddcf9091c.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 25 Jun 2024 13:34:36 +0200
Message-ID: <CANNYZj9xwEDEw9HxHQ5zAPJY2--iuq_JvTW0foOVTF=83zefsQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/11] devtool/upgrade: add RECIPE_UPGRADE_FINISH_EXTRA_TASKS
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jun 2024 11:34:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201130

On Tue, 25 Jun 2024 at 13:06, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> I don't think we even need to list the recipes like this. When devtool
> upgrade runs, we get a list of files which change. We can then query
> bitbake with that list of changed files and ask "which recipes also
> depend on these?".

Right. Can you give me a lead on how this can be obtained? (e.g. where
is the data structure it's in, or a function that returns it)

Alex

