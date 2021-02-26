Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web12.7769.1614337344791926625
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 03:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VDCb7NgW;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id u11so1260484wmq.5
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 03:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=XTa+dUxrGDyzveANKfhbLAKgmmO3trzGifD9uBRnfBU=;
        b=VDCb7NgWb6JAIlLjQCY0RAzuPWnEctqGUIxF/kFx29MTACcACPQih8xn0vU2UgOuuG
         vA1bmW7FRBjqV5c1jtwFXb+Bi6JR6z5kBsi5fGMZc6cBdG67bNX7SOcyj89I5oRxk8MI
         J7hDux3eqWB2p1RdXwtCkWAOlhUmVn+85w35M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XTa+dUxrGDyzveANKfhbLAKgmmO3trzGifD9uBRnfBU=;
        b=Lu+so2h7aUn5KKYP9FYgSBeN2JptFw0u9HR9DyWDB8KP5V6INe/4hcJAlzWxQR24Mv
         Zq5qnheukc0/5rs7nQFr0vm8WjqetkfuBukNzR1WcpcyyID6YNVMm4b4hQeQQv75lCNK
         SQKfSXemsPWoF93Nv5Xg1sshmrUPwxkp/x+LIMSoXki8X1xvdR+iSxW3Av1l+W5FOB5H
         ig0wOI0WvQoNhvEgeLiZh8VceK0QawMJTkjZJePdce/L0dZql47R2KUydFDbCJ9qY64l
         Ls1FQH9ylfRbRsnebBvs3URTwf4r1rzE8I86BAuEFS3PAkXpu1jF9O3E27XRMWCaBRMI
         7oYQ==
X-Gm-Message-State: AOAM533lrs7nYRtPP030QxmcTA59hjX9ZD+tgckVocwOfWDEtDtG4kl4
	X8jjvvh9+MnjzsAUSnwpmcPw9Q==
X-Google-Smtp-Source: ABdhPJxUwTmpPw3A1ByrRsvVRhu67KFQkKCWrd1MyBc3vgV+HFG4ZAMDHbQ5M22LJz+Q6LPnKHsDxw==
X-Received: by 2002:a1c:a916:: with SMTP id s22mr2347448wme.82.1614337343170;
        Fri, 26 Feb 2021 03:02:23 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f? ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id m24sm12492783wmc.18.2021.02.26.03.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 03:02:22 -0800 (PST)
Message-ID: <f073090d3108e89bfb8ef59fdccd42b472df782b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] toolchain-scripts.bbclass: customize prompt string for SDKs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Kai <kai.kang@windriver.com>, Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Feb 2021 11:02:20 +0000
In-Reply-To: <0a2eff5a-9121-e31f-abee-47c096799e85@windriver.com>
References: <20210225055914.34860-1-kai.kang@windriver.com>
	 <CABcZANm-+8uOoAskLz7GM4DDGrYM4c2O4NZyAz2WuHhdiH7jMg@mail.gmail.com>
	 <0a2eff5a-9121-e31f-abee-47c096799e85@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-02-26 at 09:57 +0800, Kai wrote:
> On 2/25/21 11:29 PM, Christopher Larson wrote:
>  
> > Are we sure we want to completely override it rather than adding 
> > to it? I'd be rather irritated if this blows away my prompt 
> > without my asking for it. I think either it should append or 
> > have a variable controlling whether this is enabled when building 
> > the SDK.
> The original requirement is that the PS1 after source sdk environment 
> file is as same as the original one.
> It can not tell whether in a sdk environment.
> 
> The default assignment of SDK_PS1 is '?=', you can set it in conf file to override it.

I've held off this patch for a while since I think its going to
*really* annoy a subset of users and as Chris says, it can't
be disabled. It would really need to be disablable through configuration
and at runtime when sourcing the script which isn't possible.

I appreciate the usability issue it is trying to improve but
I think it will cause more complaints than issues it solves.
As such I don't think we want to do this...

Cheers,

Richard




