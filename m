Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293C2C83030
	for <webhook@archiver.kernel.org>; Sat,  5 Jul 2025 16:08:05 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.20176.1751731681114405177
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Jul 2025 09:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OWM5Wucb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a575a988f9so1057460f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Jul 2025 09:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751731679; x=1752336479; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AONNhPXQgWesaUBLxBw+M14Q1s4bX8VQapKMfE7WY0M=;
        b=OWM5WucbgjFB06UOXIINgW0Jyiu14Wm+w/nuy1tjfPSDpZWUI4R2+T5DvlZDesnfm3
         Np3OvkRMz4G9kEi9Nj9txSxTQQjKSnsaBoPDY94HR3BQamE+62Xj5F2xqwdRdbHyAKqr
         C180dBqrTcZa7Vsrb00/k7wdsO1Cy5aN0YoXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731679; x=1752336479;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AONNhPXQgWesaUBLxBw+M14Q1s4bX8VQapKMfE7WY0M=;
        b=JVwZyzR5yVhfqOE+XfNp5uxKw/8AYSDLhJ+lbgOrH2pIKAaTN75hMItyDePNcg0OUM
         4iR5a99F4zJxSOX5zsXj0Ri+OAo5JjA3OatmWCg8MxJTAHmlNwJl5g9d+ZmmgDzwOC2O
         2gj/l9t9IN4wxryo4weAoT9IYfWTAVgsKyKN3Fq3p8pwg4B7u5Yw5xRfwn8T/uJjRUI6
         BhcbX4nHxAISMaFCRqdgIwXNNIRB42i66JucP/i9paRoVUVzn/wBov7OnKBVu02tyjFq
         muFPvZ5S3Z7DMNL+HtShfmqdOVtJ30GKXVLpq8euZTTL5hE8/aepYrFPgOgw+2Rz24bx
         Gdlg==
X-Forwarded-Encrypted: i=1; AJvYcCXOzJWWcZMYRsoU2CYYRfyU4zlk1tyL1jmyI9MXbd5+qKiwgDKVHgXSDXMtm+yWU5grNgh10PQdvW50KQkpO1ID1w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy/zL4wxs+qngbs/t6Rc9QXR1f12mzl41V8/9HUuUo4S2eqIeNk
	3Q+95AzAV/ck2UKDp1oAqaa4Y79iUCX3b4tJ71B8u/2veFcFJRc6Gj/RsArxpB+7wv4=
X-Gm-Gg: ASbGncvqut9RV6FVAhCMwKkxF3ipGXbDchoeCVTuTmlWAUZLC1ck86PT0NbKJ3j8a/l
	rlfK0fJNPo3OSmpcqfgMKV0nUQGF+LKLPAqUxqoYgjT93zqrD+Ud92G4u2TDoTm4zG+KkXHOmqt
	Vzj5MpdlsRkaKi1dd3bZN7BSqdY4ekznO+Dva7c9UQMxglk23bndi20zgC6N8i7w6rwMuYvJyTJ
	jp5rZCSK8Q+BXyaYEs2okPT+PXbhCWWNrjSxzcSDNRwBiYEm185XfKivsHavKWXO4TtKYrVrIQ1
	64Bs7KXpoVwGBbaQ9feLl7EPRZCKgSn2WEH2CzlK91UBug+dmfwzoMIwIXPZzOFUqNLRK1i3P2C
	/Oy6JkVMPuprJZMLzt9rSm4jgXgyOZRVD0I3gi8E+3eyV6AYV3gHRBj7P9b3hNg==
X-Google-Smtp-Source: AGHT+IHK6n8J9IcWrMndxwztNTUOSs5WB4tThbrIr5fypsiec11RAzEpmld1P+FNLzHm19fSaju6bA==
X-Received: by 2002:a5d:5e8c:0:b0:3a5:8cc2:a4a1 with SMTP id ffacd0b85a97d-3b49aa7dc52mr2326287f8f.39.1751731679562;
        Sat, 05 Jul 2025 09:07:59 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:44e5:6183:e700:8e38? ([2001:8b0:aba:5f3c:44e5:6183:e700:8e38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bced0esm86675675e9.22.2025.07.05.09.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:07:58 -0700 (PDT)
Message-ID: <c8c8d7d7c90d6b8113ce7b292bda403053bb267c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 3/5] testexport.bbclass oe-test: capture
 all tests and data from all layers
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Sat, 05 Jul 2025 17:07:57 +0100
In-Reply-To: <20250702072516.1075450-3-mikko.rapeli@linaro.org>
References: <20250702072516.1075450-1-mikko.rapeli@linaro.org>
	 <20250702072516.1075450-3-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Jul 2025 16:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219955

On Wed, 2025-07-02 at 10:25 +0300, Mikko Rapeli via
lists.openembedded.org wrote:
>=20
> -import os
> -import sys
> =C2=A0import argparse
> +import glob
> =C2=A0import logging
> +import os
> +import sys
> =C2=A0
> =C2=A0scripts_path =3D os.path.dirname(os.path.realpath(__file__))
> -lib_path =3D scripts_path + '/lib'
> -sys.path =3D sys.path + [lib_path]
> +lib_path =3D os.path.join(scripts_path, 'lib')
> +sys.path.append(lib_path)
> +meta_lib_paths =3D glob.glob(scripts_path + '/*/lib',
> root_dir=3Dscripts_path, recursive=3DTrue)
> +for p in meta_lib_paths:
> +=C2=A0=C2=A0=C2=A0 sys.path.append(p)
> =C2=A0import argparse_oe
> =C2=A0import scriptutils
> =C2=A0
>=20

This assumes python 3.10 which we can't quite do yet:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1850

Cheers,

Richard

