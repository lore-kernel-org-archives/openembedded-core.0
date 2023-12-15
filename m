Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33813C35274
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 22:48:55 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.1279.1702680533833738245
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 14:48:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e7KsF37c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33642523623so1012982f8f.2
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 14:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702680532; x=1703285332; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Qtc/ZDlIMuYWjje7LJ0cu4n+Gb9Bapk/KhWDJqs/Xfc=;
        b=e7KsF37cPJcz66MsyXJH0/EEmYYJkFS0CvgX/nH4mYQGbEPBHPZNOXLm22PSwlJcvJ
         IaHQYJRxr4vGNwPi3ZRMcGmiee6ZEGkyNd69sTm6cKI7u3AnBD4r+XqktcMJRLKQIRfA
         cxl69q5W/O38CzrVWzQnMl4DOIDu4igFfVh3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702680532; x=1703285332;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qtc/ZDlIMuYWjje7LJ0cu4n+Gb9Bapk/KhWDJqs/Xfc=;
        b=ev4ZnCAaPY88zkeybHYN6yQHbLwldEQlqjftufEit8daauqmqxaNZv8UxU7jrs26TB
         0FdecHjiQEnUtTkJVr6Uzn4KJFfI3MXfz0fQ0bbntz0sz2cT1OhoEPxho2vjjZzmVaUA
         YiA9UUsF9I9FwHtYSiYraOYcufOE2wSO/JKf8rqxlI4SSaK+IEtcp5pfMnguaODpdA5W
         6TOnMSmcJn9geNc41dLf5MhmMoGoLQHRqXeatO02e+YoSO3LNz3gD8i171uniO5hNh4M
         uUaC/bdGI/bB6Te77TNaED2XMfqpYHS2A1F9EVgNpGIzRLDLfleAI59VMC0a3Nke36TF
         iIlA==
X-Gm-Message-State: AOJu0YxcMnXdfWJD1NSfCrqk5QmSldqYFnxOLRJcGLQc+KH3nODG1Yvf
	jaoOC7DuZIod7ucCBJXFismdgQ==
X-Google-Smtp-Source: AGHT+IHG9EreUjKa8WmEozI2fazRr29ZZXLA6xvmr/e5RCwv159UvTV5wSaiLgQVh6X9JmEyxLe7VA==
X-Received: by 2002:a05:6000:ccf:b0:333:4c30:dae4 with SMTP id dq15-20020a0560000ccf00b003334c30dae4mr5469965wrb.45.1702680532308;
        Fri, 15 Dec 2023 14:48:52 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fec1:d6ff:46af:def5? ([2001:8b0:aba:5f3c:fec1:d6ff:46af:def5])
        by smtp.gmail.com with ESMTPSA id o16-20020a5d6850000000b0033332df65absm19952628wrw.50.2023.12.15.14.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 14:48:51 -0800 (PST)
Message-ID: <7c7052bbd533d3357b9c679736b7c40985a6b227.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] ipk: Switch to using zstd compression
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <JPEWhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com, raj.khem@gmail.com
Date: Fri, 15 Dec 2023 22:48:51 +0000
In-Reply-To: <20231215205140.2948964-1-JPEWhacker@gmail.com>
References: <20231215205140.2948964-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 22:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192550

On Fri, 2023-12-15 at 13:51 -0700, Joshua Watt wrote:
>=20
> @@ -337,7 +335,7 @@ CONVERSION_CMD:lz4 =3D "lz4 -9 -z -l ${IMAGE_NAME}.${=
type} ${IMAGE_NAME}.${type}.l
>  CONVERSION_CMD:lzo =3D "lzop -9 ${IMAGE_NAME}.${type}"
>  CONVERSION_CMD:zip =3D "zip ${ZIP_COMPRESSION_LEVEL} ${IMAGE_NAME}.${typ=
e}.zip ${IMAGE_NAME}.${type}"
>  CONVERSION_CMD:7zip =3D "7za a -mx=3D${7ZIP_COMPRESSION_LEVEL} -mm=3D${7=
ZIP_COMPRESSION_METHOD} ${IMAGE_NAME}.${type}.${7ZIP_EXTENSION} ${IMAGE_NAM=
E}.${type}"
> -CONVERSION_CMD:zst =3D "zstd -f -k -T0 -c ${ZSTD_COMPRESSION_LEVEL} ${IM=
AGE_NAME}.${type} > ${IMAGE_NAME}.${type}.zst"
> +CONVERSION_CMD:zst =3D "zstd -f -k -c ${ZSTD_DEFAULTS} ${IMAGE_NAME}.${t=
ype} > ${IMAGE_NAME}.${type}.zst"
>  CONVERSION_CMD:sum =3D "sumtool -i ${IMAGE_NAME}.${type} -o ${IMAGE_NAME=
}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
>  CONVERSION_CMD:md5sum =3D "md5sum ${IMAGE_NAME}.${type} > ${IMAGE_NAME}.=
${type}.md5sum"
>  CONVERSION_CMD:sha1sum =3D "sha1sum ${IMAGE_NAME}.${type} > ${IMAGE_NAME=
}.${type}.sha1sum"
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 55166d01784..4b1fe28c85a 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -878,6 +878,10 @@ XZ_DEFAULTS[vardepsexclude] +=3D "XZ_MEMLIMIT XZ_THR=
EADS"
>  ZSTD_THREADS ?=3D "${@oe.utils.cpu_count(at_least=3D2)}"
>  ZSTD_THREADS[vardepvalue] =3D "1"
> =20
> +ZSTD_COMPRESSION_LEVEL ?=3D "-3"
> +ZSTD_DEFAULTS ?=3D "--threads=3D${ZSTD_THREADS} ${ZSTD_COMPRESSION_LEVEL=
}"
> +ZSTD_DEFAULTS[vardepsexclude] =3D "ZSTD_COMPRESSION_LEVEL ZSTD_THREADS"
> +

Threads, sure but the compression level does change the output...

Cheers,

Richard

