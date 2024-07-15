Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BCDC3DA5D
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 11:31:37 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.35892.1721043088245970013
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 04:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=pFhhfwcN;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52e9fe05354so5726607e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 04:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721043086; x=1721647886; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w5Cn+UNPI9aTJ3Lf4FtpyDOhfhURmRENyXgqO/4j+kE=;
        b=pFhhfwcNJS1OTne+sCgPH9xr0DukAeyOHkEzsMnHnbU+GBKBelrEjo6bruYEix37a7
         w4xUq0/grQZKYZCvQMHis74rpkaVLKDbdotwluSbdFTDIah5o1rJGnGLRWR6bWN4UjZF
         XKstmDhFmwP3g19fpXYeG5fAu+b2F2J3nB5IuKlZoY961OMRTnQE1adbCmGDkIB47AQb
         EPu94Gzd+p8xw1aDl6qpd9GpvmuV7Jl5D1fE4hZYK1hP5VnEjzbB6PKc6PCAAj3s/eQw
         +nAfm6Q2dxS6L+bQQjevRE0TAez7o1vxvvcZnDEYuzAVck6/4vKP4+kZ2RmP/4zy3QMw
         n9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721043086; x=1721647886;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w5Cn+UNPI9aTJ3Lf4FtpyDOhfhURmRENyXgqO/4j+kE=;
        b=ZXFhQerllBuUZdessVtH8JxsPZeV6SnzSa4Mfcaq1fIUTwlUW4/uQWnd8hVltpWmMH
         0jKBpOHHEAHKUL4UiUco1syQmoQxtK3KBhIMurk9bNSRfRsoSXJOnJIkRhQUNBET2YKg
         L/lO4I+0hnS3UXFP3YhqzPDA809MTRvno/EilO8DskcoDSar6M92MptsPp7yKr26Y7yK
         GHqandW4O9IXPpntj8/vIgYo9aeUDbX7yL4+9/vf/bX+X6q77ZMYEqaXAKtbTULdZsUC
         1N4aQm8JjTeA4uBf2o+JRMHmtTZwD6oxg4gJg8e2b6AwZsZys41aCMB6xrvHlvP0hxSU
         7CSw==
X-Gm-Message-State: AOJu0YzLybxADo5Xc1fKeOdYvv7Vna8eGer6E13PEtYY8A7dF6lXYLFr
	gkJrjAceDBJpdd7lgpLYot0Y+2r0NIyIVHd1mQNpRgZTfjs+l/uVLtGiLhNCUaw=
X-Google-Smtp-Source: AGHT+IEKR1VkQgNVI4CC3Jv/DCB0i9TO0pNz8r3Yb/C+b3W/9KzA4tzv9+fHrlgfPf4Rx6xQL1iucA==
X-Received: by 2002:a05:6512:39c4:b0:52c:df83:ad52 with SMTP id 2adb3069b0e04-52eb99a1414mr13728558e87.36.1721043056240;
        Mon, 15 Jul 2024 04:30:56 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed24f3869sm820254e87.95.2024.07.15.04.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 04:30:55 -0700 (PDT)
Date: Mon, 15 Jul 2024 14:30:52 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] oeqa/sdk: add out-of-tree kernel module
 building test
Message-ID: <ZpUIbMxYY3IBw9Qr@nuoska>
References: <20240712184358.3103083-1-ross.burton@arm.com>
 <ZpT6c4hgYV6xIJsf@nuoska>
 <ADC09946-15C3-478B-A833-DDC3A595820F@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ADC09946-15C3-478B-A833-DDC3A595820F@arm.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 11:31:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201913

On Mon, Jul 15, 2024 at 11:18:30AM +0000, Ross Burton wrote:
> On 15 Jul 2024, at 11:31, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> >> +    def test_cryptodev(self):
> >> +        with tempfile.TemporaryDirectory(prefix="cryptodev", dir=self.tc.sdk_dir) as testdir:
> >> +            git_url = "https://github.com/cryptodev-linux/cryptodev-linux"
> >> +            # This is a knnown-good commit post-1.13 that builds with kernel 6.7+
> >> +            git_sha = "bb8bc7cf60d2c0b097c8b3b0e807f805b577a53f"
> >> +
> >> +            sourcedir = os.path.join(testdir, "cryptodev-linux")
> >> +            subprocess.check_output(["git", "clone", git_url, sourcedir], stderr=subprocess.STDOUT)
> > 
> > Is there any way to cache this, e.g. yocto build download cache?
> > 
> > Adding Internet downloads to test steps is a bad design IMO which eventually
> > causes a lot of failures.
> 
> Yeah, I know.  Calling back into the bitbake fetcher is an option but non-trivial to be honest. I hope that cryptodev will make a new release at some point as their last release doesn’t actually work with anything you’d consider a recent kernel.
> 
> Changing the download code in oeqa to just use the fetcher logic would make sense, I’ll put it on the list of things to do.

How about changing cryptodev-linux recipe to provice a package with the needed source code,
install that package to an image, and then express the dependency to package in
the oeqa test?

That way caches would be used and no need for networking when executing this test.

Cheers,

-Mikko

