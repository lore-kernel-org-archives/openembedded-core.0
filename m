Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0F71C02192
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 07:57:40 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.64346.1738915050953166722
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 23:57:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hIvhpVlF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436a03197b2so11542965e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 23:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738915049; x=1739519849; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U22DKyMSSfN8hutAWXXqKrsLDKB3TAUguaCl5QQXXF0=;
        b=hIvhpVlFVleN/xFkdOoaksJoa0Nhnv9EXXS6bhYdUL03SuWrj9I1pK0Vp7XvHZT12q
         7f+r7iB00LU07DzOPhOMFT2Ogk32eK0SadLUVMb8o2kXoAgT2GMN2vyahEuApGHYZ9tS
         4lM5sk80sV4OhRanJQ5ULfG7yXhfNvy79fm+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738915049; x=1739519849;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U22DKyMSSfN8hutAWXXqKrsLDKB3TAUguaCl5QQXXF0=;
        b=wUxQ8gMn3t7hcd4OgG13HiOXqmIcut0dgE+zBwNlevk9reFyndcqiaLz41S1diHtW8
         3h8bMZ+gB6bWCZ5zJv1PIy5cFHxgeYve5kMzjJZx+FqAwSqJfHxInDseoncWZ+zv6PHf
         WfW+IrrEASZ1Xu9OVL7zdoNn/8da+YR5cc/fZCVbgJggLvY74v2MErjZOiW0JSyX2JE+
         SiNiU2bdJNVL6WBaMvGBD4fYZZ/8UhMhd+un7AsRd8DyQBytAon5g+nQKYdkJQL7+XW2
         DOtLZyJXAjp5l1xlDDgSnRetYNcY2B62HZLDoMOnax6J7udHzQP6OeydywoNfo8GwGoo
         l6DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUsqmuWehN2sm2rcjKcjgWoGOBoUOQUvzicj4KtYUmgsbLXCHxmmijWlwQ3eNn6OlvF0GvUKWHlxiQJNpuM7re1Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxdg0Mfbzjp+8CcgljqBAwj/rtbQ2bt8UadQQoFyguq9EwjtmU0
	CnyJ3xDY1VtSRF/aYS8598dOd0vO55dRJml4PQcCHfNTWdbHv/a8+3BSglKM6eHNLlH4O3QGE2v
	G
X-Gm-Gg: ASbGncuzHdHdIpvx1veVyTD5vm+iu/5kY+wVuxyhsbAiVaHubq50LgLgXtgmg2uVBx0
	oO6RzE3QWZZGq0Mq/giLFbRCfIjOygwpdCMCIjHvfE6szPcb7OzKKT973KHXBLzmxUFfOBBVT8J
	xAUvHpf0Xv16nWZigOwxcrgsqDhAQ81j4IKmQms+r5Qxz08ptAVITpLNTB5KtXc9ED861IR0ODE
	amR6ZWuT331woGgdbAp9KI6/dTeuMpcOqF/B0+M+QhCiXRu8rPFaVg2OjIyFO68YG8MEtug0a4M
	5cYWthBvMU1QT3uj4x3jiFZgwgZ/vD1lcUijdhdCfWoQin8Qzx0KrXs1+UeRG2rKonwOO3gOwdU
	tbRH8
X-Google-Smtp-Source: AGHT+IFKpfHBgWG5eS6XiSqqtHWKQV7Rmyo2LIWiUraDDcfmL3zvfXirUpb0aW5GIOBZwQlxThWxWg==
X-Received: by 2002:a05:600c:b93:b0:434:f270:a513 with SMTP id 5b1f17b1804b1-439249caf5emr17781905e9.29.1738915049295;
        Thu, 06 Feb 2025 23:57:29 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:dcae:28d1:c97a:4196? ([2001:8b0:aba:5f3c:dcae:28d1:c97a:4196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d933523sm82955425e9.1.2025.02.06.23.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 23:57:27 -0800 (PST)
Message-ID: <ae812ff716ce8a858b27ad65e31f1f36fa62d3e4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] nfs-utils: clean up sbin installation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Fri, 07 Feb 2025 07:57:26 +0000
In-Reply-To: <20250206133114.2974225-2-ross.burton@arm.com>
References: <20250206133114.2974225-1-ross.burton@arm.com>
	 <20250206133114.2974225-2-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 07:57:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210974

On Thu, 2025-02-06 at 13:31 +0000, Ross Burton via lists.openembedded.org w=
rote:
> There's no need to sed the Makefiles as there's an option to simply
> respect sbindir.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb | 6 +-----
> =C2=A01 file changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb b/met=
a/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
> index ff02a3aea01..4683939bff5 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.2.bb
> @@ -60,6 +60,7 @@ EXTRA_OECONF =3D "--with-statduser=3Drpcuser \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 --disable-nfsdcltrack \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 --with-statdpath=3D/var/lib/nfs/statd \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 --with-rpcgen=3D${HOSTTOOLS_DIR}/rpcgen \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 --disable-sbin-override \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "
> =C2=A0
> =C2=A0LDFLAGS +=3D "-lsqlite3 -levent"
> @@ -107,11 +108,6 @@ FILES:${PN}-staticdev +=3D "${libdir}/libnfsidmap/*.=
a"
> =C2=A0
> =C2=A0FILES:${PN} +=3D "${systemd_unitdir} ${libdir}/libnfsidmap/ ${nonar=
ch_libdir}/modprobe.d"
> =C2=A0
> -do_configure:prepend() {
> -	sed -i -e 's,sbindir =3D /sbin,sbindir =3D ${base_sbindir},g' \
> -		${S}/utils/mount/Makefile.am
> -}
> -
> =C2=A0# Make clean needed because the package comes with
> =C2=A0# precompiled 64-bit objects that break the build
> =C2=A0do_compile:prepend() {

https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/962/step=
s/11/logs/stdio

Error:=20
 Problem: package packagegroup-core-full-cmdline-sys-services-1.0-r0.noarch=
 from oe-repo requires nfs-utils, but none of the providers can be installe=
d
  - package packagegroup-core-full-cmdline-1.0-r0.noarch from oe-repo requi=
res packagegroup-core-full-cmdline-sys-services, but none of the providers =
can be installed
  - package nfs-utils-2.8.2-r0.core2_32 from oe-repo requires nfs-utils-cli=
ent, but none of the providers can be installed
  - conflicting requests
  - nothing provides nfs-utils-mount needed by nfs-utils-client-2.8.2-r0.co=
re2_32 from oe-repo
(try to add '--skip-broken' to skip uninstallable packages)

Cheers,

Richard

