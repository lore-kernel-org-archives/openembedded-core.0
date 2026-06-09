Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9A41CD8C85
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:42:02 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74099.1780990912250429302
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 00:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=STWvn1Ep;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-68c3421b009so8839543a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 00:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780990910; x=1781595710; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yosreQYl44xp7sn1VxwbvK62N2hENE00AfaPPJ2eJnI=;
        b=STWvn1EpYwc/H4794H7tp4xr5PQVgDTRt5c8pp2oMOfc461B9LDHEBXzprzmrBtw/i
         CzQ5E6VLForQHnBdSiSK9lgC8fzuADiOp4lZ5U3GdjlhXroQv/CBRVOPH6TFa7dRjqIL
         OGPoPGbcEcp2FYAjmm1jpkIO1Gfxoic6NK1Vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780990910; x=1781595710;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yosreQYl44xp7sn1VxwbvK62N2hENE00AfaPPJ2eJnI=;
        b=VMueVfS+ZKxHVFbohaiw/W9oWfauPEs6aE5zgHtMtFEvmGJpiYe44rtW0ONjbaIi+Z
         bFYLBc+2g8mC0UCRJUPuqofIfq5rfobwIyGegXyncgUsq+G0tltDWWwa+NLfTMwGQxO2
         yu2DbQH61SRk/sho1RC6lP+Y1C/EwuHiQqu39QosZZSFmxhv0auvsaYc51BMe+pcVfYi
         xpFf8a+U+bj2beD6QQ8rIe+lNId3BKsynDuKORS/Lu+Chc1qNq604Rf7EGS+1qN+wJuz
         fQoL2PfrvT3o4LknzEexXEsACGqEPmRD0J7o+TgzXngMyFwDmOQi2Ttq6T8BJMm/hM6M
         JZmA==
X-Forwarded-Encrypted: i=1; AFNElJ/HEdIP4F52lXrfNqnXaBpnke+qdxnOF7TsyFb9FqxjqH+OuvoKUlJjXbl14ZYjIlx4Y1H+yU/BXJXiT3SkbCceOQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzxPg9I0ngXfvIT4dyNgRsAVhG6ukAXs4WCjAxyBiQJ/+i710ml
	OtwtQXuoOqgXXGnv9a7st7m6x58fdegt+pF5a0yHZYSWNyBOP6NIPlNjOkKOihnscT8=
X-Gm-Gg: Acq92OEBjEAt/VqMiQUJYLjcCV/55CSSYAVUUCN5apdB0an88M+QEEoqIK8djLrU64+
	lgGfU4DydieYG4rprSHpXs12nFKhfPV5+C6XAtQfmDmfrO0VBsbJq7aEYMlMH/Vc02nIdz/KZgx
	qdhjqzxc/4u+lcrm2cgNi+V3lIpkiT8U04bJeEnnEqCCXfDwkfmiS7beLHwea4zdipJMb56M4GM
	18tky0HEpIq89P7eIoYRqQYNwpGOAAmBgNX1brnV7WXrLMJ0Zo1pI98+LLGYKvUJSQ++eNTpRbd
	ed5Xj9xJcCEEyk5Mv/x0faRhKx6jpOTVpTRHhKv41196hRoQXx/J3RL3LUtXbLtj6ufRhDhLXyr
	UbsXXS6ubbIMMBs5mgCFsEKZwKwpbkKYVBP8hVzxVRqwziouOegnx9Daz2D4mQz/hrSB9dk2eMe
	zycjfMQNeGBTbw0GTmRtBnw1e1uCILHoO30DCO6qt/KD3iYU2y4HYUtDcudeyUWjg7P5Ff31SyH
	1INWITrFNHcaB5xoz24IYjvDz3t/ErOoONWIg==
X-Received: by 2002:a17:907:1def:b0:bda:dd7:2e42 with SMTP id a640c23a62f3a-bf3a900fad9mr617078566b.19.1780990910416;
        Tue, 09 Jun 2026 00:41:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1942:aa0f:4850:4ec1? ([2001:8b0:aba:5f3c:1942:aa0f:4850:4ec1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307ce3sm978330666b.43.2026.06.09.00.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:41:49 -0700 (PDT)
Message-ID: <da28e9e53e21ce0d9dee82a049fb0b6d55907bfb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rpcbind: Modify socket file only, if systemd
 is used
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: joerg.sommer@navimatix.de, openembedded-core@lists.openembedded.org, 
	AHoemig@datus.com
Date: Tue, 09 Jun 2026 08:41:48 +0100
In-Reply-To: <921b2852784f105d6ca5c8a754f87a68f2ecb4f3.1780937668.git.joerg.sommer@navimatix.de>
References: 
	<921b2852784f105d6ca5c8a754f87a68f2ecb4f3.1780937668.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 07:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238269

On Mon, 2026-06-08 at 18:54 +0200, J=C3=B6rg Sommer via lists.openembedded.=
org wrote:
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>=20
> Fixes: bee29dc822c611 ("rpcbind: Remove IPv6 listener, if ipv6 not in DIS=
TRO_FEATURES")
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
> =C2=A0meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb b/meta/recipe=
s-extended/rpcbind/rpcbind_1.2.8.bb
> index bd8ba1e88a..6604774c1f 100644
> --- a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
> +++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
> @@ -55,7 +55,8 @@ do_install:append () {
> =C2=A0	install -d ${D}${systemd_system_unitdir}/rpcbind.service.d
> =C2=A0	install -m 0644 ${UNPACKDIR}/rpcbind.systemd ${D}${systemd_system_=
unitdir}/rpcbind.service.d/rpcbind.conf
> =C2=A0
> -	if ! ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'true', 'false', d=
)}
> +	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', =
d)} \
> +		&& ! ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'true', 'false', =
d)}
> =C2=A0	then
> =C2=A0		sed -i '/^Listen.*=3D\[.*\]/s/^/# /' ${D}${systemd_system_unitdir=
}/*.socket
> =C2=A0	fi

That can be simplified to:

bb.utils.contains('DISTRO_FEATURES', 'systemd ipv6', 'true', 'false', d)

Cheers,

Richard

