Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 394B1CA0EC3
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 11:46:47 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.22799.1694519202808205904
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 04:46:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=LJiLS1nJ;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-502a4f33440so5933985e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 04:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694519201; x=1695124001; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5u7qKF1rJ5LTHK8hH+Cg+Rz9tymCK8Sgku6tg5I3I08=;
        b=LJiLS1nJpcgjfFBZJ6e+iC8q7wtzmjoTErnOdOxHxiGQE6Srx6gkZu4wqNDIZHOUO5
         qmfk+RfsTXZquyZEsrz3v6qpDZroxRm8e8772CG0jrUVKeE4OnhO7eVxsevLPXY5OAeL
         ZIovW2JxHwvnjLNFy8XFlp9cRCTJqQy2g4zNpsnBpWlekKAJ/m8KHH7yWQU9UKX9rC+x
         c6g5NB/ZIHGfmthbcnySpywlZBbwgD5pmbwJDx4Q/xAL+aN/Tr2oGfFBEN9hmAUGkqCj
         tFQGHfz+EGtZ5m/X+T5l5lUfE61bTHTVIhmOtvSWMdNzIFfuVNNfU1zfAkdc4ELvKCW0
         kn8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694519201; x=1695124001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5u7qKF1rJ5LTHK8hH+Cg+Rz9tymCK8Sgku6tg5I3I08=;
        b=L3prlFZbld81vd7/L3LOl8u+DT0tEkCVBvpBOAsRC4AXyjzJGADyrjwnzyeOuB6VHs
         GbSUwDoKFLJLXn8fRxB0ay6/zRrmIFn/x3nFgjmvADadZVUpzCyYBwhHK8fYM00rEBwt
         FR+W2eQTIIigBBAkX7K6C8Jy/AV941AmlDVo9MHJerkkDhc5HPYDSx6RoliCCrgNlh1T
         Ceb8G2U4D+OmNkfvNWJxlUESSGb8QxZo51WooJPG8eMndur2N0+lPd3lhd61bfBsyS3I
         1TR7xJGbIIQ33CGGeE17cv3jB6QaBGrDLpLuofdQQRmk610r2h2QRNJdC4ab/55hHF7C
         2P6A==
X-Gm-Message-State: AOJu0YxenB01DZyszSl8d1/iuPaSwgL2WZg1/S0YaAFzWfX1Uu93+QdN
	thwvtUacJeP76nw4Dg5eC/c7ZA==
X-Google-Smtp-Source: AGHT+IGveIMKe8L33Rm+sHCZ1kRrJnbG4RtVeYJIbj7J3OZB+GmgsCsOATctcrXHOiENXIe6ve/B5A==
X-Received: by 2002:a05:6512:6c3:b0:502:adbb:f9db with SMTP id u3-20020a05651206c300b00502adbbf9dbmr8793753lff.65.1694519200859;
        Tue, 12 Sep 2023 04:46:40 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id r12-20020a19ac4c000000b0050234d02e64sm1728109lfc.15.2023.09.12.04.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 04:46:40 -0700 (PDT)
Date: Tue, 12 Sep 2023 14:46:38 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] oeqa/selftest/runtime_test: No need to use
 append with TEST_RUNQEMUPARAMS
Message-ID: <ZQBPnpWNx3iyWfnV@nuoska>
References: <20230912113242.3994352-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912113242.3994352-1-richard.purdie@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 11:46:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187509

Hi,

On Tue, Sep 12, 2023 at 12:32:42PM +0100, Richard Purdie wrote:
> A simple += operation is fine for working with TEST_RUNQEMUPARAMS so remove
> the heavier append override usage.

Ok, but I was being consistent with the other variables in the tests.

Cheers,

-Mikko

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/lib/oeqa/selftest/cases/runtime_test.py | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
> index 57d3852d579..12000aac16e 100644
> --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
> +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
> @@ -138,7 +138,7 @@ class TestImage(OESelftestTestCase):
>  IMAGE_CLASSES:append = " testimage"
>  IMAGE_FEATURES:append = " ssh-server-dropbear"
>  IMAGE_ROOTFS_EXTRA_SPACE:append = "${@bb.utils.contains("IMAGE_CLASSES", "testimage", " + 5120", "", d)}"
> -TEST_RUNQEMUPARAMS:append = " slirp"
> +TEST_RUNQEMUPARAMS += " slirp"
>  '''
>          self.write_config(features)
>  
> @@ -252,11 +252,11 @@ TEST_RUNQEMUPARAMS:append = " slirp"
>          features += 'TEST_SUITES = "ping ssh virgl"\n'
>          features += 'IMAGE_FEATURES:append = " ssh-server-dropbear"\n'
>          features += 'IMAGE_INSTALL:append = " kmscube"\n'
> -        features_gtk = features + 'TEST_RUNQEMUPARAMS:append = " gtk gl"\n'
> +        features_gtk = features + 'TEST_RUNQEMUPARAMS += " gtk gl"\n'
>          self.write_config(features_gtk)
>          bitbake('core-image-minimal')
>          bitbake('-c testimage core-image-minimal')
> -        features_sdl = features + 'TEST_RUNQEMUPARAMS:append = " sdl gl"\n'
> +        features_sdl = features + 'TEST_RUNQEMUPARAMS += " sdl gl"\n'
>          self.write_config(features_sdl)
>          bitbake('core-image-minimal')
>          bitbake('-c testimage core-image-minimal')
> @@ -284,7 +284,7 @@ TEST_RUNQEMUPARAMS:append = " slirp"
>          features += 'TEST_SUITES = "ping ssh virgl"\n'
>          features += 'IMAGE_FEATURES:append = " ssh-server-dropbear"\n'
>          features += 'IMAGE_INSTALL:append = " kmscube"\n'
> -        features += 'TEST_RUNQEMUPARAMS:append = " egl-headless"\n'
> +        features += 'TEST_RUNQEMUPARAMS += " egl-headless"\n'
>          self.write_config(features)
>          bitbake('core-image-minimal')
>          bitbake('-c testimage core-image-minimal')
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187507): https://lists.openembedded.org/g/openembedded-core/message/187507
> Mute This Topic: https://lists.openembedded.org/mt/101312801/7159507
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mikko.rapeli@linaro.org]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


