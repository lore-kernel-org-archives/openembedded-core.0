Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5900C54F30
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 06:45:43 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.1065.1748587540119309703
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 23:45:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Z7mqzjW7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a361b8a66cso1043248f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 23:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748587538; x=1749192338; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mNTpVIw3mxtzCAYxGc/3AH/giCYWK8zx8mlPdoMWVtw=;
        b=Z7mqzjW74gXQ0lP+F2gSslmEBRnny++nPsbVSWdtuxeNhlHcD1qDElhDncTbzbWZNK
         X3+re+AkuOCkKTuzggPhGpfcMdQ9xVBpQS0wJkQOUsaz6T4KNMo6RmYA9Xi03qbVmcUj
         VJT1qOAwgMJf6AXjitzDc4gI/IJMOkKlES+Qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748587538; x=1749192338;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mNTpVIw3mxtzCAYxGc/3AH/giCYWK8zx8mlPdoMWVtw=;
        b=EAYYqx8I7mzrnQy9Bke0K3lucKQohok69RWIdH8CNGI8y3lqRryheSwp9N2kzGhAtf
         zDRqdffUj4nyyU60PNBzHyCA904QlNnupxz1cYf6+RiTQJEW/sOHyuSEvBRsUIr/H/Ij
         OcJTC3YCZ5iXGqjyijqMYXbglDDOD4TfCWCrKB2Bvri4fKT2pqDrpN8JvGef3SG8dCT6
         5Z6WjDfWwqBtJ2f8vI4nphpaUK/oEGm81QNr1Us3t7nD3IEzYU93VJA40ri7PhrNApbl
         FZecJHANMNfleJMUHXDTNHvPxQJI0ZzDXCBTTHP7VD+wEfZfT/TkjV/vu4sMHQfRr5gR
         vvtA==
X-Forwarded-Encrypted: i=1; AJvYcCX3PxDI2vQ/CwzhrClDh3ZDHIdvqu5SX+ANq4r9Zrq7r6ehINFUKsN88qgBej7T14e7Qak4y9quXhJ2k0CY12QmUg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yww5RnCYGf4TDu1QvINXaZBPBOGKxXvVZ+K1m8NQlN5EThp9vow
	eW9VgskN9r8ZK6A+SOFSG+tgFCFDcY/VGzajl46/+zoxGrPqam0v+9IxBHTnmX59Wm8=
X-Gm-Gg: ASbGncuMFGsC9Y1RcQA0xfLVgFoDKkGD7K3D8w73A0R2udSOpAC2GT9+fj1+X2vWY3Z
	veofumLW2z1IBHaKrKAEH30IgUWCafJ8SmJty+MvW/wDSY4s9GbzIIQu2qXjpLkGt8r3rmUQG7w
	VYlnTwbIeaTk38naAZ9h1DfECwmb0T1PPA6daZVXbU0kHP/cva9ZOkexI8EtuxMj08gri/feEGy
	TzA21sM1M9iLb2+ShanCFaWVOR4YZtEivyixjkbRFLfBF7zlcNw2DPCyvfbUj3Wv3DEOFItaxs9
	o31pcAj7l7AKa6GRrt25+khUPlPL82z+fY8WEzzaqWu+JzUWwdb4tclunD7fQ7s5h7MjL13Ifin
	ReVi/MkBHxFWDY3ZkLpmvXo4R40uxTAhwyOshVfqKSSfOkGKO
X-Google-Smtp-Source: AGHT+IH2Qu+i4IusCFRrj1OnM4OaA+d2tTBDw331edIDf8AluOAZ5d/PYe0JZDx5ZgWX/SHUwvURVw==
X-Received: by 2002:a5d:58dc:0:b0:3a4:f7db:6ff7 with SMTP id ffacd0b85a97d-3a4f7db764cmr1061046f8f.52.1748587538530;
        Thu, 29 May 2025 23:45:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5d72:4093:f55c:1c6? ([2001:8b0:aba:5f3c:5d72:4093:f55c:1c6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009fbf7sm3901331f8f.83.2025.05.29.23.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 23:45:37 -0700 (PDT)
Message-ID: <782b23ff482ab3749e1655288c3932fe882a41f6.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] wic: plugins source bootimage/isoimage
 rename to allow be imported
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anibal Limon <anibal@limonsoftware.com>, Ross Burton
 <Ross.Burton@arm.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 30 May 2025 07:45:36 +0100
In-Reply-To: <CAOU5ZMsctXq9Gf0UHdrrt-9ZKV69qMs21AjBJ7Uu=vUxmWp6Pg@mail.gmail.com>
References: <20240323195304.2909926-1-anibal@limonsoftware.com>
	 <20240323195304.2909926-2-anibal@limonsoftware.com>
	 <20240325101809ec807440@mail.local>
	 <CAOU5ZMvcO4_HWWgNc44P11w=rXh_cXyFhi7P2=D1iDhZjB+xTQ@mail.gmail.com>
	 <FB405ACE-51BB-44F0-B449-EAC18194F176@arm.com>
	 <CAOU5ZMsctXq9Gf0UHdrrt-9ZKV69qMs21AjBJ7Uu=vUxmWp6Pg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 06:45:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217466

On Thu, 2025-05-29 at 17:22 -0600, Anibal Limon wrote:
>=20
>=20
> On Thu, May 29, 2025 at 2:06=E2=80=AFPM Ross Burton <Ross.Burton@arm.com>
> wrote:
> > On 25 Mar 2024, at 14:39, Anibal Limon via lists.openembedded.org
> > <anibal=3Dlimonsoftware.com@lists.openembedded.org> wrote:
> > > Thanks for reporting, I will adapt the tests.
> >=20
> > Without having to rewrite all of the documentation and existing
> > files, why doesn=E2=80=99t wic just normalise the plugin name that it r=
eads
> > to replace all - with _?
> >=20
> > This means you can still import the module names, but doesn=E2=80=99t
> > change existing behaviour at all.
>=20
> So to normalize you mean change python module name from _ to - at
> runtime?.
> The plugins already had a name attr with '-', the issue is when
> trying to import from an external module.

What Ross is suggesting is that in the code in wic which parses the
commandline parameters, we could add a line of code to change "-" in
plugin names to "_". We'd need to tweak what gets parsed from the wks
files too.

This would make the migration easier. We may or may not want to issue a
warning at the same time so the user can know to update their wks file
or command.

Cheers,

Richard

