Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86378104C007
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 10:46:58 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17939.1773226008482532748
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 03:46:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fU4Z5umf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439cb5af25bso4150741f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 03:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773226007; x=1773830807; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beVRP68jkxa/nZiyTh/hbqNpIQYxMxkleePGLG1uwbI=;
        b=fU4Z5umfkVwlMgFzsg9OB3IhuMcmHwqRiBu0rVyJdUQhktTn1TbFAWTfQ7Z1JlMtMC
         zET6wD+tgty0cRu5Y4NzupUrmMr5k6aFsotpNrc7uafrqtDauvsWNjXkYVEh9RRUTCkn
         iCzoRRtNXDc9yd4IghVkZmJLaMNrwyZA6vKSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773226007; x=1773830807;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=beVRP68jkxa/nZiyTh/hbqNpIQYxMxkleePGLG1uwbI=;
        b=HHsbOsXoCbrHbkkd982sytAIEU/GXoRQFjz2y+8crR6hpKLsja805mydnYSyvp/1JK
         pU4TxVyDhtvQ2ftz5kJBZiJflXGNtX3ecnbVDG21oI+9EaiAQYVGpzba9R/SbfYcA7Jk
         uvFYtT8y4ZIIKpp0VvgIA0MKI5dldZaFhc5wi86ANZ/0PFCkW0NZpWzqK859Am6ulvm0
         fslqcB0q0jZYQfsGRvzkAOFjIJdVkaSYjT/fkPnufum3L9i9JRUHZSTymAxzud5q/BCe
         x6DHlRBDRXIEpuClo2pde73Bm9w89bdqDaBVU96IiX2+TO0zwyiYXO7t9xuJNTyr2+ku
         utZg==
X-Forwarded-Encrypted: i=1; AJvYcCXCguHC7JqI5ar3oia5/sUD5THQRKK63yu8OFjUczUj3axFRcAeZG2r3nYJ425XV5LC0cKq39XLC6nxa1dLdR0cTg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwIJj8lgqaH/5x18P9HuZtCn3Mu24ecofmbQo/FPm1Hhpv5ATs7
	UbYGU8vYfHAfi0JZUNzR4DxqBS/s06hj50Gyiwx916u6F1KFD8GBvRwB/nV+H+fae8U=
X-Gm-Gg: ATEYQzwI9jY/EZq4/sB7pdvC5nm4g0PD/C0S4MwPkJ4nO8xaBrFJ9uobj8eLReYC65A
	AkONn3AEg3LTMJB9EecVzp/5XYuunwC1LtWk3uXuoss+6Q7n6eYO8GdfQ4gK1aNe7oqzS6hGUxU
	6stBoJLM6G20c3X/lIjE0kxpJwFKYwcobI6blNs7WCpoxkUil7uCwAIL2G+XRNn6WGdoIhyaLGY
	eNpgn4Ci5WPw5L2MzQjUQJBipi/UUww/Z/x/UjZGFNhD/BGc9ArHv6DWBpyKp17bw+FZXu+a3zE
	oic0pHdDuc3XoAh9dAKC/OVkO5XovPAghVlk+TUlC0AgYLRCRxTTvp/NzanZczj+GLmsRqc+x8Q
	Xy+V7bMVc0rnvDoFoUPqV3WsliZcUT1a+h3vau+Ssoe4JxWkdRnnrVtTqQu6pf4K1QC0OYpyF7A
	VvXxDawDeE1QpyNeluK3tjqqouspWlnSsVejJ+prRUsiZufzhaIj6tnROKXOOd/Us1J43px/TdI
	KIe4T+5qirBJME=
X-Received: by 2002:a5d:5d84:0:b0:439:c43a:acb1 with SMTP id ffacd0b85a97d-439f842a3d9mr4213997f8f.35.1773226006827;
        Wed, 11 Mar 2026 03:46:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7fc5:b1af:c486:ad0b? ([2001:8b0:aba:5f3c:7fc5:b1af:c486:ad0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f821d895sm5706814f8f.33.2026.03.11.03.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:46:46 -0700 (PDT)
Message-ID: <9029a33449f495475953ea561dce5047cf4008fe.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rootfs-postcommands.bbclass: use DATETIME as
 system timestamp
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: liu.ming50@gmail.com, openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2026 10:46:45 +0000
In-Reply-To: <20260311104359.194321-1-liu.ming50@gmail.com>
References: <20260311104359.194321-1-liu.ming50@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 10:46:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232865

On Wed, 2026-03-11 at 11:43 +0100, Ming Liu via lists.openembedded.org wrot=
e:
> DATETIME is being used in BUILD_ID and some other places to mark the
> build time, let's use it as system timestamp, to have a consistent
> system-wide timestamp.
>=20
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
> =C2=A0meta/classes-recipe/rootfs-postcommands.bbclass | 3 ++-
> =C2=A01 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/class=
es-recipe/rootfs-postcommands.bbclass
> index f0c7ee658d..43001e09b5 100644
> --- a/meta/classes-recipe/rootfs-postcommands.bbclass
> +++ b/meta/classes-recipe/rootfs-postcommands.bbclass
> @@ -424,11 +424,12 @@ rootfs_update_timestamp () {
> =C2=A0		# Convert UTC into %4Y%2m%2d%2H%2M%2S
> =C2=A0		sformatted=3D`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS} +%4Y%2=
m%2d%2H%2M%2S`
> =C2=A0	else
> -		sformatted=3D`date -u +%4Y%2m%2d%2H%2M%2S`
> +		sformatted=3D${DATETIME}
> =C2=A0	fi
> =C2=A0	echo $sformatted > ${IMAGE_ROOTFS}/etc/timestamp
> =C2=A0	bbnote "rootfs_update_timestamp: set /etc/timestamp to $sformatted=
"
> =C2=A0}
> +rootfs_update_timestamp[vardepsexclude] =3D "DATETIME"

This could be a little tricky as this timestamp is meant to be the
latest thing in the image. DATETIME is fixed when the build starts and
therefore if files are modified during the image, those could have a
later values.

I'm therefore not sure this is a good idea.

Cheers,

Richard

