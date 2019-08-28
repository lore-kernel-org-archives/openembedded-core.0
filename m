Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id BEAF47EFB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 16:09:17 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id y135so20889wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 09:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=6Tt9cryKer4p7PB55YXjneKKnSP9MVe9HZcg0jZmmqY=;
	b=W32xzvlPIRq5FQOL4BvlkOQ9uOHoM8sQT0b+eGlKmVdU9JIMTbthS/EjrClukQPxtm
	V8gjNKrL4qx7YYY61i7yJS8Ezuy2ojpt96upMXAkwfIWF6fr47/Cinav2x1Sn7ptQEmO
	GOhb1Ce6qmeGU8kW8KW5U0dfrEqa6RUOniJTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=6Tt9cryKer4p7PB55YXjneKKnSP9MVe9HZcg0jZmmqY=;
	b=BS/09YnPLDy70Yirc/VPgTOv9ndWvy6HkTHXY7ZYISG31ORBtAHzEeC9RXfaJ2kKdH
	PSBedkPXE5Visa/e2bR0DHZMPx4u253VHG5Y5iQm0/T3RT6IsmKV1HQudXsXsa4pms+i
	nTkjwbrFhobWVWn8y3ZIKSjLMjz8bDzCaAakeaeRmRqv/YPpRVmNCLQQ20JUeYJrHSIZ
	mKdkFmv96YkTIIeW0N6QRjHqLuGsPjQyHSzpL3+fJTQubd4L5TZIZQmN9YRjayuUSU+3
	YOJK1XtzyviZIq6j6VoLdFtt2JX+IqnI01b68f8/HrOYMnIRkG1h81eQzB/mCxtJdF7Z
	yxOQ==
X-Gm-Message-State: APjAAAXirqH7klfUaSSuWWHqammM8slyMncnQxH5iAMR6P1nC/RF+PlW
	NprD9ufJiIw/VVPrXpZR5xW7YA==
X-Google-Smtp-Source: APXvYqwcDGNEAe97ukJOOY0vjkrFyMIzgv25aOs36TG7P5UccUwXN/lOg4HBJVVG9PwrBgju3jH6aQ==
X-Received: by 2002:a1c:f007:: with SMTP id a7mr4243814wmb.172.1567008558407; 
	Wed, 28 Aug 2019 09:09:18 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id s2sm4252614wrp.32.2019.08.28.09.09.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 28 Aug 2019 09:09:17 -0700 (PDT)
Message-ID: <893793eb5d13e0da6f32b446bb876ab562cd8f52.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 28 Aug 2019 17:09:16 +0100
In-Reply-To: <20190827124546.18114-1-JPEWhacker@gmail.com>
References: <20190827124546.18114-1-JPEWhacker@gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] glibc: Fix locale DEPENDS
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
X-List-Received-Date: Wed, 28 Aug 2019 16:09:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-08-27 at 07:45 -0500, Joshua Watt wrote:
> gettext is required to generate the glibc locales in do_compile. If not
> present, glibc will skip the generation which isn't reproducible.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
> index 252fd56c13c..f1a6ae2a245 100644
> --- a/meta/recipes-core/glibc/glibc.inc
> +++ b/meta/recipes-core/glibc/glibc.inc
> @@ -6,7 +6,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}gcc libgcc-initial linux-libc-headers"
>  
>  PROVIDES = "virtual/libc"
>  PROVIDES += "virtual/libintl virtual/libiconv"
> -inherit autotools texinfo distro_features_check systemd
> +inherit autotools texinfo distro_features_check systemd gettext

I suspect this may not do what you expect.

At least as I read the class and recipes, glibc sets
INHIBIT_DEFAULT_DEPS which means no gettext-native dependency is added,
instead, configure has --disable-nls added.

Is that what we want?

I'm curious to understand how glibc locales are ever generated
correctly and what we're aiming to add here (a gettext-native
dependency?)

FWIW gettext-native is a very heavy thing to add in as a dependency
from a build time perspective.

Cheers,

Richard


