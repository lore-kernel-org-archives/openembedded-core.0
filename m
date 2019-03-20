Return-Path: <ruslan.bilovol@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 626CD6A441
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 02:26:25 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g12so984150wrm.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 19:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1S4LOhKrVpjdkwV9oCty5A5LIVbKzzyxir1axRonQ0M=;
	b=suKX6QhgbqsQLbxVVGX34w8yhMWIuQvLOv2Mrg8ZPzodAsnGWPhxuQny0stxPDo8dr
	EY0W5evIwwwlR1XynJPnBlpjS50LdMHnTwjbzWzwFIhpl5+ADkD4CNCZqsSCYjWZdbOn
	7xqFC7FgLcNCOHwbAXdtTlH+0MTfwYzmMIosyTKBsNREFtfi7J3Wx9WAO+MG2iJd1tYw
	KKz2WHZj8DOZLfQTWHGzDwWxD40bn7y9RXQiDmSZ5hB+Dwb+KQSqm/BYiyzbpLgjAdlx
	C1h/QICAq3wG1d+K6dWqEUiUPf9CndCt8o1Wd3O8QFjqOhCs4QFmrK2CgZrej1WuMHtV
	d/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1S4LOhKrVpjdkwV9oCty5A5LIVbKzzyxir1axRonQ0M=;
	b=GUR/Zei73DQfG+apy+tjGxR0Cu6rqXpZR4JfyXZaVWzpWUcsMXW5vOQ+WTL/Xieeen
	SU1kBFYatV98O9LePLI0hxinBvZnw8u/SK8rTZlnQ6OEtaFaGDyExJwofLNWaO0HymcH
	a/mdF4KGqB0l0PmFZadbwaOPHtMPSLiVN+Co9gzYcT5vlzvVyfbFCq/AjKroDM6QNCQP
	bg8JLplQ9lHVU2Cwy4djiVv0xeyHyMNUoTGHVb9PHvmakJyBBVwh7N0VlR8w6GOo3tm4
	mRWzNrpFQ6Nvopl7wB4RYK4g5soX1A6A2ebYfnse8bI/QarHWtZqQHZs2QI8SK1W8JyN
	PTUg==
X-Gm-Message-State: APjAAAUKPJZcPFaa+DmPsbiQtpqaQW2WsOfn1uM+Fj+j7Lf70n73S3hy
	v1rmR5EMbLtydMewEFKkkTl9YyWQ6v8ny78E764=
X-Google-Smtp-Source: APXvYqwCkoB/Z7yZoGU+mTlmP/mvKhHO83rlHBb3Oe0EbPF/KtGyap4nq2vB3zCVZ+MqO1tbj4XnIQZaNqT37LROnh4=
X-Received: by 2002:a5d:5192:: with SMTP id k18mr4746016wrv.171.1553048785756; 
	Tue, 19 Mar 2019 19:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190215160356.9764-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20190215160356.9764-1-richard.purdie@linuxfoundation.org>
From: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Date: Wed, 20 Mar 2019 04:26:15 +0200
Message-ID: <CAB=otbSLUR7WhkZmB2GVycHs=iqT7HGhB9__J19pMNwFkbfyvg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] target-sdk-provides-dummy: Extend to -dev and -src packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Mar 2019 02:26:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 15, 2019 at 6:04 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> This avoids errors when running populate_sdk under opkg:
>
>  * Problem 1/1:
>  *   - package busybox-dev-1.30.1-r0.core2-64 requires busybox = 1.30.1-r0, but none of the providers can be installed
>  *
>  * Solution 1:
>  *   - allow deinstallation of target-sdk-provides-dummy-1.0-r0.sdk-provides-dummy-target
>
>  * Solution 2:
>  *   - do not ask to install a package providing busybox-dev
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-core/meta/target-sdk-provides-dummy.bb | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> index 26716ace87b..60499f7b66a 100644
> --- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> +++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
> @@ -2,9 +2,17 @@ DUMMYARCH = "sdk-provides-dummy-target"
>
>  DUMMYPROVIDES = "\
>      busybox \
> +    busybox-dev \
> +    busybox-src \
>      coreutils \
> +    coreutils-dev \
> +    coreutils-src \

Does it mean coreutils can't be provided anymore in target part of SDK?

Thanks,
Ruslan

