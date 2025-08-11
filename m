Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF67CA0ECD
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 15:24:07 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.web10.51039.1754925845760611744
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 08:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iBqJjqvS;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-71c06bb7470so20530137b3.3
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 08:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754925845; x=1755530645; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R6aew4Yoq2tNDz5lPobxIxPAvS82GA3mzozl0J5HxBc=;
        b=iBqJjqvSA7OIBd8nJ1uGs4++b/NXFWQIH+AY9vS6Bzd0a/uTyv23Sy3fqs/ar1XoIJ
         qBcVk8Fz3Up17ubfZfKPV/478oeek/8CumagRN1de6fCulOAjsyPSQ2ac9USnSTgbzqL
         b7bPTDM9D13QSuwaRe3Q9OvzWtnTUQwSwyI3nm//yTcwMB359JfKJjZtAec8QIgpTmVP
         HdQR9lKr6/BAkIdLbTUFHu4h6T83SvNxnBRiKNKZuCqsWpVBsGw11+x19IlThYBAYQfj
         TJkOdqSxEUfM/GGewFz4ddNq9WbdLdFkE7pqQSfexobTEzq5A2W+mVfJj/x2JeiJtgXU
         XMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754925845; x=1755530645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6aew4Yoq2tNDz5lPobxIxPAvS82GA3mzozl0J5HxBc=;
        b=OvLFYe7EWGkha12UhZSZs0+jMrwYe8kiMgn99uecUprbrtW7J42JdBpghXt2FGiJe4
         meqlqx0IVzHbyZjJ7s6O1aj921jcE4GzAj577y9KSqWWKbRGKpJzutdHEGFVffSi63E0
         QCEXlxknPezfzwKXLlrcCEGIZBNvTzOVYtk2pefQTTNKvidNq/tDXB3QV7dBCWp8gvL2
         iXmcfxqMdeEH7Aw7pzy/L4tHo8kf54K53P7CU2s/0KzA45yZnOHooJwB+MKTq6ejhtZb
         7CMCqoMC0mYeNj/w/g/IVI4ap42fQB0XqTfbv3RNePAjY+EB4kaJiGeh/5B0MqjmemaK
         W62g==
X-Gm-Message-State: AOJu0Ywe+Aln3yB9cHTkmIrRQHmRQBkZk0scvV8udlQgUTPLLSs4ViCZ
	ZpYe+dCxenGLNSen17HkBMdvEdB6vZApxMYB/hxgNRIy0HdLsItcIwDd6VWkVItGmVTyqgbnxX6
	7wHfN5vhDTFh4t7fpiP3czX9QBFJMlbY=
X-Gm-Gg: ASbGncvnVohKwkxo4dh34sTCT23vO5XfRvjzpvtZXY55lXzwb/vtrDkv4qru0OW3zk0
	64gmcLRNdcuhCk4RAUsDq7/lWj/W4eTsQ2gaJ7KavMl9eAmmrayRfa2R6oKczASfhsdCVM9OjDl
	AfNTaFmU5zyjo4XsBt5A3u9CCVX+BOgjIb72SoCgr4AQHXxfR7bjzsZZrtPuvgZMqRO6S7yquoe
	Z0H7g==
X-Google-Smtp-Source: AGHT+IGTh5JawlVWJKE0c7FjKFHpm4bWcxdC7tzixsU+MHk+xfAP3+uGqzezOPV7bqa7hwnn1/PcKG4ifvZRUlaSz3A=
X-Received: by 2002:a05:690c:9a8a:b0:71c:16b7:5183 with SMTP id
 00721157ae682-71c42a7a8abmr1361807b3.28.1754925844683; Mon, 11 Aug 2025
 08:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250801042242.3076232-1-raj.khem@gmail.com> <20250801042242.3076232-3-raj.khem@gmail.com>
 <CANNYZj_aGce4mmz2P+LUHZdDYGVYQ1sOSkdcOdn6-mTY_USk2A@mail.gmail.com>
 <CAMKF1spXxqp=U+430dTzHnTiQzJg5M4TWXGBeyuM51rOaPv88A@mail.gmail.com> <CANNYZj-CwsORcS2QF=NO=O82r+nqLe84tiPWO5CyX5oDBxq-tA@mail.gmail.com>
In-Reply-To: <CANNYZj-CwsORcS2QF=NO=O82r+nqLe84tiPWO5CyX5oDBxq-tA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Aug 2025 08:23:37 -0700
X-Gm-Features: Ac12FXyOanit0aEmFeQ4_8oC97WFL76ztwzSC9yv2G-DTXWiTCTyr1pX3G79wQU
Message-ID: <CAMKF1soUKOdBXyfM2rfe7Te7X+zM_xGKVYLzou-CtfKNx8sVgw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/7] libxcrypt: Allow undefined symbols in
 version scripts with lld linker
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 15:24:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221744

On Mon, Aug 11, 2025 at 1:18=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Thu, 7 Aug 2025 at 22:18, Khem Raj <raj.khem@gmail.com> wrote:
>
> > Hope this helps you understand what's going on. Feel free to ask if
> > you have more doubts.
> >
> > >
> > > The same question stands for similar patches for libtirpc, gzip and
> > > binutils-cross-canadian.
> >
> > They all have the same issue underneath.
>
> The way you describe it, this at least merits upstream tickets, if not
> actual fixes. Upstreams can then decide if lld is something they care
> about.
>

Its in plan.
I have reported it for libxcrypt.

https://github.com/besser82/libxcrypt/issues/213

Others are also in works.
> Alex

