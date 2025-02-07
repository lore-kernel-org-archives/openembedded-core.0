Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF198C02194
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 16:09:33 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.73160.1738944572763123209
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Feb 2025 08:09:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZrRNTt6Z;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dc1dfd9f2so1190448f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 08:09:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738944571; x=1739549371; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxUjKFqvDN4kZfseJYtnNjV4JNyQqzZbQYX7ckSr9p4=;
        b=ZrRNTt6ZXwqF+IgsUUhXDeMGO8MZYCG7dfKTVmsee6R0/NNpts8Z3clAo/nIVYk6UE
         5+hBOI3/RM4g2RGEfrIlSdWDsubqtsAwwoShR54QKsiIqRTYiIMWl0VXp3NG7ZMdkdUD
         29EwsMZzGtEtrh3NQ2srnwsCXSKhKVRy35L2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738944571; x=1739549371;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QxUjKFqvDN4kZfseJYtnNjV4JNyQqzZbQYX7ckSr9p4=;
        b=aK+S538j1I/ihbMknnxwB8yrD5GMuIrfN0L08i/UmMFh8Leyn6xatD0XLaX4sR+r73
         s/vant+qdj9cNhYvECY0ra28Hs4fmoycXa7LddbAs95rqCPjSPhYIYxi8sYS/zkkrq1H
         n9aOPD7e8leW+u2VUFHsWX3p+tDLarqBdeFyElRVxIS4/+GK7JNrpytm3MESIAft8Nw+
         Q6s+ZRzPsvGzqoVfEaaUidTq16YQInfYYFBNFMYFtCpmpUVNSrM8yHugTi46vAp9kudd
         tZ7Zmh9/sX3hKqJh8hduJcl6GsEDQEo6E3qRWBNAZ4p84uojhm3DzN/NiDVCJ1/MuKa5
         EDNQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9vJcySTnjyFkbSNlKoYibFzNL5vUzLmnCpGqtpipDaR/e7uZBpxj6Jqf2qfwxOtv6CSwGqZh/DAP/GzSrlGqRQA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyrnjRkBBxMJMI6CQrZGsYe0oHIwuWDi5+/Sz1nGx+WPjd+V6w9
	i6SAAe9zzRtJEFymXGOpYCVBj+xIrUvv3icM4UvwHUR3r23IYH46zAWy2VJ+NjM=
X-Gm-Gg: ASbGncslURGX/Xkymyup85vfAlwuaX4CrAV+gNAl5Sl+OwJup6C2wlfbgbDGpfg52HC
	hDq+t5Z4B/GaeZv//Vr2arnUgrHlaEfbuazTwq6xCW9wlbaheK9sNtym3a5Ue6DR9374gWA8MgA
	Xnp1BZNGCv7xkNwUqbAGT3+3yPIrGQlTlbmrmge6iuh9HJoBGqw9AfJWnPRfmQZZmcKftXaZ+lW
	7kp2Z5f3SwoMLqqkXUcFVW+GPe6NBxDppmMiAMP+TtFa20D2TBYxSG7k7WMXq/+1QZ+cIRDvobB
	UuDd7u7nC+p999nySPB+IAFF516UhDGrqEme0lUXaAbp6qa1Ay848/6j9JUUahZtRFLOwt7Y7Lr
	eKQ5m
X-Google-Smtp-Source: AGHT+IGtRF96j46rPkJPPSZvr4/1b1Q7gD7G0bE5VisTL+d0sht5Bhxj5s3c8604mMWwDR80LUQ+yg==
X-Received: by 2002:a05:6000:402c:b0:385:d852:29ed with SMTP id ffacd0b85a97d-38dc9138a84mr2131155f8f.36.1738944569539;
        Fri, 07 Feb 2025 08:09:29 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:dcae:28d1:c97a:4196? ([2001:8b0:aba:5f3c:dcae:28d1:c97a:4196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d933789sm93924745e9.4.2025.02.07.08.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:09:28 -0800 (PST)
Message-ID: <96fbc2c08d23e3485497e3b7cc9ba235c2a9176d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] recipes: Drop ld-is-gold support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 07 Feb 2025 16:09:28 +0000
In-Reply-To: <D7MCDFANDYTT.2NNXQR99MAHC7@bootlin.com>
References: <20250206144911.3776785-1-richard.purdie@linuxfoundation.org>
	 <D7MCDFANDYTT.2NNXQR99MAHC7@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 16:09:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210993

On Fri, 2025-02-07 at 17:08 +0100, Mathieu Dubois-Briand wrote:
> On Thu Feb 6, 2025 at 3:49 PM CET, Richard Purdie via
> lists.openembedded.org wrote:
> > Gold hasn't seen development in some time and is being dropped from
> > binutils
> > releases. Drop the small number of special cases for it we were
> > carrying.
> >=20
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
>=20
> Hi Richard,
>=20
> We get some errors while building go. I fear this comes from this
> patch:
>=20
> > # /srv/pokybuild/yocto-worker/genericarm64-
> > alt/build/build/tmp/work/armv8a-poky-linux/go-
> > runtime/1.22.11/build-tmp/go-build691092281/b285/libstd.so
> > /srv/pokybuild/yocto-worker/genericarm64-
> > alt/build/build/tmp/work/armv8a-poky-linux/go-
> > runtime/1.22.11/go/pkg/tool/native_native/link: running aarch64-
> > poky-linux-gcc failed: exit status 1
> > collect2: fatal error: cannot find 'ld'
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/974/st=
eps/11/logs/stdio

I'm seeing them too and fear you may be right. It is only on aarch64 :/

Cheers,

Richard

