Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AFF2C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 07:12:37 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.5167.1721113948770126096
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jul 2024 00:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OmES71Kx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-427b9dcbb09so3248335e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 00:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721113947; x=1721718747; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yL3t4H3Ep1nrY5GbMqIc+eDJLR4FsQhSRRSOLeGwFJo=;
        b=OmES71Kx1+AphJsBUQ9Zgw4v9K3CsRdZNo4fxrHcyIv4bG2/FVZjsbZoDM5/rZhLiW
         vo9nRVo70/d2eqIZ7ZTrePrqjvBgWFmMx3PnL+8Mjr9NsZ6imKF+d8B7Xxhw/s2THk4h
         5XUv5fvlAhGZCqlAd6pzJpYpbypi4ttQDFBVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721113947; x=1721718747;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yL3t4H3Ep1nrY5GbMqIc+eDJLR4FsQhSRRSOLeGwFJo=;
        b=mJwjVvswbETC2KSVwpkG8JQw7+iVqpr7J7aBkkPxrVLlQUaNQg2As501ePty91xtDj
         DJytma9f0LAd9vSjiPwXkpclAcfK+BG9POklWm9s+tMgrR48vHu4InG74S7gJqRj5kJo
         SWCpTwATLuQbRJEQWkS5rVzJ5/Un9RuCYAckN9kaUOFeufJB3+JznNvIE0Rtf54iN0Tx
         FnrDWwCda4wY1bEF1QQhsfXKKAcanmaUmwsKSZgTlkFbe3PouGkyKc+DdWe5LxB2hxnS
         kMtnEkU29LhjtPtACS/OVoBcrBGt6tEaieojObDKa5ojFx7hnJ2bTTZAMK7f3l9IlWxq
         ZWAw==
X-Forwarded-Encrypted: i=1; AJvYcCXko9lGVUSJZCUJW2a8kjvuKm96dZKPydRyx7+a845AyY7FamTcRHj4TXe+X4TRqgwdEiUQOaSzX1y/xumMXVcNX9rb4UQv37dUIyD9Bq+I0jMzCO+Sk7Rz
X-Gm-Message-State: AOJu0Yyp0++1ReiT+xxQWTVLU8T8fKruMkcmnIGc0ZpJwHNP8DZsv2by
	zQJAW4o+Z2SX76QjPhwkKyC3xjjlDr4f64ANe3ovfWU+hpxtOifF0KfH1BnUOSQ=
X-Google-Smtp-Source: AGHT+IHPZas+Uvnt2UXyLMtVPQLQoatwkJRZzeiirhpitjpQyFsyRZS/l/ULwcspN4vTXQskdWFvdg==
X-Received: by 2002:a05:600c:470e:b0:426:6314:3336 with SMTP id 5b1f17b1804b1-427ba725da2mr7567505e9.36.1721113947129;
        Tue, 16 Jul 2024 00:12:27 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:86a0:3ee3:878:91c7? ([2001:8b0:aba:5f3c:86a0:3ee3:878:91c7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e7749esm112901945e9.2.2024.07.16.00.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 00:12:26 -0700 (PDT)
Message-ID: <725daf1938215f5228a29b272f446ad37d96d58e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] llvm: extend llvm-config reproducivility fix
 to all classes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: denis@denix.org, openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2024 08:12:25 +0100
In-Reply-To: <20240716013642.3050435-1-denis@denix.org>
References: <20240716013642.3050435-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 07:12:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202082

On Mon, 2024-07-15 at 21:36 -0400, Denys Dmytriyenko via
lists.openembedded.org wrote:
> It's not limited to "target", but also happens to e.g. nativesdk:
>=20
> ERROR: nativesdk-llvm-18.1.8-r0 do_package_qa: QA Issue: File
> /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-
> linux/usr/bin/llvm-config in package nativesdk-llvm contains
> reference to TMPDIR [buildpaths]
>=20
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
> =C2=A0meta/recipes-devtools/llvm/llvm_18.1.8.bb | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/llvm/llvm_18.1.8.bb
> b/meta/recipes-devtools/llvm/llvm_18.1.8.bb
> index 8dad952923..6afca9c7d7 100644
> --- a/meta/recipes-devtools/llvm/llvm_18.1.8.bb
> +++ b/meta/recipes-devtools/llvm/llvm_18.1.8.bb
> @@ -95,7 +95,7 @@ EXTRA_OECMAKE:append:class-nativesdk =3D "\
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> =C2=A0
> =C2=A0# patch out build host paths for reproducibility
> -do_compile:prepend:class-target() {
> +do_compile:prepend() {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i -e "s,${WORKDIR},=
,g" ${B}/tools/llvm-
> config/BuildVariables.inc
> =C2=A0}
> =C2=A0


Do we need those buildpaths in llvm-native?

Cheers,

Richard

