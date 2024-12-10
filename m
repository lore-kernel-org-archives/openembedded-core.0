Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DDFE7717F
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 21:53:57 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.5236.1733867633371579560
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 13:53:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HHPS9AzP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-434e69857d9so414265e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 13:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1733867631; x=1734472431; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MxBgBAg365i7wGMiSRomRiEh1ohXlreZNyI0ox6vQAE=;
        b=HHPS9AzPH8sak67q+IDe/zKukMVQRQKTDNOdnaE4GzMAD/HwJ/vvowVSRoUIzjXB15
         no50dcECVKabrtUw/PAV0fVte3ZfLbe5Hz9oSqpMAIh91E+9ffQMvIHPoArjNV55+uCF
         wkCqkX/oOuumJCsOvMiuRGHfyEHXPJsjbJeyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733867631; x=1734472431;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MxBgBAg365i7wGMiSRomRiEh1ohXlreZNyI0ox6vQAE=;
        b=aAtmsWHCXtdyleaR0sch8jMJwX8VAoPK6HuaJotu80xg9M357+a+lfnwL3TrtSHezH
         AnTK4U1FLz2tcwC3ZUupnjOG8swgCGLrgWuyHDMyMV2bromPa2egtf0UKGFHzoKihbik
         A3JrcwD7z5jxGBTXo8F/UWCCTmLU/jJvPvvx9wgpIangMpUoCjmZxauGh2rnklbNUKXR
         LnEDw18kbaJ5AcH+neh7m3loidE+MoQI29aV+X2JbV2XVHnKJ/J+d3VWJOhOvI0ta6LM
         ebN7TRbvZv0DsherD+t7hoLPnjH1VfvH/qI5PWGp/P3ov7Uzbz+yXmnazSPRjjznuif6
         L+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUHDjVyM1gJTXA+DLz1vvVV7SDSjOBeY5o2u/8I9Y6SJ/I2dQzOIXAZZ/DjangQP2uTE/Pue+t2hXUlA9MxAgA76w==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywb7ivpHJKRnFSumC3Nkejfth/wSQcsDfTL++PqkwcUFXd4UyL8
	+NS+4/OXs5cpZ1++EIlI9SYp1V8V8V48rvKoPzpJlDs+u/54BWlRwdLTiZYaqvs=
X-Gm-Gg: ASbGncvXkhzHBMpy1M0Lv23c9/vELpYtQKQlFd3UflQ9YwiQ1pnsoXHwWLeQYUkSLTX
	AjeDMiU1ppSmsIfnMYcJVtwC01xoiDC++noreEiFOLCEusxZQrHt+ZmR5Wk4xwb2IXXnRT16+iC
	QLY3rdcIil2985Ll1zFwNDonIf0MMQz0nK10zhN895upe03mlJzX1tHN/uLG57I/s4PJJasLpF7
	75rvOt1Nn+R0YYFmRc7+EagoFnYju3JVLgr4C6yd9kt3OIIxj270XRpwRwB5kRluAl0bYd2LWjV
	zE3BwBSrsanc7BTgF5xjR8kBOef9WrtKfBgbsKxyysY=
X-Google-Smtp-Source: AGHT+IF5n0Sgd5aGW/UuQkaC0d8GsxmX7CMIba6DLUIq/SkNZv3C2xgP6q8IJ/Eku0xJGZ9gnfuLDQ==
X-Received: by 2002:a05:600c:3226:b0:434:e65e:457b with SMTP id 5b1f17b1804b1-4361c58ee82mr2221145e9.3.1733867631444;
        Tue, 10 Dec 2024 13:53:51 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d1b6:218e:c6fb:2d33? ([2001:8b0:aba:5f3c:d1b6:218e:c6fb:2d33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-435017d724esm47396975e9.19.2024.12.10.13.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 13:53:50 -0800 (PST)
Message-ID: <9c3143ebb7f9e17cfbd318ef0e17994aae7264be.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: add lz4c to HOSTTOOLS_NONFATAL
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: jsbronder@cold-front.org, openembedded-core@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Date: Tue, 10 Dec 2024 21:53:48 +0000
In-Reply-To: <20241210151015.2450083-2-jsbronder@cold-front.org>
References: <20241210151015.2450083-2-jsbronder@cold-front.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Dec 2024 21:53:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208565

On Tue, 2024-12-10 at 10:10 -0500, Justin Bronder via lists.openembedded.or=
g wrote:
> Commit fe167e082cbde1c6d186ecdda531abef610ac2ac switched to requiring
> lz4 instead of lz4c which allows us to support distros dropping lz4c.
> However, it's only in the 6.13 kernel that CONFIG_KERNEL_LZ4 makes the
> switch from lz4c to lz4.=C2=A0 So we should continue to link lz4c if it's
> available to support older kernels.
>=20
> Signed-off-by: Justin Bronder <jsbronder@cold-front.org>
> ---
> =C2=A0meta/conf/bitbake.conf | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 1d2c2e0022..c7927d19a0 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -553,6 +553,9 @@ HOSTTOOLS_NONFATAL +=3D "gsutil"
> =C2=A0# Link to git-lfs if present
> =C2=A0HOSTTOOLS_NONFATAL +=3D "git-lfs"
> =C2=A0
> +# Link to lz4c if present, used by linux <6.13 with CONFIG_KERNEL_LZ4
> +HOSTTOOLS_NONFATAL +=3D "lz4c"
> +
> =C2=A0CCACHE ??=3D ""
> =C2=A0
> =C2=A0TOOLCHAIN_OPTIONS =3D " --sysroot=3D${STAGING_DIR_TARGET}"
>=20

The YP TSC chatted a bit about this. Personally, I'm a bit nervous as
this could make the builds a bit non-deterministic and allow the builds
to fail well into the build. We try to do that "up front" if and where
we can to make developers lives easier. This becomes more likely as
distros drop lz4c and releases age, i.e. we'll hit problems years down
the line.

I did have an idea for another potential solution which would be to put
a lz4c wrapper in the scripts/native-intercept directory which tweaks
the parameters and calls lz4.=C2=A0Could I convince someone to see if that
would work?

Cheers,

Richard






