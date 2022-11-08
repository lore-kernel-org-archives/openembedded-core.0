Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 216CBC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 22:59:55 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.3959.1667948392508392068
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 14:59:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Kx7mJnyt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id a14so23251909wru.5
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 14:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/jm6KMWoXMLf3tcGON72YsTkMH10ZZnuqIfiIcyrMiI=;
        b=Kx7mJnyt7H7+I5s29YhusAEhGsyPZEv60Qrinhafi1mOqcR6DS5L90viHIJlHGYNX5
         csdrikeAhQSih9XFqeOSBeLVaBO/v8EyeaOCSDoNnZg7tavBWI8C8fsigZZw1p55y48l
         IofERHCuUKvdVERNT7mSGlxLn4hFG7v9cI5fI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/jm6KMWoXMLf3tcGON72YsTkMH10ZZnuqIfiIcyrMiI=;
        b=xbjWO/NRR3A7VQLTl89UIk4qwculaMGv6mZ8V3U2sdBMJbFXuhwFGty6rJaKt6LgnU
         H0PBxp7Z/++GZH7/+s40y+bKLCn9emOzek4VlTACq4n+3GyeqwGclvmYRwxT8dUBpmSO
         fqDf37CcJkvtxSJs5DHA/09AEFH14J4Nir4cj6tAFAaJQ9FT+CClmeZ+o5tfjnhcqotZ
         THFlSMLOcOZ2XcsWkTlGs8otOOF2XPLkvRnJKWl/T7w+i8a8hhdWcO18xWGRz+kpqrmC
         zDQ6jg/fBPkwnVdAzE+yocd9iHK39dv+8XoihIk1ysP/uNMX+KBICLUN+BgvT/R0LpGr
         i6Fg==
X-Gm-Message-State: ACrzQf0z9swrUFGMyEvCL5GsrI/hp9Dmk3fHG2rBOTj0zt8tYfJkS7/r
	Q0OfTJ4CNis44t5A/bDUD/WPAg==
X-Google-Smtp-Source: AMsMyM4sM87sS2NUIhpJemG8ibIVn7FjlfnBCXsb6rWZaZN9A5LPWbIXM4y1rQkXUmpZowzGGvykcA==
X-Received: by 2002:a05:6000:808:b0:236:9822:718d with SMTP id bt8-20020a056000080800b002369822718dmr37359363wrb.254.1667948390897;
        Tue, 08 Nov 2022 14:59:50 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:e2d0:9d94:505c:5899? ([2001:8b0:aba:5f3c:e2d0:9d94:505c:5899])
        by smtp.gmail.com with ESMTPSA id h8-20020a05600c2ca800b003b4a699ce8esm16982222wmc.6.2022.11.08.14.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 14:59:50 -0800 (PST)
Message-ID: <53c48a9347a894fd991b4faf3bfb415ae3529830.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 46/48] python3: use the standard shell version
 of python3-config
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Date: Tue, 08 Nov 2022 22:59:48 +0000
In-Reply-To: <20221107145508.1051404-46-alex@linutronix.de>
References: <20221107145508.1051404-1-alex@linutronix.de>
	 <20221107145508.1051404-46-alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 22:59:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173003

On Mon, 2022-11-07 at 15:55 +0100, Alexander Kanavin wrote:
> =20
> +SYSROOT_PREPROCESS_FUNCS:append:class-target =3D " provide_target_config=
_script"
> +SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk =3D " provide_target_con=
fig_script"
> +
> +provide_target_config_script() {
> +        install -d ${SYSROOT_DESTDIR}${bindir}/
> +        install ${D}/${bindir}/python3-config ${SYSROOT_DESTDIR}${bindir=
}/
> +        install ${D}/${bindir}/python${PYTHON_MAJMIN}-config ${SYSROOT_D=
ESTDIR}${bindir}/
> +}
> +
> +
>  SSTATE_SCAN_FILES +=3D "Makefile _sysconfigdata.py"
>  SSTATE_HASHEQUIV_FILEMAP =3D " \
>      populate_sysroot:*/lib*/python3*/_sysconfigdata*.py:${TMPDIR} \

This made me wonder if we shouldn't have a better way of handling this.
I was wondering if we should have a sysroot_stage_file function (like
sysroot_stage_dir) and then we could do something like:

sysroot_stage_all:append() {
	sysroot_stage_file ${D}/${bindir}/python3-config ${SYSROOT_DESTDIR}/${bind=
ir}/python3-config
}

Note that the sysroot code plays with hardlinks for efficiency, I
appreciate one file doesn't really matter though.

I was hoping we could have just added to SYSROOT_DIRS but that does
only handle dirs, not files.

Cheers,

Richard

