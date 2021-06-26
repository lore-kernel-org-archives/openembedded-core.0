Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.7427.1624718937908278019
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Jun 2021 07:48:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HY+H/k+y;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id o33-20020a05600c5121b02901e360c98c08so8566847wms.5
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Jun 2021 07:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=5JaI4uyvh3X+2ncYUFEPz7MAvD2JXED7d/4qEvk/3JI=;
        b=HY+H/k+yRRx7XKP5Nq0gqcvvRFa4/ka/gs3qFXYiKoBCvQqCdAC9NsIMqWmRsZUZX2
         zpmK8g2QfTYK2qknNJuGaG3Z3KjfMdHO9teduAKJaX+l/vh4hgx6VnUJzORiDqAGJwAq
         rcSq3J34STakae0jghE+nbfXss7PslpkY6MHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5JaI4uyvh3X+2ncYUFEPz7MAvD2JXED7d/4qEvk/3JI=;
        b=IHvWMrBsut1SGQEY3S8gFvNWMVVkL6S4fsvu3jHYhAAAd7XdoInFDbc0vCvcIzBQ1R
         K2bmpGYcLDqPR0A1lk+cXGiiLAWAhY7wRqI+BRiAc2FV3+N/FwNmhBJqKjgkiJNakj0a
         L5TIYpK8lGWeb2YufyeIOSDR4bSscmqnAeorLlLK46HCy4g0GJal1QNOQ6hnzdGfbIhY
         7nszyUY8uc3SIh+CjgO6XXGTX6boX5HLmVUYiJi7vPSrD+UVKiSRfl4YAga1E3C6riRV
         WUbBs1kzollZg/f1ACxc/wkrp1UtxfQ8eHaGxHccSEIElbsrKYOWuCMdpUJ55IMk5drN
         r/Mg==
X-Gm-Message-State: AOAM531kVV4puLpMbNB+fwu3e/ye7luSIZPA2K+V0iz+5NMRoHyr1b+9
	anc/431k0vDK1chgdM5/yruWQw==
X-Google-Smtp-Source: ABdhPJylYA4ePJfF5HogeMeFdD4rQCsl9+dgxVVUTt+J6hMtD703t3eWSr3Woh95tNhN9A9ynFwyFg==
X-Received: by 2002:a05:600c:3658:: with SMTP id y24mr16705039wmq.6.1624718936409;
        Sat, 26 Jun 2021 07:48:56 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:2c6f:d408:8eb3:4ab2? ([2001:8b0:aba:5f3c:2c6f:d408:8eb3:4ab2])
        by smtp.gmail.com with ESMTPSA id l12sm9037980wro.32.2021.06.26.07.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jun 2021 07:48:55 -0700 (PDT)
Message-ID: <d51a4bc91088f8d11f4b7e474041a2dda3650bea.camel@linuxfoundation.org>
Subject: Re: [OE-core] Using RDEPENDS or RRECOMMENDS inside a kernel module recipe
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 26 Jun 2021 15:48:55 +0100
In-Reply-To: <12aff56f-000c-64c0-8578-f839642b480e@topic.nl>
References: 
	<1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.f27afeb7-e29f-45df-b516-6c058e15adde@emailsignatures365.codetwo.com>
	 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.e9eaa89e-7e17-4231-9d9b-986210f14e42@emailsignatures365.codetwo.com>
	 <12aff56f-000c-64c0-8578-f839642b480e@topic.nl>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-06-23 at 15:22 +0200, Mike Looijmans wrote:
> Simple question: How can I make an external kernel module depend on its 
> firmware?
> 
> Suppose I have a recipe "kernel-module-something.bb"
> 
> Now this module needs firmware to work so the recipe basically contains 
> this:
> 
> inherit module
> 
> SRC_URI = "..."
> 
> RRECOMMENDS_${PN} += "something-firmware"
> 
> 
> What I would expect is that if I add "kernel-module-something" to the 
> image, that "something-firmware" also gets installed. This however does 
> not happen.
> 
> The "something-firmware" package is being built, but not installed, even 
> though "kernel-module-something" is present.
> 
> I think the reason is that there are two packages created, one meta 
> packages called "kernel-module-something" that indeed contains the 
> dependency on the "something-firmware" but does not contain the actual 
> kernel module.
> 
> There's a second package named "kernel-module-something-5.4.0-blabla"  
> (where 5.4.0-blabla appears to be the kernel version) that contains the 
> actual kernel module, but there's no recommendation in this package at all.
> 
> 
> How do I properly make it so that installing "kernel-module-something" 
> will also install "something-firmware"?

I think there is something broken in the external module code. It should
be renaming the module to include the kernel version (for parallel kernel
installation from memory). It sounds like the rename is only partially
taking effect for external modules for some reason...

Certainly for the kernel itself, the modules created are just of the form
with the version in, the others are not created.

Cheers,

Richard

