Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE707C3DA59
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 11:35:47 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.35972.1721043344651486334
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 04:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RTAvPjX0;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2eedebccfa4so21103271fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 04:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721043343; x=1721648143; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/AbgW3WtXnozItyLd9B8j7bxxAXOkECqmzuClzRuoA=;
        b=RTAvPjX0z0iRrOSl1N8dNneJTCqttYjGJWeZ+GRW75YXbNDxLg0yycQf+eNFE+nHFq
         2PNPs84DIKZwRWdLPdcqTk296P3NUbp5vF9+mxrAaf9cnpPCyanfw3ObMtNOTWHr1yG7
         VRT2ToYtXn0R3mFPzmL+rfYA4Kube2H6IArlq3L52CxozrNHI8Ls7QCXVLynaVplGTWG
         5fejQ/mutHR1zyvG0/rtd8nKyn+si9N9gP8T8haIBND3qp3UdfcDV6FFS8GXJGl5BImO
         RgrQsOYI3JzeJAImIeL8bjvX7FQ7yJHAGVtFjUFxOoeCAmyr9lY2VIduIsSIfVGilA+t
         S79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721043343; x=1721648143;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t/AbgW3WtXnozItyLd9B8j7bxxAXOkECqmzuClzRuoA=;
        b=rOtAQzDzE9VNlsH5ewmFFwT+SJPSwXSkZpy/nLaKQxo2Nv3K/ntB6QZdo5wL1Fezx6
         3gjfcsObRtudqzNgPvJnfwC6fhIHjJgWCvy6mC7vR+JlMY4RuO+3fS+M/Z13u9mworn1
         FG8Ptcu7IVwD4IG5DqT0fqmtqWVQBwwwZlw9BIr4HokW+5fS2GggbxLg7xQlZ13mDXDI
         aCsY0mL3igwDjpVuOE0YGiQYtMdy63kCNvHOaWYyVl1jBgHtvD6tBu3GYc06Vu2t+TcW
         ZN7XLu2JXNSsueqFrHgoB0jucQqHys5bAT+JQhJWzZwMvapLdKxGemcu11RE8BlAGKGW
         +9AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVujzcNDXg+rsaQ1zsYuCAT9UjPcWdIw0EPaZHwcHNZra4B70iHibFg70sR/kFdr5QM/hiL6hqfV0CPZwuukObOD2UAgbPOtv8dN26PyYAlZQL0LzTO0cfM
X-Gm-Message-State: AOJu0Yz5zOp5e887qeNxYOnBZufSKu+cHPDnxORuBLJYUCGWd6E+QyK+
	NAHiLU7sIsdiCCwxbCQcixYWqnJT1Epeq798aC3Xo7JtcVYnOxzM6RocApIywqs=
X-Google-Smtp-Source: AGHT+IFbrNR127mFyxUNZf250EwnptI0UCgoqPCBd1PsugWa3+CZ1CkBf64Xt7vnkFwpX+AGxvSbZw==
X-Received: by 2002:a2e:9f16:0:b0:2ec:5a13:e19c with SMTP id 38308e7fff4ca-2eeb30e364dmr139564251fa.17.1721043342757;
        Mon, 15 Jul 2024 04:35:42 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee179edb1sm8638961fa.1.2024.07.15.04.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 04:35:42 -0700 (PDT)
Date: Mon, 15 Jul 2024 14:35:39 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Ross Burton <Ross.Burton@arm.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] oeqa/sdk: add out-of-tree kernel module
 building test
Message-ID: <ZpUJi1s0cSJCUBiN@nuoska>
References: <20240712184358.3103083-1-ross.burton@arm.com>
 <ZpT6c4hgYV6xIJsf@nuoska>
 <ADC09946-15C3-478B-A833-DDC3A595820F@arm.com>
 <17E25F9219ACA60A.6120@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17E25F9219ACA60A.6120@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 11:35:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201914

On Mon, Jul 15, 2024 at 02:30:52PM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> On Mon, Jul 15, 2024 at 11:18:30AM +0000, Ross Burton wrote:
> > On 15 Jul 2024, at 11:31, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> > >> +    def test_cryptodev(self):
> > >> +        with tempfile.TemporaryDirectory(prefix="cryptodev", dir=self.tc.sdk_dir) as testdir:
> > >> +            git_url = "https://github.com/cryptodev-linux/cryptodev-linux"
> > >> +            # This is a knnown-good commit post-1.13 that builds with kernel 6.7+
> > >> +            git_sha = "bb8bc7cf60d2c0b097c8b3b0e807f805b577a53f"
> > >> +
> > >> +            sourcedir = os.path.join(testdir, "cryptodev-linux")
> > >> +            subprocess.check_output(["git", "clone", git_url, sourcedir], stderr=subprocess.STDOUT)
> > > 
> > > Is there any way to cache this, e.g. yocto build download cache?
> > > 
> > > Adding Internet downloads to test steps is a bad design IMO which eventually
> > > causes a lot of failures.
> > 
> > Yeah, I know.  Calling back into the bitbake fetcher is an option but non-trivial to be honest. I hope that cryptodev will make a new release at some point as their last release doesn’t actually work with anything you’d consider a recent kernel.
> > 
> > Changing the download code in oeqa to just use the fetcher logic would make sense, I’ll put it on the list of things to do.
> 
> How about changing cryptodev-linux recipe to provice a package with the needed source code,
> install that package to an image, and then express the dependency to package in
> the oeqa test?

And by image I mean the SDK under test.

Cheers,

-Mikko

