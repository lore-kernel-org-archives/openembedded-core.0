Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B21C7EE2A
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 20:01:42 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.25640.1750881694764433251
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 13:01:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X7CL4+T6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso1724585e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 13:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750881693; x=1751486493; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ev18h5p4BR8su2Ewhu5Qti65CB/RckOTvGdTcLhJv7A=;
        b=X7CL4+T6vOY1a3rM06zZG18HlXpr8TY2WkzSa6EHSvQTe6j15SRlDqgzYFho2sn5Lo
         eXRmX2Q8P1flmLmpPRNWXLOHsI8mso9N9mmguPTesqq1nVhfKXeK2F5a40ESPiHR+Ys7
         o6b0iCW/R0qgqoqzYU/jrz//kGMa/UG1/FtK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750881693; x=1751486493;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ev18h5p4BR8su2Ewhu5Qti65CB/RckOTvGdTcLhJv7A=;
        b=Ni8j2GyYIAB++V/vZ70x6aW61IBwPDdMVz/YEume0NTbPlHl2+j6ApUhq5cnQnTyC9
         SJoaEt35L4P6BQTcsgwLkXl4qF9YlH88OVN4s7Y+1j4c2sLw6lTmgWMfX0iDnr+6Ovov
         PX1BjfSz6p+dl43cy/afYygoyf/+X3TSLsh2dqrchQBverePxaxNShv5cHk1mZVJBzPt
         b2IRrESk6zTw35XR8+49wA9ejcQMGIZsp1661OcKnY3UH9mwH+y9hSr+pDW0kTTeKh1i
         JBd5+PUjmhEVtYxQS/oFkqebYAzxHDwba6W4MOP9wjtm6U5ptq326q7kJ+IZrILJBSp7
         lr/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXIUE1iIuzi0EHWh2aer2N2gnCv2H/Fn11dIQctNWPk0X4EC8xYzEXPg60SJ2pChT3ACtG3Y/fHLSEHjfqKtGrUKQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxoep48n+w/guCSA0g2gcyt1bfpgUwkZYH1f9GaplWtLwT+05gF
	Ne4blyZD/eX4gPyhHWzhIAjXpAVdnrjWWwJd1OfNABKLsooYODo7gC5chgtt+qqe93MAxabrykv
	yK39z
X-Gm-Gg: ASbGncudzk89mWrnvZg3F5v2Gm1KsX3xkrzTMc/C9Rq7EnJDMji0UFEXwWLX43CvH2o
	9rZf4BJVab9gUsQcEoaclz04joPNLQNdf/Dy37BnQxVXJ2ppMO3WsLt3Wl+UPhP7t2btTyrUU0D
	7AN7phSAbMiHZPgzuZ4x0A/xECvM7Bbv0lbI/Dxix145ml8t7NYCPgiYmtajZS3Gjj2MpMFv7sH
	m4bJEMKxjznUVZqNRwrNEiaKwZ0TS1T+dFApBxUYT7wAFSZMwm2bqg5HQj+d75pNZpGapmxycb8
	/7yUCrkJ7L84OBLDMu4KCmoWmrX8sixexfDWemC98f18YHSPlB9SM40guqJ7AytrvJmEj5Wochd
	sYxrFO14zyxQj3GQ7zrhkVtw1bJmYuFESPE6TlRq1SrRmXLYf4ro=
