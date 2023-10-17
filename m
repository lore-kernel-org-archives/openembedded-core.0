Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181AFCDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:53:49 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.216272.1697550826883072924
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 06:53:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QFFdy9w0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-407c3adef8eso5030025e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 06:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697550825; x=1698155625; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qX5ii4pSmWpnNCwbPuJd075Dwx1z4tlMHdOLsjiMP5s=;
        b=QFFdy9w0zznv7eyLc2WwwN5BYJMgS8LtINspOKDRJt6dztffqXVf6iPMrfFxHr/gCO
         MMkCM1MHgHWZqD5u9CCy9ACf2A1mXBLGsLk3+bpzRvAledoPq0dVqCog8oohfRynPtk/
         FfYe4avuV0DzcTtmRbG2ZiIlyYhssrDuEE5AM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697550825; x=1698155625;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qX5ii4pSmWpnNCwbPuJd075Dwx1z4tlMHdOLsjiMP5s=;
        b=itSbXZ4i0rYet0ZpBInAwdnI0wv08bU6L9PasR4oEXuNebuQti6acesOF30djj6PhN
         5pK1KClWkwYLoDzOMgo5E2MForZBGdg2VM69iPVo4s4jod96NJCuYUspdQz1I9aSnt80
         kP1IUudyZtGARd5rxCtiEUTV2P7xhDvzNwdGpiBheVvf5I8PVIjZ4oIpI4BpfuNrfitO
         gptQuWW6OO/g200aXi/9l70o+/GYQONggLfnNYVRf+EL/MR8NDWAJkM/u3TLpjHa18vB
         yQNLJRVsi7wdYjunFpiqCDldaK995oVORvvNcJi45NMaxnVM1vKqMXDMkZ5REKnCPO2/
         tPhA==
X-Gm-Message-State: AOJu0YyF12mtR8nVppvFZaThbU+X8yaC/Btgf+H/SlX0tyGEIG2gOo+T
	z2L+yGIAD92ecyiQZTtxjnJWSw==
X-Google-Smtp-Source: AGHT+IE6b8ZDWTzPSPUx1keie5lP3ghuyWgNFtMHmAfl6b6DtREtG+pSsfkOT9NAwYq/vnTRfoK9xg==
X-Received: by 2002:a05:600c:19cc:b0:405:375d:b860 with SMTP id u12-20020a05600c19cc00b00405375db860mr1677376wmq.21.1697550825225;
        Tue, 17 Oct 2023 06:53:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:81eb:8695:fc05:9038? ([2001:8b0:aba:5f3c:81eb:8695:fc05:9038])
        by smtp.gmail.com with ESMTPSA id b9-20020a05600c4e0900b003fefb94ccc9sm1974177wmq.11.2023.10.17.06.53.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:53:44 -0700 (PDT)
Message-ID: <f07f4dd38c52c4dfca42723ead5d97ef8015a994.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v2 4/4] recipetool: Add handler to create go
 recipes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lukas Funke <lukas.funke-oss@weidmueller.com>, 
	openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Vyacheslav Yurkov
	 <uvv.mail@gmail.com>, Martin Jansa <martin.jansa@gmail.com>, Lukas Funke
	 <lukas.funke@weidmueller.com>
Date: Tue, 17 Oct 2023 14:53:43 +0100
In-Reply-To: <20231017132647.352938-5-lukas.funke-oss@weidmueller.com>
References: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
	 <20231017132647.352938-5-lukas.funke-oss@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 13:53:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189334

On Tue, 2023-10-17 at 15:26 +0200, Lukas Funke wrote:
> From: Lukas Funke <lukas.funke@weidmueller.com>
>=20
> Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
> ---
>  scripts/lib/recipetool/create_go.py | 730 ++++++++++++++++++++++++++++
>  1 file changed, 730 insertions(+)
>  create mode 100644 scripts/lib/recipetool/create_go.py
>=20
> diff --git a/scripts/lib/recipetool/create_go.py b/scripts/lib/recipetool=
/create_go.py
> new file mode 100644
> index 0000000000..e0254f111b
> --- /dev/null
> +++ b/scripts/lib/recipetool/create_go.py
> @@ -0,0 +1,730 @@
> +# Recipe creation tool - go support plugin
> +#
> +# Copyright (C) 2023 Weidmueller GmbH & Co KG
> +# Author: Lukas Funke <lukas.funke@weidmueller.com>
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Copyright (c) 2009 The Go Authors. All rights reserved.
> +#
> +#  SPDX-License-Identifier: BSD-3-Clause
> +#

Can you clarify what this license information means please? Two
different license identifier lines seems rather confusing and
problematic.

I've not looked into the rest of the patches yet, this just caught my
eye.

Cheers,

Richard


