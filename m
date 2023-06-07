Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B747C77B7A
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 08:49:16 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.3775.1686127747746534769
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 01:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=SWn3H+EP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f6e1394060so59464255e9.3
        for <Openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 01:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686127746; x=1688719746;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eGxF6SetkGoaZ1TphBHDtQUxttJSyUfETW4zUNmSPS4=;
        b=SWn3H+EPw0fcQ9JsYa9sHZ2jFZwQiCCdSG8VBPgyOyN1itHgKhUnW5FcvJjTmBkc++
         dTOU2DOJsyPpsglqnkinJ2gUMXIXApvgq2YbTKRZ3KmsWwbnkyyBkJfOUB3IU4aFjwO6
         2+3FfiC7SU7IizTCOTNh5886KowQgu/Qm7DAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686127746; x=1688719746;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eGxF6SetkGoaZ1TphBHDtQUxttJSyUfETW4zUNmSPS4=;
        b=VYmkU6lEPHELh/5rGJEJ8cTAYfpV4qJgnaFNdcFRjwjNv6o3z0+NYvQd9L+gLdz4Bq
         yCGpVLU2MUXP82Azu8FIpXGQ4GnrkQIl07+A6fD9pOIIzFsBUjcJYVEOKq99ywiFY5w/
         Jw5FQe7QbgnpwKgiaBXd4WrPF4vbWbnamIzhhD1qXXwMk29wCwkmEcJaeIqicpDJ+pG6
         tIaa2NPTIPVMhVEVaHQrvJz/3zetCesZrWF3PgzMgMNIyWjIf+4RvJfw6fyXGYYb2WI9
         K9knWHowgcH59UMZEPGnVZmQV7Ju9vJDakWMHBDJO1Jmv2GShZZCEUAPnxq7oiMPTYql
         8uxg==
X-Gm-Message-State: AC+VfDz++5t7DTy1kRrjmwfg3lf1pY8QxPEpmU7isoIhPYHVknQsRq27
	cjn2wnQQrdcTp1ce0WwZqyOSCg==
X-Google-Smtp-Source: ACHHUZ40ABaluTQRZxKTFK2o/dLpjAe7wuNME1Yar8qCePSU8jOYglV8nlkolKAOVIenKPlelFCo4Q==
X-Received: by 2002:a05:600c:2904:b0:3f7:26f8:4cc0 with SMTP id i4-20020a05600c290400b003f726f84cc0mr3935389wmd.17.1686127745968;
        Wed, 07 Jun 2023 01:49:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:247f:a475:41f0:cfdc? ([2001:8b0:aba:5f3c:247f:a475:41f0:cfdc])
        by smtp.gmail.com with ESMTPSA id d10-20020a1c730a000000b003f42158288dsm1376763wmb.20.2023.06.07.01.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 01:49:05 -0700 (PDT)
Message-ID: <b8e4b45e013ed8fdfb2c6075336b388bb9904b7c.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v2 2/2] testimage: implement test artifacts
 retriever for failing tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: alexis.lothore@bootlin.com, Openembedded-core@lists.openembedded.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Date: Wed, 07 Jun 2023 09:49:04 +0100
In-Reply-To: <20230607083015.20760-3-alexis.lothore@bootlin.com>
References: <20230607083015.20760-1-alexis.lothore@bootlin.com>
	 <20230607083015.20760-3-alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 08:49:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182462

On Wed, 2023-06-07 at 10:30 +0200, Alexis Lothor=C3=A9 via
lists.openembedded.org wrote:
> Add a basic artifacts retrievers in testimage class which:
> - triggers when at least one runtime test fails but tests execution
>   encountered no major issue
> - reads a list of paths to retrieve from TESTIMAGE_FAILED_QA_ARTIFACTS
> - checks for artifacts presence on target
> - retrieve those files over scp thanks to existing ssh class
> - store those files in an "artifacts" directory in "tmp/log/oeqa/<image>"
>=20
> This implementation assumes that the SSH or Qemu target has run and
> finished gracefully. If tests do not finish because of an exception,
> artifacts will not be retrieved
>=20
> Bring partial solution to [YOCTO #14901]
>=20
> Signed-off-by: Alexis Lothor=C3=A9 <alexis.lothore@bootlin.com>
> ---
> Changes since v1:
> - only gather artifacts in nominal case (ie qemu runs without any raised
>   exception)
> - list artifacts directly in variable instead of using external file
> - use standard variables in artifacts paths
> - allow glob patterns usage in artifacts paths
> - expand/filter artifacts list on target before retrieving them
> - tune default artifacts list
> ---
>  meta/classes-recipe/testimage.bbclass | 49 +++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
>=20
> diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/=
testimage.bbclass
> index b48cd96575d2..c6ce74a9e7a8 100644
> --- a/meta/classes-recipe/testimage.bbclass
> +++ b/meta/classes-recipe/testimage.bbclass
> @@ -18,6 +18,16 @@ inherit image-artifact-names
> =20
>  TESTIMAGE_AUTO ??=3D "0"
> =20
> +# When any test fails, TESTIMAGE_FAILED_QA ARTIFACTS will be parsed and =
for
> +# each entry in it, if artifact pointed by path description exists on ta=
rget,
> +# it will be retrieved onto host
> +
> +TESTIMAGE_FAILED_QA_ARTIFACTS ??=3D "\
> +    ${localstatedir}/log \
> +    ${sysconfdir}/version \
> +    ${sysconfdir}/os-release \
> +    ${libdir}/*/ptest"

I know Alex Kanavin asked for this but I'm really not sure=20
${libdir}/*/ptest is a great idea. This will effectively copy the
entire ptest package files for every ptest on the image. Now we split
ptests to different images it is less of an issue but it is still
potentially rather large. Could we at least limit it to failing ptests?

Cheers,

Richard