X-Google-Smtp-Source: AGHT+IFVpFjBHrctVDYjHE+F6TdKIXGss0sRzyOkhcom3zASxefelFiRYi033ygHlZRBwkdT2/FjCw==
X-Received: by 2002:a05:600c:5492:b0:453:6ca:16b1 with SMTP id 5b1f17b1804b1-45381af1eaemr38526225e9.26.1750881693018;
        Wed, 25 Jun 2025 13:01:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f1c1:2228:ff4c:9514? ([2001:8b0:aba:5f3c:f1c1:2228:ff4c:9514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823ad0fesm29642245e9.25.2025.06.25.13.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 13:01:31 -0700 (PDT)
Message-ID: <263ec88ce93f876a07a6cd121294fc90fc990ad4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 8/8] psmisc: fix runtime version when using
 git shallow tarball
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yi Zhao <yi.zhao@windriver.com>, openembedded-core@lists.openembedded.org
Date: Wed, 25 Jun 2025 21:01:30 +0100
In-Reply-To: <184C5E7CE538E8EF.24592@lists.openembedded.org>
References: <20250624104155.559827-1-yi.zhao@windriver.com>
		 <20250624104155.559827-9-yi.zhao@windriver.com>
		 <47b30bbd84054b6ff891f6d7e74d582c9374f7fe.camel@linuxfoundation.org>
		 <515c93ba-5b3d-4007-a4a6-a5dffc1df668@windriver.com>
	 <184C5E7CE538E8EF.24592@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 20:01:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219332

On Wed, 2025-06-25 at 20:04 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Wed, 2025-06-25 at 18:22 +0800, Yi Zhao wrote:
> >=20
> > On 6/25/25 16:19, Richard Purdie wrote:
> > > On Tue, 2025-06-24 at 18:41 +0800, Yi Zhao via
> > > lists.openembedded.org wrote:
> > > > The runtime version of psmisc is generated by 'git describe'
> > > > command in
> > > > misc/git-version-gen. But when using git shallow tarball,
> > > > git-version-gen can not get the correct version due to missing
> > > > git
> > > > tag/commit messages. This actually breaks reproducibility,
> > > > since
> > > > the
> > > > generated binaries should be consistent regardless of the
> > > > source
> > > > code
> > > > packaging format.
> > > >=20
> > > > Add a .tarball-version file in source directory. Then get-
> > > > version-gen
> > > > can determine the version through this file instead of 'git
> > > > describe'
> > > > command.
> > > >=20
> > > > Before the fix:
> > > > root@intel-x86-64:~# pslog -V
> > > > pslog (PSmisc) UNKNOWN
> > > >=20
> > > > After the fix:
> > > > root@intel-x86-64:~# pslog=C2=A0 -V
> > > > pslog (PSmisc) 23.7
> > > >=20
> > > > Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> > > > ---
> > > > =C2=A0=C2=A0meta/recipes-extended/psmisc/psmisc_23.7.bb | 1 +
> > > > =C2=A0=C2=A01 file changed, 1 insertion(+)
> > > Does adding the tag parameter to the url fix this?
> >=20
> > I have tested it. But it doesn't work.
>=20
> I was curious why not and I had a look myself. The trouble is that
> the
> way the shallow cloning works, it squashes out references so "v23.7"
> becomes just that, not "refs/tags/v23.7".
>=20
> I'm not 100% convinced the fetcher is doing the right thing here. If
> we
> could convince the fetcher to preserve the refs/tags piece, then this
> probably would work...
>=20
> At the very least I wanted to document why it didn't work.
>=20
> After writing this, I did dig a bit further. If I change the fetcher
> like this:
>=20
> diff --git a/bitbake/lib/bb/fetch2/git.py
> b/bitbake/lib/bb/fetch2/git.py
> index 0af8070080b..e7b030998c0 100644
> --- a/bitbake/lib/bb/fetch2/git.py
> +++ b/bitbake/lib/bb/fetch2/git.py
> @@ -634,7 +634,7 @@ class Git(FetchMethod):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
all_refs.append(line.split()[-1])
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 extra_refs =3D []
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if 'tag' in ud.parm:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 extra=
_refs.append(ud.parm['tag'])
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 extra=
_refs.append("refs/tags/" + ud.parm['tag'])
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for r in ud.shallow_extr=
a_refs:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if not ud.bareclone:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 r =3D r.replace('refs/heads/', 'refs/remotes/origi=
n/')
>=20
>=20
> it does work. Perhaps we should do that.

I've sent a couple of patches doing this, and adding the tag to the
shallow tarball name so we can add tags to recipes without complaints
and migrate to the new layout without issue.

Cheers,

Richard

