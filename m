Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA0EA105A590
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 11:55:59 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19748.1773316551273483762
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 04:55:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AQy3RTpp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4853c3c2fe7so4867505e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 04:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773316550; x=1773921350; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxyEQcKzTMbIupT8NYEIoKF8RN3eKs+QGY1KDH9naSA=;
        b=AQy3RTppTkqno9LmzQopSQC9E7wdmCBEtM1gJLuwIm4HaYRoaeYYPLx+cLV1WIGI2z
         Af6Id/Lwbd4Pi2bb4YA/b//sLLodD1zARKRYlRDWO6AnedrKPSC47R7F6lDQQNdeG48j
         kDCFZBG/44+rbO2GiBoljoBAdxUGoxLebSPB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773316550; x=1773921350;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jxyEQcKzTMbIupT8NYEIoKF8RN3eKs+QGY1KDH9naSA=;
        b=cdz6ZYpaPmFSocwpS5nobenwfTcGuyHsKYZedYrXM8o/bC8gF9JNZEW8H0wUHwjLKn
         xcxk89VVm8GpuA177eUJF6d/XhuDwuYmYniZySNDB5B+EFClITA2J0gV70d8Q1qnLpM5
         Hce3qrZxe06mSE7AWhaCZOKh5oaVR8kb9p5j5SCFYXtnkxXFYkib545626sXAVN+vlZA
         PoqTpfc6zOdX6riWyMHXTXXEaFqMIJIcz5cBgTd4uvmIzs0UCpc+7vwxKDZhkfxna5hk
         JsZcr6xfaCaBcobxwMXihKV9IZ27R7QsklTgXopguxNv/+y/tuYfyEQf74gDT/HI5h9V
         +8iA==
X-Forwarded-Encrypted: i=1; AJvYcCUeNewmOVgeR4HmJyYMbH1ulGMPVLib+A1yXZ2EMrpVo1FdMVxrvjwzz9O8Z3mhPETpHxVUGumYY2ZQhuknga+BgA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz6ePjoFmJ1a+iXy8TaaI5TiTjNHzitjcwI4+XJLwnWAz3Js5FN
	2Iz6UBERhqWvJuzoTTyqPnEpiv680DrQh8rGU+l1dTerWY27vUBKvLoptzNEjjtwkAU=
X-Gm-Gg: ATEYQzyjacodgWAyrYXBbKxtAzuE/Yrw+kiYPpqU0LE2iVEx44MJReSnrzTI5heDPj8
	tYTrukLxzm0oUKQ9PMar2xUlLluyl+b9cPvPOlo5l+V7v/kBtvLEDxdJHngnCAn6EsiL2ICdTTM
	4slo60SXYrEhEGT0EhgIOCB6TUb/FHJEBMkDIeSX71PI0xKZF2rm2B/Zx3D8hYuXF4BLIc+u09O
	1pdW1guaeAmLm2o3Y5y808Tz15SXv9MuS5EC43lj/DK5M5hOWqXbYkSsUnPhHAvv89xDAhu0HbC
	7Wj9FnBABITA/HrEKd1CQUAIbg8Jfmgp9VJf9hMxVFth+sxk1DV5yGFq/vrieLX4yCSPUCj8QCy
	g9ZJ1qUBwjvEGbYF5yKlyY95wpDSJk1glsl9j0BthvaFtzMNvCLbqNE6q2pY8HUucKO6uKZonT/
	BY+HewFBUxwK/ilwx2g8gwcCNq+Uk1CUWvLqMZ3NZxJlujg9MZ78xoH+aG4ZuScV4mHJOmleeLJ
	mJkyxKLaT4w
