Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2643C4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 11:16:44 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.119344.1699528601840355843
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Nov 2023 03:16:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R2OtyM5J;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4083740f92dso4978935e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 03:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699528600; x=1700133400; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+H1Lvsml9kW/CQSLNamiNVp/Hr6pFVg719IWlZ6P/sc=;
        b=R2OtyM5JVtCitjTISGOzmBQ2/PhbtKJ3ogIFQLoxjJ6iO9T9k5tsQIbEDOHxuUOQsE
         Y1O9+ZpwcH6MfpP5jzRF+nGc/k7xghW4Du9g+vslLOu59Say//cneO/77J667sYAO2L6
         ye9fAzRv0gAozo6u2PqngL8RaQ1FnHhFRg4+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699528600; x=1700133400;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+H1Lvsml9kW/CQSLNamiNVp/Hr6pFVg719IWlZ6P/sc=;
        b=j5oa85dhNX59SFD0sx8BJUjKt9wb3/P8qnTkAhTgHUNwbyMUFROag8iVuRPku4mRZE
         Jmv7BhXb7MLWCskZ1z+3WYJ4Z9JCjTyFVA8bdcOuiwdDDQx8saXcWP8n1p6EGl8d6T7E
         aJ5W3r+Bc4fMiY2IOhc9f329wcGRZxjfH7ZKDfa4j7SwULWZDn3Noz7nfM9GIN5qcJTv
         0xagLxgh2G/wlI0tKr7bUclRtf5sdWjbiEr7hVVCvo37OjrR/CdAoCw12KccC30cTG8o
         8uL46Qf0iF4nY2CgH3HpkdT3PAIaTNaMbHiQxl7pLPFn33H9sk7UUwX3etEQR1EdpteU
         RrKg==
X-Gm-Message-State: AOJu0YxLAAgHqyOLht3mdZzTJSLHvNh3yld+ixlwykdjBr9rpgx5zwUL
	JwjIvuHKEonNn/wxPjz/XWqjag==
X-Google-Smtp-Source: AGHT+IEeaXq8pICwyPhr2EvwtHos9ApMrcRYV0GjR1/n7U7P4qB/2iuymdcHh4BLtJH6eFBtdZIqoQ==
X-Received: by 2002:a05:600c:19c8:b0:408:3c8a:65ec with SMTP id u8-20020a05600c19c800b004083c8a65ecmr4283415wmq.8.1699528600219;
        Thu, 09 Nov 2023 03:16:40 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7d6a:4777:87ed:703e? ([2001:8b0:aba:5f3c:7d6a:4777:87ed:703e])
        by smtp.gmail.com with ESMTPSA id u22-20020a05600c00d600b0040775501256sm1746939wmm.16.2023.11.09.03.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 03:16:39 -0800 (PST)
Message-ID: <1a9aca76ed59120e60f04c801a90942b703c04b5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: Drop PE and PR from WORKDIR and
 STAMP
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 09 Nov 2023 11:16:38 +0000
In-Reply-To: <CA+chaQdtfrd1zLmKz=2HWRyJe5ngLK7OTXbJ6G+1hOvVPeJ3aQ@mail.gmail.com>
References: <20230810164114.261613-1-richard.purdie@linuxfoundation.org>
	 <CA+chaQdtfrd1zLmKz=2HWRyJe5ngLK7OTXbJ6G+1hOvVPeJ3aQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Nov 2023 11:16:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190382

On Wed, 2023-11-08 at 09:34 +0100, Martin Jansa wrote:
> On Thu, Aug 10, 2023 at 6:41=E2=80=AFPM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Once, we relied upon stamps changing to rebuild. PE and PR are
> > packaging
> > variables and are reflected in the taskhashes when/where they're
> > used so
> > they do not need to be in STAMP.
> >=20
> > Similarly, once, multiple versions were something which was useful
> > in
> > WORKDIR but this is really just noise causing long pathnames now.
> >=20
> > Drop PR and PE from these variables to clean up the paths a bit.
> >=20
> > This may break some tool assumptions about paths but those are
> > probably
> > things we need to fix.
> >=20
>=20
>=20
> meta/conf/bitbake.conf: -fdebug-prefix-
> map=3D${S}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
> meta/conf/bitbake.conf: -fdebug-prefix-
> map=3D${B}=3D/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
>=20
> What about changing ^ as well to match workdir names? I know it works
> as it is now and it might be useful to know from which PR the PN-dbg
> files are, but as we don't depend on PR in WORKDIR maybe we don't
> need it in /usr/src/debug as well anymore.

I'm ok with trying that. I think we could drop PE there too and I'm
even wondering about PV...

Cheers,

Richard

