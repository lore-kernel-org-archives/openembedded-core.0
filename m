Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07EF7C4332F
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 16:28:34 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web11.40276.1702484909335156994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Dec 2023 08:28:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wx3m491E;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2cb21afa6c1so85852511fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 08:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702484907; x=1703089707; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/toXWucQQQJm5pvywJzOw1lUNOcVM+QFgj4SBff0I4w=;
        b=Wx3m491ECG9NJc0ZgbGIquL/3u6UDepR7hAGy2GlQNUj79J6mkV6rrn/v5IafwlvQe
         j3+jqaxxzSwsGphBaXxqvfEIBicaoNu9yDGA3cNw8NhaJkAEy4bjp1RBepnv3997M43K
         P4qkMrmHUrbNnfx7VUEpnDyvQ3E5ZlX4v5Wz4AJnSbSbdz+vgUP7F1SykrH1vesXVaXU
         18ZL/j+/cbR3hmsRBZKbhLam30eIago0gFrBVEgDVCA6F/3SNxnZJ/COAYPEatJjsCxB
         l1wt2Yu6XrtvP4Os9mseyeM3zcyskxKYfVpFkvOcJaKcTgdNhIdtK5MBCXG50Z2DwgXM
         oLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702484907; x=1703089707;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/toXWucQQQJm5pvywJzOw1lUNOcVM+QFgj4SBff0I4w=;
        b=ldysCP4tTXjPijBu87uNgrvoKSR9qWk4QKNdgTKfHDj7yi/sjocCzSNA2mYrl5WV1D
         wzqsHHqsmrEF+W+d9u6AazbP4wV8by4n1SRUmpGXFrgk/tiu/aTlBsDtYjKOYdmGVW+H
         HgA4qqoRzwjamUPYx1hzVyXiFg7v8nCSUe8LLMi9jdubnYsHUE72BXbA3M2Wdzv6n9Tv
         6oXSmog0TrIg+aDwb3GRYIjb0X+oWfx6WpU2b03FDVFHvHo8NBHSqdMXBeqf2dVH3lOv
         ZpwH7XKMtoy9x86vWwAAxr11PBtfJawbUH/nLPH8X7ZksFyTU9DhJpg7EeA6cfUGw4Ka
         xFaw==
X-Gm-Message-State: AOJu0YxskY3Lb9E/HErKUU5Ptq3eDucbQo/LvB8JaI0/CsUe7ZwMvp6R
	Xcc6LwQuV23nM3ngfnD5EatvjR1PGe1AcioKax4=
X-Google-Smtp-Source: AGHT+IG4riHKoFyzevfbfUofxnKqe5+yIEIv9KQaNJKyK4Z+FORxdtoNCsVOmYxtIk81wveXCvJiQnXSkb7EYgYlLus=
X-Received: by 2002:a2e:9856:0:b0:2c9:ffdf:f6dc with SMTP id
 e22-20020a2e9856000000b002c9ffdff6dcmr4058158ljj.41.1702484906974; Wed, 13
 Dec 2023 08:28:26 -0800 (PST)
MIME-Version: 1.0
References: <20231213083045.194148-1-changqing.li@windriver.com>
In-Reply-To: <20231213083045.194148-1-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 13 Dec 2023 17:28:15 +0100
Message-ID: <CANNYZj-Xa1R-yKXpKB3Z_Pit9w7BacPPpwQigOGQN0a7OW_M8w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rxvt-unicode: set correct outdir for tic
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Dec 2023 16:28:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192305

On Wed, 13 Dec 2023 at 09:30, Changqing Li
<changqing.li@eng.windriver.com> wrote:
> +From 1b7d547453fc57806ef86f64c86706530a23e62e Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Wed, 13 Dec 2023 11:53:18 +0800
> +Subject: [PATCH] Makefile.in: set outdir for tic
> +
> +tic is from ncurses-native, and set TERMINFO as
> +${RECIPE_SYSROOT_NATIVE}/${datadir}/terminfo of ncurses-native, so the
> +rxvt-unicode terminfo will be wrongly installed in there.  set the
> +outdir explicitly to install them to correct dir.
> +
> +Upstream-Status: Inappropriate [oe specific]
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + doc/Makefile.in | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/doc/Makefile.in b/doc/Makefile.in
> +index e3d1fe8..1de56d3 100644
> +--- a/doc/Makefile.in
> ++++ b/doc/Makefile.in
> +@@ -100,8 +100,8 @@ install: all
> +       $(INSTALL_DATA) rxvtd.1.man   $(DESTDIR)$(man1dir)/$(RXVTNAME)d.$(man1ext)
> +       $(INSTALL_DATA) rxvt.7.man    $(DESTDIR)$(man7dir)/$(RXVTNAME).$(man7ext)
> +       $(INSTALL_DATA) rclock.1.man  $(DESTDIR)$(man1dir)/urclock.$(man1ext)
> +-      @TIC@ -x $(srcdir)/etc/rxvt-unicode.terminfo || \
> +-           @TIC@ $(srcdir)/etc/rxvt-unicode.terminfo
> ++      @TIC@ -x $(srcdir)/etc/rxvt-unicode.terminfo -o $(DESTDIR)$(datadir)/terminfo || \
> ++           @TIC@ $(srcdir)/etc/rxvt-unicode.terminfo -o $(DESTDIR)$(datadir)/terminfo

This does look like a suitable change for upstream submission, and
should not be marked Inappropriate. Please do so first.

Alex

