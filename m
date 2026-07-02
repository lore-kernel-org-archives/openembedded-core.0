Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739E4C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 09:31:09 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65067.1782984665173450681
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jul 2026 02:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lN/kjRpW;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so10864635e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 02:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782984663; x=1783589463; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UsNSPCShi72AgEQD9i/285LvW7h00gYTDI8ut4A2KPo=;
        b=lN/kjRpWveuFh1ie0BOzv+CqRegFcnnpWjnSF2xVq9SHCxpEfmH3xL2BPZxAfWgt2r
         4E3fvQ9FYms0spNpRjNTByFPc5kPZI2ZFORdoU3T6AkbjQgxB6AMQLlOunNHid2cjOtC
         2akD7aFzgmm4/m8ES6sd6up3iXDeaCoG3OweuyEX9LE/WjJSICFWF/wwS2GxgEtxx4ig
         83VwLD9MF34DRFhUkD1/hvBp5brtIiNEkY7pCLllyFJi1k/fGY2q+cyrlUBLJqQlGiwa
         X46nbujwexOoT6ozjf5iVdv6cEyrSm8fGZ4ztYK5IXgDpws4t0BABO17J9G4IXz8K0bf
         VC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984663; x=1783589463;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UsNSPCShi72AgEQD9i/285LvW7h00gYTDI8ut4A2KPo=;
        b=EZC/9NagdJ5Yewi7YG/Uob+UwpssO6nr8y+A2kz1j5vaw2qhPsJkO5rI2TcLhBPaYH
         KWz92PcEJuGoqUbVmZRv4Atogt3PructZZ2LNLCWTbt+Ld4Gv4X6N/oo49NUTx+MJkTD
         bDgRyJRvrRbN86GilQwxhtksgKkkywNhaq6PWlB4iM26R7dVYuUdhNChJW6fuDVFtszz
         ValL4XInU4ey0HO1EA2QqGUFEBZxP5tZSV1AN3P/BniSLERgVKvDcmVY5awHYM6gcT3/
         OsP94Z8jA9PC9nhGJ7BlE4GP4fBljTr5jeVhE3tR8Wr20bvOe6c7uHKN+fJxWNwFuoOq
         wMbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9hySdGJfBaqVkNGTwwpWUzVzhw9mVuwzItSLAdpRYIxfn+dgDAcVZrf4sSIT5pLcGvXxp/IzlMC70vy44yMtNspg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxVzTZGr7cyaY17hwmojjN0i9dd98mKBv/IxlciAUM1BCOkVZQF
	p6vL6VfVEhSiXNIihOyQxPSvnct3iosS4qlwJrI6GreZGPvrh4wrzcesahTVow==
X-Gm-Gg: AfdE7cnK/ueSQ80UE1Ex1xFVLdW0X7RXHnUru/E28FpDtugI+fB036tpP23us3xa1c+
	crarOL9QcMA1kWJ67PLod0jFr1CqNuRmAzdFPEJXcyLyBdK0oPhJ5zGyCzGjB0mWFUFiJaKjinM
	M/eDLkXaCvmLXmSZ0h5d2ew+O8sfTknxdgtr/Xk07u2ib3V6PebOrXft3eTjrXG/qOlHIrKj0zg
	shDwdZDygMgY1zV7qFh1HFGrMD7lakfCjJZdfQseupEW0YGXDHzga84kmtu25AKki9IPQTDOqrn
	VUTj5BL41fIY4G6ppIi/SICP11VVgjv4JA5PE6zGzYL0roLXARAcFPl1enIvrTXxNVU+PfYdDfx
	jkSDNnnWiNJPLuYeIZYkqQAtFX5cI6sienTps6/rxLg8+fDMPPGh1tt42wjjN5HKwqzEOxI9bkL
	FhA0fX0NSgBPf9K07NLaRzn8Flmyxwuue6+wKB87szO9Z2ykKe+gsQNVfU3pwaig==
X-Received: by 2002:a05:600c:828d:b0:493:bf86:85c5 with SMTP id 5b1f17b1804b1-493c3df3495mr61419195e9.36.1782984663256;
        Thu, 02 Jul 2026 02:31:03 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c636c8b9sm35007635e9.10.2026.07.02.02.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:31:02 -0700 (PDT)
Message-ID: <59e632d359f41c211f1bcdf10c36b4652e1f3ea6.camel@gmail.com>
Subject: Re: [OE-core][PATCH] kernel-fit-image: Add KERNEL_DTBVENDORED
 support for FIT_CONF_DEFAULT_DTB
