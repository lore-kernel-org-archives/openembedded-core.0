Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.4396.1610729488989621871
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 08:51:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b1lbf/kO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id u14so3971346wmq.4
        for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 08:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=aCVY1lMQqlds9cbT4YRI1mCBCWom0blbPAzd/rzM8Zk=;
        b=b1lbf/kOW6jAv8qpvCgswVcAYFJL20gTwcMVoQCaMI5/3UMyfm9xvgJURMMy3xsfei
         9TQj81bw5eVMTYwUqg6TT2TXp+BkMTYDxSVVGX8wUL2qF1uDMisdL9OjiU6xlZFqNmGb
         9IUnuEBA+X58uyWbKgQtrCHvGoMzpRIIe3DSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=aCVY1lMQqlds9cbT4YRI1mCBCWom0blbPAzd/rzM8Zk=;
        b=fw/ssCpviTdjOhf3d1iW2VOR9BokyL6awdwjSVA4gjsSlGcySoxavDDN9RDReIz93q
         wuLF6101+jaf6o6qKKhl4ABiajKZfukrFKbr9aWiiFpnhCq33g5+5D1hvAA8q6ccLfkt
         eIRg8NRkoywmxK2RXTfmG1w7YX9Z9dsVDswsOxuZlVC28NPnXcj6nMcc7pZiLR3QiXF4
         CqhFwkiRidoMlXMsULkiKBTMO/Fxz97fg8P2QQvPKAALn5jB+qsPAOuuMPHHXleN930d
         EFCSAdQZUnvJy1mQPoTrQRkMr3WvQkYyCiSmBRH+XWLZCyZcKL+eGXOl7mHq+Kn3OcmI
         zX4g==
X-Gm-Message-State: AOAM530fPPo8vN8dD3e70zGM1sZIm26d4T/+2PoOQGLNhdc3CJFjpGpN
	v2wv22IYHNNWPO0mr8DejkwdrV/ppMx5YQ==
X-Google-Smtp-Source: ABdhPJz0KrZEufLSnFdBty9nRciihI8zj/XGgNlTDE7GXTsf96LsItty6S8nNzZVFxlDWqjQImnvPQ==
X-Received: by 2002:a1c:6a10:: with SMTP id f16mr9563556wmc.106.1610729487567;
        Fri, 15 Jan 2021 08:51:27 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:974a:2423:c71:b423? ([2001:8b0:aba:5f3c:974a:2423:c71:b423])
        by smtp.gmail.com with ESMTPSA id r2sm15857348wrn.83.2021.01.15.08.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 08:51:27 -0800 (PST)
Message-ID: <fb1e48e9b2cca8a0acb5d9da2081e091620253f2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] apt: add nativesdk support
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: hongxu <hongxu.jia@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 15 Jan 2021 16:51:26 +0000
In-Reply-To: <165A643B5E417599.21794@lists.openembedded.org>
References: <20210115094536.18651-1-hongxu.jia@windriver.com>
	 <20210115094536.18651-2-hongxu.jia@windriver.com>
	 <165A643B5E417599.21794@lists.openembedded.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-01-15 at 11:26 +0000, Richard Purdie via
lists.openembedded.org wrote:
> On Fri, 2021-01-15 at 17:45 +0800, hongxu wrote:
> > 
> > 
> > -inherit cmake perlnative bash-completion upstream-version-is-even
> > +inherit cmake perlnative bash-completion upstream-version-is-even useradd
> > +
> > +USERADD_PACKAGES = "${PN}"
> > +USERADD_PARAM_${PN} = "--system --home /nonexistent --no-create-home _apt"
> > 
> 
> I think meta-selftest/files/static-passwd  will need this adding for
> the selftests to pass?

I've tweaked the patch I've queued in master-next for testing.

I also added a comment here to say why we need this user (it used to
exist but was removed as it wasn't realised what it was for).

Cheers,

Richard

