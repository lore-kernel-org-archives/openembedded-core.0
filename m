Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A3510775FC
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 17:45:58 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20503.1773855956401711274
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Mar 2026 10:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dQJ3FnaU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b45bb7548so35304f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 10:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773855955; x=1774460755; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=etJUkVrylRfgBmB/a1qoI+NF0bzTk6KClr7Oj5kE1AE=;
        b=dQJ3FnaUZ/kAYvAs13Icmtvd6yLzA/5B1G3M/l8h3gqX7TgAaEgHo9HBAAxrjwUYAC
         td8Xw20ZdEPBgMEy/pR1e4/8u2Gw9Nx4roAGyrMbo2eU+N7VxpquGyoxzJNtbnFV4bUk
         RWx6rFrkyE8bvcbEH+3kX82Pq0U5Ot+p6ysPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773855955; x=1774460755;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=etJUkVrylRfgBmB/a1qoI+NF0bzTk6KClr7Oj5kE1AE=;
        b=GTNoulHIAXKxDhdsMSQYztcsmJh3jyFA8GZ7lUzen1kTpOQmtaz51IOhGlKdQOK0Yt
         X726aXADVoETPEoOIg3wLCVOr1M4jB6HzeXfPAjL4jVkI10b4GsGVmsO/W+f3mvMbeyF
         TaaIvv4F6A7vmJLncPK9wTGkCafgJZXJ2D18NZMi1u7ynFt2j14TRYB0xaqJ3nU0cJzb
         tyh5RGrICqxEOqHwQslQ755cHiaZhhZxOtFYDv8+qeFi2scckV4VFG2lYgssxcJ2YteO
         zSC+5oDK5NQQlGWSPALvsFxBNWzN0Mv43jh1JTmGLHYqRbRNaRowMDTE9I9FV719LguS
         4OHg==
X-Forwarded-Encrypted: i=1; AJvYcCWe8eR6Vmn7CeFUqAHTiCGAkhvrZpiRQ2xGShLmlsWOkg0xtX/huWDsnCXUJBgWfCJ3Ot52ZusZOCLXlaktAHY5/A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzJGVe+Pll8wmyaJLrFzBcWvPzumNx8H/LJEZFwK6ryUpKo0EDx
	YPcPdoTSu65BNUy9UaYxZ2okfg7nG73eIHs9Tt07VSNp/u9EruYqh1UtE975G3mRvt0=
X-Gm-Gg: ATEYQzxVuJYGn+scVwm1T9uRTPp5RjTvKx+FE2rRtZ/gkadQ7lfYzA6HJW8f+2bl38P
	gxpMiwUGQ8tzWipt+doaVtMdkbEtokrzlQzG7xiEw4w4Lq9if4TnuHVegUaFpbnt4O76uTRTqHo
	udbpFdulkROTUyBepmONiDWVI2wE44vESqZj2froeOceEr6b4GB9zE5qk/ybMMUSmbJWJxmRzam
	aqWe9ED4YGEVth2jIOASoG+MRg2zIjpvoJoVapitQuq/Y24Z5kWeXZQ9sUb9XECGo7/DVTB4pjs
	kwthzNh2X/vY+9a4anySut30WJeD7vj/s8+7WimkLqKOmgf0RwY3jIPEVEsFbZ5le+skE4aEe5T
	Q4lnYFucunJyZi6pMw61JxgoujK4UNfIybyVxaJC0Nd00kR7Kl4sMtIicN14+w7+WLnqs5DWOuP
	uEZvtP1SfxOZCYutt3v8B5+hF6yhd0ZrzHi8KcZ1zfqgttlXzhMHGS2jsTZKzDXxSs5kycn7SYP
	wWBThs7VC6H9Cw=
X-Received: by 2002:a05:6000:2010:b0:43b:3e34:7fe with SMTP id ffacd0b85a97d-43b527aaa5amr7202385f8f.21.1773855954532;
        Wed, 18 Mar 2026 10:45:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c5d8:efeb:ae8c:c686? ([2001:8b0:aba:5f3c:c5d8:efeb:ae8c:c686])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51892161sm9973484f8f.21.2026.03.18.10.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 10:45:53 -0700 (PDT)
