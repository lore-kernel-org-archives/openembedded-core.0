Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EB5110FC456
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 21:58:17 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.118186.1775685487513908998
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2026 14:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M1zoqLZg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488ba840146so1653655e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 14:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775685486; x=1776290286; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5wRE6LE+poB1gQzWtD8yvrdLkYThfJCUllA50KWLeSs=;
        b=M1zoqLZgbtJUx4KE1DxlOgUWj9Op8NlWTCgAevVJFf8TzQj5cy6Nv6h9izgtayYIPW
         Q3rrD9v9Mrq0Rtb+quwBtkUPM1vQajfiO4fFEyDUMvILhVYkpCjXloyhvqiMSOQSZpSP
         bKRa+F2IigVvtx+ZDRuPt/POTd7/rG0QZKG40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775685486; x=1776290286;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5wRE6LE+poB1gQzWtD8yvrdLkYThfJCUllA50KWLeSs=;
        b=FstiZ7R8QFlwrXHfaiGBq1HZJZ+FsPuovDRq4ue6TB4/tzy5pX66bsAGAM+n+sm3N8
         1Xuo7PeHLLtTWAfiKepZ53SO6ePa29nme6MPNmZnYuvj8W7X+sUwE/dRaQxlF6z2q/TS
         Jlxa9E4RZkZF+ftwgAFhdrGMaoLZg7POjGXp8VHIuDFqLO+slMfZcq2OsV9jWZhKZbqe
         rwNexMAuf47ptnX2z4oXdaKjEIni1fITCytswShSFqSeTCdhXQoSdmOiLVhErukYDL7W
         yrQZP5KWJDi0STjN3xUoesp/7e4mAIP7XDo8eEMuUjtkOEyj1JNUW+H6lLukVbVcMwiY
         EKGQ==
X-Gm-Message-State: AOJu0YxpMX88N/a68GBsbHQJbF6OgWhWfl84x/EY/tzDe22IhLpXTTN1
	2gWD7Vrdz4jcEWTLnQx3bc4aazpzCneW7y0ixxCJEyq/W4ZYOrU9I7I27EYGpSVJuyQ=
X-Gm-Gg: AeBDietEOfrD6Q3gey9BApxp7MkERC/bH7udwaGxVVlJ+wyXJB0+y+UVungaAQC+p2W
	yZX0A+6EB+2llZ76bOxFWKI0tyPx0MxhzJBGwhicwN+eWjUhDS1j0YnPgleYOhE9UsalJoA20+S
	ti4umzLWYUW9yst1O2PUlURSUv7LjvEhy3MvI09bjQakA9H292t5F2xS/BF00lnQb9kZ7W4SSPg
	Sp1k0VRrQAMuI/qOExVFESzrIGzvnc93Fzd3BL+5k1zRXuKb4JIiSWs8izbdA8Ky8itydBSJXT7
	PT3BHsFotVtfyHCSXhtIcRY71DOAbKXj8ylSUgqFiSd+dG5haBOxBYbsLYoZ9VvRYVRY4J2AW9b
	VSMhLP4ithfCZYdsN3VID2gWdhSIgjyBkEsMpHugeozOJww0Z5PZZ1NILnb+xAciNZoah8nOlsY
	IVaCn49AMprbSo+y4CPjLw9yI9RMsLanP72HKUr0Xk8nLQV4EMUezfErvojgSAPq9Lhog0ohpiP
	BzyT2qj69tFBCHerJuie/8V
X-Received: by 2002:a05:600c:4510:b0:488:c530:48a0 with SMTP id 5b1f17b1804b1-488ccfeb72amr17401455e9.24.1775685485864;
        Wed, 08 Apr 2026 14:58:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:530:d4f8:22df:8c0d? ([2001:8b0:aba:5f3c:530:d4f8:22df:8c0d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm63320588f8f.0.2026.04.08.14.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 14:58:05 -0700 (PDT)
Message-ID: <ed0e1e8c378031b3ef0155e0afb3f75feacac243.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH] systemd: fix unmerged-bin tainted message
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rs@ti.com, ross.burton@arm.com, mathieu.dubois-briand@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 08 Apr 2026 22:58:04 +0100
In-Reply-To: <20260408195024.1874335-2-rs@ti.com>
References: <20260408195024.1874335-2-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2026 21:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234868

On Wed, 2026-04-08 at 14:50 -0500, Randolph Sapp via lists.openembedded.org=
 wrote:
> From: Randolph Sapp <rs@ti.com>
>=20
> Systemd prefers both /bin and /sbin to link to /usr/bin. If this is not
> the case it reports that the system is tainted in systemctl status.
>=20
> Add a link from /usr/sbin to /usr/bin to prevent anything from being
> excluded from the merged bin directory. This mimics the current merged
> bin directory structure of Arch Linux [1].
>=20
> Update the systemd recipe to prevent creating a duplicate link when
> sbinmerge is enabled.
>=20
> This check was added to systemd back in 2024 [2].
>=20
> [1] https://gitlab.archlinux.org/archlinux/packaging/packages/filesystem/=
-/blob/main/PKGBUILD
> [2] https://github.com/systemd/systemd/commit/844863c61e7b501097da84a1e4d=
1e4a6aa6d9f0d
>=20
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>=20
> I feel like this is overloading the "usrmerge" distro feature somewhat. O=
n the
> other hand, this parameter was added for systemd support, and systemd con=
siders
> all of this to result in an unmerged-bin warning. I figure it's kind of f=
ine.
>=20
> Open to opinions here, as we could also just add a "sbinmerge" distro fea=
ture.
> Then again, what would be the expected behavior when usrmerge is disabled=
? Would
> /usr/sbin just point to /usr/bin and /sbin to /bin then?

These are good questions. It feels like systemd is basically dictating
how the system should be laid out at this point and we may as well put
all this on the systemd distro feature as it is getting to the point
you can't use it without doing that :/.

It feels a bit like we should drop usrmerge too and just use systemd
there too since it doesn't have any seperate policy, it is just "do
what systemd says".

Cheers,

Richard

