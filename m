Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32C73C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 12:41:37 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7225.1783514494490850119
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 05:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dOP/835F;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ef7b7651ecso13356836d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 05:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783514493; x=1784119293; darn=lists.openembedded.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ly6l0u2h9lpwYNRuiaSEyqQLkx9zBfOoIGHoWD6LAA=;
        b=dOP/835FeN1LBWaLjcJvSRoIzUQVch/UMoF10h5lT8W8+b0AZ2OoqEjfDTxalVuWCV
         VsP8fLGH9zOCauwZFAsgij7nDNsyAZ0vFghaUjjXAJFY+ouj+vrtHr0yj4PNDoYTfG15
         bX9TnbxEQpt2ssJT/WlRIZbwRtjdqarrc8q+HmzNdaUsoqN3ut1Eh06qfE5gg26/Ydz8
         UJx8edNu3qAa9LmF9tG+AurG7PZltBFh7GKfAoAC8pDvhypHu7QJy7dke6X5hYCKAqeG
         rxf8Tlo0QMZdLTf+Oty1kFXJZgIvlEl6nCGJVSB23rkEUqY6xlQVCJ53bsELyv1BlqKg
         eXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783514493; x=1784119293;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Ly6l0u2h9lpwYNRuiaSEyqQLkx9zBfOoIGHoWD6LAA=;
        b=G6lSNizGNGF8nqU46d7UEOsIWYSUHNMpdwXy0yGh1OpqCvPmhjwrV2hBRlFYOFOFXr
         za0MhJk9YZyMLgaCKyfzw2xPPZ8vdxGkahTU8FrFlm7SxR9ZX/eXMmnACqOLE1mXkAQh
         a+07gi0sEXtjOMhevgmY7N3kyexP1wvE1skOaz8+BXTzfDf5lhqmr1rRZu/I8/a60K21
         TBG92hwNkKJpcggwrgB50Ph2pEab9uu3E9ldP9+JnLxcgIpr7wtgmT2tBe530sFCG5z5
         x3iy2uKvBxS6DHuMUATzL+62FoUau1yDwsfb8CsgGF4iavqCT9W/ZLyO7V64zIyqKmsP
         lLFA==
X-Gm-Message-State: AOJu0Yw54TwZ9Z1+N303a44tDaU20VWAe2HiM8ebtN+PxoKg0eGmv9WV
	pz0Kw5btin1qX0hptVDpCCVi2UfLKAYH+meuwi63F1CI1pbfB4/9iaIkrq70pr1C
X-Gm-Gg: AfdE7cngMrH3hOGKCvVDrXP14bjF1l26pthdjnWj3yI965EAON8xLJfRSI8NEuKP7Bx
	rR5SnRWCORfjVvf/69ziiOCf1UAdRbkE/bYfjrGamEtIGpWpEAD57SG40oDNb9Czw/tb6UNIPtr
	OdWW7jjKYBSX7lF5fBYeRl4RxMAo27VbeDKOTId9/XPwNV0EDmISzUGJENCOmhdMAb77nLYnKO2
	4214WZgjXs5jva9izDfb/+TK211ff0gtLGuKmPvelzeqy3oO9JFZRi1wENQnLugTGOkhftOlLmF
	xS8EgWfyxxlGaCiL72wHG3JTMdII5k6/yXFwuPte77mnP3MmInjmjPQdQfb2Axfy/KOvC5zno4I
	i+p4iZ1t+hfka1JAE71ZrKX4kqIlT7OYPR4ng6wQe2SWeKIdN/qNuSTnUCHXHsTDHj8GHov6KiB
	wY3vMlZ8Z2+EMCuFUUlESJ2MyEaZUwCGzgAVotj71qK9TPcBdEsTNBKPGth2vVp7BXbNKpwYx2X
	TygxHuh/MP1Abapz8H3Y+tf6T5u7pmg/PsPiHy8/fLgrjNK8fP2NHR7gNxrzUq1whTV3Xh7Uv8G
	6fDY4SXtg68Clg==
X-Received: by 2002:a05:6214:1315:b0:8e9:f62b:8f83 with SMTP id 6a1803df08f44-8fea2d55216mr26773736d6.26.1783514493225;
        Wed, 08 Jul 2026 05:41:33 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f4724ba6fesm182608386d6.41.2026.07.08.05.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:41:32 -0700 (PDT)
Message-ID: <6a4e457c.dfaa6ae2.334193.82f9@mx.google.com>
Date: Wed, 08 Jul 2026 05:41:32 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-core@lists.openembedded.org, yogesh.tyagi@intel.com
Cc: raj.khem@gmail.com
Subject: Re: [OE-core] [PATCH] bindgen-cli: set CLANG_PATH in native wrapper
 to native clang
In-Reply-To: <20260630190004.1083997-1-yogesh.tyagi@intel.com>
References: <20260630190004.1083997-1-yogesh.tyagi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 12:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240483

On Tue, Jul 1, 2026, Yogesh Tyagi wrote:
> Set CLANG_PATH to the native clang in the bindgen wrapper so clang-sys
> uses the runnable host binary first, short-circuiting the llvm-config
> lookup. The native wrapper already exports LIBCLANG_PATH the same way.

The reasoning is sound, and beyond the mesa rusticl case this also helps
the rust-in-kernel build: kernel-yocto-rust.bbclass pulls in both
clang-native and bindgen-cli-native, so native bindgen can hit the same
target-clang-via-llvm-config lookup. Pinning CLANG_PATH to the native
clang that matches the native libclang is the consistent thing to do
there too, so:

Reviewed-by: Bruce Ashfield <bruce.ashfield@gmail.com>

One thing while you're here: the recipe is BBCLASSEXTEND = "native
nativesdk", but the wrapper fix is do_install:append:class-native() only.
Unless I'm misreading it, that leaves the nativesdk bindgen wrapper with
just LIBCLANG_PATH and no CLANG_PATH, so an SDK that runs bindgen (e.g.
rust kernel-module development in the SDK, which is being wired up
separately) would still hit the identical "could not run executable
.../clang-NN" failure. If that's right, could you extend the CLANG_PATH
export to the nativesdk wrapper as well? A shared helper (or a
class-native/class-nativesdk pair pointing at the respective
STAGING_BINDIR) would cover both. If nativesdk is already handled some
other way, ignore me.

Bruce

