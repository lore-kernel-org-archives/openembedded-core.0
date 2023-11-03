Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA53C4167D
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 13:48:46 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.52291.1699019324899766955
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Nov 2023 06:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MxUO/7fK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-408002b5b9fso15129515e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 06:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699019323; x=1699624123; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdPhIw+7VcNXlkapbwRzCAh7hkHzze2Vgei8Iq7SCgI=;
        b=MxUO/7fKgKC51dJISTwsWagqyTPBToLG0p37KYVRAYAVwxMDO3wPksTXIKNHU3VIzr
         mxrTlqs5KfPVN0gTYRDZTE9M5WLfGfVyCF90+y/R3hgwJIg70Ifww+WNHfKnfw+hyTN8
         QZrzSKwLzdlVWGXAI8zVINdACrgEHuToc7bHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699019323; x=1699624123;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YdPhIw+7VcNXlkapbwRzCAh7hkHzze2Vgei8Iq7SCgI=;
        b=JJVfTgmji9ukG8mRMPK9cg0E/8iP0XbLdn4ZyBNGLEVtpHl8AfvaDL/DaJYgRVAqYS
         n8jc+NyTLkZfWLyHxEwPAm3pk/d89wGnvXavC3B3Td73b/ePCJx2HUpr7hXZTKx1IgXf
         r0pV+77pzBIy898fACpfSAJVnmU+Rd+tuJX2p83jwY25KJRwXdKfw6V9AsnTgFozWayy
         spug/qizCIOsKQVWxtHc8jNFNdLHLSbWY7zuG0NB5qCqKW4F4gEi2dae8yCrfXP31rHf
         TJY0sgptTKGKG8HUeawMp+/SQ6Q4UovE/kd+fe8Xm0OTT6SrTUEC5EE2muXNiVChWDOG
         pqUA==
X-Gm-Message-State: AOJu0YyfBuXwoqP11bvg4eJFQxolbTUSZ1DYETzwREpDv+NU/uQDaq7V
	0WEUHbb3MIg4ztWCNFgxzEuqzw==
X-Google-Smtp-Source: AGHT+IHJ5wqRRmP9zLXNLlGaEfPic87zmW3jiUZkdgeQPY6Ia3nQKVxYIEmK2CoKAdd6b2mzXgauYQ==
X-Received: by 2002:a5d:648c:0:b0:32f:8181:7d38 with SMTP id o12-20020a5d648c000000b0032f81817d38mr16296446wri.20.1699019323253;
        Fri, 03 Nov 2023 06:48:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e0d8:6688:b1fe:2c10? ([2001:8b0:aba:5f3c:e0d8:6688:b1fe:2c10])
        by smtp.gmail.com with ESMTPSA id y8-20020a5d4708000000b0032d9523de65sm1908441wrq.48.2023.11.03.06.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 06:48:42 -0700 (PDT)
Message-ID: <ac2dc772b8da59e0b1a32b75b03732b25896a55c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] classes: Move package RDEPENDS processing out
 of debian.bbclass
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sergey Zhmylev <s.zhmylev@yadro.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 03 Nov 2023 13:48:41 +0000
In-Reply-To: <20231103131428.2620444-1-s.zhmylev@yadro.com>
References: <20231103131428.2620444-1-s.zhmylev@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Nov 2023 13:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190161

On Fri, 2023-11-03 at 16:14 +0300, Sergey Zhmylev wrote:
> From: Sergei Zhmylev <s.zhmylev@yadro.com>
>=20
> INHERIT_DIRSTO by default includes debian.bbclass which in turn properly
> establishes dependencies between package management tasks and build
> process. Debian class also unconditionally renames several packages in a
> Debian way. In order to allow disabling of such renaming rules, the logic
> of RDEPENDS handling is moved to a separate package-deptasks.bbclass.
> This commit also solves the SDK building issue without debian.bbclass.
>=20
> Signed-off-by: Sergei Zhmylev <s.zhmylev@yadro.com>
> ---
>  meta/classes-global/debian.bbclass           | 22 +++-------------
>  meta/classes-global/package-deptasks.bbclass | 27 ++++++++++++++++++++
>  meta/conf/distro/defaultsetup.conf           |  2 +-
>  3 files changed, 32 insertions(+), 19 deletions(-)
>  create mode 100644 meta/classes-global/package-deptasks.bbclass

I think this patch does raise a good point, PKG_ renaming doesn't work
unless you have the dependencies in debian.bbclass.

Since we rely on PKG renaming in places, I suspect we should move the
dependencies into package.bbclass or the main classes unconditionally
since they're not really optional this point?

Cheers,

Richard

