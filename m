Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12C43E77173
	for <webhook@archiver.kernel.org>; Sun,  8 Dec 2024 22:22:28 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.87992.1733696547149692218
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Dec 2024 14:22:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K/gPIkug;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385e06af753so1642264f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 14:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1733696545; x=1734301345; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAJa9uS1W/Ely1294QEQWtF5DYboZVmmCW9rki4GE3o=;
        b=K/gPIkugWjZoGmSRruQOHjmjYAc9fQHXNUtE6n1X8Yf9Lt8lgx4aY1XeSwpPI3BqLB
         xcOJzUB618yQPZ2sbelOaWKIBOdZ9HAxLLeoAB1xD9u79XYKgbQ89/8Kkn8tdujevYyL
         wG3uxymzcgfmpWcrsTS926Ye3jjpiFIw/WF1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733696545; x=1734301345;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iAJa9uS1W/Ely1294QEQWtF5DYboZVmmCW9rki4GE3o=;
        b=DallMhTz43DMKwtKf5de53rBodi1slGvYXt2dyz0hYMy4UJVYtdFeBiApvs7WTk4UI
         JqiVuW7HfohR0kK7+XJwxgNqwreYfkJYNseDi8j6GpPpRTIJIADH3rSrakHGSjXq9oF+
         SGR3ia3IhRBuFwovqNwboREwxobmcmexPbpIMj/4ifOfyDJb9y+NyV8c6/nn178eHo0w
         WgT8N0/VD315oHLdCj6Hhrfmp954iWSA0larxUq0nNoj0t3SMjvfmLFLwvglbZlAzS0r
         VBTmJqZowXp6FFN/y34PLUehbtifaEntSDhCULd/2ECs4aehUCOfVSOCiSre9cnqSy0g
         dQJg==
X-Forwarded-Encrypted: i=1; AJvYcCUeZ964JkX6IH6SeWtm5bDsEh1V6heVNGTcjt7hBhJUwXO+Fl7kjq/GYukaPAQcrsVT/OtqY1LHYgj1pOxHmAEX0g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzutAJOX9hO+VR0KeEIQqwTQJPlXiPWWZWea3T1JIUB0oYmEj7d
	BRbEChRElyzSM6NeuTIbXrzEMKKhd8MpLu7xASMZ5oW2CdYWwIyLCXPqOIXsa3c=
X-Gm-Gg: ASbGncv5z5mf1HnQXUIICKqxnVP3CRBEz1P5Vb9r3Qhkc/JNmQXuoKB92ksGU6v6y5Y
	b4nr0usMEzV6xlg7CGZ9O3yYXSvujDKEUQ7xkI4b5jB3NYUm8hRVjN/iSI6PdF4Zw7Ba5NPZYiu
	NCfOB4rha9UBiZP/zDTyPO3d3Dl4PsLd8SCl3sODQJ4WAb4ee0q0ZQskGVcqZm/6ZyWU1C/qNl1
	k4/PQRPjU0GwkRQoProCvV7/fioU1ZwYpRh/gQKlR94Iii+285i6qtwUxqQw7NEjTyo5G4cDlnI
	0hqpfcb3qdozsCbx/7yz5Q2Io6B/PqK6LeVyQoA=
X-Google-Smtp-Source: AGHT+IFmPmetw8NHp4QXhy/YYv6uEM3ZEnJhdPQSLVskBnC1lyK8IOER3g2E71dq6Lu2H+qLGdOnIQ==
X-Received: by 2002:a5d:64a3:0:b0:385:f249:c336 with SMTP id ffacd0b85a97d-3862b3e60e9mr8251372f8f.45.1733696545543;
        Sun, 08 Dec 2024 14:22:25 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:c1d1:82c8:bc8d:a69c? ([2001:8b0:aba:5f3c:c1d1:82c8:bc8d:a69c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386408549b9sm538012f8f.89.2024.12.08.14.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 14:22:24 -0800 (PST)
Message-ID: <f33814f998b09438feadedbab1ab04c536600496.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] Revert "uboot-sign: fix U-Boot binary with
 public key"
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: reatmon@ti.com, openembedded-core@lists.openembedded.org
Date: Sun, 08 Dec 2024 22:22:22 +0000
In-Reply-To: <20241206210917.31123-1-reatmon@ti.com>
References: <20241206210917.31123-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Dec 2024 22:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208469

On Fri, 2024-12-06 at 15:09 -0600, Ryan Eatmon via lists.openembedded.org w=
rote:
> This reverts commit 0d14e99aa18ee38293df63d585fafc270a4538be.
>=20
> The patch removed logic required for correct handling of
> UBOOT_SUFFIX=3Dimg or UBOOT_SUFFIX=3Drom.=C2=A0 We need to find a better =
way to
> handle the fix for [YOCTO #15649].
>=20
> Signed-off-by:=C2=A0 Ryan Eatmon <reatmon@ti.com>
> ---
> =C2=A0meta/classes-recipe/uboot-sign.bbclass | 8 +++++++-
> =C2=A01 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe=
/uboot-sign.bbclass
> index 7ee73b872a..a17be745ce 100644
> --- a/meta/classes-recipe/uboot-sign.bbclass
> +++ b/meta/classes-recipe/uboot-sign.bbclass
> @@ -122,7 +122,13 @@ concat_dtb() {
> =C2=A0	# If we're not using a signed u-boot fit, concatenate SPL w/o DTB =
& U-Boot DTB
> =C2=A0	# with public key (otherwise U-Boot will be packaged by uboot_fiti=
mage_assemble)
> =C2=A0	if [ "${SPL_SIGN_ENABLE}" !=3D "1" ] ; then
> -		if [ -e "${UBOOT_NODTB_BINARY}" -a -e "${UBOOT_DTB_BINARY}" ]; then
> +		if [ "x${UBOOT_SUFFIX}" =3D "ximg" -o "x${UBOOT_SUFFIX}" =3D "xrom" ] =
&& \
> +			[ -e "${UBOOT_DTB_BINARY}" ]; then
> +			oe_runmake EXT_DTB=3D"${UBOOT_DTB_SIGNED}" ${UBOOT_MAKE_TARGET}
> +			if [ -n "${binary}" ]; then
> +				cp ${binary} ${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
> +			fi
> +		elif [ -e "${UBOOT_NODTB_BINARY}" -a -e "${UBOOT_DTB_BINARY}" ]; then
> =C2=A0			if [ -n "${binary}" ]; then
> =C2=A0				cat ${UBOOT_NODTB_BINARY} ${UBOOT_DTB_SIGNED} | tee ${binary} >=
 \
> =C2=A0					${UBOOT_BINARYNAME}-${type}.${UBOOT_SUFFIX}
>=20

I'm in two minds about whether to take this or not. The code is clearly
needed for some platforms however the selftests don't cover it and I
doubt it is documented either :/

If I take this, can we add in some better testing please?

Cheers,

Richard


