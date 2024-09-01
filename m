Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01BA7C54FC6
	for <webhook@archiver.kernel.org>; Sun,  1 Sep 2024 10:55:40 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.13979.1725188131226611847
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Sep 2024 03:55:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MIwPPyGg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-371b97cfd6fso2258266f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 03:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1725188130; x=1725792930; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXSltH7WTTxdmsb3+96mOEqIt+EuWx43Y5KQvOk7X4k=;
        b=MIwPPyGgIrbRLFBZMvmnyqnUxkQph7hDNzuxAY5T4QXBMN6RCe+wWA60MeTf7dnkKm
         iQy/bwzghsBHjgjPPYO0bppJh/Rx7WV3r4fsB7cqlWNPsnBHNyCsfdeI1oucANCmdvxp
         xstx/mB2JeoRgDJlWAUJCZX+73mjYjXEfAMdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725188130; x=1725792930;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sXSltH7WTTxdmsb3+96mOEqIt+EuWx43Y5KQvOk7X4k=;
        b=bzhGiZYPJrNgGo3oOfAAqfbQ9AykaB4vABujios6Ai2w/FLSZqRdrsmc61LlN35MIt
         A/wwV1bJbV6q/kIAnunv6AxIh8kGmD2prUmP7KhDpDpmKTBiJTr1/dnW17Tl0QJzHsME
         Lc3IOlACFH6x0+wSZZr0KfmNkGd1oPv5kD5ERQlaQ2+Amzj2RjU5rG0I4EuIg4GbQYLO
         SeMpzdhdN+BomXWwJYA6/efDytYh6POgnj98CGrV6+HMEk3TQ+UKFkWAX3l2HByHNfAb
         iun+KR97t9hECpYJjHd/Z8wVAhqxKM+5Xjt4A2v7K4IznA4XUVF4rKDvCeoAXnNVfBEL
         QUmA==
X-Forwarded-Encrypted: i=1; AJvYcCUBxNocdniX+rzrYRrD/svyQoslv2Xb0zYV4WC80nKLuEQp2CVu26FioZhCU+qONDnGYLyl/fbBbOo4CR3iDZh4FQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwWXfmA5heLe7+0enlymv2+g6WUfSQZwhJ2cNNzY1RiUn454Gjy
	lsvBir6C6IOKxg9REQrSqEEKVoZpXAOrhuJsiX2vW15B03Q34FmaBZxzd3wouUCTB35VoqsnRHn
	/
X-Google-Smtp-Source: AGHT+IGbJMy083gY/jgF3A6gzDszKAJzKg+IbRZQJvK+k3t/OMFTC7FVIr7nrFuq1RXwZUVzQJdC4Q==
X-Received: by 2002:a5d:69cb:0:b0:374:be10:3eb7 with SMTP id ffacd0b85a97d-374be104023mr2317653f8f.38.1725188129550;
        Sun, 01 Sep 2024 03:55:29 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c6b5:7d2b:4127:f9f9? ([2001:8b0:aba:5f3c:c6b5:7d2b:4127:f9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c61a7f03sm1640499f8f.55.2024.09.01.03.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 03:55:29 -0700 (PDT)
Message-ID: <b7b2d9e74f400fb604c2f5976538b1f788dd50f0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] icu: Fix 'buildpaths' QA error
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: niko.mauno@vaisala.com, openembedded-core@lists.openembedded.org
Date: Sun, 01 Sep 2024 11:55:28 +0100
In-Reply-To: <20240831130113.34867-1-niko.mauno@vaisala.com>
References: <20240831130113.34867-1-niko.mauno@vaisala.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Sep 2024 10:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204043

On Sat, 2024-08-31 at 16:01 +0300, Niko Mauno via
lists.openembedded.org wrote:
> Add stripping of STAGING_DIR_NATIVE during target/nativesdk specific
> do_install, which mitigates following BitBake failure:
>=20
> =C2=A0 ERROR: icu-75-1-r0 do_package_qa: QA Issue: File
> /usr/lib/icu/75.1/pkgdata.inc in package icu-dev contains reference
> to TMPDIR [buildpaths]
> =C2=A0 ERROR: icu-75-1-r0 do_package_qa: Fatal QA errors were found,
> failing task.
>=20
> While doing so, we also drop HOSTTOOLS_DIR stripping, as it's value
> does not appear in the content of either file that are manipulated
> here.
>=20
> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> ---
> =C2=A0meta/recipes-support/icu/icu_75-1.bb | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)

Why aren't we seeing this issue in automated test?

Cheers,

Richard

