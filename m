Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1482ECCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 08:44:06 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.7231.1759999442775214282
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 01:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bmU+v50n;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-46e2826d5c6so4516975e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 01:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759999441; x=1760604241; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ea6PaY71klHpdLdms9WYt8FC//FTyD4Ys+AA6shraJE=;
        b=bmU+v50ngu2wafDKXXgYOwriFX5wCl2pvwVyCClxwRsYH9ebcuLW9CfIBUriX0vFuR
         pwaOZv1WNOSz1QAYEZvPv2+kOL+ge+WbWR6WDV05ASuz7hv276klf7STPjwXjLj5iTLz
         zWLcGJCzjM+KIiS6VdI0E24ZFHZhXW0V51Pf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759999441; x=1760604241;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ea6PaY71klHpdLdms9WYt8FC//FTyD4Ys+AA6shraJE=;
        b=WpwAArIzrmtzjN3+KmWDeYc4ZUTkloOJ3/Dhs/8LbNydTToOtWwua6Ia62Trcg2vif
         CfPAK4lTG1GP6pRD+gp8kOPQvnABo+HMoWllMtz8Y4RlfDJn4H1r2ncBApBqJHLTSjUM
         59U5VtjHrrz7aEBrJ4EA72aWsnS9BNGuZYCUdzU3xxn2jSHYS0vvLI2SYw00wHYh88vj
         mt9mar5lMgfU17OhABsHCvYCuptZWo/8VO8MhopJSio8O56uauTN6l8mNqPRjEP8BExf
         hzPi+FxlX1rm5rXhgYgwsn4mA6+pb5JhJC2vRgeDBylxYV6BeI4wiyB1n7z5l4qdvSAi
         DyTw==
X-Forwarded-Encrypted: i=1; AJvYcCW0Avo6XVP5nKzVRR+5QwmotTvouWMPiAGbabzCSX+VkmQYqn17KGa8GBtqRkn2cXJ3aYPRBWd1qXmrxdaHDbCWhQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyZRx7r48haT62Ug1ouV6LsG7588SlN/zGnH9OUo7Pe2zYQaM0A
	/wozwKQs3siiKWzbkvKjmEpUS7hPAjI+f7II23ovDahjDKnC5ZGmhBBThMrMNn5xLd5UeAx21uB
	D8b+O
X-Gm-Gg: ASbGncvyXOssCYBqCz73fT6dY9eoM5y57sBmWw+FURroFKBGaJv/14ud7FLRlrDgE5l
	ZcaA+is11lsfBkad/Jy8KwFPC8t4heCwu/gw9ZBMZ3p6HSDNxMlAu51akx/7Ntv6EAb+6V3VJt8
	iYBLHwKiNHhy7okcP1YCyUXwVoc6uPOw3iKsKBkganOBIt9fm8eaKQNnfTzxxSST7n7Ubg/rfM4
	MCVSofLNKWQI64Pq4e2ucMprvpcVExE+gYtFevikGvh6BYfDsA7hlbU2/vgVJX6HYSJsQXGC1bK
	xSmEA7hpsxeWBEg5CFEyiC4V5VYoRbhT0RnsI6en2SyGlH4UT+gKbEqpMntK5Tga8r4hm3vz1km
	uOyAwkdi3c/Hg2FlrU571OrIpR+xW2Xi6ocFwFfg5QsZOsh6uPUiO3KKQr3JP/QQ30SdurH8NxU
	xQUcJH42hGxkxKVKKZ0JlSe73Zp3gjP2jSfyw=
X-Google-Smtp-Source: AGHT+IFeCF2B9yzyy3456B5LkIU7vm5o8kW20aY+UuA6GuBqNQbAnpCP+zlrko/VuLYWRaSXqGVd9g==
X-Received: by 2002:a05:600c:1395:b0:46e:37fc:def0 with SMTP id 5b1f17b1804b1-46fa9a9efaamr47356605e9.9.1759999440980;
        Thu, 09 Oct 2025 01:44:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8c4a:b3bc:b910:6576? ([2001:8b0:aba:5f3c:8c4a:b3bc:b910:6576])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6c3esm33985677f8f.1.2025.10.09.01.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 01:44:00 -0700 (PDT)
Message-ID: <e892df0828506e1129448bca78c7511461fafff1.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH 2/2] oeqa/sdk/cases/autotools.py: use gnu
 mirror instead of main server
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
Date: Thu, 09 Oct 2025 09:43:59 +0100
In-Reply-To: <20251009023123.245604-2-steve@sakoman.com>
References: <20251009023123.245604-2-steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Oct 2025 08:44:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224607

On Wed, 2025-10-08 at 19:31 -0700, Steve Sakoman via lists.openembedded.org=
 wrote:
> ftp.gnu.org=C2=A0is the main server of the GNU project, however download =
speed
> can vary greatly based on one's location.
>=20
> Using ftpmirror.gnu.org should redirect the request to the closest up-to-=
date mirror,
> which should result sometimes in significantly faster download speed, dep=
ending
> on one's location. This should also distribute the traffic more across th=
e mirrors.
>=20
> This information was sourced from https://www.gnu.org/prep/ftp.html
>=20
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
> =C2=A0meta/lib/oeqa/sdk/cases/autotools.py | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oeqa/sdk/cases/autotools.py b/meta/lib/oeqa/sdk/cas=
es/autotools.py
> index 3f51854e3d..ecafafa7d6 100644
> --- a/meta/lib/oeqa/sdk/cases/autotools.py
> +++ b/meta/lib/oeqa/sdk/cases/autotools.py
> @@ -27,7 +27,7 @@ class AutotoolsTest(OESDKTestCase):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmv =3D parallel_make_va=
lue((self.td.get('PARALLEL_MAKE') or '').split())
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with tempfile.TemporaryD=
irectory(prefix=3D"cpio-", dir=3Dself.tc.sdk_dir) as testdir:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tarba=
ll =3D self.fetch(testdir, self.td["DL_DIR"], "https://ftp.gnu.org/gnu/cpio=
/cpio-2.15.tar.gz")
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tarba=
ll =3D self.fetch(testdir, self.td["DL_DIR"], "https://ftpmirror.gnu.org/gn=
u/cpio/cpio-2.15.tar.gz")
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
opts =3D {}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
opts["source"] =3D os.path.join(testdir, "cpio-2.15")
>=20

This patch is good, thanks.

This code is supposed to be using a cached copy from DL_DIR. If it is
failing on older releases on the autobuilder, it might mean the version
of the tarball is missing from the mirror for that release. Might be
worth checking...

Cheers,

Richard

