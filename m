Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAB4FEB64DA
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 10:55:05 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.11038.1689764101670587732
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 03:55:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=g3CoQdWU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3fc03aa6e04so62678845e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 03:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689764100; x=1690368900;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5S1OPKMyb1dOpScK280tFwKg+LP+TYVLfWYZgz1bYww=;
        b=g3CoQdWUUUFgl6gRsNVCzBXaCQggadz/wrV6XKbhOwSMFyw4mIMwEubtT3pVFVz3Mf
         VXmMzvYj38rs7IsowHleaIDMljxKRWclYvkwU0R+F4uWFwRHGcEVIeZ/JbJc6pgnOdte
         +/G9e++xhGXin1a8F9SWim15EsFX+Mmn+ZU9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689764100; x=1690368900;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5S1OPKMyb1dOpScK280tFwKg+LP+TYVLfWYZgz1bYww=;
        b=Jd/nPGxd4kP8RE+2yurU5K4oMbqC/ekNPviqJYZTy236LWTWiAjOIC35evYrMu6gvh
         RsINxwoG7VK0FKdp5CqZOViIQ9xmVDsXM47RO1ibCwC4hcjkWsvmnDQcZvVvfk+XQlp3
         x+7R07grSsXy+Ed+hlJVbXBnl4L1TqvKXmSCN39U48TJrapa9FN7nBhHtoElGoBv183o
         H+I78RqnlgqTgMO1/wPpBTT4CM23huD1LeO7wHotzbo6IJf4EPSuN+MpGw+tI/WWcsps
         zdCNcVJPU8C/Pkg0uVAO+rQY27B9DDfDxVtYR1yKGtweAiDAWmHDxgHTN9OjK7c9miq0
         zdJA==
X-Gm-Message-State: ABy/qLYzntEZ1tpiBEzp4Fzc+lE2tPMnHf1b6P68JXVp7oB3nnciO3FH
	ryhZ6FkmJTGxCRK1gyId8ys2VzUKqX8TnbhZkWI=
X-Google-Smtp-Source: APBJJlGpjekcNgrgE/UdVO5Hsahtbu3xCyISadv5zZRAPsk9Kvs5l0N0AkWRfn61tJuEp1jg/5y7RQ==
X-Received: by 2002:a7b:c454:0:b0:3f7:f45d:5e44 with SMTP id l20-20020a7bc454000000b003f7f45d5e44mr1607295wmi.32.1689764100084;
        Wed, 19 Jul 2023 03:55:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6248:d29c:dec5:5723? ([2001:8b0:aba:5f3c:6248:d29c:dec5:5723])
        by smtp.gmail.com with ESMTPSA id p3-20020a05600c204300b003fc3b03e41esm1760382wmg.1.2023.07.19.03.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 03:54:59 -0700 (PDT)
Message-ID: <ca87e264250af926f1cf3a2463e3213436c515bd.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v9 0/3] CVE-check handling
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Valek, Andrej" <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jul 2023 11:54:59 +0100
In-Reply-To: <38950e1b3bd475c131e7e4b5db03d9d170c8d690.camel@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
	 <20230623111459.97933-2-andrej.valek@siemens.com>
	 <38950e1b3bd475c131e7e4b5db03d9d170c8d690.camel@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 10:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184577

On Wed, 2023-07-19 at 10:26 +0000, Valek, Andrej wrote:
> Hello,
>=20
> I would like to ask, what's the status here?

I've asked for some people to help review it and I'm waiting on their
feedback. FWIW they did promise "this morning" yesterday so they have
around 6 minutes!

Cheers,

Richard



