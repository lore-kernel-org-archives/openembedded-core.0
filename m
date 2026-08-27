Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D181DC61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 17:31:31 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.765.1787851882188544158
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 10:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fp3QPNLS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49978908b35so80175e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 10:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787851880; x=1788456680; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FL/2+euyKWAhcpTHEbAMS5CkqDYCmAsF/xyUxBbxQXA=;
        b=Fp3QPNLSCjKgwmMi6zIcDK0ZhJt19KT1KNW2zd0wMdwwnr2m0+jm5K5onpxQRNiI+z
         zy/snzZcADW69VMLHB3Q/wKkbaCe7Wd9qZI7fm5NXt4vrXIYHx2UyEwVc90taDADDUvD
         YS1qsq0uXMz10SLF0LAx8dckIYRAsGMmFMh6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787851880; x=1788456680;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FL/2+euyKWAhcpTHEbAMS5CkqDYCmAsF/xyUxBbxQXA=;
        b=TgGIfKNYLkFf4DjZaCItb5o/R2VQ55xkbG9HeaxlnxHGp6nXwd0cYsRutWJFV9lE6N
         69pJNRg9ybKsmLHWpilZzABvUNbY3doxbneFtZSKOEq5UCkH/TWKlFvlZefDLo3Nc8BL
         gkPFLd5iMRyS1ZUhRn8nKEecRvRGLf9je/rC/h33urbNcP5S0+QjKSffyx2B1BrGiVib
         2VaJIdtkVb7lw+xJ4kAG0btMwm+xr+jOb2WtDxcqRTZ9MzhXXrfHSLdnrmuzNDvlyG4W
         OmSOMvTh2mAKTmBW7nwxxJdNdVqGmPBH63czL0w692LJd/SokPvdCWmk4+Zv44WRjxqP
         ggaA==
X-Forwarded-Encrypted: i=1; AHgh+RrhWUplam9edPG3IjJNSUR/ucuZ6f/uodRKug6YEc7RwApHPso7bCUEEqiVCnUBogYBS1HVejZzPGCeS9zpOqmJQA==@lists.openembedded.org
X-Gm-Message-State: AFuF++nwUxKqofR4m8FTUf95WgyH/0qQyWwFfTzw2yZJ0Kpto+QDISzm
	GDeMTkUygSbAgHriHU37neYu9gkDN/gkyNSlJIGUQBcNjJzGU929COwzy2Usq1t1ZRg=
X-Gm-Gg: AR+sD10sU81yQcsUv7WRWPT5I6xbpwUxw7PXccOd8LwcCOTdu2vSxIfkg553Mllsl7m
	mLMe97KtMnsEiJ6OEcXHLXaKVtqOGiOUcmI4lwiLovA8OsZifbB1zj9V6hJ9t1PnxqFhhjzFYrw
	AwYB5Tc0mbQa3NyB+PW/70b/cQ13Omi5QbuUQAGpGV2S+rMVhwdi6mGdDMYu6DCnJA034uGspwU
	wmyw6YAN+ptGCcPQguSflmLGRX6w+D1DMM5rF93dCapwKfiUpbFN4VktjXc3nNGlvBPJBiZS8PD
	KRB5qG4hZd2eRs93jG5rhQH0SJfVZT9r8w/5RD0ZhoQ1Aesa7Hr2rdNXsjarbHMDcwx4qZ9YXzA
	2tVw/7Y8TAce/wvB+dukzVZMsmbZ+kPAsPK6NbDHyOEkVchCwk9yek0+ntA/NIwDy8REPYzQYsm
	i2fyh5UcLV2BE0TaevJnBKpSajGP3mCM8fhCpnJupctXjHxRuO9/+jyjfmQ7NFP4VyTatmd7ZeM
	f8jfRhgKHK9NN3c37W0vKc6i5Qkm8oxFxMXH/LzQjZfg7vg3vk=
X-Received: by 2002:a05:600c:4585:b0:499:b402:6c0 with SMTP id 5b1f17b1804b1-49b91c265d7mr7592465e9.3.1787851880119;
        Thu, 27 Aug 2026 10:31:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:297a:6cb9:3a6b:fc8? ([2001:8b0:aba:5f3c:297a:6cb9:3a6b:fc8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5771a3sm74741165e9.4.2026.08.27.10.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:31:19 -0700 (PDT)
Message-ID: <661986274bd867b38fcd20ea5e99bab704fbc1bc.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/3] rust-cross-canadian: install
 target-specific env scripts and fix rustlib lookup
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Date: Thu, 27 Aug 2026 18:31:18 +0100
In-Reply-To: <ff0f740c-91b2-4ab1-93ff-223c3546c2b9@windriver.com>
References: <20260807093116.3680514-1-Harish.Sadineni@windriver.com>
	 <d489c96976fb770d0499ef325cedf7e085dcc775.camel@linuxfoundation.org>
	 <ff0f740c-91b2-4ab1-93ff-223c3546c2b9@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2026 17:31:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244503

On Fri, 2026-08-21 at 14:25 +0530, Sadineni, Harish via lists.openembedded.=
org wrote:
> Even though the script filename includes ${RUST_TARGET_SYS}, for
> multilib SDKs both the 32-bit and 64-bit scripts end up in the same
> environment-setup =C2=A0directory.
> =C2=A0
> The SDK's environment-sourcing logic sources every '*.sh' file in
> that directory, so both scripts get sourced regardless of which
> target you're building for. Since 'CARGO_TARGET_<TRIPLE>_RUSTFLAGS'
> and 'CARGO_BUILD_TARGET' are set unconditionally in each script,
> whichever one is sourced last wins and that can silently override the
> 32-bit settings with the 64-bit ones (or vice versa). That's what
> causes the 32-bit Cargo build to fail.

Ok, can you point me to which "environment-sourcing logic" we're taking
about? Is this in the test code or within the SDK itself. I suspect we
should be fixing that issue...
>=20
> Putting each script in a target-specific subdirectory (environment-
> setup.d/${TARGET_SYS}/) ensures only the script matching the selected
> target gets sourced, so the two configurations no longer clobber each
> other.
>=20

Perhaps. I'd like to avoid the complexity if we can so I'd like to
understand more about where this is happening.

Cheers,

Richard

