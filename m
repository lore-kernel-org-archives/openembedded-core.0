Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web12.515.1627505370679297389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jul 2021 13:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bqL5A0PM;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id r17so6459162lfe.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jul 2021 13:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uEfRs0twQZtvuR67eAf+m8R54MhN3lu7x/hY3LKQn5U=;
        b=bqL5A0PMnnMR/ZPVeSwinaQ+a1TqhOPG1Ii5hHWBW85FPiUArWpY7qqbroNq01MtWW
         gglj3iPt+b3ZJrtPSJaDW0+/dPv6hxSOK3okgTPY8CvZuDAJ55EsxjYuaKpXJQVi8FBr
         ++yEE95MwCH1mJ5NUjP6U22Jk4vNZjc9xFHk8mgzYPNBPlygJRW5CYtYfkr40ZspDSZp
         OJOrQvaTHnwMEsiCsvsxN/Tzh9eBoh4xXwMy8ZW5VChExqRbtJU6mcNe3oK/6uANmHFl
         itiKJG8YS5Oa7LvTQ5LTsuXnb+hSaP3lbV+FJMiVgd3NcICz+12aIUm5WTfgDeSFMK43
         ufRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uEfRs0twQZtvuR67eAf+m8R54MhN3lu7x/hY3LKQn5U=;
        b=UaUG2PV+nKZ4v/Gv7wkI0q+IY/qYmVWgWXFxmIl4mUe/ydfIJN+D/p4y69r3VQbFc+
         rlNppGIb6pHVxBUamso/UoQBg5zBYQ7rsNhorT6t9e0hZmIjbnwxOkVZROkf5foZqSzn
         FoYVJHoICeEMziwg169w99Vg0Zbsre+Z74xV3EqLuHAeWCAwdYQcqE+jy6t+PqJEyqEL
         Tj3iLov6trf1sVUf78y9P0GJiGvepP/g2CB8Nbmghjn+8wi2pl5g1WtdmqTH/XFhyVAu
         uMyun6g8gAu53o2LMZ6TWD+mAPR/1RFuLpPKh4BzE0md2tmvyySl0tVMMYXOcb9zYuEy
         +iYg==
X-Gm-Message-State: AOAM530b9DXz8L+DhvP5qEhXs2x/+lXCSNLmEjiwBl+3EikhjAgczRaw
	GksgMcU9GQhUSjpxAooeIMiAjhvkYtAe4t4Of9o=
X-Google-Smtp-Source: ABdhPJxKyxoiE26UaQgWa9TsumwLaZQ1RmbRrs4RxOAeC2miUzbnMWph+H+9OM+uAyD0m+ROM9KxUxB6KpEEnNm2CXU=
X-Received: by 2002:a19:48cd:: with SMTP id v196mr1073538lfa.269.1627505368716;
 Wed, 28 Jul 2021 13:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210727114906.191837-1-dwrobel@ertelnet.rybnik.pl>
 <20210727114906.191837-4-dwrobel@ertelnet.rybnik.pl> <20210727104712.385ad146@seebsdell>
 <17ae8cdb530.110af7c7857737.3405175808509729608@ertelnet.rybnik.pl>
 <20210727115246.04b8ffa4@seebsdell> <17aec78de72.dbb79e7b5562.7908341287383433208@ertelnet.rybnik.pl>
 <20210728151641.667338a5@seebsdell>
In-Reply-To: <20210728151641.667338a5@seebsdell>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 28 Jul 2021 13:49:17 -0700
Message-ID: <CAJ86T=WvqW64bxW+qWon5ahuyJMqy4H=nhJBhUfwy9jKM4X8SQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH pseudo 4/4] Do not return address of local variable
To: Seebs <seebs@seebs.net>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 28, 2021 at 1:16 PM Seebs <seebs@seebs.net> wrote:
>
> On Wed, 28 Jul 2021 11:36:22 +0200
> "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl> wrote:
>
> > Do I correctly assume that pseudo_client_op() has to be fully
> > reentrant?
>
> No. It's never been even a tiny bit reentrant. We used to do the
> allocate and free thing, and it was incredibly expensive, and the
> nature of the thing requires confidence that we never, ever, have
> more than one thing writing and reading over the socket at a time,
> so it's just Not Reentrant. During one call to pseudo_client_op,
> there will never be another, and all the IPC stuff uses a single
> consistent local buffer that it returns the address of.
>
> Declaring that as static without changing the initializer would indeed
> break everything -- we rely on the initializer working. Changing it to
> static means it only gets initialized once...
>
> Changing it to:
>
>         static pseudo_msg_t msg;
>         msg = pseudo_msg_t { .type = PSEUDO_MSG_OP };
>
> would probably be fine, because then it'd be initialized. Otherwise,
> we'd get failures when msg got overwritten and reused.
>
> Or just changing `result = &msg` to something like `result =
> &xattrdb_data`, which would be nonsensical but it turns out not to
> matter, as the only caller that reaches this case is the caller
> that's just checking yes/no "is the return value not a null pointer".

If the caller only cares about yes/no then how about returning 1/0
instead of a pointer?
