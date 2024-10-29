Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 286FFD2AB11
	for <webhook@archiver.kernel.org>; Tue, 29 Oct 2024 10:01:51 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web11.15424.1730196106084550780
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Oct 2024 03:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=AVcSSnMg;
 spf=pass (domain: linaro.org, ip: 209.85.167.50, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f58c68c5so8686040e87.3
        for <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 03:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730196104; x=1730800904; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VXLTeTk2Eu7r8mnJstwuk5WOVo1jtjgBoJtQZ609dsw=;
        b=AVcSSnMgBI0T4+PGprR1i5224Adh3Uw2zcReAppWI6HKJIMLoiuttLte/qtUSOyvN2
         llZM2SW/Q6N+dv1ACNHPA0qeCqDqw7TBrT5lRW5pZ46LVTz5BS62Q+llG+7ybnuEo0PI
         fxPCoY0pBLQqUalPrnbWF15z2HVR5+Wlkj/DtiZ53NdGC08W2nejY/EVgYXsmRudBbgS
         BhXjkiYmuOS9/7+/YGknAlF2kS2gv/nkk/WObFRQ+DM3Y6ya+4rbnRrl4vgzPt8gD91H
         ZoprRuB/Aht83IIb84voALzfSWvjWsQwqPPxMcH17cOEiBXtAhNNrxdWg8YjbIuEt19E
         iH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730196104; x=1730800904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXLTeTk2Eu7r8mnJstwuk5WOVo1jtjgBoJtQZ609dsw=;
        b=F2whMVF+qk7qW7/YGEoqkquQsTIBbmM1vI9iAST13dGRMQkCXiU7c7nCgR0X6Vr6hI
         xnVVoLES1ISbhG5BF5UKMcAVsqZHyY3UrO3nwNlAQWL12chhKaRvjYOgYIt9b3NiUo7l
         aiUXf/flJpfZgroIS9HFysHoFc/WgMMfhYUzQOI+GW7DUG02KncqkpnVaEQEfrtb2qsr
         5MO+a+8lMMcMC0N93120+ExC2AiJ7AF7+Tzw1b5w34LcemxYN2HquWruQ86+d77tqQdm
         C37YL2p/kJviMrHvNPQR5cPPiQ+fvIO42dcvUJQQ8UN5ENy9NYumtlXY+Gzbzuw8HYD/
         mT6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPj127VPf/2K1QVisxEADQI6O8ANaLDUjSge2leuWxZ/XxkuhA4pBgWkjGD+uwV9qF/e/ul4UBDliNIrS9feeqrg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzRKfM1XE38djuMSXGlR/NvhXA6YVpl5EiZpP8L+K20gquNT1fR
	9cQ0kzQ0AyuqKZrpC16So5z1cwWXFhYPkEP6oqEZRXiEKqmjWJVr7lOLecrU3rs=
X-Google-Smtp-Source: AGHT+IEqkC4hVQxGyIF7BZGlThxXGSJZM5chup1qggmYYF3L07fIuORjSexdLt2JZAPxrE5h+kdG+g==
X-Received: by 2002:a05:6512:1282:b0:53b:1fd1:df34 with SMTP id 2adb3069b0e04-53b3491e0eamr8835035e87.45.1730196103686;
        Tue, 29 Oct 2024 03:01:43 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1df359sm1333815e87.261.2024.10.29.03.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:01:43 -0700 (PDT)
Date: Tue, 29 Oct 2024 12:01:41 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: rasmus.villemoes@prevas.dk
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] openssl environment variables
Message-ID: <ZyCyhYHLTR3cl708@nuoska>
References: <87v7xbjn9b.fsf@prevas.dk>
 <f0d57e20bdf3d90e6c0ccd8ccfef6faf61bf45b0.camel@linuxfoundation.org>
 <87r07zjkpw.fsf@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r07zjkpw.fsf@prevas.dk>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Oct 2024 10:01:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206487

Hi,

On Tue, Oct 29, 2024 at 10:56:43AM +0100, Rasmus Villemoes via lists.openembedded.org wrote:
> On Tue, Oct 29 2024, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> 
> > On Tue, 2024-10-29 at 10:01 +0100, Rasmus Villemoes via lists.openembedded.org wrote:
> >> I'm wondering if anybody has encountered this problem before, and if so,
> >> if there is a clean solution:
> >> 
> >> When using openssl-native, there's machinery in place so that when
> >> openssl-the-binary is called, it's done through a wrapper script that
> >> sets
> >> 
> >> OPENSSL_CONF
> >> SSL_CERT_DIR
> >> SSL_CERT_FILE
> >> OPENSSL_ENGINES
> >> OPENSSL_MODULES
> >> 
> >> so that these point into the appropriate STAGING_DIR_NATIVE, and then
> >> invokes openssl.real.
> >> 
> >> Similarly, when including nativesdk-openssl in the sdk, there's an env
> >> snippet installed that has the same effect when the sdk setup script is
> >> sourced.
> >> 
> >> However, when the build involves some tool, say (uboot-)mkimage, which
> >> _links_ against libssl, no such env variables are automatically set
> >> up. This means that if one tries to do something like using a pkcs11
> >> engine, and has made sure that the appropriate pkcs11 .so file is
> >> available in sysroot-native, libssl still won't find it because it
> >> doesn't know to look in ${STAGING_DIR_NATIVE}/usr/lib/engines-3.
> >> 
> >> I can of course define and export these variables myself in the recipe,
> >> or in a tiny openssl-env.bbclass helper class, but this feels like the
> >> sort of thing that the build system should take care of automatically,
> >> just as it already does for the openssl binary itself, and for the whole
> >> sdk environment. But I suppose that by the time dependency resolution
> >> has figured out that "hey, this recipe (transitively) depends on
> >> openssl-native", it's way too late to inject something that sets+exports
> >> these variables.
> >
> > https://github.com/openssl/openssl/pull/19260
> >
> > We realised we could only probably fix this properly with upstream
> > help. We haven't managed to have anyone work through the process enough
> > to get patches accepted though.
> >
> > So yes, we're aware but we need someone with time to work on it.
> 
> Ah, thanks for the pointer. OK, so it's a known, and hard, problem.

As a workaround, you can do this in your own layer and a custom bbclass:

DEPENDS += "openssl-native"

export OPENSSL_MODULES="${STAGING_LIBDIR_NATIVE}/ossl-modules"
export OPENSSL_ENGINES="${STAGING_LIBDIR_NATIVE}/engines-3"
export OPENSSL_CONF="${STAGING_LIBDIR_NATIVE}/ssl-3/openssl.cnf"
export SSL_CERT_DIR="${STAGING_LIBDIR_NATIVE}/ssl-3/certs"
export SSL_CERT_FILE="${STAGING_LIBDIR_NATIVE}/ssl-3/cert.pem"

https://gitlab.com/Linaro/trustedsubstrate/meta-ts/-/blob/master/meta-trustedsubstrate/classes/openssl-native.bbclass?ref_type=heads

Cheers,

-Mikko

