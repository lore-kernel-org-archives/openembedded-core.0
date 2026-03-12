Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 022F1105A59E
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 13:25:31 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21240.1773321928531505960
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 06:25:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=P0M4tdZ2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439ac15f35fso956827f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 06:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773321927; x=1773926727; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/GoO5rOTn8m/nC32m1o2SEhc6+UlFqoiWgYWhLtZgI=;
        b=P0M4tdZ2+RbmlIsVxHe3MLGMht366jqsBDGchV17wAMjo/16j/Fk0NSjKwFWo1CadI
         buYKeeojW1DpOQK6M6A9jo0WfG8/wQDpr1V8ENtkwTATIQAvsEuh0LfjAM9o4Mh89R/2
         aJBAypmd+rl05uGkCQDr5MwNgGiXoZL5y+n/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773321927; x=1773926727;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A/GoO5rOTn8m/nC32m1o2SEhc6+UlFqoiWgYWhLtZgI=;
        b=cRnWfOFcQ8DlMy3qjS4RNBv9F9NFoy0YVviCt7QRvMzbdq4116i31BryYZuAxDvSkc
         nwrh46xsaY5hmwwrNMedDFGf7T3UT38qO1kZ+UxGXiTly/kuZ9yX6o1vzqt89R1k0IkF
         c/cpjJXrM6BcIk6Qw5+6z/sXMBtpPxtQ40iU2WtDZqaJIees8zxyhXeuQhufh1++u19t
         6QgxOEGyo9js4VMEsGw/TtREdhZWVNFgCsGlyHuhiEfF7PrC0CtlzE5SfPSOUHzoiOne
         CZqPks7lWwj7OohwOelpTXNbCjEwQFoYVcYN1pN1GqBmgdDBCtz1s66QkENmYX18j2eN
         GA6w==
X-Forwarded-Encrypted: i=1; AJvYcCVJWz0gWM5pZrTAbK0hGJuF5yX/dUX2jhKxdwyZUZpDnexBsqL9xT1yUKsSet89+tzuH7NxXy7WV1jOvPA0pMRa9g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwRSRebyXII/Oo1VQl83nAM716oZFJ71ACMtpixO3LNkN0keq68
	BQcCqQrXcXt5bv5hgvpFDcl78d2WFl4EI0WGbWCe39E1ixIqiK2cvTb1XtDdnFc+0upp9TE4DFr
	txJf7kk4=
X-Gm-Gg: ATEYQzzQurKYF9N52xZGXvppUCYx4ANZSya4sIyxW3C8q3YnVAQM1UlDOkR4Xkyw4Ux
	a0L0/cW54IFkpNBNi7Ve5ob5aYSWWdO+7Ttu0bm3Px9TWaEJWQ6cOGSEjw6F3TacC9dAJwnm7um
	kLn7Cp490KQYcYlcWLSs10e4RlpkCBo+mXWN6kQFKz7HWifHzxubfmfQbuvYAK69Ztchbi7Jlgf
	4Rpvdl1jA4/FS1miFOXiM5aCleTdBNHTG0SMuPuOXawzNS2W955Ar1YaXS3hGa3s4Qut5SSSQt/
	sq/IUchAsoUovECx5qBz0GpV15PxJ1gytK2pFaJtnCjAHYAgqNNz1pFPdqOwWivknRAutRLVfgJ
	HaAlzcxmnyY7DDAtDrDukct0c88X4vkviP3MjMST6eYWIBLU+IijvVCCJaQR2NleTm337/9PAwE
	pb7NVW76NHOJ3ntZllzD1gJzquTSEtSVpHVxdC+qECqISjym427hGboBt4Y1k3N5bYNCFDWGpNP
	mK1rORRWYox
X-Received: by 2002:a05:6000:1846:b0:439:c1f9:f633 with SMTP id ffacd0b85a97d-439f8439091mr11673953f8f.45.1773321926804;
        Thu, 12 Mar 2026 06:25:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:215f:5162:d0b:8f1d? ([2001:8b0:aba:5f3c:215f:5162:d0b:8f1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20c0b4sm9402904f8f.25.2026.03.12.06.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:25:25 -0700 (PDT)
Message-ID: <99fa7f5500ba90479db4e20496b8683641bc571c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] webkitgtk: remove PACKAGECONFIG soup2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: changqing.li@windriver.com, openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2026 13:25:25 +0000
In-Reply-To: <20260312081506.970978-1-changqing.li@windriver.com>
References: <20260312081506.970978-1-changqing.li@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 13:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232952

On Thu, 2026-03-12 at 16:15 +0800, Changqing Li via lists.openembedded.org =
wrote:
> libsoup-2.4 already removed in commit [1], so remove the soup2
> PACKAGECONFIG, which may causes depeneds on libsoup-2.4
>=20
> [1] https://git.openembedded.org/openembedded-core/commit/?id=3D94ebc5b79=
8aed6eea642c5e2a4df24b386520636
> [2] https://webkitgtk.org/2025/10/07/webkitgtk-soup2-deprecation.html
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
> =C2=A0meta/recipes-sato/webkit/webkitgtk_2.50.4.bb | 3 +--
> =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.50.4.bb b/meta/recipes-=
sato/webkit/webkitgtk_2.50.4.bb
> index a1b0a72612..9891a5216d 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.50.4.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.50.4.bb
> @@ -73,8 +73,7 @@ PACKAGECONFIG[openjpeg] =3D "-DUSE_OPENJPEG=3DON,-DUSE_=
OPENJPEG=3DOFF,openjpeg"
> =C2=A0PACKAGECONFIG[systemd] =3D "-DUSE_SYSTEMD=3DON,-DUSE_SYSTEMD=3Doff,=
systemd"
> =C2=A0PACKAGECONFIG[reduce-size] =3D "-DCMAKE_BUILD_TYPE=3DMinSizeRel,-DC=
MAKE_BUILD_TYPE=3DRelease,,"
> =C2=A0PACKAGECONFIG[lcms] =3D "-DUSE_LCMS=3DON,-DUSE_LCMS=3DOFF,lcms"
> -PACKAGECONFIG[soup2] =3D "-DUSE_SOUP2=3DON,-DUSE_SOUP2=3DOFF,libsoup-2.4=
,,,soup3"
> -PACKAGECONFIG[soup3] =3D ",,libsoup,,,soup2"
> +PACKAGECONFIG[soup3] =3D ",,libsoup"
> =C2=A0PACKAGECONFIG[journald] =3D "-DENABLE_JOURNALD_LOG=3DON,-DENABLE_JO=
URNALD_LOG=3DOFF,systemd"
> =C2=A0PACKAGECONFIG[avif] =3D "-DUSE_AVIF_LOG=3DON,-DUSE_AVIF=3DOFF,libav=
if"
> =C2=A0PACKAGECONFIG[media-recorder] =3D "-DENABLE_MEDIA_RECORDER=3DON,-DE=
NABLE_MEDIA_RECORDER=3DOFF,gstreamer1.0-plugins-bad"

If you want to do that, you need to put -DUSE_SOUP2=3DOFF somewhere else
to ensure it stays turned off.

Cheers,

Richard

