Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web08.7954.1615738365204832587
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 09:12:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NnjbZ9Ob;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id l19so6711710wmh.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Mar 2021 09:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=v6VIDJSgS8klTdEnpEW22mGzkYwMVPas1TG+wogywns=;
        b=NnjbZ9ObHsTvyfQaxTlHSYbh7a6iwRkOEdsMr/xwHg7nIsTV+/4aUxACWthAEO8cc5
         fb1RMinQrISKu4SdWfeJMkbd9UZKDrD8LyZ9fvWuj2Urls6qhg/qZIw+0NHmGV+9gswO
         F5IzMqI5SGJ9aXpD9c0CtvSb+AI9T8+fLVIpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=v6VIDJSgS8klTdEnpEW22mGzkYwMVPas1TG+wogywns=;
        b=tE6SVcmJDKyWG6dMn7LlLr/UTOUw2iBzle10n1ip2qzZG3aAiVoGz8k8UdCDYr4tiu
         87vgY3Pcvi6btubJl0RM0v3UCIcaurYNUFsj/fvlVg+N/o8gRRWPTDRQkJKoBljUASUQ
         TiA0lC6W3KB/jGR9RXKfKEFVpfPLPsU379kpbPz0Y90wWYgFG5fAzG2F7BjUQO5WWLuH
         ombzpMXTLMhz290/WiBa3XRQS4UIlX3Wwpf3wncUXCSHS7ay7VFJclAPKavwmWR23kIb
         I3yHUkeISz147Q2p8WJhi/S92tG2sAIZXLKcGhnINfvlb3LpQrZit4CSPSRg4eucOhq8
         9i+g==
X-Gm-Message-State: AOAM530Wj0UvP1Ht+2/18E8FVpYmOnkb3bMIk5Lu1eHA5O3aB71KzZ0v
	R+W2ZRDKvP2y/eqis3CnqpsuLg==
X-Google-Smtp-Source: ABdhPJxNrv2yVPSPAkMFt9DePdiE64OrKAeS9gJ+8sYOROhWxc8cC88CcpJJaZG74B5ImIfI+45cZA==
X-Received: by 2002:a1c:195:: with SMTP id 143mr22630199wmb.147.1615738363609;
        Sun, 14 Mar 2021 09:12:43 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9c7e:acfa:71fe:22ea? ([2001:8b0:aba:5f3c:9c7e:acfa:71fe:22ea])
        by smtp.gmail.com with ESMTPSA id u20sm17085595wru.6.2021.03.14.09.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 09:12:43 -0700 (PDT)
Message-ID: <8e7984950df26a5dc7bf3a427c04d24d6a764aaa.camel@linuxfoundation.org>
Subject: Re: [OE-core] sstate mirroring between different host OSes requires pre-building pseudo-native
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Matt Madison <matt@madison.systems>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 14 Mar 2021 16:12:42 +0000
In-Reply-To: <hx4N.1615729515427076467.TVRw@lists.openembedded.org>
References: <hx4N.1615729515427076467.TVRw@lists.openembedded.org>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-03-14 at 06:45 -0700, Matt Madison wrote:
> I run my CI autobuilders on Ubuntu 20.04 servers, which generate sstate that I mirror out to my development
> machine, which runs Ubuntu 20.10. That used to work fine - everything would setscene in as expected. For
> some
> time now, though, I see just about everything setscene in, and then everything also gets rebuilt from
> scratch
> again.  I'm not sure if this dates back to November when the change to de-universalize pseudo-native
> happened,
> or with some more recent pseudo-related changes, as I only had time to investigate it this week.
> 
> If I bitbake pseudo-native first so it's at least in my local sstate-cache, then everything works as
> expected
> again. It's only if pseudo has to be built from scratch that I get the rebuild cascade. I thought this might
> be due to my distro setup, but it's easily reproducible with a stock poky setup.
> 
> Is this the expected behavior now?

Sadly this is expected, yes. It wasn't really intended but an unfortunately 
side effect. Ideally bitbake would delay the rest of sstate until pseudo-native
is built but it never used to be able to do that. The code probably now can 
cope with it but it would need modifications to runqueue to make that happen.

Its something I'm aware of and would like to improve but the release needs
priority right now.

The reason is do_package sstate must be extracted under pseudo-native. The
irony is that sstate would likely be skipped anyway but it realises the
"hard" dependency isn't present first :/.

Cheers,

Richard

