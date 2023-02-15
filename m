Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE3EC636CC
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 13:53:58 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.15293.1676469235469108628
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 05:53:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112 header.b=uifilIv5;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.46, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-16cc1e43244so18699422fac.12
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 05:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UWIB8NlEpfbLrk7SK3hPOJhB3onMF/bBhidX8/OhP40=;
        b=uifilIv5mIWFQgiRcejVC27P8ivc2QbH4CsLltE49gSjqTCwfYZREkvJ4WihZSrGid
         SrwfIS/a3OwtxhuNZKVO6GN7JOY8F1nDf37Bt9cnu9Th2NIsH1A/IBTPrEchV/ePHNb7
         ifPS1k90PxhUqFZXmKF3LbX/ZZqhXxYVFN3GysWBgm651AbZMwRt7PKCGOxE7Av6rAa+
         WIaUoQSdskwWgDMrPM209njy4TsDDH7qqPwK8ebkJ9+wyUcnf0m/jckooBjdqS31OV9y
         chqRQVetI/uvHIJszITxfSy/iGIh70XfdCKSlBViQdJfDzRUzqZSIiao/+9r382WgFxc
         MX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UWIB8NlEpfbLrk7SK3hPOJhB3onMF/bBhidX8/OhP40=;
        b=g1G1IXVjpFLZ2aMW2wQL2xF/bScahoPvtaJ0e8tgs8zofpb4qKFZmElPTwi2C+8dtO
         yYIPbNHH5JI6GcHlCnuyQ7iKfdtszjoWi+EmqdUdCOX5lPaHvbXrzPNMWMo4iV9Pf2EL
         Z/sd58+pe0Fqzc6KuIOjy93keugbrR2/NylmsCcpJxyEFEEh/FU+PdYrAeWsT52pu62p
         S8Xd6V6+r6dNgCeynW7T95XPvUG2XLjstcw8cDZ7EYp+s6y5FvmVpzlXJ3isxN5s8HeZ
         mvynjwVDLGfXUbNj46HRRyhfNGvf6P6dulyCLecYhTzrXGp5YDZgdt609m9RyCJS4CBC
         /Q6g==
X-Gm-Message-State: AO0yUKUndFG0kqy4g6SIw87yNytoEWynJ/kg2jMd318u1jpvFzxbPB9q
	x9JPBJwC93C1cproIQ7rBkFSEXzA+Ij67TdwFnQ=
X-Google-Smtp-Source: AK7set8bziG00yAjSz3eHWDmXYVYfccjuQumlREWTpcc0GfAQTgPHnZ+ICa9y3YuGpUFNXvBxIdLpg==
X-Received: by 2002:a05:6871:4385:b0:169:cbcc:25cf with SMTP id lv5-20020a056871438500b00169cbcc25cfmr1602823oab.29.1676469234402;
        Wed, 15 Feb 2023 05:53:54 -0800 (PST)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com. [209.85.160.48])
        by smtp.gmail.com with ESMTPSA id ec22-20020a0568708c1600b00143824af059sm7032815oab.7.2023.02.15.05.53.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Feb 2023 05:53:53 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-16e353ce458so5413569fac.9
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 05:53:53 -0800 (PST)
X-Received: by 2002:a05:6870:f:b0:16d:d720:98f8 with SMTP id
 a15-20020a056870000f00b0016dd72098f8mr239705oaa.288.1676469233378; Wed, 15
 Feb 2023 05:53:53 -0800 (PST)
MIME-Version: 1.0
References: <20230203135011.2061939-1-m.felsch@pengutronix.de>
 <12e370a3183d04572da1c5749d8e64dcf5091a0c.camel@linuxfoundation.org>
 <acf8b79c23675a2b4c7225e55e4ab369fbcf7f54.camel@pengutronix.de>
 <7f5ebf2315c969ce7c76d024ec373f45cc8eff3f.camel@linuxfoundation.org>
 <CAP9ODKokQpGL3ttukqRaq3-8m0ci7qp8mckbgudGJx1HOu-fPw@mail.gmail.com> <CANNYZj8_RkjMASpozi+oSu3XOHCW04n9YUC5UgHKy+2vm=cDrQ@mail.gmail.com>
In-Reply-To: <CANNYZj8_RkjMASpozi+oSu3XOHCW04n9YUC5UgHKy+2vm=cDrQ@mail.gmail.com>
Date: Wed, 15 Feb 2023 10:53:41 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqjkCuhyVkfhskOSdF3g57=R9MO6Bcy2R5zBV9fVd6wZQ@mail.gmail.com>
Message-ID: <CAP9ODKqjkCuhyVkfhskOSdF3g57=R9MO6Bcy2R5zBV9fVd6wZQ@mail.gmail.com>
Subject: Re: [yocto] [OE-core] [PATCH 1/2] barebox: add initial support
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	=?UTF-8?Q?Enrico_J=C3=B6rns?= <ejo@pengutronix.de>, 
	Marco Felsch <m.felsch@pengutronix.de>, openembedded-core@lists.openembedded.org, 
	yocto@pengutronix.de, barebox@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 13:53:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177193

Em qua., 15 de fev. de 2023 =C3=A0s 10:44, Alexander Kanavin
<alex.kanavin@gmail.com> escreveu:
> On Wed, 15 Feb 2023 at 12:22, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
> >> Fair enough, I'm open to the idea. It would be interesting/useful to
> >> see if anyone else in the community is in favour of this or not. I'm
> >> sure you appreciate why we need to ask the question and why we can't
> >> just add everything! :)
> >>
> >> The community usage does appear to be primarily phytec/ptx.
> >
> > I have used barebox in some projects in the past for multiple customers=
. It is a solid and commonly used bootloader. I consider U-Boot the industr=
y standard, but Barebox is also widely used, and it makes sense to be part =
of OE-Core.
>
> I do not quite understand why barebox needs to be specifically in
> oe-core. There's a well maintained layer for it:
> https://github.com/menschel-d/meta-barebox
> so once all those meta-phytec recipes are phased out in favour of
> using that layer, there's no fragmentation.

I think the Barebox inside OE-Core allows a bigger integration and
reuse of existing tooling for signing and other classes currently well
integrated with U-Boot. For me, a critical point for decision is if
Pengutronix will commit to support it.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

