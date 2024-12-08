Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A84E77173
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 22:27:18 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.88070.1733696834811938384
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 14:27:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ideQsDRK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434f0432089so9280065e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 14:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1733696833; x=1734301633; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cFDQzIBgHF7VZOArBTBbniUJtPeFMk0Szd5n8sOq4m4=;
        b=ideQsDRKKtE4+ruvfEOtKZeBM1MT/0TZ1+BSsmzeyPryiYwNRlNkYLZTBn1JCU1yW7
         cCiFb4a/21QZ1oq+RJl1tYNnal+iwWKHvz4lIhqEGhrVsjUGLmATNeK/LRY+fIu2hgM8
         DQCaLrvwoNQpzTS+R1P1+n20U+eqc+Io1p7F0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733696833; x=1734301633;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cFDQzIBgHF7VZOArBTBbniUJtPeFMk0Szd5n8sOq4m4=;
        b=JCUy7Z6gFJMmoDxdFAYuXy/1w4l1pq328DCTSiMelxmHYMvIC/ja4PYqe9gubngFTX
         meDpULXgP6yXObLibi2ti2/QdClNdYanuoLBL8vPcHsCRLKmj+7uDFp0UIGnN4muUJDD
         oXHJKy7wTR9sxg7+UAvMkCo3WGRf92rSr5f0kngWye2tPtcrMcHDTCYcQazVdxrqHHi/
         kinuuuGn3BVgkEuP1SSGRFzyOgKrSroihewAB5fVnG7I5FzEflBppwmsp5a2WpRyH9Fj
         z3HENs0UY12SoXxazNqED3lFLhm7POZEklqe/eq7jlCGgX4ZZGelAHiByHCxaqvyJtBt
         79ng==
X-Forwarded-Encrypted: i=1; AJvYcCUsNEF66moiMkGGCGQ0v+JlNKzMlfqfQ8FIjj/pJJ0PhQDgBNjgocT4c5TwnTslSPMETbWRsiPTx9L+ciC3wj0wCA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzF0gISbWQVzUZWSew1C8OdFT14W1TWVp6Fxe28RabC9cmUkzOL
	Dth5IB6vhbfiJmryn2LlG+7zkD37AXRrSH99UH/m018FqP4rSQX0f9baStWnxUg=
X-Gm-Gg: ASbGncsSHFZuaKtNBEN7DwKV5bdx8k8dpzKQFEWMGcLWMFN9DL4RY2mj6+/D8Oimy9Z
	Jw8+NMgauNffRiqMGDBH+2CPlN3GDUCIN9tJE+z2ec9uF4T9LCMtNF3O2OaGpmYXA1/xTZ635Is
	1X+rehnvDO+4guyUsazFwxgEMpkmDs5xVKq2t8uIMjHzHKm2El7nPrzQZNILRoO3sk1hNQTK3HT
	QMHdu2+vYTs0d0V7P3zZDdx6yvxRxBhnC8le+2xj9tQ+pXfrSnpfquOAXzckcafvwUEAnltdbQn
	0SvhvGHCaSIMinJISFW8WKUT+IbGYa4wrQbZXWI=
X-Google-Smtp-Source: AGHT+IHVe+GJi6Uvie2PnEchbJmxagHvhVJ+bpvtgYC7j0ozE9Zoj/CcyooXA6THlzN5EaSuaVirvQ==
X-Received: by 2002:a05:600c:458a:b0:434:a59c:43c6 with SMTP id 5b1f17b1804b1-434dded7310mr71985675e9.26.1733696833197;
        Sun, 08 Dec 2024 14:27:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c1d1:82c8:bc8d:a69c? ([2001:8b0:aba:5f3c:c1d1:82c8:bc8d:a69c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f981880csm13021655e9.44.2024.12.08.14.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 14:27:12 -0800 (PST)
Message-ID: <045483954dfffbe9dc30f4032b0bf78cbbc4d9b8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] go-vendor.bbclass: avoid QA errors with
 absolute paths
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: oecore.mailinglist@gmail.com, openembedded-core@lists.openembedded.org
Cc: Robert Berger <Robert.Berger@ReliableEmbeddedSystems.com>
Date: Sun, 08 Dec 2024 22:27:10 +0000
In-Reply-To: <20241206173119.12422-1-Robert.Berger@ReliableEmbeddedSystems.com>
References: 
	<20241206173119.12422-1-Robert.Berger@ReliableEmbeddedSystems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 22:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208470

On Fri, 2024-12-06 at 18:31 +0100, Robert Berger via
lists.openembedded.org wrote:
> avoid QA errors with absolute paths from go-vendor.bbclass
>=20
> Signed-off-by: Robert Berger
> <Robert.Berger@ReliableEmbeddedSystems.com>
> ---
> =C2=A0meta/classes/go-vendor.bbclass | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/go-vendor.bbclass b/meta/classes/go-
> vendor.bbclass
> index 38ea69ab50..12667b2d60 100644
> --- a/meta/classes/go-vendor.bbclass
> +++ b/meta/classes/go-vendor.bbclass
> @@ -14,7 +14,7 @@
> =C2=A0# folder. Additionally a manifest file is generated for the 'vendor=
'
> folder
> =C2=A0#=20
> =C2=A0
> -inherit go-mod
> +inherit go-mod relative_symlinks
> =C2=A0
> =C2=A0def go_src_uri(repo, version, path=3DNone, subdir=3DNone, \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 vcs=3D'git', replaces=3DNone, pathmajor=3DNone):
>=20

Can you provide a little more information in the commit message such as
the kind of symlink and whether go-vendor always creates these or what
the trigger is for the issue? Which tool is creating the symlinks? Was
this a change in behaviour of the tool? Could the class create relative
symlinks by default rather than fixing them up?=20

That symlinks class is a heavy hammer and I'm surprised this hasn't
come up before now if it is always needed.

Thanks,

Richard

