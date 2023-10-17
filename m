Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CDFCDB482
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 22:23:42 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web10.269424.1697581419511977205
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 15:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IJc1Ky9w;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-32dc918d454so702457f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 15:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697581418; x=1698186218; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hvjHKBVr5tAK3eJiS1uJpwxsraZOc15Jmf21zwRf4CQ=;
        b=IJc1Ky9wlUxsigRc53rK525TM9vDJh4Si7COdRs8MCtcI7w+ENrZVgxW+PIJk6YdML
         lnxIXB69ZFzbsXHCYfLpZ/RrrI0xbwbaQXPC9KNh4RXIfi5SAXY++fUipGdZiFkOLcTc
         eaVdlmcV39RmU56G8WuPjQhvjlhhWX33wNRLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697581418; x=1698186218;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hvjHKBVr5tAK3eJiS1uJpwxsraZOc15Jmf21zwRf4CQ=;
        b=PLwXOouqd2qqyUk2s4DkF1gjN47zXJl+N2HUTSeGS2hhZlWdCAw/IZ2cqDfnE9J+97
         gF/kwxo48UfnUPohYdh2HVUDZClbJ6lQXDa96Hr9LX9osDs/tWU/HNh3MBmQPbYgR8CA
         ocz93BYgG4+KMcD5DKnXP2l5keFu283h5P6vXthe1/pD/JRH6QQkgMMbNkeqWISjlh5Q
         JKDHdzO4kzvCTNfayGsA/O1wegBomEto9IRyikpHxPc9a2JbN3qLPHr5LTBPnA4RnbUV
         Dudaif3NriWVC7x/5tZbW2WSXlPecrhHnxuFg7ZiXlq+ToYOwbhy/3nXwgWgUYKgwPAI
         Qv/g==
X-Gm-Message-State: AOJu0Yxu6+DYKVMCabvKrxvVnur3mS9BOKOMsd5A34SXy9/pKcqugnQJ
	56VlrUcXFZEGm6U9uUp9sp6QJsxoAyAgnL9BaLw=
X-Google-Smtp-Source: AGHT+IG9FBKcx44poQlOrRIBr9oec5uDGNkcbB/MvTdRGcraqVUTikNjSUYrfnB+R1Dkcx8Kor4dXg==
X-Received: by 2002:a05:6000:9:b0:31f:e5cf:6724 with SMTP id h9-20020a056000000900b0031fe5cf6724mr3165914wrx.46.1697581417847;
        Tue, 17 Oct 2023 15:23:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fa42:b755:fc77:86e9? ([2001:8b0:aba:5f3c:fa42:b755:fc77:86e9])
        by smtp.gmail.com with ESMTPSA id b17-20020a05600010d100b003197869bcd7sm684669wrx.13.2023.10.17.15.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 15:23:37 -0700 (PDT)
Message-ID: <713f9cb65dd27f5ed85149c3618aa76f47f791ff.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v2 4/4] recipetool: Add handler to create go
 recipes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lukas Funke <lukas.funke-oss@weidmueller.com>, 
	openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Vyacheslav Yurkov
	 <uvv.mail@gmail.com>, Martin Jansa <martin.jansa@gmail.com>, Lukas Funke
	 <lukas.funke@weidmueller.com>
Date: Tue, 17 Oct 2023 23:23:36 +0100
In-Reply-To: <68f2963c-8c25-a005-4635-0baf5e13817e@weidmueller.com>
References: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
	 <20231017132647.352938-5-lukas.funke-oss@weidmueller.com>
	 <f07f4dd38c52c4dfca42723ead5d97ef8015a994.camel@linuxfoundation.org>
	 <68f2963c-8c25-a005-4635-0baf5e13817e@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 22:23:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189364

On Tue, 2023-10-17 at 16:00 +0200, Lukas Funke wrote:
> Hi Richard,
>=20
> On 17.10.2023 15:53, Richard Purdie wrote:
> > On Tue, 2023-10-17 at 15:26 +0200, Lukas Funke wrote:
> > > From: Lukas Funke <lukas.funke@weidmueller.com>
> > >=20
> > > Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
> > > ---
> > >   scripts/lib/recipetool/create_go.py | 730 +++++++++++++++++++++++++=
+++
> > >   1 file changed, 730 insertions(+)
> > >   create mode 100644 scripts/lib/recipetool/create_go.py
> > >=20
> > > diff --git a/scripts/lib/recipetool/create_go.py b/scripts/lib/recipe=
tool/create_go.py
> > > new file mode 100644
> > > index 0000000000..e0254f111b
> > > --- /dev/null
> > > +++ b/scripts/lib/recipetool/create_go.py
> > > @@ -0,0 +1,730 @@
> > > +# Recipe creation tool - go support plugin
> > > +#
> > > +# Copyright (C) 2023 Weidmueller GmbH & Co KG
> > > +# Author: Lukas Funke <lukas.funke@weidmueller.com>
> > > +#
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +#
> > > +# Copyright (c) 2009 The Go Authors. All rights reserved.
> > > +#
> > > +#  SPDX-License-Identifier: BSD-3-Clause
> > > +#
> >=20
> > Can you clarify what this license information means please? Two
> > different license identifier lines seems rather confusing and
> > problematic.
> >=20
> > I've not looked into the rest of the patches yet, this just caught my
> > eye.
>=20
> Some of the ideas/code was ported from the original golang code to=20
> python here. Thus, I had to copy the license information as well (I=20
> guess?). If this is wrong or could be written in another way please=20
> provide an example how it's done.

If the code is close enough to the original to be based off it, the new
code would be under the same license? We can't tell which is the old
code and which is the new code so the license header is rather
problematic and confusing so this does need to be fixed.

Perhaps this means it is all under BSD-3-Clause? That sounds easier but
we don't don't have a top level LICENSE.BSD-3-Clause to match this and
I'd prefer to keep the code under MIT/GPL-2.0 and not add another
license to the mix if we can help it.

Or is the code sufficiently different that you can say you took
inspiration from that code but the result is under GPL-2.0 as it was
different enough you can license it as you wish, the original license
becoming not relevant?

Either way the header needs some explanation of where this other
copyright comes from too. I would probably just credit it as a source
of inspiration but I don't know how similar it is/isn't.

Cheers,

Richard









