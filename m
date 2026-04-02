Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CDBAD39416
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 11:20:12 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13393.1775128802559626382
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 04:20:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=TBi+misd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so7339775e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 04:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775128801; x=1775733601; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0hyUy10chaPrn3kCq9hJGsessMepWaQWXQl/UMLRXWY=;
        b=TBi+misdaCGSMs/XsLZ2sWWob9PaLjXau4s8A0LCfmT/Farsg9RG7e/Nb92WUCAFLK
         Qy+i6Yb3UpR+M0cGCY+9L407QZKvNI3CyedkPClYeI3Qxdk9MMm1R55zdFMxTLCGMVeV
         IIfxqqFS9nax0E8U06mFX0rG/y56EaC+8cmj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775128801; x=1775733601;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0hyUy10chaPrn3kCq9hJGsessMepWaQWXQl/UMLRXWY=;
        b=pOsOMQH5mdkxDw3XQmKCNxbNhHsbuh1Vjf8jTxzzdKsopISPMtFSfuqYU/GMhdFAGj
         dPD+fh2alcgbaC9ChLCLmicemPpFOvJxzSAWAWAkPqQBsrjsZ0tD2WA6khp+UBWvnEzZ
         NrOUCtbwoTRm1ttN1gbg1O7vi99W3+i2BMFVGQH8UzlqdknuxUP9V4+Jtflvx8j78Igh
         zpjBAxvd+Pe4oyK7vtbLqrJtgr7osGBpKBkUb3d3uWmBvEV6S2bO1Ju5qKWDrmSgIPQa
         mnCVmiCnxIm1r5/oJjeXow3S4jCbZhV45rz2/DIERawHYUECG444Wi5eNDsMoouAhmbZ
         7NHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIOpL+0XUyLOIJqxj/idaTZSP970k87amgUZ6CElxq0+DhMLO/sbIeNpKVTAHif3X5BfROwbWwHYp/cdzwJVMNfg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxF5iUFuqUybvEhIuhTYzfWsUiHsSohUbWC261yFZoCQGnfBUs7
	xxyTyFLGmJxbbZaau5r69kc3z3b08/wD11SV61aNwy8sHJ++D6nXMKYgKGRe4qNtjJ4=
X-Gm-Gg: ATEYQzycbaTlskin+LFFn5XWsXK/oEMrLN5sllMvjH/GvEHAIGtwjxb4l56BU1Cnhsy
	ANQHm3RxWS1JTadDZG2i5nlW3SvWRFiAbB2VBuF1UOH42B54EgcgneDCFCZh5SzMeEJBF2hwtm7
	R8qvirvS8Kdnyl7jK4xM6zutGTUgzuGfpZIccM9/GVWCVri8+v1Sy2ejGyTBPmR61/RD3fVGDYg
	jKYptYtmZp8jdRv38D/SYMspyxq1ojHwyU9f6fhk7dNseGGvihTzdHjTHjX4r5oG9WPYIbi7w27
	7e/k3Zer55qj1/a5owItAzIc01SVO/FeKqCMs1jqTJTJrTRnf7n6eAB8D+H2EJyEpJvOCXNFEw4
	I5yhMy1lGrIxQ5qaSu3t74JG2OY2cByC3ZhnMGkgONiDeAyzkANuTR36giGATASsRDaWW9qT6yD
	8Nid0e+owWB3lrWPp2iH64B8RI1ENuEaCh94A6BRp2GoSXF8u1cqb3IlXaKVJ9rO8+8ZSnQry44
	l3FnBEwijHqbzCM
X-Received: by 2002:a05:600c:3f14:b0:486:fb69:4960 with SMTP id 5b1f17b1804b1-4888359d919mr128983465e9.19.1775128800852;
        Thu, 02 Apr 2026 04:20:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a695:b092:8c54:d70f? ([2001:8b0:aba:5f3c:a695:b092:8c54:d70f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887ad3fb99sm64994965e9.6.2026.04.02.04.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:20:00 -0700 (PDT)
Message-ID: <f916880345502a4a53c88d5e27d2c96378845f7e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] uki.bbclass: handle undefined
 KERNEL_DEVICETREE variable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: pavel@loebl.cz, openembedded-core@lists.openembedded.org
Cc: Michelle Lin <michelle.linto91@gmail.com>, Mikko Rapeli
	 <mikko.rapeli@linaro.org>
Date: Thu, 02 Apr 2026 12:19:59 +0100
In-Reply-To: <20260402105450.2672139-1-pavel@loebl.cz>
References: <20260402105450.2672139-1-pavel@loebl.cz>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 11:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234517

On Thu, 2026-04-02 at 12:54 +0200, Pavel L=C3=B6bl via lists.openembedded.o=
rg wrote:
> When kernel DTB is provided by firmware, KERNEL_DEVICETREE can be
> undefined. This the case when U-Boot provides the devicetree (compiled
> from it's own sources) via EFI configuration table.
>=20
> Currently this case results in following error:
>=20
> =C2=A0=C2=A0=C2=A0 do_uki: ERROR: cannot find
> ...build/tmp/deploy/images/machine/${KERNEL_DEVICETREE}
>=20
> Therefore handle undefined variable as empty to skip DTB inclusion.
>=20
> Signed-off-by: Pavel L=C3=B6bl <pavel@loebl.cz>
> ---
> =C2=A0meta/classes-recipe/uki.bbclass | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/uki.bbclass b/meta/classes-recipe/uki.bb=
class
> index 326697a06660..d16f3c95561e 100644
> --- a/meta/classes-recipe/uki.bbclass
> +++ b/meta/classes-recipe/uki.bbclass
> @@ -80,7 +80,7 @@ UKI_CONFIG_FILE ?=3D "${UNPACKDIR}/uki.conf"
> =C2=A0UKI_FILENAME ?=3D "uki.efi"
> =C2=A0UKI_KERNEL_FILENAME ?=3D "${KERNEL_IMAGETYPE}"
> =C2=A0UKI_CMDLINE ?=3D "rootwait root=3DLABEL=3Droot"
> -UKI_DEVICETREE ?=3D "${KERNEL_DEVICETREE}"
> +UKI_DEVICETREE ?=3D "${@d.getVar('KERNEL_DEVICETREE') or ''}"
> =C2=A0# secure boot keys and cert, needs sbsign-tools-native (meta-secure=
-core)
> =C2=A0#UKI_SB_KEY ?=3D ""
> =C2=A0#UKI_SB_CERT ?=3D ""

A fix just merged for this:

https://git.openembedded.org/openembedded-core/commit/?id=3Dc3ab994e4b1c1db=
5d967a93d5b3e999f26332f8a

Cheers,

Richard

