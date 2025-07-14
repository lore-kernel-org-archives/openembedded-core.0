Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3DFC83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 12:08:52 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.76495.1752494925329839458
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 05:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LZSZef6A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4561a4a8bf2so9694585e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 05:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752494924; x=1753099724; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vc4D23jEgm2mXap7cnRiBAIg8WwbAYDhD37DS6gXOl8=;
        b=LZSZef6Aq5CMKL4TH5zxplbIXW81g8GI53qy//7BEaELEWnH/6tqPlUPSaQBw6yDi/
         NsJkq3L5EwPnFYE+r9GHgP80sw8nU/TYXeSaFY3ePbI/Lsq6TH1hwUVZpWKIfP1+O1sa
         kyVPxmsw9Lki1qS283f9DyLuP2jn5YNjfoLYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752494924; x=1753099724;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vc4D23jEgm2mXap7cnRiBAIg8WwbAYDhD37DS6gXOl8=;
        b=bd1gp9LEs0oCz1zGaMO4AsMuDvj/BjlOCLOWg8TT1vhBb+ke6IHFH1Xhn7+1VFqgWa
         zjeJoaEMK1kXAQb43kGM97gTa284sPi+B4NPOmDQZuq0jborj3aHAqiRjH9gmpKLQY3T
         ZknWQbF2ecyf/CtH16k3KCUz5p79QRxmObHHleVnKgwSS4LGHGdFnWFb3ZgTzOqPiIZS
         VLTifjuAQq90dT3tS2TokU9ug6fezsNFfDaTOiHH3Tm/CrqVy/1OoE9Tfo1YBL2MJraZ
         yLV46/Ku4o8uTZfD3tywow5xGIcv7y8KFZfMp68RkLihJ7VjTba9RhkVDWVceA1i3ZkI
         itiw==
X-Forwarded-Encrypted: i=1; AJvYcCUM0TS6nPoO1sFcBwSRX3xogc6XtkBVPO2VhpMMyvjGZPlOE4FJXXld1jGBiWu9Smyp9rmw9NmnltrQcdj6k0eAWQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzw5ZqDbKT8hNX0sRxzfv/YUYvzw46d1KRpYMSy3F1p8ZdzIaW9
	8TK/LWhop3QyXStn+bXGCVzu7XkUZ4eTXyifE2NLWYZEazWH0jqfIseZnzsh5yeVQzvH3fF/gYm
	GmF9c
X-Gm-Gg: ASbGncv+t9szHTRuxnvHVgZsJ7nQ1L/qJ9SaDn4/F13SXgHnENKWf2f9/cK/VB5npti
	obVObOezmFZV5+XRycgF2lsZJwacOdPpmaQDpepzsgPGcq12v0Ptxq0o0c5hFLCGbTYSKa6MDOU
	pppw82cwGn+5tci25opyAt1aXd/hMGWUZ3JchplqQCRaxgOPmowiEXzrRUNA2bwAKs2ld0/F8FU
	WZHrop0ERXOr3p4yh1EMacLYoLy1IRASsKrhXHEq3QAPF0gBCnLHzNkx8JLe5bkdS3QCEs4nXf9
	lIo6+DNjEJMXypuZrG95urEq3Vl44DJGudEvBMFOai0klskFqDiDKdax61RolJ05oQl6XlI0UsP
	Z0qGfKRekn84Xkcsj54xneAR8MOXjYpbLtbgo6VD/NqNUnsyqOn39dwabcMXVQm2+EL3GQV1iOK
	mSCH29for793U=
X-Google-Smtp-Source: AGHT+IE50m0rPIxEcW+Owa0Dh518WIVof0JdoRRqGG3o0Sqto9iyqwLs14j+kNsxuHSOeVYp6ZSb3Q==
X-Received: by 2002:a05:600c:3f0c:b0:456:dc0:7d4e with SMTP id 5b1f17b1804b1-4560dc08725mr66593055e9.18.1752494923615;
        Mon, 14 Jul 2025 05:08:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7cb4:487f:cc4e:53c1? ([2001:8b0:aba:5f3c:7cb4:487f:cc4e:53c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d50def1fsm168995015e9.21.2025.07.14.05.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 05:08:42 -0700 (PDT)
Message-ID: <8f8c45afad9226d215b4c37d13abd8d677e79755.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 4/5] testexport.bbclass: use image suffix
 in testexport tar ball name
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Mon, 14 Jul 2025 13:08:42 +0100
In-Reply-To: <20250702072516.1075450-4-mikko.rapeli@linaro.org>
References: <20250702072516.1075450-1-mikko.rapeli@linaro.org>
	 <20250702072516.1075450-4-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 12:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220226

On Wed, 2025-07-02 at 10:25 +0300, Mikko Rapeli via lists.openembedded.org =
wrote:
> testexport.tar.gz is image specific. Thus add same image name
> suffix to the tar ball name. For example genericarm64 machine
> core-image-minimal image tar ball changes name from
> testexport.tar.gz to testexport-core-image-minimal-genericarm64.tar.gz
>=20
> This way testexport from multiple images can exists in the same
> directory.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0meta/classes-recipe/testexport.bbclass | 8 ++++++--
> =C2=A01 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-recipe/testexport.bbclass b/meta/classes-recipe=
/testexport.bbclass
> index 843d777e3bb9..3005fc0dfa52 100644
> --- a/meta/classes-recipe/testexport.bbclass
> +++ b/meta/classes-recipe/testexport.bbclass
> @@ -136,8 +136,12 @@ def copy_needed_files(d, tc):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
if dir =3D=3D '__pycache__':
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 shutil.rmtree(os.path.join(subdir, dir))
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 image_basename =3D d.getVar('IMAGE_BASENAME')
> +=C2=A0=C2=A0=C2=A0 image_machine_suffix =3D d.getVar('IMAGE_MACHINE_SUFF=
IX')
> +
> =C2=A0=C2=A0=C2=A0=C2=A0 # Create tar file for common parts of testexport
> -=C2=A0=C2=A0=C2=A0 testexport_create_tarball(d, "testexport.tar.gz", d.g=
etVar("TEST_EXPORT_DIR"))
> +=C2=A0=C2=A0=C2=A0 testexport_create_tarball(d, "testexport-%s%s.tar.gz"=
 %
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (image_basename, image_machin=
e_suffix), d.getVar("TEST_EXPORT_DIR"))
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 # Copy packages needed for runtime testing
> =C2=A0=C2=A0=C2=A0=C2=A0 test_paths =3D get_runtime_paths(d)
> @@ -149,7 +153,7 @@ def copy_needed_files(d, tc):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export_pkg_dir =3D os.pa=
th.join(d.getVar("TEST_EXPORT_DIR"), "packages")
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe.path.copytree(test_pk=
g_dir, export_pkg_dir)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Create tar file for pa=
ckages needed by the DUT
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 testexport_create_tarball(d, =
"testexport_packages_%s.tar.gz" % d.getVar("MACHINE"), export_pkg_dir)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 testexport_create_tarball(d, =
"testexport_packages%s.tar.gz" % image_machine_suffix, export_pkg_dir)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 # Copy SDK
> =C2=A0=C2=A0=C2=A0=C2=A0 if d.getVar("TEST_EXPORT_SDK_ENABLED") =3D=3D "1=
":

Since most of the machine and image specific elements of this have been
removed, does it not make sense just to have one testexport tarball
generated by an external script?

The testdata json file is already exported separately.

I've held off this patch for that reason, making it machine specific
seems a backwards step?

Cheers,

Richard