Message-ID: <64a1484a196d4e9c603ec6dda598c6a8c4b91606.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH RFC 0/2] sbom-cve-check: Download CVE DB using
 BitBake fetcher
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: benjamin.robin@bootlin.com, openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, peter.marko@siemens.com, jpewhacker@gmail.com, 
	olivier.benjamin@bootlin.com, antonin.godard@bootlin.com, 
	mathieu.dubois-briand@bootlin.com, thomas.petazzoni@bootlin.com
Date: Wed, 18 Mar 2026 17:45:53 +0000
In-Reply-To: <20260309-add-sbom-cve-check-p2b-v1-0-09165cddfcf1@bootlin.com>
References: <20260309-add-sbom-cve-check-p2b-v1-0-09165cddfcf1@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Mar 2026 17:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233433

Hi,

On Mon, 2026-03-09 at 12:57 +0100, Benjamin Robin via lists.openembedded.or=
g wrote:
> This series is an RFC and a follow-up to patch 6/6 ("Add class for
> post-build CVE analysis"), which was previously discussed [1].
> I have prepared two RFC series, this one and another, each exploring
> different approaches to handling the download of CVE databases.
>=20
> I explored using BitBake's internal fetcher instead of direct Git calls
> for fetching CVE databases. However, I encountered two major issues:
>=20
> - No proper shallow clone support: I wanted to clone the repository
> =C2=A0 without downloading the entire history (which is very large). Whil=
e
> =C2=A0 `BB_GIT_SHALLOW` exists, it creates multiple tarballs in the downl=
oad
> =C2=A0 directory, which is inefficient for updates.
>=20
> =C2=A0 In this series, we are going to do a full clone of the git reposit=
ory,
> =C2=A0 so this point is not going to be fixed.
>=20
> - Performance overhead for CVE databases deployment: The recipes
> =C2=A0 downloading CVE databases must copy them to the sysroot or to the
> =C2=A0 deploy directory. This requires copying the extracted databases
> =C2=A0 multiple times, even with hard links, which is slow due to the
> =C2=A0 combined size (~6 GB, ~672,000 small files).
>=20
> =C2=A0 In this series, we are using a custom deploy task that is going to
> =C2=A0 copy the git repository using rsync directly in the final deploy
> =C2=A0 directory, by-passing all the Bitbake logic.
>=20
> Additionally, there's no built-in way to control the interval between
> CVE database fetches: In this series, we are going to use AUTOREV,
> which imply to query the git repositories for each build, to check if
> there is a new git revision.
>=20
> Moreover, this series ensures that the CVE analysis runs only when
> the original SBOM changes or when the CVE databases are updated.
>=20
> Upon revisiting the class and its associated recipes, I identified
> several areas for improvement, which were fixed in the first commit.
> This series also includes a second commit making the VEX class optional
> rather than mandatory.
>=20
> [1] https://lore.kernel.org/all/20260226-add-sbom-cve-check-v3-0-2e60423f=
4d35@bootlin.com/

I've just been trying to work out where we're at with this coming up to
release and we need to get this resolved.

I feel quite strongly that we need to use the fetcher for obtaining
this data. "fetching" isn't trivial and is full of
license/auditing/sbom issues. Making any exception to that, even for
cve data tends to become problematic later.

The existing approach was only done as it was a sqlite database and we
didn't have fetcher support for such a thing. If we need to improve the
git fetcher in some way to better support this use case (e.g. shallow
clone update efficiency), that is something we can work on.

As such, I was wondering if you had never versions of these patches?

I'd note that we can't set AUTOREV by default, we'll need to specify a
revision, and document how the user can enable AUTOREV in their config
(maybe even a config fragment?). Whilst it is annoying to do that, it
is a requirement that the system doesn't touch the network outside
mirrors unless configured to.

Cheers,

Richard









