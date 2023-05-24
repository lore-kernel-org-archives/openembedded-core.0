Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FBEDC77B7A
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 15:53:43 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.781.1684943617372336656
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 08:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=dPbWVFnD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f611ccd06eso8917885e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 08:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1684943615; x=1687535615;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j9GQZjfWlRm7QocDSmdGM87oMHwd4DjYJUhyPWforq8=;
        b=dPbWVFnD2UkuVOK7NyglnmZeTgKVn+D50NwefVsk6/393l4MjMWAAuwI9+f1Gitm/U
         PRlboj9zfKcYo+Iv++fP16VwA4/AQzYbFc4di+Avb5uwndnhgzB5dJwkx+M4JRmPZZ/E
         UbRr0e3bU4AtOJ3n8BaPFCDfAc2HsD/1mfej8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684943615; x=1687535615;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j9GQZjfWlRm7QocDSmdGM87oMHwd4DjYJUhyPWforq8=;
        b=gCnihHORYDpKUif41fGsRaKFNRO3F0FnzD+d4JN75qU0ZJdQCz5dUOdELkoHSt7qyb
         aKpKyBAqW7b3qvgrIXWKpzCV5/h0BuCFv5Z111erHzjpOq7WTi6685efRkB//Vt5hXlJ
         cCIHX2UHjB/WYLV9N8wU079Sal7TvoOAsadP4AnPlb31yl2dpfFFsbmJFup49IbTfM6E
         e+wCXQ5NTLo0KJu/6r8TakPG0H0Ysvj7yBnOwkluEtwhriKn/dmOSoymgSejBP5DYvuf
         SWZeX6OF2/F5QrDYGAH05JJCz7vK/JP4HKmzH7Vki6RvLqfIIZPU6AUwRum8m7GW5R30
         nv9w==
X-Gm-Message-State: AC+VfDxvvwaeEpoBYQPDheBUe36k/M9P/sVKgT7VrPqC4UqkKmTf/3Mg
	tlRyWI9h81QHsLnp+Nq8zFHl/A==
X-Google-Smtp-Source: ACHHUZ7IZ+1mVHb14r0n1Zhd+67pvZz0CXIbZgC92Nj57yB+/FLTuPhsQcbvAdC2lklpddovlMi/rA==
X-Received: by 2002:adf:f448:0:b0:309:4123:4968 with SMTP id f8-20020adff448000000b0030941234968mr177198wrp.13.1684943615597;
        Wed, 24 May 2023 08:53:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e50f:20dd:d0e2:cad5? ([2001:8b0:aba:5f3c:e50f:20dd:d0e2:cad5])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d5950000000b003077a19cf75sm14905601wri.60.2023.05.24.08.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 08:53:35 -0700 (PDT)
Message-ID: <80dcddef37fe30615da08c72a266936ee5e106bf.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cpio: respect MLPREFIX for PACKAGE_WRITE_DEPS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>, "Martin.Jansa@gmail.com"
	 <Martin.Jansa@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 24 May 2023 16:53:34 +0100
In-Reply-To: <774CA448-E912-446F-8D97-0406FC2452EA@arm.com>
References: <20230524105631.517832-1-Martin.Jansa@gmail.com>
	 <774CA448-E912-446F-8D97-0406FC2452EA@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 15:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181686

On Wed, 2023-05-24 at 15:38 +0000, Ross Burton wrote:
> On 24 May 2023, at 11:56, Martin Jansa via lists.openembedded.org <Martin=
.Jansa=3Dgmail.com@lists.openembedded.org> wrote:
> >=20
> > * unlike DEPENDS/RDEPENDS the PACKAGE_WRITE_DEPS dependency isn't autom=
atically
> >  extended with MLPREFIX, causing lib32-cpio to depend on 64bit ptest-ru=
nner (and
> >  all its deps)
>=20
> Sounds like the fix should be in the ml extension code, not the recipes?

There are limits to how complex we want to make that code so a prefix
here probably isn't a bad thing. The nativesdk error is a bit worrying
for other reasons though :/

Cheers,

Richard

