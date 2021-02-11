Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.8214.1613048687149411634
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Feb 2021 05:04:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=anfOdvN8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id u14so5669993wmq.4
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Feb 2021 05:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=iUauJ9w3jLKSSX7FNn1BKKqa2m2CgBm4FaA/UYIoChE=;
        b=anfOdvN8okMiUoPk5zdgbv4IxRo7DUGk0jVN5VW59jy5DS3c59arXICujagokEcZvC
         jWRIZ30m+Vv332KX7CUF6UeHCpF14DWlK0vXGkf/1ObU7N14M4JVokRy3759R9WsEYSs
         pNAtmjl+e79iYZdo+HdXe9plECjuzuL0Stm0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iUauJ9w3jLKSSX7FNn1BKKqa2m2CgBm4FaA/UYIoChE=;
        b=k6uYCQzAGkKmZRWiuizbglgK/dB6IHHoIqcKg+q8pf0RgkRXpt6YdwdJJ3e7QYyNAQ
         RJbA/KFQLSK0hvOu+UEtqR8regqwlNCmvA76ewXSbiqlNol1W7cuXgZNJIHK4MII4945
         PIYKQZMJ2HnypgbUfQBtqc9XNNkslIKdwkJcUIVtH4rl/SH5tEwtF/4+vGGmpVFM3D2P
         XOHnk6qBkOmKKpIWlKjBsAhTeF3qdeNqXmBLqfKiFvMY4hVCWVhZG8NwSE1Mlsn+pOJN
         22lWMOvE3CPe5NxKlzbCDUVaTeXlZJ9pW6nY1rmGF4/5L4eUp2g3BklAj6Is0HHq/nCL
         5RGA==
X-Gm-Message-State: AOAM5318VbYbOyCrfYAJqCpnbcxe1IxqBX59mmObogEFcgfzwlsZTnis
	j2XuTavmy2u8xeGLxokycTw03g==
X-Google-Smtp-Source: ABdhPJwwTMW6SqhOx+G3Jaiy4Q9h8gfzKRpJyuVbjqrY+BysaeyKlESrWwgWpqKId1sREVxe5eXXGQ==
X-Received: by 2002:a1c:98d4:: with SMTP id a203mr5216904wme.10.1613048685663;
        Thu, 11 Feb 2021 05:04:45 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1f44:6379:818:1e61? ([2001:8b0:aba:5f3c:1f44:6379:818:1e61])
        by smtp.gmail.com with ESMTPSA id c9sm9778847wmb.33.2021.02.11.05.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Feb 2021 05:04:45 -0800 (PST)
Message-ID: <df38a497ef1c31b72445d7ae2361d3d6db676f6e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] insane: Add test for native/nativesdk inherit order
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org, tomasz.dziendzielski@gmail.com
Date: Thu, 11 Feb 2021 13:04:44 +0000
In-Reply-To: <AM9PR09MB46424CCD4DD40C8DC3F59403A88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: <20210124095546.3329-1-tomasz.dziendzielski@gmail.com>
	 <AM9PR09MB46421810B3B2B59AAB545357A88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
	 <adeb07bdec1909082286a2dd6d16757adaf9098e.camel@linuxfoundation.org>
	 <AM9PR09MB46424CCD4DD40C8DC3F59403A88C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2021-02-11 at 13:10 +0100, Konrad Weihmann wrote:
> 
> On 11.02.21 12:43, Richard Purdie wrote:
> > On Thu, 2021-02-11 at 08:21 +0100, Konrad Weihmann wrote:
> > > After this patch got merged I notice some "noise" in my builds.
> > > 
> > > For bbappends which inherit unrelated classes I get a lot of warning like
> > > 
> > > Issue: nativesdk-openssh: native/nativesdk class is not inherited last,
> > > this can result in unexpected behaviour. Classes inherited after
> > > native/nativesdk: my-custom-class.bbclass [native-last]
> > > 
> > > First it doesn't give any hint that this is caused by the bbappend and
> > > secondly I have no idea how to fix that (if that is even possible).
> > > 
> > > So I would like to have at least an option to ignore these warnings for
> > > classes I'm sure don't cause any conflict - something more granular then
> > > just to deactivate this pretty useful check.
> > > 
> > > Thoughts?
> > 
> > This shouldn't be too common as most recently use BBCLASSEXTEND which
> > would ensure they're last. Which recipes are you running into this
> > with?
> 
> Sure, it does only affect recipes which are manually inheriting native 
> (I got a bunch of them, that's why I noticed).

Any reason they don't/can't use BBCLASSEXTEND?

> A (unfortunately) common pattern I face is that ppl share variables 
> between recipes using bbclasses - which to my understanding shouldn't 
> cause any issues when being inherited after native.
> And the same pattern is applied to recipes only being appended.

You could use conf files for variables. That is something I'd like to
try and encourage more of, I've been meaning to look at that for the
core too.

> > You really don't want your class coming after native/nativesdk, if you
> > understand what that code is doing you'll realise it is rather risky :(
> 
> Totally, that why I'm absolutely in favor of this patch.
> 
> > 
> > You could turn off that warning for a set of recipes if you really
> > don't care but I'd prefer not to make that too easy.
> 
> But that would turn off the whole feature, which is bad IMO.
> What I see (once that will be used by a wider audience in the wild) is 
> that this will lead to questions (consuming my time as an integrator) or 
> to the fact that this check will be turned off completely.
> Either way not the best choice if you'd ask me.

I'm hoping that people might fix the underlying issues.

> That's why I asked for a more granular configuration, so that a person 
> who's able to understand the implications of a bbclass in relation to 
> native could turn it off on a distro/site config level.
> 
> And just to be clear I wouldn't want that to be used widely, or even 
> being promoted.

I can guarantee that making any such option available will just have
people reach for it and use it. You clearly want to here when the
changes needed to avoid it are probably not that difficult.

> If that's not what the project wants, I'm also fine with it, but then it 
> would be really helpful to point to the bbappend as a culprit and not 
> the base recipe

I understand why you'd want it, I'm just not sure if would encourage
the right behaviour :(.

Cheers,

Richard

