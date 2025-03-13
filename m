Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E89BC282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 11:15:30 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.12058.1741864524744382665
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 04:15:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fyH8JupD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-390e3b3d3f4so471810f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 04:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1741864523; x=1742469323; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+MpL0GFPDZPkMWFdn+ySGRc9lbjRKllrLWKRfHr9z0U=;
        b=fyH8JupDhbSnAml0Stlu9/y9INmbpFTmKRbgUPXRNexXupGZHI7zRwYyHFAxI9dnPm
         5QsTWJgM5wXcBlFsB2K1wrib/t0sCXM/CTb0TYMf0uUibUw1Jf2fUhHl366n4P9J0ncA
         8Te1riYCTDyceHRWawAr+KMKGPKHdwyTgEPGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741864523; x=1742469323;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+MpL0GFPDZPkMWFdn+ySGRc9lbjRKllrLWKRfHr9z0U=;
        b=vygaqOWj6JR8Ddzcx0SYROUbZ2wXe5zoQ2KanidIH5EqFYxxLqK6+rk82+Kc4EhNem
         fRsRGgqAbLWCXdJwfMc2xiNA2D/TKAZGDU4DtxKsBlkzK4bKTHtbn1ylWlo128xwJF34
         SUfsf9mzzUQODVxjDJOLvozh2yhfM90Uwwhe21rbv8yn1KPFmGV7nPJ8+QGs0CwKq1I7
         XSgywZjmvM2VQfwmS9Aj2xJ5bCv9hE+WX6Gl2tmQJ5Ey7IiOGNyViqw9w9jZ54djRzUj
         MvfGURSJR1/3nIL4Uf7C5MphxjCa/hF5aDSTZYkmmR6t+IshTgP1Kovtm9M7Ryk89ecF
         Zk+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUehu58VNafoRGC0cnB25IX/XdKB7TOLts12PbqqO1AxtA9rA6w1lz01cUHtR4teXFjM3Os9aI0kt9ULJ/OzrCFNQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YygXc8L3GwlLFxsIVahau+s4ZsRelra9eMI4IFQtrPmXqiNvjRX
	lgJmLGYlWxKPU8bG2E8B9EySvY1RXdZk61ElTHjavSIBUuBqaa3INoZYztxr2tY=
X-Gm-Gg: ASbGncs3OXvSlRIh4uKUenAOb6KyOdVSe1cEdxfRnqjEELiJ5m/PDGC5PPDKSZJVDae
	PJKGN+fI8hQSxmCna/jZ/r+uIyMZ/FxAfx607eVKt+QgEVBVEkIkBhWAA9D3DSkNp166QIp4OMD
	X+KXG6FwokXIXhPnfL/8MK/rxgZwEv6mxlhMFDO1utCJHYZrmUyTO62I0sG3q6NAhBXkij+oA5x
	AGghFEc4xwpKLtaDSnaV3ZIxB55snUbINQORb5/lnZo7VvMv6wTe0TyFDOSpPfj3lKPpndbtHLS
	Z1Ic7MHwyL42Ix9HOejX3zAXUF1r8aQ0bxY8+WmbYm+wlWn2tzEhTvWJ1F9nRaONOtRRVbm1gja
	lGgQODTV4xrhsG6jxs6ploHgyAAum2zOXSA==
X-Google-Smtp-Source: AGHT+IHXv+Mx7gYTVumRJ7t4PbPCvXzZMIvoqIIG1YCFj31Q5GWLViAtMY91GcInlgmAUTcRBwpNLg==
X-Received: by 2002:a05:6000:144e:b0:391:4bfd:6de with SMTP id ffacd0b85a97d-3914bfd0841mr14145431f8f.46.1741864523069;
        Thu, 13 Mar 2025 04:15:23 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cc37:5f80:1a41:4bc8? ([2001:8b0:aba:5f3c:cc37:5f80:1a41:4bc8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c8e43244sm1821657f8f.60.2025.03.13.04.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:15:22 -0700 (PDT)
Message-ID: <6f58e530f2e52d06b1d2354470d2f075d3b73e79.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] scripts/install-buildtools: add an option
 to preserve downloads
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Thu, 13 Mar 2025 11:15:21 +0000
In-Reply-To: <20250311104152.393470-1-alex.kanavin@gmail.com>
References: <20250311104152.393470-1-alex.kanavin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 11:15:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212764

On Tue, 2025-03-11 at 11:41 +0100, Alexander Kanavin via lists.openembedded=
.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
>=20
> By default the script puts everything it downloads into a temporary
> directory and erases it after unpacking and installing the buildtools.
>=20
> This isn't great for traceability and reproducibility of builds
> (being able to see what was downloaded exactly, and being able
> to reproduce setting up a build, especially if the buildtools
> download location isn't available for whatever reason).
>=20
> This commit adds an option to download items into a specified directory
> and keep them there. I would particularly like to use it
> with bitbake-setup, where an optional script to install the buildtools
> would ensure the tarball remains available on local disk.
>=20
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
> =C2=A0scripts/install-buildtools | 12 ++++++++----
> =C2=A01 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/scripts/install-buildtools b/scripts/install-buildtools
> index 639ebb12d78..1a68aad53e7 100755
> --- a/scripts/install-buildtools
> +++ b/scripts/install-buildtools
> @@ -142,6 +142,9 @@ def main():
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
fault=3DDEFAULT_INSTALL_DIR,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 he=
lp=3D'directory where buildtools SDK will be installed (optional)',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ac=
tion=3D'store')
> +=C2=A0=C2=A0=C2=A0 parser.add_argument('--keep-downloads-directory',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help=3D'=
use this directory for tarball/checksum downloads and do not erase them (de=
fault is a temporary directory which is deleted after unpacking and install=
ing the buildtools)',
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 action=
=3D'store')
> =C2=A0=C2=A0=C2=A0=C2=A0 parser.add_argument('-r', '--release',
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
fault=3DDEFAULT_RELEASE,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 he=
lp=3D'Yocto Project release string for SDK which will be '

I think this option should be renamed to simply "--downloads-
directory". The "keep" element made me think it was a boolean value
which when you read the code/description, it is not, it specifies a
download directory to use. I appreciate how you came to that naming in
the way it changes the code behaviour but I don't think users reading
the help text will understand it.

Cheers,

Richard




