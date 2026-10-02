Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85ACDCA5FDD
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 15:17:32 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14810.1790954242729255498
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 08:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Az+xZfse;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso58825e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 08:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790954241; x=1791559041; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0fxVHAqP528NkL9mnYXxXvyxD/JnxnyV432HdK0ALvY=;
        b=Az+xZfse6HcxcWjsePR5rPtR+gMykHQLmX0LUOZTlvE4PY4A+WtUDeOihRq6CYoSbI
         sEsChKTNLrQZfdvmyfoGQA106fvi3uR1PQqM9vkz8brZrocquy2vRkJIxl7Vlboh9KWV
         uTQDTafvv3WCzdPIA1u7hcQvm7AxrUtUzwhTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954241; x=1791559041;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0fxVHAqP528NkL9mnYXxXvyxD/JnxnyV432HdK0ALvY=;
        b=JJOj8aff+xv4HXtwktWMdsA+zw+CKrh5n3Nm8IqrsIWSXEmvCHSjfKMG7uR6RPUeZT
         54Qy6gibKM9KMg51/BwIiE7XmHp480TbkiPSliykR9aaLih9wcnavEJwFcyLmdLF2k6O
         /xuxoRHidaR08FIG4F3fcGJ2otzIqdDRUFqD8YhY/a0JPCws2Gh/Ic9eEadJnewVO0se
         YplK/WQEoKWs9rqsqru4/1lHjhLKNEHBzuVLPo6shRL53yYeSzfPUIlWgmV7Totetdsc
         UXQ97ZRhtXLS2DswX8evxxtsipuFHrfoTBM2JS9LFQg2y1e1rVs9Tmpz7b5FH1ou45iW
         pLGg==
X-Forwarded-Encrypted: i=1; AKwUvByxls7azmhqabWhl6PujDtaOYMnsLP87Gpy1h49v0W8FtfkQBqUuB+Xz07DiAm+x0jSSVT1oxBz80nRUmCqecdTCA==@lists.openembedded.org
X-Gm-Message-State: AFuF++nrAZ8w9tZ13QjXMAPIpmCUPHz5N2xWOnMhmJ6NmGFNB2xBf64A
	Mtr+OfLXLFmOC/cEQwp2Kr+TWMbPO4SdbZGrNqm967Hj30u/JGtE7w8gXQ4R5wAy8wo=
X-Gm-Gg: AYBFou0gNpDg+4wRLltPBihjNcz0LbSMU1Rt+E3GcRBh2im7WQZs5dwbyNcYEeHW5gG
	Hl2Q3MNZCVEC8NF7I6Hoaxb/OPf8ZlfTw62EhUCmEbqLD3nYAeTIxKNsDCnKo40pZk38f5OB8r0
	wAzVCJtdFqUlh1Phn9rvJT0Vpzj8c2UJO7C8W9ewOAkkgNWwQsB+0Ojv6qzEfdvN7JOfaDYPyF6
	BWbXDpQbrL6hA74LNORApzInYFVxCsBZoGOaYdqzWmF6y4WFuFPep/hho/jbCId9r0LRHrQi5Wy
	0lr0qy4XPQAuiIdz62nDaWNAXLENL1vA9OrpRhim+vLlgsMLvFg9ptupaMbMkcwO5mynJ5kLL2V
	5axe8R15ioP4UYP+dTLDCzca7muHb+SFS9QPO9mcnOy0yiyh/FduMc5uAntWxLbsoj5Dep1qiQL
	62oXbTODb2EmN/onRQk5soA6vcORdyvWXXuLwV2AZ9NvvHnFi8r41CqztJ9SiF0FsT7Ej4ELhRZ
	CrLZyySsXOtEZ4VZ5Kx3uv0asZcZA0tNUakyCPul55IM6yzYHIz7fiuHKoWRQ==
X-Received: by 2002:a05:600c:4592:b0:4a0:bc9:28c6 with SMTP id 5b1f17b1804b1-4a0276b6860mr50650795e9.34.1790954240727;
        Fri, 02 Oct 2026 08:17:20 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02854073csm79156505e9.3.2026.10.02.08.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 08:17:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 17:17:19 +0200
Message-Id: <DLUGAJL0DW01.2UDQ8P6GXPBUN@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <gael.portay+rtone@gmail.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [scarthgap][PATCH] connman: fix syslog identity with
 glibc
