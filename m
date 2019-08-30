Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 871B860720
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 16:49:38 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id n2so6743149wmk.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 09:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=uqim+k0xrQatkAfOpZyNXohVkT6YLhKFlCede10tVMA=;
	b=fYUEUOHkR66nurAnOcwaNDh2xzGrC49tGg/yG6fTgTO7An4ORMqW00x3GEqcss0EoH
	mBBkdpdh9owA+qnbYaS3dtyGtslFZ/sJKrpOEj4RcYfqYe1fsKZ22N9X4oBZEkD8mQre
	HoD2KIdnBNsAvsC+Yv4+h2ta/nRArrxmXLt2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=uqim+k0xrQatkAfOpZyNXohVkT6YLhKFlCede10tVMA=;
	b=C9qazPmO2lDf3qOipMbIHoBrYyp1L8gGccy0R8e4Q0IDY52nsmJPwJ/RWFu8aC7d2t
	5pjesmypi/dchKaddk1TnIQ8kAOUefQE17KWlloON8fcvS5L3U4QN0s8Q8I8ibQ8KPFV
	qzZ0NBwynwqxZMum5xDdT6m1o6mSxS2LzPQD443Jkc0MEUSSWUVq57AkyIBizVE+IU57
	oZBP9EbqdoBtj3aTTbeJUa/cJWUjCkyxhoQAVaHWQgttwC/uJmQYBOwNZRwl/XquK153
	7TXA6DX/Rd1jD8tjuCS/ZWAozl9Mmwek/4bqxBRwTHgPglvG90nysuplw2NurDuAbVqs
	txng==
X-Gm-Message-State: APjAAAUfHDvGCOS9Zrus6t3246+W+Vlw6fp5dnM2Gfwc1eQj4pwVCe/f
	cV3YqbLLZpQSEU86h1dkft0XYYRzXAQAzw==
X-Google-Smtp-Source: APXvYqwHoCFuILtAewZ+vwcjxKnIVc5fPZSNDleeIe/mwM8hz6WJIYq9rWWG3waKjPMy+UcOQk7Mcw==
X-Received: by 2002:a1c:1b14:: with SMTP id b20mr7102974wmb.122.1567183779287; 
	Fri, 30 Aug 2019 09:49:39 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t19sm6870165wmi.29.2019.08.30.09.49.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 09:49:38 -0700 (PDT)
Message-ID: <289f14f3a89bf12fef9d830cd0579a06bf5514a8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mattias Hansson <mattias.hansson@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2019 17:49:33 +0100
In-Reply-To: <20190816091329.10359-1-mattihn@axis.com>
References: <20190816091329.10359-1-mattihn@axis.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Mattias Hansson <mattihn@axis.com>
Subject: Re: [PATCH] base.bbclass: add dependency on pseudo from do_prepare_recipe_sysroot
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
X-List-Received-Date: Fri, 30 Aug 2019 16:49:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-08-16 at 11:13 +0200, Mattias Hansson wrote:
> do_prepare_recipe_sysroot may perform groupadd, which requires pseudo.
> However, do_prepare_recipe_sysroot does not depend on pseudo explicitly,
> which sometimes causes a build error when building a recipe that adds
> groups.
> 
> This issue only occurs when executing do_prepare_recipe_sysroot for a
> recipe that adds groups before finishing a task that depends on pseudo
> for a recipe that doesn't add groups.
> 
> Signed-off-by: Mattias Hansson <mattihn@axis.com>
> ---
>  meta/classes/base.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 0c8a4b2862..0576b110c9 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -480,6 +480,7 @@ python () {
>      # If we're building a target package we need to use fakeroot (pseudo)
>      # in order to capture permissions, owners, groups and special files
>      if not bb.data.inherits_class('native', d) and not bb.data.inherits_class('cross', d):
> +        d.setVarFlag('do_prepare_recipe_sysroot', 'fakeroot', '1')
>          d.setVarFlag('do_unpack', 'umask', '022')
>          d.setVarFlag('do_configure', 'umask', '022')
>          d.setVarFlag('do_compile', 'umask', '022')

This basically forces all target recipes prepare-recipe sysroot to run
under pseudo "just in case", with all the performance overhead that
entails. prepare_recipe_sysroot does a lot of file accesses so this is
significant. It will also increase the pseudo database sizes
everywhere.

We'll need to find a better way to handle this I'm afraid.

Cheers,

Richard


