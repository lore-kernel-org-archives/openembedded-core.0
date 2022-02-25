Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64EACC433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 12:11:41 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web09.5837.1645791099077889861
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 04:11:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fE657dvn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id d28so4199786wra.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 04:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=GnpAUojuhunZdFbqsCkW3r/QvZ3X85Jm5KUoPbeHPZ0=;
        b=fE657dvnTzMWRE0e2z5di4TehuIF5j6sRClZ7uRNqzFKBOFI0Y3lrFWlOfHxjNjY45
         OpX8bPARQLXWf0uS6Lh7Lx4MfTS09ZG5IQ5YjVuXSlsAfTHjZPsKwiTGRgVkGYRlpxiE
         VZ4BT9MQIL6U8sqybM0uUby5g9w8shngYIXA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=GnpAUojuhunZdFbqsCkW3r/QvZ3X85Jm5KUoPbeHPZ0=;
        b=eKuBYqJxD0HzGyU7In/mFVSRCYu5v6uvwyP5kbe3W2h1hrwXwc+UE6WZh4qvX+njJS
         iJ2ATWnDfqrYUcW0dgz9//cmHSkqnHG/+dpxJ0yKA/X7R/ZW8XLB2g55rOtPTZwMDhdO
         GqtPcXzotJL6Qu0k5ixt90yNx73AYVKBHjyzk9IhOvd04llT62XPBaW4IzncDVA8+wjf
         u8vDWUNePh3X6ZMPq3aTTlx2pvqCf+nIJn9S2xFyUzGvAiNQoEffbGS4YMeCyHn6j2MA
         1n5wukyH790ySESuWiRCoDBThoygCy8mHA7XucZ7KHCQCLc3X059k9gfqQMkxJ1G1Bvq
         7mVA==
X-Gm-Message-State: AOAM531piXqkGlO+JuWMoHFEOQ08mlrGi6ovi6djpusB1icp7lOLHlb5
	XE4/yFjAY7qzDERpHCJnvDtO0Q==
X-Google-Smtp-Source: 
 ABdhPJy/GoKi6tmR+IUrerT1UyOLg9IS5trxj+EkrD3iDCO4xCntB4JroEnJLMN9SslGdagTsyCEMQ==
X-Received: by 2002:adf:908e:0:b0:1e7:bea7:3486 with SMTP id
 i14-20020adf908e000000b001e7bea73486mr5715745wri.401.1645791097484;
        Fri, 25 Feb 2022 04:11:37 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8c05:a731:3c1:5d08?
 ([2001:8b0:aba:5f3c:8c05:a731:3c1:5d08])
        by smtp.gmail.com with ESMTPSA id
 s11-20020a5d69cb000000b001ef5b49d68esm2303541wrw.37.2022.02.25.04.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 04:11:36 -0800 (PST)
Message-ID: 
 <d6e448e9c2ee7f919187ff16e0697b0b0971c3cb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] systemd: move systemd shared library into
 its own package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>,
	openembedded-core@lists.openembedded.org, mingli.yu@windriver.com
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Date: Fri, 25 Feb 2022 12:11:34 +0000
In-Reply-To: <1594db98-46b6-7358-0649-a61e59b0b714@weidmueller.com>
References: 
	<20220223161722.14256-1-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <af819494e57fe7da1b44786b004488a72f3f4c48.camel@linuxfoundation.org>
	 <1594db98-46b6-7358-0649-a61e59b0b714@weidmueller.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 12:11:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162343

On Fri, 2022-02-25 at 09:05 +0100, Stefan Herbrechtsmeier wrote:
> Am 24.02.2022 um 22:06 schrieb Richard Purdie:
> > On Wed, 2022-02-23 at 17:17 +0100, Stefan Herbrechtsmeier wrote:
> > > From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> > > 
> > > Move the systemd shared library (libsystemd-shared.so) into its own
> > > package to prevent a runtime dependency from udev package to systemd
> > > package and thereby to a second init manager.
> > > 
> > > Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> > > 
> > > ---
> > > 
> > > Changes in v2:
> > > - Fix SUMMARY override
> > 
> > This did trigger a warning on the autobuilder tests:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/2657/steps/11/logs/warnings
> 
> I will post a patch to add `INSANE_SKIP:libsystemd-shared += "libdir"` 
> to the recipe.
> 
> At the moment I have a problem to reproduce the warning. I don't see it 
> on qemux86-64 and have to retest with qemux86.

DISTRO = "poky-altcfg"

should show it. It happens since it makes libdir /lib64 for x86_64 instead of
/lib and only then do you see this error.

It is also worth noting we already set that skip for other systemd packages.

Cheers,

Richard