X-Received: by 2002:a05:600c:c4a2:b0:485:4371:539a with SMTP id 5b1f17b1804b1-4854b134965mr105453715e9.31.1773316549567;
        Thu, 12 Mar 2026 04:55:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:215f:5162:d0b:8f1d? ([2001:8b0:aba:5f3c:215f:5162:d0b:8f1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0dc76csm45044855e9.24.2026.03.12.04.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 04:55:49 -0700 (PDT)
Message-ID: <68df2a5e4d34f553e5e1c4e6ebaa95cf1e75d462.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v6 09/15] spdx30: Skip install package CVE
 information
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: JPEWhacker@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 12 Mar 2026 11:55:48 +0000
In-Reply-To: <20260310184058.533343-10-JPEWhacker@gmail.com>
References: <20260304164835.3072507-1-JPEWhacker@gmail.com>
	 <20260310184058.533343-1-JPEWhacker@gmail.com>
	 <20260310184058.533343-10-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 11:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232944

On Tue, 2026-03-10 at 12:38 -0600, Joshua Watt via lists.openembedded.org w=
rote:
> Skips adding the install package CVE information by default. This
> information grows exponentially, since it ends up be N_CVES *
> N_PACKAGES. The CVE information for a given installed package can be
> determined by following the "generates" link between the install package
> and the recipe and looking at the CVE information for the recipe,
> meaning that the CVE information is only included once in the SPDX
> document.
>=20
> If users still need the legacy method of including CVE information for
> each package, then then can set SPDX_PACKAGE_INCLUDE_VEX =3D "1"
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
> =C2=A0meta/classes/create-spdx-3.0.bbclass | 11 ++++++++
> =C2=A0meta/lib/oe/spdx30_tasks.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 39 ++++++++++++++--------------
> =C2=A0meta/lib/oeqa/selftest/cases/spdx.py | 12 +++++++++
> =C2=A03 files changed, 43 insertions(+), 19 deletions(-)
>=20
> diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-s=
pdx-3.0.bbclass
> index c3ea95b8bc..88b7ef9f42 100644
> --- a/meta/classes/create-spdx-3.0.bbclass
> +++ b/meta/classes/create-spdx-3.0.bbclass
> @@ -45,6 +45,17 @@ SPDX_INCLUDE_VEX[doc] =3D "Controls what VEX informati=
on is in the output. Set to
> =C2=A0=C2=A0=C2=A0=C2=A0 including those already fixed upstream (warning:=
 This can be large and \
> =C2=A0=C2=A0=C2=A0=C2=A0 slow)."
> =C2=A0
> +SPDX_PACKAGE_INCLUDE_VEX ?=3D "0"
> +SPDX_PACKAGE_INCLUDE_VEX[doc] =3D "Link VEX information to the binary pa=
ckage outputs. \
> +=C2=A0=C2=A0=C2=A0 Normally, VEX information is only linked to the commo=
n recipe that `generates` the \
> +=C2=A0=C2=A0=C2=A0 binary packages, but setting this to '1' will cause i=
t to also be linked into the \
> +=C2=A0=C2=A0=C2=A0 generated binary packages. This is off by default bec=
ause linking the VEX data to \
> +=C2=A0=C2=A0=C2=A0 each package causes the SPDX output to grow very larg=
e, and the same information \
> +=C2=A0=C2=A0=C2=A0 can be determined by following the `generates` relati=
onship back to the recipe. \
> +=C2=A0=C2=A0=C2=A0 Before recipe packages were introduced, this was the =
only way VEX data was \
> +=C2=A0=C2=A0=C2=A0 expressed; you may need to enable this if your downst=
ream tools do not \
> +=C2=A0=C2=A0=C2=A0 understand how to trace back to the recipe to find VE=
X information."

To me, removing this duplication and keeping the SPDX docs usable seems
like a very sensible thing to do. Do we want/need to make it
configurable?

I appreciate some tools/usage may need fixing to work with this but
adding configuration options like this makes it harder to use our code
and also adds maintenance/testing overhead.

I think I'm very much in favour of just changing and generating things
like this unconditionally and if someone needs to work with it
differently, they can post process the output.

This goes back to my concern about the complexity of the code and
configuration, I think we need to simplify and present fewer options to
the user...

Cheers,

Richard

