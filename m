Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC9C2C433EF
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 22:20:50 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.4078.1642112449514026775
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 14:20:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=goDsU2nS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id e5so4890639wmq.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 14:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=lBCcti9gAIpCNn+uee3OJahqyx4K86gTqQwvX4K7cVo=;
        b=goDsU2nSxQiW1yRzfxSle46PrSriALZF3nM/YOK80qIKaxiA/ieKzdHATFraJej672
         rsFTs10qZFfhe2ceAwxm4UVIPzfdPBVfrS2djRV+tKHYtrpJL0/QZjYQTmilPtTz2wKg
         Nk4R5GsDEBG4bdMkN8BeSK5lukW5BcjiD2Kj4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lBCcti9gAIpCNn+uee3OJahqyx4K86gTqQwvX4K7cVo=;
        b=6L3ujS1hqE2zG9O56OVXFLRhOWpx6cYpVMS6yM04da7bxoXkvZJbtvclq/7XUZAao3
         hadfdLf88EE1OEf93/gCYKKaePLngSdOOkFkE3hJ7eZfAT5XR90rAyy/+ouFv3W9M3yk
         Ww+2h/4GhhtAXrFq2TjPKbkhSM7jivF05B24DHN4Br0SgoAK9cWax4WvYqdf2rZzRZd1
         YYumtptbBnsCzY2TmQlN07xT/W4NT2Aa7hqSh/qU2i18Z0nB+jTKLa3iTxHv6vYKKHHL
         DBs+0FEqktePFfZtA0N7E63YHgDacM8uhE33JcxKsxCeuOEWOE/IkbQokaPKo2Iqi84/
         KWyg==
X-Gm-Message-State: AOAM530LYbVCwoHMH36HYVaAsRnKzQQSQ+si32jk+2hTEcfEZiKM0ibX
	NwgSTcuJuVsiMeWzqn8HxqkR/w==
X-Google-Smtp-Source: 
 ABdhPJxDpF4dt7FvDkNYZF3us8Tp0HEulJg0cHRamDKs30GEG/r2d0onw7Etmd7W9Cn9bdxkBeGK6g==
X-Received: by 2002:a7b:c942:: with SMTP id i2mr5613987wml.97.1642112448053;
        Thu, 13 Jan 2022 14:20:48 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b80b:58a:dabd:3794?
 ([2001:8b0:aba:5f3c:b80b:58a:dabd:3794])
        by smtp.gmail.com with ESMTPSA id
 f5sm3741827wri.52.2022.01.13.14.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 14:20:47 -0800 (PST)
Message-ID: 
 <1dabcf6c5f611aaaaea9eb9ac39151c296961eb3.camel@linuxfoundation.org>
Subject: Re: [OE-core] Zero umask when unpacking sstate packages
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Jan 2022 22:20:46 +0000
In-Reply-To: <60996169-d939-2a35-f6ac-8bd0edf37f1b@gmail.com>
References: <f914d2c4-b3eb-f52b-6010-0447ac874fb5@gmail.com>
	 <dc7564efda700a003c380edf6e769530cce15075.camel@linuxfoundation.org>
	 <60996169-d939-2a35-f6ac-8bd0edf37f1b@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 22:20:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160537

On Thu, 2022-01-13 at 23:11 +0100, Jacob Kroon wrote:
> On 1/13/22 23:07, Richard Purdie wrote:
> > On Thu, 2022-01-13 at 16:44 +0100, Jacob Kroon wrote:
> > > Hi,
> > > 
> > > I often see this diff churn in my buildistory for shadow-native (and
> > > similar issues with icedtea7-native from meta-java):
> > > 
> > > -drwxr-xr-x -          -                  40 ./var/spool/mail
> > > +drwxrwxr-x -          -                  40 ./var/spool/mail
> > > 
> > > One can reproduce it with:
> > > 
> > > # bitbake -c cleansstate shadow-native && \
> > >   bitbake shadow-native && \
> > >   bitbake -c clean shadow-native && \
> > >   bitbake shadow-native
> > > 
> > > I see that the sstate package contains the correct permissions for
> > > 'mail', 775. So it would seem to me that it is the unpacking from sstate
> > > that strips the group write permission.
> > > 
> > > Testing with the attached patch and the problem goes away.
> > > 
> > > Is something like this the correct solution ?
> > 
> > Is this with master?
> > 
> > I'm wondering if your code has:
> > 
> > https://git.yoctoproject.org/poky/commit/?id=c4ecf7c1122380cdbc74fe692aa91756dc5bdf6b
> > 
> > applied?
> > 
> 
> Yes, this is with master branches of bitbake/openembedded-core as of
> right now.
> 
> So yes, I do have that patch applied.

I guess that whilst the default task umask is 022, some chmod operations may be
run to change permissions that don't match the umask. These are correctly
captured by the sstate archive but not preserved by tar at extraction.

I wonder if the correct fix is to all -p to the tar unpack command in
sstate.bbclass?

In many cases it would execute under pseudo so there wouldn't be this issue but
a native populate_sysroot wouldn't be under pseudo do we'd only see that here...

Cheers,

Richard


