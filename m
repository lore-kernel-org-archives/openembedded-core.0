Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA901C02198
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 14:27:22 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.9655.1739024834694042734
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Feb 2025 06:27:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=R1t1DHTO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso1487449f8f.3
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 06:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739024833; x=1739629633; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C++RIAhy3xHY7Iu/cFf0ziOecw/uoS6k7J86MRqINMU=;
        b=R1t1DHTONHYB9Pmd5QNrD582rDlOJqqmr3JjpjA7myObMR+m7SqKOtCDCQorqQhvuy
         GZKcOcvameYY/RqQG/QgsZbgrTWKhkOdQ/6wxxuvXk2Id88v5elLgzvr+Mvd6pR94/u4
         Clu+k8tEDCXVA4njsiX637EBTErQVf8li3iP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739024833; x=1739629633;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C++RIAhy3xHY7Iu/cFf0ziOecw/uoS6k7J86MRqINMU=;
        b=G8jvVUXmQ6cCRwORnJ6ooeuVKOq11Yn48IOY6zYiNh37KAriHU4q117t1aaBhlp9YT
         12/Dlfa5qDktRhTwMbtft36Ce6tyFKxpWsFNlRE4Wa1N6h92K2/7d7ZyNGAQuFXKMaJc
         8kJJqqx8832aJVvIHjfi0A6b4hKT8i+5whtWc4cB8pZ3+HRtq9K8FmOGGfgjXPkxXo1q
         rmzWZWMRr1nw8O+uplZWzinU7sst1Elzk3HR9W4bk19wpFYbo8a+M6TVkgieNzAe3KZX
         eCYAILiZa4W6sbL8zkv3bAu7qu0bO5RieTeQ94rhRr8+thjdvd1Xf5KWHcHWeMdaVh3W
         de8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7rT+grLul1z4F34HnXd/vKS4w8LTh09TfkSRfVFI2/4Dqjq52oit6pkVruPDVZsM0Yaozuxnh/NNLU6itC2Sy/w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwBNwp3ch4nOoZuU8DcJb+x60LeOxe5pDMLIvP9o2Dc43fV0AKD
	GcJd2wEpnWQ8IpjJUaf/XRwENtkx9bcRDJ7/hJNgx1b/S0nEkimNb3sAvoe9Gk8=
X-Gm-Gg: ASbGncvrl9+Hv41qkttETjWowQL/IpNSUDyHfwsWAhEqr/Ddgv/290tg/1TWXGnEF/W
	d989L249rQHdBfB28755AlyQVQy7UfMUIq2jMJlvTeMjWTNnlnCYiKG0EaRvcPMlqZi4+nvirDW
	Ss5wIE8/1RBv1Gs7r6+TzfUWICRF+dLhirVnywmgPLO0oYRyORAO958jqq/2LuTTP8P28SMI6Xw
	AJALUIacTcXK0Z9AhcgByhlny3I8TAZQVwOcqMQrIVaB1N08NIuGAdh73MN7p1oldzZE1NAH3xj
	rr9vsJP9I7JXwKxFUzu4UYIV6CZnBJpHWm3+9zCDH6MkigrM/PbRXA9TTkoZELstXtHXF0J8PA0
	fT5OG
X-Google-Smtp-Source: AGHT+IFyRRQzlmAV+dt93ZVBFRozkRtTRCUDsOighbheCi6ljUGOkTR9KC+IxGppzfNSjVsIEBepKw==
X-Received: by 2002:a5d:64ce:0:b0:386:366d:5d03 with SMTP id ffacd0b85a97d-38dc8dc1461mr5568453f8f.16.1739024832875;
        Sat, 08 Feb 2025 06:27:12 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1b4e:9b51:38ac:64cf? ([2001:8b0:aba:5f3c:1b4e:9b51:38ac:64cf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43907f6741esm81530085e9.3.2025.02.08.06.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 06:27:11 -0800 (PST)
Message-ID: <56d49621808fc61f0dec8c739d6870cb00083f19.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] curl: upgrade 8.11.1 -> 8.12.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.marko@siemens.com, openembedded-core@lists.openembedded.org
Date: Sat, 08 Feb 2025 14:27:10 +0000
In-Reply-To: <20250207202537.2137371-1-peter.marko@siemens.com>
References: <20250207202537.2137371-1-peter.marko@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 14:27:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211037

On Fri, 2025-02-07 at 21:25 +0100, Peter Marko via lists.openembedded.org w=
rote:
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Solves CVE-2025-0167, CVE-2025-0665 and CVE-2025-0725.
>=20
> License-Update: copyright year refreshed
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
> =C2=A0meta/recipes-support/curl/{curl_8.11.1.bb =3D> curl_8.12.0.bb} | 4 =
++--
> =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
> =C2=A0rename meta/recipes-support/curl/{curl_8.11.1.bb =3D> curl_8.12.0.b=
b} (97%)
>=20
> diff --git a/meta/recipes-support/curl/curl_8.11.1.bb b/meta/recipes-supp=
ort/curl/curl_8.12.0.bb
> similarity index 97%
> rename from meta/recipes-support/curl/curl_8.11.1.bb
> rename to meta/recipes-support/curl/curl_8.12.0.bb
> index b4d80e9643..0d9457db93 100644
> --- a/meta/recipes-support/curl/curl_8.11.1.bb
> +++ b/meta/recipes-support/curl/curl_8.12.0.bb
> @@ -7,7 +7,7 @@ HOMEPAGE =3D "https://curl.se/"
> =C2=A0BUGTRACKER =3D "https://github.com/curl/curl/issues"
> =C2=A0SECTION =3D "console/network"
> =C2=A0LICENSE =3D "curl"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Deed2e5088e1ac619c9a1c747da291=
d75"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D72f4e9890e99e68d77b7e40703d78=
9b8"
> =C2=A0
> =C2=A0SRC_URI =3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0 https://curl.se/download/${BP}.tar.xz=C2=A0\
> @@ -15,7 +15,7 @@ SRC_URI =3D " \
> =C2=A0=C2=A0=C2=A0=C2=A0 file://disable-tests=C2=A0\
> =C2=A0=C2=A0=C2=A0=C2=A0 file://no-test-timeout.patch=C2=A0\
> =C2=A0"
> -SRC_URI[sha256sum] =3D "c7ca7db48b0909743eaef34250da02c19bc61d4f1dcedd66=
03f109409536ab56"
> +SRC_URI[sha256sum] =3D "9a4628c764be6b1a9909567c13e8e771041609df43b2158f=
cac4e05ea7097e5d"
> =C2=A0
> =C2=A0# Curl has used many names over the years...
> =C2=A0CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libc=
url:libcurl daniel_stenberg:curl"

Thanks for the upgrade. There does look to be a host search path issue on m=
ingw:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/7/builds/1003/step=
s/12/logs/stdio

Cheers,

Richard

