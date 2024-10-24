Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0860CE8E71
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 12:58:17 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.13869.1729774693911477806
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Oct 2024 05:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dvF3xRQt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d4c482844so591204f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 05:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729774692; x=1730379492; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+KxBlHLl/cDEJaVp2WGc2Au0l3ufOvYQuaFZ//pKQWg=;
        b=dvF3xRQt+XxUU/8Srpb7HdlUP1qg9CavyOM4vz1IV1+sGcm109Ubip4KakOtYmXVNx
         x8YlP3TqfSdvuU7pC60PYjVwQuRRl18C6vC3710nCBc+DNhVljf617KcD3Ydshno73nH
         alIMwijM5VL4mNJ/sTa/yi7rGwRALC8BnhUUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729774692; x=1730379492;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+KxBlHLl/cDEJaVp2WGc2Au0l3ufOvYQuaFZ//pKQWg=;
        b=cFLxcNqbB1wnKTPU0uCG8DcIRZvsPfhkHfcONCrEFYB5FIee2sykJIwcE3eOf2MZwe
         W2/X9WA5/Wfx2KhIjMMOAkU5f3TizXrnZ5jekmsSqyiDW1pi7BSeYa8UntiLAEnUm877
         0LhLfgXeANTQnLVx3qD2WJ2uFlRASPkR7Y2DN3+JCr4dbVl0tH9tS0y0w3ISABiafeM6
         8RUH3LoALMbxSjaVJ4djeLV0W8Zf3Z6JEhF40pSY64ep26dlBBRv/djtO1tPS1uVL29S
         D/Arlcn7nYoH0O2WHN9FYvsPGNKL/WTplz10J+aKZKVs7Q/3Gh6v1X711MIxY7y4MJnb
         UXbg==
X-Gm-Message-State: AOJu0YwG0tgsikkeLr3oxkfiL8a9qYMDYeyBDijO3AC9abOcVcMZqnZj
	aTIyvPJ+mS1scyl85As2GobQd/ZfWSUkrileJU2PIBx1WKt0hkYWK3lKgJ8bO1BKldUyactZdpp
	43GY=
X-Google-Smtp-Source: AGHT+IGGmpOdui94k4q8MsARrBMQbd2Mbk/Uotlf0d5qJwj9Q7pY3sR1364w5hBO43w4/myqyGHubQ==
X-Received: by 2002:adf:f84f:0:b0:37c:d57d:71cd with SMTP id ffacd0b85a97d-380458fbe09mr1398091f8f.52.1729774692264;
        Thu, 24 Oct 2024 05:58:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c08d:5245:a79b:dc4f? ([2001:8b0:aba:5f3c:c08d:5245:a79b:dc4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186bfd4cbsm45118515e9.28.2024.10.24.05.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 05:58:11 -0700 (PDT)
Message-ID: <58cf7a251cc55641f2d5da7dfedf204e367cc38b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] systemd: fix journald persistency when
 VOLATILE_LOG_DIR is false
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: esben@geanix.com, Changqing Li <changqing.li@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 24 Oct 2024 13:58:10 +0100
In-Reply-To: <20241024-systemd-create-log-dirs-v1-1-23cba4a734ab@geanix.com>
References: <20241024-systemd-create-log-dirs-v1-1-23cba4a734ab@geanix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 12:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206295

On Thu, 2024-10-24 at 13:41 +0200, Esben Haabendal via lists.openembedded.o=
rg wrote:
> Commit 18d46e11d85d ("systemd: fix dead link /var/log/README") broke the
> default systemd behavior when VOLATILE_LOG_DIR is set to false.
>=20
> By not creating the /var/log/journal directory, the default configured
> systemd (Storage=3Dauto) will silently revert to just doing volatile
> logging (/run/journal).
>=20
> The problem fixed with the above mentioned commit was specifically relate=
d
> to configurations where VOLATILE_LOG_DIR is true, in which case it should
> be perfectly fine to not create the /var/log/journal directory, so we
> should be able to keep the fix in place, while not breaking behavior for
> non VOLATILE_LOG_DIR configurations.
>=20
> Signed-off-by: Esben Haabendal <esben@geanix.com>
> ---
> =C2=A0meta/recipes-core/systemd/systemd_256.6.bb | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_256.6.bb b/meta/recipes-co=
re/systemd/systemd_256.6.bb
> index 68f15ab065dd5985e4e5cefc2cd005dba5ac9c7f..88ee0c8a7f89726fc9be489f3=
fc419f9feb37251 100644
> --- a/meta/recipes-core/systemd/systemd_256.6.bb
> +++ b/meta/recipes-core/systemd/systemd_256.6.bb
> @@ -254,7 +254,7 @@ EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dsystem-uid-max=3D999 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dsystem-alloc-gid-min=3D101 \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dsystem-gid-max=3D999 \
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dcreate-log-dirs=3Dfalse \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@ '-Dcreate-log-dirs=3Dfalse' if oe.types.=
boolean(d.getVar('VOLATILE_LOG_DIR')) else '' } \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES'=
, 'zeroconf', '-Ddefault-mdns=3Dno -Ddefault-llmnr=3Dno', '', d)} \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> =C2=A0
>=20

There were recent changes in this area so that is not the correct way
to do this in master.

meta/conf/bitbake.conf:BB_RENAMED_VARIABLES[VOLATILE_LOG_DIR] =3D "is obsol=
ete and no longer supported"

This does make me wonder about testing :(.

Cheers,

Richard

