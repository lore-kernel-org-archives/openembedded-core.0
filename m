Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84EE5EE6B7C
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 08:53:50 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1782.1770454425144666718
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Feb 2026 00:53:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dBOP/Ipz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-436e87589e8so13940f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Feb 2026 00:53:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770454423; x=1771059223; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxuErRmwNirF1rdcZ/88e4JvWVeuawnb0LoTzclwdZc=;
        b=dBOP/Ipzpc9rRVMWiJfHgssZvKX6uHqQ43idSZjIyTs9vTs2puuDx5TfXqHDdPhsZY
         u8PTfISqvx3j6PPk3Lvhh3zqj7cKQ1H/9ewA0LyU9y44fA+mk/s0sBucoJKniCIzBY3J
         J16L9H2shxR+Fam/ZI3C/oRsYdqyw/eXu20rM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770454423; x=1771059223;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GxuErRmwNirF1rdcZ/88e4JvWVeuawnb0LoTzclwdZc=;
        b=Pcso+ScpCSlC4LyzDn5K+60qQWbWs+NHZBJzryJSJab0IurNE6mewXpJ0LPd+EUZtg
         PfmndskiGNMOf6C7lkxaAfiNMSzgLfKLARE9jgc09Xa5g+Gug4j9r2TNCLTKDGX77wXD
         TAAae8Qg3JKtvTT5dYaiTIKxHnNuURaKII4E4jX2xlVrhVqxCiyFJc5yblJ+ur9bgnuE
         UUIC8i0ugVg+C1/nugLF8XOdK4I754+s7z5WNS13l3oGi+B0kCIYZWGMn9Ur7h1dbPuI
         cIMyHhIf+q1WxTdJkeDnOUyO9CTCjdK7eUj13mtjlxIzIT6h82xKkIudIkmM8iLz3Oxs
         1Hlg==
X-Forwarded-Encrypted: i=1; AJvYcCXxC0cEN1V64zacx1MnXkTBQTMzevtzZ7USGIDa0kVtspXyt79J9Zl6gLh0Nu9I3EbHZ/h831gulQS4AI7SHEBExQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywi6jnHvFTu/RNujtQwZnhcqdwyln9a08Z2qgTh9d4TVHQ9REyJ
	vTsBte//92nLhFq9c+CMA/SvQQKI47V+nF3chR5rVjNbkCNQv9Wdu8JJwk81P5KeOFI=
X-Gm-Gg: AZuq6aI39T0wJ4I7UAoFFbI21ARINkRheUSrjx8M16zENpAbZkn+9taSlR7EfCt+8aO
	lLf91OepkbC8JjanEnMf/Sa8qQ+qKvfZBZVD1sWPCEmtzGSPpnjXiWUAyByPBYXEJgIuqHkKLEp
	6IpQtc+aiw60XMpvZjh+HcDR2Jxfn4p6jEUKKIEg65X7Qjsy0Rf0vwACiKmQFPIYT1CqBiC1OG8
	H2gQNaXVWgu95nRGGpiLQenJkSalFpV1jMULkVuCJpsGWtOkQjdRgoY8GRjAdNOlQiL4BnJyRnM
	BC10Fz7vky5ChaqwpjifoBzwMm5dlwtVAzk5YmiRW/4x5BAsz4Eu9noRCOXvNPqV/goZxx5RcM9
	ARKnE5ov0jLgS3NMHDtpEXMUDkRUP7/aNu7u9mmfoeQ5Kr1avIcGvQLY799Fbyv8xXsMXUb3lam
	zhOG0/rjDGrF/657L1BGoUaOdr3k0kiGhmvDtg8gzAqEJ3eSQDyf76gZyi4BZcxIgWh5hFBVVyI
	cM=
X-Received: by 2002:a05:6000:184f:b0:430:f241:a11f with SMTP id ffacd0b85a97d-4362938b258mr7446833f8f.30.1770454423460;
        Sat, 07 Feb 2026 00:53:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d710:b0b1:4482:6d4f? ([2001:8b0:aba:5f3c:d710:b0b1:4482:6d4f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc1bsm12337188f8f.28.2026.02.07.00.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 00:53:42 -0800 (PST)
Message-ID: <3d9da9404610ce4c80ff8b086a041ca242422e8d.camel@linuxfoundation.org>
Subject: Re: [PATCH v1] license.bbclass: directly expand LIC_FILES_CHKSUMS
 to apply inline python
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Johannes Schneider <johannes.schneider@leica-geosystems.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 07 Feb 2026 08:53:41 +0000
In-Reply-To: <20260207002856.2847527-1-johannes.schneider@leica-geosystems.com>
References: 
	<20260207002856.2847527-1-johannes.schneider@leica-geosystems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Feb 2026 08:53:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230668

On Sat, 2026-02-07 at 00:28 +0000, Johannes Schneider wrote:
> Add 'expand=3DTrue' to directly resolve file checksums that are added
> conditionally with inline python code.
>=20
> Otherwise it can happend that the license.bbclass still sees the
> un-expanded values and either misses or even skipps adjacent licenses.
>=20
> E.g. an unvaforable combination of
> LIC_FILES_CHKSUM +=3D "file://docs/license.rst;md5=3D83b7626b8c7a37263c6a=
58af8d19bee1"
> LIC_FILES_CHKSUM:append =3D "${@bb.utils.contains('TFA_MBEDTLS', '1', ' $=
{LIC_FILES_CHKSUM_MBEDTLS}', '', d)}"
>=20
> would lead to a
> =C2=A0# pre-expansion value:
> =C2=A0#=C2=A0=C2=A0 " file://docs/license.rst;md5=3D83b7626b8c7a37263c6a5=
8af8d19bee1${@bb.utils.contains('TFA_MBEDTLS',=C2=A0'1', ' ${LIC_FILES_CHKS=
UM_MBEDTLS}', '', d)}"
> =C2=A0LIC_FILES_CHKSUM=3D" file://docs/license.rst;md5=3D83b7626b8c7a3726=
3c6a58af8d19bee1"
> and the license checksum verification on 'license.rst' being sometimes sk=
ipped.
>=20
> Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.co=
m>
> ---
> =C2=A0meta/classes-global/license.bbclass | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-global/license.bbclass b/meta/classes-global/li=
cense.bbclass
> index af5f1ed41d..62116ba31d 100644
> --- a/meta/classes-global/license.bbclass
> +++ b/meta/classes-global/license.bbclass
> @@ -125,7 +125,7 @@ def find_license_files(d):
> =C2=A0=C2=A0=C2=A0=C2=A0 from collections import defaultdict, OrderedDict
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 # All the license files for the package
> -=C2=A0=C2=A0=C2=A0 lic_files =3D d.getVar('LIC_FILES_CHKSUM') or ""
> +=C2=A0=C2=A0=C2=A0 lic_files =3D d.getVar('LIC_FILES_CHKSUM', expand=3DT=
rue) or ""
> =C2=A0=C2=A0=C2=A0=C2=A0 pn =3D d.getVar('PN')
> =C2=A0=C2=A0=C2=A0=C2=A0 # The license files are located in S/LIC_FILE_CH=
ECKSUM.
> =C2=A0=C2=A0=C2=A0=C2=A0 srcdir =3D d.getVar('S')

This is a little strange as expand has been the default value for a
long time. On a modern code base, this should therefore be the default
and the change would make no difference.=C2=A0

Was this an issue you were seeing on an older release?

Cheers,

Richard