X-Mailer: aerc 0.20.0
References: <20260929093009.847328-1-gael.portay+rtone@gmail.com>
In-Reply-To: <20260929093009.847328-1-gael.portay+rtone@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 15:17:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247132

Hello,

On Tue Sep 29, 2026 at 11:30 AM CEST, Ga=C3=ABl PORTAY via lists.openembedd=
ed.org wrote:
> The connman syslog patch modifies the handling of the ident string to
> solve a build issue with musl.
What "connman syslog patch"?
I'm having a hard time understanding this patch...

> This introduces a regression with glibc
> that does not make an internally copy of the indent string[1], while
> musl copies it[2]. Thus, that change is unsafe to apply in the glibc
> world.
>
> Also, syslog(3)[3] man page tells:
>
> 	NOTES
>
> 	The argument ident in the call of openlog() is probably stored
> 	as-is. Thus, if the string it points to is changed, syslog() may
> 	start prepending the changed string, and if the string it points
> 	to ceases to exist, the results are undefined. Most portable is
> 	to use a string constant.
>
> This removes 0001-src-log.c-Include-libgen.h-for-basename-API.patch[4]
> from the SRC_URI if libc-glibc overrides so that it is not applied when
> using glibc.

Hmm, this patch moves "0001-vpn-Adding-support-for-latest-pppd-2.5.0-releas=
e.patch"
not 0001-src-log.c-Include-libgen.h-for-basename-API.patch"

> Note: The patch was submitted to connamn, and was never get merged[5].
> Moreover the patch was removed from poky after bumping to 1.43[6].
>
> Fixes:
>
> 	Sep  7 06:10:36 qemux86-64 daemon.info ^A[776]: Connection Manager versi=
on 1.42
>
> This fixes commit 992d59564b84333740e6465ec696238274b73938.
Where it this commit from? I can't find it in oe-core nor poky.

>
> [1]: https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dmisc/syslog.c=
;h=3Db7414e7b43a510342273bece335b4258e8754905;hb=3D47dd7e0dacf50c740b04c78d=
3f85fbf983d53aba#l338
> [2]: https://git.musl-libc.org/cgit/musl/tree/src/misc/syslog.c?h=3Dv1.2.=
4#n64
> [3]: https://linux.die.net/man/3/syslog
> [4]: https://git.yoctoproject.org/poky/tree/meta/recipes-connectivity/con=
nman/connman/0001-src-log.c-Include-libgen.h-for-basename-API.patch?h=3Dsca=
rthgap
> [5]: https://lore.kernel.org/connman/0caf957f-e046-4453-a8ae-fd6c994ac95d=
@gmail.com/
> [6]: https://github.com/openembedded/openembedded-core/commit/467d28f5d24=
3d821722cf8dcdbb9675a2820cd4f
>
> Signed-off-by: Ga=C3=ABl PORTAY <gael.portay+rtone@gmail.com>
> ---
>  meta/recipes-connectivity/connman/connman_1.42.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/connman/connman_1.42.bb b/meta/rec=
ipes-connectivity/connman/connman_1.42.bb
> index 9b3abbe258..5c8bdd43f2 100644
> --- a/meta/recipes-connectivity/connman/connman_1.42.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.42.bb
> @@ -5,13 +5,14 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/network/${BPN}/$=
{BP}.tar.xz \
>             file://0001-connman.service-stop-systemd-resolved-when-we-use=
-co.patch \
>             file://connman \
>             file://no-version-scripts.patch \
> -           file://0001-vpn-Adding-support-for-latest-pppd-2.5.0-release.=
patch \
>             file://0001-src-log.c-Include-libgen.h-for-basename-API.patch=
 \
>             file://CVE-2025-32743.patch \
>             file://CVE-2025-32366.patch \
>             "
> =20
> -SRC_URI:append:libc-musl =3D " file://0002-resolve-musl-does-not-impleme=
nt-res_ninit.patch"
> +SRC_URI:append:libc-musl =3D " file://0001-vpn-Adding-support-for-latest=
-pppd-2.5.0-release.patch \
> +                             file://0002-resolve-musl-does-not-implement=
-res_ninit.patch \
> +                           "
> =20
>  SRC_URI[sha256sum] =3D "a3e6bae46fc081ef2e9dae3caa4f7649de892c3de622c202=
83ac0ca81423c2aa"
> =20

Regards,
--=20
Yoann Congal
Smile ECS


