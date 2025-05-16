Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E22DC3ABDD
	for <webhook@archiver.kernel.org>; Fri, 16 May 2025 06:17:03 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.7173.1747376216976943616
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 23:16:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Tuv7ljis;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442ed8a275fso19450675e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 23:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747376215; x=1747981015; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FADl/SNKUyjamxjMHsU9+XPubphOjN5g4sYGuzbkCo=;
        b=Tuv7ljisVdc5vXLsmUyqRjFABcdjVYmCFLzRfzYCEv5xAgI9ysHLqyfBNe/GFqROEu
         ev+qxDmOpkkJ9ZmvwaqQgtQa9DwLEYFSVVXVK6R68NYjlxotzB5GCdpKWK2qAORyTGeG
         Z7WpMWUsineWXwLkZvpFUfVLyJrD3m8VZy8J8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747376215; x=1747981015;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6FADl/SNKUyjamxjMHsU9+XPubphOjN5g4sYGuzbkCo=;
        b=WiwI3xfSwWN+JCmdsmIkhB5yXZyzISOwdVY1QZynJ70WILB5m+8uPkcT1BosBslmhJ
         lbVXiebdiHn4AEACwYxZgdcptphQ7UVkoYZgV64JznmWOev9a+3J2ktTc3bqG5UmkNKA
         4Y1pX4oEGt1Nd1/Gbe/GyDC/WwhWyGRYDAa27nstvolxHM1Ppv2k1PrdtfEF8BUTphA4
         s8ECnAUYkndYyKDyBuxmEoU8RnAmipjYnTyASVPAtNEC7wRhUImb42H5a+QG9INnQvCX
         D+YT+rWxeRkhfs0am4hC5ZcLIYAiyC5jJxSmrKfJQW0ZyG3uu2PrIKUvEKTyrVaQq/pA
         9ROg==
X-Forwarded-Encrypted: i=1; AJvYcCWZazFbEdvusaCL5xgIxrvv9L8zE3zUy7Xc8p5o+GlrAXUKDxjzZOXAh1JXxtpvgy86NWnBPHEf1ttqaah6XgeDkQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxdka7g5UHgQSyC3q4iBT2wf5zi+7LmMrG4j+p/ZMuKhoE3Yrc3
	h4pfrDa5p/IP/O15qZ6v0TNWLXXPWWS2B7LrDtUXwubd7gTNTfX2LrNBkFi5F87Glys=
X-Gm-Gg: ASbGncsYLnfHNcA94SvSYL5TycZw7wxLNozX2np8NwEbITbKsF1M7VLTij9lhBpzT6y
	JnnH3fFW06OxBP4KFqjwNtXVftL7MMrWw4bCDqCBs4feu91wgMpuaabJESeyDgxiYnReSyrDafO
	B9DJroNp+MQGYvUE1gbSkff1zr7k0SLzU56xkdDCP/dlUVUhKp9t6ftZ6UkzShr+TcHpbIw9dBG
	kZHoB+1hPfj0Zt1+Ya6YvYoLkD1KFybgXQRwu9CzvRJUj75Mst9OxtCUTm6CB42XZTQAMlxzmSF
	ZvhKedq4lNFQCBmEpYB3OvI9uxr9QssCpUBsSVITv1U+REn8bCrProhHaYWVSjiOvsX0eEbjrRi
	Xv4afAZb9qOyKBIyccUoQb33kxfY8vTZYpf7IuEOs
X-Google-Smtp-Source: AGHT+IGOrfGNg+UgBgvnYIKcvIDd/wQgvfOuB1VA+rD1wvlGZx5ODR3psJ0Jz75KV0YJ975hu+S37A==
X-Received: by 2002:a05:600c:1d07:b0:43c:e70d:450c with SMTP id 5b1f17b1804b1-442fd664797mr14215915e9.22.1747376215105;
        Thu, 15 May 2025 23:16:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fa4b:a3c2:43a9:a562? ([2001:8b0:aba:5f3c:fa4b:a3c2:43a9:a562])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a3622b8a3esm585249f8f.14.2025.05.15.23.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 23:16:54 -0700 (PDT)
Message-ID: <6ef2eeba0eae48ec4c869e4aa22956dbd62888e2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/5] perl-ptest: include gcc as a recommended
 package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: rajendra.desai@emerson.com, openembedded-core@lists.openembedded.org
Date: Fri, 16 May 2025 07:16:52 +0100
In-Reply-To: <20250515165010.242349-2-rajendra.desai@emerson.com>
References: <20250515165010.242349-1-rajendra.desai@emerson.com>
	 <20250515165010.242349-2-rajendra.desai@emerson.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 May 2025 06:17:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216721

On Thu, 2025-05-15 at 22:20 +0530, Rajendra Desai via lists.openembedded.or=
g wrote:
> The following perl ptests:
>=20
> dist/ExtUtils-ParseXS/t/001-basic
> dist/ExtUtils-ParseXS/t/002-more
> dist/ExtUtils-ParseXS/t/003-usage
>=20
> are giving out below warning while running on the yocto CI build:
> Can't exec "x86_64-poky-linux-gcc": No such file or directory at
> /usr/lib/perl/ptest/dist/ExtUtils-ParseXS/../../lib/ExtUtils/CBuilder/Bas=
e.pm
> line 362.
>=20
> additionally, 2 of the tests are skipping out:
> SKIP: cpan/ExtUtils-Constant/t/Constant
> SKIP: cpan/ExtUtils-MakeMaker/t/02-xsdynamic
>=20
> This is mainly due to a missing gcc dependency which is needed by
> the above tests. Hence, adding the package under RRECOMMENDS to
> make sure the tests are able to find the compiler and that the
> tests do not skip or output the missing file or directory warning.
>=20
> Signed-off-by: Rajendra Desai <rajendra.desai@emerson.com>
> ---
> =C2=A0meta/recipes-devtools/perl/perl-ptest.inc | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-devtools/perl/perl-ptest.inc b/meta/recipes-dev=
tools/perl/perl-ptest.inc
> index 4b4756118c..817ad401f4 100644
> --- a/meta/recipes-devtools/perl/perl-ptest.inc
> +++ b/meta/recipes-devtools/perl/perl-ptest.inc
> @@ -60,6 +60,7 @@ python populate_packages:prepend() {
> =C2=A0}
> =C2=A0
> =C2=A0RDEPENDS:${PN}-ptest +=3D "${PN}-modules ${PN}-doc sed procps-ps"
> +RRECOMMENDS:${PN}-ptest +=3D "gcc"
> =C2=A0
> =C2=A0# The perl-ptest package contains Perl internal modules and generat=
ing file
> =C2=A0# dependencies for it causes problems.

We've avoided doing this as there are key elements of a build that
require perl and this means those builds will now build gcc. It
effectively means that even small images will end up building target
toolchain tools. I'm not sure that is what people want, even if it does
come at the price of a small number of skipped ptests.

We should perhaps comment this in the recipe through so people know
we've considered it.

Cheers,

Richard

