Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94FF2C6FD19
	for <webhook@archiver.kernel.org>; Mon, 13 Mar 2023 09:14:53 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.15183.1678698883284747737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Mar 2023 02:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cfgWie62;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id m4so1761525lfj.2
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 02:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678698881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNPXtpG/FNLjr6r6KAEpFW527DLVLBWV/rn6pvo371w=;
        b=cfgWie62oVAmWFhGobJvQWQWQjE6GaahRbNeeaMk0sJbtLmxFf+/2H7Ax/w6Y4bCZT
         Bkn/0pqUZsnJlcqNM7t44xaNaJrVA9TV6FbzfKQ9KL1sq0mIReQ8554X4LnLTTA2Cnoi
         aDsOVXF9/ThE8sd6ZW0z6WeyQwD4TIslt3p2PJeeP50G1tzEKSRy1RwKsriq4Es8GUqe
         7o9J4yovkfbSeRF1rOhU+tTLr6boz7eHNXOvTZZo4fXqRwWgglcPjtXCGLcFY+z9vtTP
         GzkXGrGQJ2lYNBe5FLQYrR6nzxJB+kwHG7RA46h+nfCHgWEoX9g4pBFFm9j8rBiLqxmT
         pKdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678698881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNPXtpG/FNLjr6r6KAEpFW527DLVLBWV/rn6pvo371w=;
        b=yFHsU6sNUb0sfg1ulHY25RU22F9KUY2JKbbTniLunrp7N4pf9P/8AYYP/AXSWyoYN1
         1lcdEJ0L3//s8EPl60GZ+7nvzp2pk7s+SpWpvLhKCRAFkPUhxBop0TFLVCHn5nmxUhoC
         4NCUEB4px1sXBdtxKpJCB0Xc/+anRKlr4XqrT2yBDg3mJBWNOU36o3hOwZiPtlZ/ZCKn
         yjk7uCO9cOIGqOZ1QqTfrDn6jqwpkqUPaWSmxhz6q2m2QlGxQeO4i0Vry0/tPEcB/sgg
         sE+mh87wObu7HD/qr/rndK3CefzLTq66BUm4Zd1ZA2PspiaQ/3RhSI7Iz1SKVKMcqjXJ
         BY7w==
X-Gm-Message-State: AO0yUKWqvTGzAAkAKaufb1vbdYcT+0Odss03CA9IJ5N/qn3yODl6jn5D
	SQeGboUaX0Jj8Jo083pz7ooGODiLhVtsIsXRp3U=
X-Google-Smtp-Source: AK7set8TRtyp1q4ECpfqt87SOKjs5lPaQmI4Z7vPgy0n9CTsn2dV+/Cu05TNxqoY3U2xfE+pPb6uHE7cUkS82jLyYcs=
X-Received: by 2002:ac2:4117:0:b0:4d5:ca32:7bc5 with SMTP id
 b23-20020ac24117000000b004d5ca327bc5mr10444404lfi.12.1678698881460; Mon, 13
 Mar 2023 02:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230312065517.61051-1-frederic.martinsons@gmail.com>
 <CANNYZj9ah1rO9FH3a_m2ftgrDik_NtcLa_15r6+sqD5iwBXsiw@mail.gmail.com>
 <CA+cAkeqZjC=L=_v-3K4VDtdWKxc3crDaqfwp_30B9KFAVrfJuw@mail.gmail.com> <CANNYZj9vyfkez+iL-EeeV0Yb3o1Fz9FDrbz+ZRjg5EjUHiAisA@mail.gmail.com>
In-Reply-To: <CANNYZj9vyfkez+iL-EeeV0Yb3o1Fz9FDrbz+ZRjg5EjUHiAisA@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 13 Mar 2023 10:14:30 +0100
Message-ID: <CA+cAkepYqf_hJWe5HBpKcJrF37P7V81AWCZJJ_tUYtBH=BqHqg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Mar 2023 09:14:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178417

I understand there should not be a fetch during build step , I'll try
to find why .
In the mean time, if this is a strong rule, shouldn't we invoke "cargo
build" with  --offline option ?

On Mon, 13 Mar 2023 at 09:38, Alexander Kanavin <alex.kanavin@gmail.com> wr=
ote:
>
> On Mon, 13 Mar 2023 at 09:29, Fr=C3=A9d=C3=A9ric Martinsons
> <frederic.martinsons@gmail.com> wrote:
> > But the compile step tried to git clone anyway and so it failed like I
> > showed in my first email.
>
> You need to figure out why this happens, because it should not. We
> have plenty of recipes that list crates in SRC_URI in oe-core, so you
> could start by studying how they work.
>
> Accessing network anywhere except do_fetch is not allowed for
> reproducibility and license compliance reasons (both break if that
> happens).
>
> 'cargo bitbake' is a 3rd party project with questionable maintenance
> status that we do not support. The official way is to use
> cargo-update-recipe-crates class.
>
> Alex

