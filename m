Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE03C3ABC0
	for <webhook@archiver.kernel.org>; Thu,  8 May 2025 06:23:01 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.9253.1746685377193417391
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 23:22:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=bYQ4GogC;
 spf=pass (domain: linaro.org, ip: 209.85.167.48, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so801934e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 23:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746685375; x=1747290175; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IX3FPhBDNmI3fTUeiCBcDD5ESpnoA6ufj8Wzj/WS5g8=;
        b=bYQ4GogC3PhkJ7o8xTptp6Uryx48fV3X1Uyq3r0xUv6MxSkvW/ZNfE7xtR2Guzfy4v
         AXJVX8j+YQnF4cDaGK2VqWxd6aK9eXZqGIDCo6X+/4Hy9GWsm09LytdU3KU2/L5zC7kn
         HcDW8encN2/xUPs+OajxARGUMaH1gJNR/60fO/UKIz+sJBaeYX1m39Iz5KRfFAg1h+yi
         7eSd9AmBhQBFwFNZB6lFQA8FsYNgDOVqnFAqsszbR1cuwPJqKhqfV5Jgo69Zt0L16852
         KugzG9qpWzdowbQ400DJnTYOat/Y/TRDkWiiT1Roi/gPoRaDAClUK+/WLAGDX7Lr2fJ6
         1eGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746685375; x=1747290175;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IX3FPhBDNmI3fTUeiCBcDD5ESpnoA6ufj8Wzj/WS5g8=;
        b=G03psi0ccWj2yYkmdLVQFz12Rn+FEFMON3LnO9Bvymv2lZ5yFm/lc0Yz+/TZrmN1hJ
         Z8C1DQz5uuLzD95mM5bxI4FQMCOIsnrKg8S9IcGzSuyu3t7IwLMtJe4OeJ1Xo+tmV57E
         UHeNXtg/KSj49S/r2A5QRI99pBRUqYqlhP7ZaDjQRgxIL/1j9x4/73GX0bvQvl+gJd3P
         iC5k5La0U/zMqsKd+WGH+o5/w0cFmvpbsN0vnDVsfsdBFMrmL6P8ruNzs3oD3zF/U6v2
         9hYXPgLb8SpefHTSWXqatu7jx8VA/gVDdMzML5RMokLKcxypEz9zLn5oQfPgSGGlHCIS
         tz3g==
X-Forwarded-Encrypted: i=1; AJvYcCVuDNNtGPxkx2AsEQKYTHWMd0Ca+Wyrb4RbjlApxyjM8mDy51oP5Y8AEoA+T8R8jdsmaaJXdfT1MOJzkiqfbidQpA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzp8EOlUec3K2lexn7Id8+z/+PRhgK6PhrLSq0aW+PFZZ8dh8BU
	CMXdvK7+RdC0u0aQ6Ol1SlB3m1JwqMovtRrHC6g2DuIm18YuZ8/pjQMGfDIjQZ8=
X-Gm-Gg: ASbGnctwGStQCJc3w7LZjZVX7oC1YPAHo2m+EyieczUKG7PZ23RG/PtRbkjYZ1pDQ9K
	J9066yczMZWsk6/BvhXacwh7DpNi/FrWPuApLPnchNOO9SXhOlyP4yXTJso4t/hpcd8qQbQq17p
	YlvYxZQpQ79ySHYCjoqknIcRjjRjoelgklpvULRoUUgz3kjmP15mAbxkvMua0Z2DltifcptRFf0
	Oe5XfATPIM1VQPMGyiLCpr5Br7zwgtksabsJGGCmPEtwlM+j7apOzvmOwSwo5ZGK6neq7QvUFB8
	GQuZJeHsgHSJ9AlaI2pY3rmlfukHppfJNHKI5FrOCACwsbCH+F21Jz5vwz2KabqoA7scymJOpRc
	n7Nwbce8z
X-Google-Smtp-Source: AGHT+IGa/Og8qETYDoI8hvhgO9oB4pSuDshSVoc6uJAW2nkhvPjb4ie9UnPG5w+eJTZJIL2XIJfE8g==
X-Received: by 2002:a05:6512:3ca2:b0:549:38eb:d694 with SMTP id 2adb3069b0e04-54fb9605effmr2031168e87.26.1746685375125;
        Wed, 07 May 2025 23:22:55 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94b18ddsm2542906e87.44.2025.05.07.23.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 23:22:54 -0700 (PDT)
Date: Thu, 8 May 2025 09:22:53 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, Ross Burton <Ross.Burton@arm.com>,
	Sathishkumar Duraisamy <sathishkumar.d.cbe@gmail.com>,
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64:
 gcs required
Message-ID: <aBxNvW-JhKHitdWN@nuoska>
References: <CAMKF1sqkw3xZpLqKw9aaOvike+6RPBsRsfoq+dXzeQf6Zpn1pg@mail.gmail.com>
 <CAHebdzTV7rRKkAJGzL79sngS3BDCEx2nNu8+jO1t5STM31bGeA@mail.gmail.com>
 <CAMKF1spEREKO0RL7d=RE9i-g0GDqWqPGcbR_Cr8pr=ET03AcFg@mail.gmail.com>
 <183D310FC8853D5E.1749@lists.openembedded.org>
 <aBtspIFmf7KoIZ_7@nuoska>
 <20250507182924.GA700@localhost>
 <B699294E-FA19-495C-9DFF-68AB3502240E@arm.com>
 <CAMKF1sq6ttpUeRCsSY9WbY8hixTkhaCOB61u6AB-=xVqhTVn+g@mail.gmail.com>
 <20250507190449.GA7882@localhost>
 <20250507191029.GA24048@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507191029.GA24048@localhost>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 May 2025 06:23:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216140

Hi,

On Wed, May 07, 2025 at 03:10:29PM -0400, Trevor Woerner wrote:
> On Wed 2025-05-07 @ 03:04:49 PM, Trevor Woerner wrote:
> > On Wed 2025-05-07 @ 11:38:12 AM, Khem Raj wrote:
> > > On Wed, May 7, 2025 at 11:34 AM Ross Burton <Ross.Burton@arm.com> wrote:
> > > >
> > > > On 7 May 2025, at 19:29, Trevor Woerner via lists.openembedded.org <twoerner=gmail.com@lists.openembedded.org> wrote:
> > > > >
> > > > > I stumbled across this build issue via a completely different route than most
> > > > > others, it seems, and certainly different than what you have described. I'm
> > > > > not using meta-security and I'm not using tpm2. Therefore your patch will do
> > > > > little to solve my build, and others will likely stumble across this issue by
> > > > > other routes as well.
> > > >
> > > > For what it’s worth, we’re seeing this without meta-security too.  This needs to be worked around in core (personally, I’d remove —fatal-warnings from systemd until openssl includes the GCS hints).
> > > >
> > > 
> > > thats a bigger hammer, I would suggest to apply
> > > LDFLAGS:append:aarch64 = " -Wl,-z,gcs-report-dynamic=none"
> > > in systemd recipe in core
> > 
> > If we want to make the hammer smaller, it's only triggered when:
> > 
> > 	PACKAGECONFIG:append:pn-systemd = " openssl"
> > 
> 
> diff --git a/meta/recipes-core/systemd/systemd_257.5.bb b/meta/recipes-core/systemd/systemd_257.5.bb
> index acf97517a94a..995b55580e4a 100644
> --- a/meta/recipes-core/systemd/systemd_257.5.bb
> +++ b/meta/recipes-core/systemd/systemd_257.5.bb
> @@ -240,6 +240,7 @@ RESOLV_CONF ??= ""
>  # bpf-framework: pass the recipe-sysroot to the compiler used to build
>  # the eBPFs, so that it can find needed system includes in there.
>  CFLAGS:append = " --sysroot=${STAGING_DIR_TARGET}"
> +LDFLAGS:append:aarch64 = " ${@bb.utils.contains('PACKAGECONFIG', 'openssl', '-Wl,-z,gcs-report-dynamic=none', '', d)}"
> 
>  EXTRA_OEMESON += "-Dnobody-user=nobody \
>                    -Dnobody-group=nogroup \

I would prefer this but in the past I had trouble getting non-default
config fixes to oe-core and thus I proposed the patch to meta-security/meta-tpm
only. I do understand that "openssl" in systemd PACKAGECONFIG can be enabled
in a number of builds and setups, but it's not the default. Maybe
it should be the default, together with "repart"? Another thread, hopefully
shorter than "efi".

There are a lot of corner cases and non-default configs which need fixes
to oe-core. I would like to understand what the policy for fixes is.

I think it would make sense to enable more features by default, but allow them
to be disabled. TPM support being one of them.

Cheers,

-Mikko

