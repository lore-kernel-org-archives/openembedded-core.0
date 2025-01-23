Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A379CC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 08:38:19 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.6890.1737621495563029833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jan 2025 00:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=htfATP8W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so282147f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 00:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1737621494; x=1738226294; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12wU4mdBsIND5hsUjcMnWyCyXKYE6Fk+ShMPBsrj85s=;
        b=htfATP8WOf2dKXRzgA8ci21EHL7ntVzFhdXp0k7bVnC4yZ27H7cVG4wgMSyBVHmCBD
         F9aeA1YU0gxdgZFdvlwPBcPKxKE05RAzurz2nvD4VSvvHPBeUdawszzltkLkGDBCUAUs
         W5MLPWXqJ9b/2T+oeplBjJDHmMS90e16nn2ZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737621494; x=1738226294;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=12wU4mdBsIND5hsUjcMnWyCyXKYE6Fk+ShMPBsrj85s=;
        b=VT548wcIJE3PIKHhiEFag7AKMhCg3NvhKxR/cgpsCm8cKfmcoTbwA2JlT+endwrTVq
         MDD85B4Q1j77rMXkU0vYNX9RC3gBlJP9eco47YgmDoKfhCiN9PtFKcmx8o4EHWMl8C5U
         QiA/4GdNs6Tz4rxcp/zJYGcDXsnUutSqFssJJhLqLTQoD5naRHuZuwD5tOgOuEsPqgb9
         O6XkLOCuvl8Dg6vzox3BTR60r0Y8pC8RTLakLNT2dGLKEAYVXCEFhSEDoAtkyun7XExx
         Eh/smgonKe/jXQP8MbZGDTE5Fvvnex4Uo9iE1C2d79yECSehEGb1rTSv0y5yPRMiUJNX
         TyMg==
X-Forwarded-Encrypted: i=1; AJvYcCXMn5QiT2IEHLq3E6GdxkDjrngOxuIvoWIjx9+Vxgn6uEvH84uJwLekP7L0ooyCod+gF3mLGACtp6qSom3Zr0z7eQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyOgIF+CB7/8kJz4lAzNtT+uHTJtlx2oA/CLC59XzhxyUlpEYeI
	c0HY4k8Hdb0d9MvpynczheiFvBjVYcwP35xZXavpLVGR2/EsguPrEeiDsRmHT50=
X-Gm-Gg: ASbGnctvh8NdYtfu9gnMTk+0XzH+nhVX6CKnYol0KaZxT0ExL2r0d4M1xMx8qlNY1hm
	zEonmIWlIP0wcmzNBfGVtQl5a4iJoIg5F+QWPf9G9LQ91AU7j+zUtPSuxUIcD06FO6Ha6j5CNTx
	W+97o4/QXuHBY9LBxp3cGe/gZMwnXmle9QT19Q/U6yRw88gLhJgluUDzM3BosUcar0ru1ZiNbTc
	MTgYVWfFWAkJ0qT4KRXTxlzaqTcSnaG60jgDHFmti1Nk4Zm+GDbrurpHxXxwZP/QzqTxYD/YG0o
	LJtbsBn+BMARFmRUpS8AeQW9XWatlltDIyeqkDhVTVyh8fzbQfb6FJ8Xj6kdcbZ64kPEFw==
X-Google-Smtp-Source: AGHT+IGj0NuU1SuWquYm7Hs9U4E0nNP28iaCPmuZUG6a1jaTZF4Zh1j/EnQmTmhyRfzRnPdL7X1/eA==
X-Received: by 2002:a5d:5f51:0:b0:385:f17b:de54 with SMTP id ffacd0b85a97d-38bf56568b8mr23573010f8f.5.1737621493891;
        Thu, 23 Jan 2025 00:38:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e9f3:6482:e693:9d62? ([2001:8b0:aba:5f3c:e9f3:6482:e693:9d62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf32222d1sm18676259f8f.38.2025.01.23.00.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 00:38:13 -0800 (PST)
Message-ID: <2a14a7e2d97936c5e0f68a8320bddc20dd4005d7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] classes/spdx-common: Fix patch error for
 recipes that inherit dos2unix.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 23 Jan 2025 08:38:12 +0000
In-Reply-To: <181D447E5FAF7FB4.25327@lists.openembedded.org>
References: 
	<9c98a7d0304062e884e35823af9a97f30bff75b3.camel@linuxfoundation.org>
		 <16166.1737619411751493273@lists.openembedded.org>
	 <181D447E5FAF7FB4.25327@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 08:38:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210179

On Thu, 2025-01-23 at 08:18 +0000, Richard Purdie via lists.openembedded.or=
g wrote:
> Hi Hongxu,
>=20
> On Thu, 2025-01-23 at 00:03 -0800, hongxu via lists.openembedded.org wrot=
e:
> >=20
> > Convert do_convert_crlf_to_lf from a separate task to a postfunc or
> > prefunc
> > is not suitable for this case, the postfunc and prefunc is executed
> > in
> > bb.build.exec_task [1], but do_patch is called by bb.build.exec_func
> > in archiver.bbclass and meta/lib/oe/spdx_common.py
> > Which means postfunc or prefunc will not be invoked in
> > bb.build.exec_func
> > =C2=A0
> > I think prepend function to task do_patch could workaround the issue,
> > v2 incoming
> > =C2=A0
> > [1]
> > https://git.yoctoproject.org/poky/commit/?id=3D0f516fe9a043276c67062289=
5c4760ff6468f293
>=20
>=20
> That is a good point. It makes me wonder if we shouldn't tweak the code
> to allow exec_func to optionally execute the pre/post funcs though. I
> still don't like having to manually fix up these things, or start using
> append/prepend which the pre/post funcs were meant to avoid.

Of course that still doesn't handle the [depends] flag which is really a ta=
sk variable.

Your patch changing it to DEPENDS won't work unforutnately as that is
added to the sysroot too late to function correctly.

I guess this is why we've ended up working around the issue. It would
be nice to fix this properly somehow but I'm not sure how we can do
that now.

Cheers,

Richard

