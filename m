Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D167D5B174
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 09:06:20 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.14712.1730192775774298176
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 02:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AvJRoZpF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so6347398e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 02:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730192774; x=1730797574; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlCDSUKJrYD4bniKYZPzQRXnnzIi4wv04HgnI9u+Gas=;
        b=AvJRoZpFrxby9dI8yCMbEwCWSCQBeU9s/1pRMVHP/yWQXXmK/xIZ0DDdoAjHk/Oemm
         sGMp1g7CeF87fPlJHupT8KtBvZ30SrD255+K38RHIwAFLOSNtNb1UatyXV6vYtGqTwrO
         6K2+iXRnwIYJOLwan9ACx4KCEQe1j29Tr0yjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730192774; x=1730797574;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qlCDSUKJrYD4bniKYZPzQRXnnzIi4wv04HgnI9u+Gas=;
        b=MkEMH+uOZ1kQdCKSxvRm7cRA1aa2/gPiL9PfgYKwu6RXevNaYz+ZTtfM8G56BgcSwW
         OpaXsr8uO2JFvkGxzxJNQm8eZEwqCWAb/ka4Kv8UUA6yg7wNdzRnYghMJ+uJKokLvwYZ
         iGFqFUNmLlvTtfRbX/D94midg22sHPMe7svF/LdAfKWVV4S3d3T7qal7DGMLACBCnYag
         8mBZM9znCGfe0lZFOFTwgX0VZ1/TOyODf8jRqzjMatzsTlhNI5RMafHKicb0uwvFJlMN
         L9fJ8AgjMqPPqK/VMMEX+jvK5Q0BjfMOHx4RVHsEJJe+o4q0tRn9NmwT8qP6egu6YwrL
         k6Og==
X-Forwarded-Encrypted: i=1; AJvYcCXrxTc0lJgkVpuFtJVoDsvpdGi3VTyV4oXbbBnUEolNCzpfC7tkqc8dObIzDzjeaQpc2W8lMJTG9tddSWZgT5Aiag==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzZc9v73Q5JFxuof3w4o5OComj0NIR9yQcgks7tjj2xxE5XjVYn
	72EgQfvaBfM3fEIGNv8ZARjLv2aARtjLCmKrn5WC0tStpYD6WTMbOvmrcgg8Mvk=
X-Google-Smtp-Source: AGHT+IGkADkOmfue1JwaoKNUoGtqzFFc48kslwizWBd5B2qaljxB0h3Fes+ZRKzHS2oQC8RXDDCiQw==
X-Received: by 2002:a05:6512:3096:b0:539:fb7f:6288 with SMTP id 2adb3069b0e04-53b348e8dfbmr4088027e87.35.1730192773844;
        Tue, 29 Oct 2024 02:06:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:aaf1:415e:4af0:f4a4? ([2001:8b0:aba:5f3c:aaf1:415e:4af0:f4a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b567e23sm166575715e9.25.2024.10.29.02.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 02:06:13 -0700 (PDT)
Message-ID: <f0d57e20bdf3d90e6c0ccd8ccfef6faf61bf45b0.camel@linuxfoundation.org>
Subject: Re: [OE-core] openssl environment variables
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rasmus.villemoes@prevas.dk, openembedded-core@lists.openembedded.org
Date: Tue, 29 Oct 2024 09:06:12 +0000
In-Reply-To: <87v7xbjn9b.fsf@prevas.dk>
References: <87v7xbjn9b.fsf@prevas.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 09:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206476

On Tue, 2024-10-29 at 10:01 +0100, Rasmus Villemoes via lists.openembedded.=
org wrote:
> I'm wondering if anybody has encountered this problem before, and if so,
> if there is a clean solution:
>=20
> When using openssl-native, there's machinery in place so that when
> openssl-the-binary is called, it's done through a wrapper script that
> sets
>=20
> OPENSSL_CONF
> SSL_CERT_DIR
> SSL_CERT_FILE
> OPENSSL_ENGINES
> OPENSSL_MODULES
>=20
> so that these point into the appropriate STAGING_DIR_NATIVE, and then
> invokes openssl.real.
>=20
> Similarly, when including nativesdk-openssl in the sdk, there's an env
> snippet installed that has the same effect when the sdk setup script is
> sourced.
>=20
> However, when the build involves some tool, say (uboot-)mkimage, which
> _links_ against libssl, no such env variables are automatically set
> up. This means that if one tries to do something like using a pkcs11
> engine, and has made sure that the appropriate pkcs11 .so file is
> available in sysroot-native, libssl still won't find it because it
> doesn't know to look in ${STAGING_DIR_NATIVE}/usr/lib/engines-3.
>=20
> I can of course define and export these variables myself in the recipe,
> or in a tiny openssl-env.bbclass helper class, but this feels like the
> sort of thing that the build system should take care of automatically,
> just as it already does for the openssl binary itself, and for the whole
> sdk environment. But I suppose that by the time dependency resolution
> has figured out that "hey, this recipe (transitively) depends on
> openssl-native", it's way too late to inject something that sets+exports
> these variables.

https://github.com/openssl/openssl/pull/19260

We realised we could only probably fix this properly with upstream
help. We haven't managed to have anyone work through the process enough
to get patches accepted though.

So yes, we're aware but we need someone with time to work on it.

Cheers,

Richard