From: adrian.freihofer@gmail.com
To: reatmon@ti.com, openembedded-core@lists.openembedded.org
Date: Thu, 02 Jul 2026 11:31:02 +0200
In-Reply-To: <20260630190445.3062430-1-reatmon@ti.com>
References: <20260630190445.3062430-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jul 2026 09:31:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240029

Hi Ryan

On Tue, 2026-06-30 at 14:04 -0500, Ryan Eatmon via
lists.openembedded.org wrote:
> When specifying a FIT_CONF_DEFAULT_DTB for a machine, you have to
> exactly align the name with what will be in the fitImage file or you
> will get a build error.=C2=A0 If you also turn on KERNEL_DTBVENDORED then
> you
> must also specify the vendor directory as part of the dtb name that
> you
> want for the default, but you must manually do the same mapping that
> the
> kernel-fit-image class is doing when it generates the fit-image.its
> file.
>=20
> This patch just adds the same logic to figure out the value for the
> requested default dtb and eliminate the need to understand the
> internal
> mapping of the class.=C2=A0 It should make specifying the value more
> intuitive.=C2=A0 The same value that you put in the KERNEL_DEVICETREE can
> be
> used in the FIT_CONF_DEFAULT_DTB and the new code will correctly
> honor
> the KERNEL_DTBVENDORED setting.
>=20
> Before:
>=20
> =C2=A0 KERNEL_DEVICETREE =3D "
> =C2=A0=C2=A0=C2=A0 ti/k3-am62p5-sk.dtb \
> =C2=A0=C2=A0=C2=A0 ... \
> =C2=A0 "
> =C2=A0 FIT_CONF_DEFAULT_DTB =3D "ti_k3-am62p5-sk.dtb"
>=20
> After:
>=20
> =C2=A0 KERNEL_DEVICETREE =3D "
> =C2=A0=C2=A0=C2=A0 ti/k3-am62p5-sk.dtb \
> =C2=A0=C2=A0=C2=A0 ... \
> =C2=A0 "
> =C2=A0 FIT_CONF_DEFAULT_DTB =3D "ti/k3-am62p5-sk.dtb"
>=20
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
> =C2=A0meta/classes-recipe/kernel-fit-image.bbclass | 15 ++++++++++++++-
> =C2=A01 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/kernel-fit-image.bbclass
> b/meta/classes-recipe/kernel-fit-image.bbclass
> index 448a88ccb1..f49838d639 100644
> --- a/meta/classes-recipe/kernel-fit-image.bbclass
> +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> @@ -195,8 +195,21 @@ python do_compile() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> loadable_loadaddress,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> loadable_entrypoint)
> =C2=A0
> +=C2=A0=C2=A0=C2=A0 # Figure out if we have a default dtb and if we need =
to honor
> the
> +=C2=A0=C2=A0=C2=A0 # KERNEL_DTBVENDORED variable to tweak the name to ma=
tch what
> will be
> +=C2=A0=C2=A0=C2=A0 # in the fitImage.
> +=C2=A0=C2=A0=C2=A0 default_dtb =3D d.getVar("FIT_CONF_DEFAULT_DTB")
> +=C2=A0=C2=A0=C2=A0 if default_dtb:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # With vendored DTs, replace =
any path separators with
> underscores,
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # this matches the behavior u=
sed to generate the dtb entry
> in other
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # parts of the code.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if d.getVar('KERNEL_DTBVENDOR=
ED') !=3D "1":
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 defau=
lt_dtb =3D os.path.basename(default_dtb)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 defau=
lt_dtb =3D default_dtb.replace('/', '_')

This is probably needed in addition to
https://git.openembedded.org/openembedded-core/commit/?id=3D4297b94c3728cd2=
e320d75b68c508e12ab127719
if I understand correctly.

Would it make sense to move this if else block into a function which
can be used in both places?

Regards,
Adrian

> +
> =C2=A0=C2=A0=C2=A0=C2=A0 # Generate the configuration section
> -=C2=A0=C2=A0=C2=A0
> root_node.fitimage_emit_section_config(d.getVar("FIT_CONF_DEFAULT_DTB
> "), d.getVar("FIT_CONF_MAPPINGS"))
> +=C2=A0=C2=A0=C2=A0 root_node.fitimage_emit_section_config(default_dtb,
> d.getVar("FIT_CONF_MAPPINGS"))
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 # Write the its file
> =C2=A0=C2=A0=C2=A0=C2=A0 root_node.write_its_file(itsfile)
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#239914):
> https://lists.openembedded.org/g/openembedded-core/message/239914
> Mute This Topic: https://lists.openembedded.org/mt/120052405/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

