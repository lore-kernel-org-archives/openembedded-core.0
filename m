Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC94C3DA5D
	for <webhook@archiver.kernel.org>; Thu, 25 Jul 2024 09:00:25 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.32072.1721898016448555454
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jul 2024 02:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FLVt+8F/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42797289c8bso5187515e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 02:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721898014; x=1722502814; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbvRupdJ+AHrqtI196/Fhi0Yk6p5DX+Q/FQL2l0M2zM=;
        b=FLVt+8F/LviMdnvKPTf85z3eAQriybsrRo6cwjiuSCUg9hqt3rWvRDYnDXbf4ADaiU
         btujJZzLgsCS1DGuQDqDuhJAPBf04YudPTspTHe90dGPBG0lLURpwJTyKtCXT9vqk1Hv
         VjTp5Osv712aiW8S2DrL100Fld00xhWLWJqPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721898014; x=1722502814;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AbvRupdJ+AHrqtI196/Fhi0Yk6p5DX+Q/FQL2l0M2zM=;
        b=Sh48nO/GgIq3ZsJC1hml+5UwAmmEehY/47zPmg+QBvxkwBettYRqhBrWcsv0g8SCd5
         2C59etVflaG9+wo3oDZPdFM7fdg9rDAuquhppjK7iLokl33L2inHSh3YkgYSqGye3Y6E
         Lm3+TRXDjxFAs8wVTJ4ZMFMyYfC/xV6u+H4huhOIlny1lvWZ44cBcCWPbiUG1fQS0oSP
         ujPqxAltd/mCVKsUgjFpWK1DKFodaWkXp3cn4Io+oMfAcyBFBhx6Eeqdrkvmltqq2zpf
         vocaZSNPHIufAd5odlGTbkKuNSK6bfuMJzSal4L5t0PjLWdO5JCfTvPupgdXEsHKdR48
         hrwA==
X-Forwarded-Encrypted: i=1; AJvYcCWbbC6d5qyD06qwxlVYaHuO/3++17phA1cjCmFVZj1F/8DKimN8Wq81CcmI3fTBVUMjXzo8chFtqVyHUVG1bHd6WZEmJoudRZ79d3cys1jDAoWNSEzVGpHt
X-Gm-Message-State: AOJu0YzQ4vHo7HWcDWTg/x3IxHPTdL4OLHzQ0HZZB/TFNmOkdfArlzOE
	5MZl1+D5e7n7zNgVqycFMofnP+eoiLahBiVkd2fiZEGWSjrb1Nk/5AdM9PnXXiU=
X-Google-Smtp-Source: AGHT+IFUVaLy/NTR/+4I7T7OBhVXsPPVLyBGcE9wU/wzinpd5O25OwNwKqT79d9Ifv50ktjUQ9MEMw==
X-Received: by 2002:a05:600c:198c:b0:426:5f7d:addc with SMTP id 5b1f17b1804b1-42805749cebmr10072045e9.37.1721898012953;
        Thu, 25 Jul 2024 02:00:12 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:267:c2d:5abd:7ee6? ([2001:8b0:aba:5f3c:267:c2d:5abd:7ee6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36858229sm1429003f8f.82.2024.07.25.02.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 02:00:12 -0700 (PDT)
Message-ID: <18bb43d3ad691f5ff1ce5f3099f36373ba09fc25.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/4] ptest-packagelists: sort entries
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Date: Thu, 25 Jul 2024 10:00:11 +0100
In-Reply-To: <20240724160832.2384962-1-ross.burton@arm.com>
References: <20240724160832.2384962-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jul 2024 09:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202494

On Wed, 2024-07-24 at 17:08 +0100, Ross Burton via
lists.openembedded.org wrote:
> Sort the entries for OCD reasons.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
> =C2=A0meta/conf/distro/include/ptest-packagelists.inc | 15 ++++++++------=
-
> =C2=A01 file changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc
> b/meta/conf/distro/include/ptest-packagelists.inc
> index 5e90096b1e8..08a8d612048 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -28,22 +28,23 @@ PTESTS_FAST =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 json-c \
> =C2=A0=C2=A0=C2=A0=C2=A0 json-glib \
> =C2=A0=C2=A0=C2=A0=C2=A0 libconvert-asn1-perl \
> +=C2=A0=C2=A0=C2=A0 libexif \
> =C2=A0=C2=A0=C2=A0=C2=A0 libgpg-error\
> =C2=A0=C2=A0=C2=A0=C2=A0 libnl \
> =C2=A0=C2=A0=C2=A0=C2=A0 libpcre \
> =C2=A0=C2=A0=C2=A0=C2=A0 libssh2 \
> -=C2=A0=C2=A0=C2=A0 libtimedate-perl \
> =C2=A0=C2=A0=C2=A0=C2=A0 libtest-fatal-perl \
> =C2=A0=C2=A0=C2=A0=C2=A0 libtest-needs-perl \
> =C2=A0=C2=A0=C2=A0=C2=A0 libtest-warnings-perl \
> +=C2=A0=C2=A0=C2=A0 libtimedate-perl \
> =C2=A0=C2=A0=C2=A0=C2=A0 libtry-tiny-perl \
> =C2=A0=C2=A0=C2=A0=C2=A0 liburi-perl \
> =C2=A0=C2=A0=C2=A0=C2=A0 libusb1 \
> =C2=A0=C2=A0=C2=A0=C2=A0 libxml-namespacesupport-perl \
> -=C2=A0=C2=A0=C2=A0 libxml-perl \
> =C2=A0=C2=A0=C2=A0=C2=A0 libxml-parser-perl \
> -=C2=A0=C2=A0=C2=A0 libxml-sax-perl \
> +=C2=A0=C2=A0=C2=A0 libxml-perl \
> =C2=A0=C2=A0=C2=A0=C2=A0 libxml-sax-base-perl \
> +=C2=A0=C2=A0=C2=A0 libxml-sax-perl \
> =C2=A0=C2=A0=C2=A0=C2=A0 libxml-simple-perl \
> =C2=A0=C2=A0=C2=A0=C2=A0 libxml2 \
> =C2=A0=C2=A0=C2=A0=C2=A0 libxmlb \
> @@ -57,6 +58,7 @@ PTESTS_FAST =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0 python3-atomicwrites \
> =C2=A0=C2=A0=C2=A0=C2=A0 python3-attrs \
> =C2=A0=C2=A0=C2=A0=C2=A0 python3-bcrypt \
> +=C2=A0=C2=A0=C2=A0 python3-beartype \
> =C2=A0=C2=A0=C2=A0=C2=A0 python3-calver \
> =C2=A0=C2=A0=C2=A0=C2=A0 python3-hypothesis \
> =C2=A0=C2=A0=C2=A0=C2=A0 python3-jinja2 \

Where did beartype come from? That broke builds:

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6663

but I've a tweak on master-next I can squash in which the new test
build is running with. I'm guessing a local as yet unsent ptest
enablement!

Cheers,

Richard

