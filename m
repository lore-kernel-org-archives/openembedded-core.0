Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 254A6C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 08:21:18 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web09.6060.1646122876563738101
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 00:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ek1u45z2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id
 c18-20020a7bc852000000b003806ce86c6dso769862wml.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 00:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=5qx2yny/3a6sB+pnR8n4tAXQHVZfmTnOhS607Q7LaBA=;
        b=Ek1u45z23k5g3UV+R0uNp0YL0XWiihiavuLiJQ6PMnIYNcSgahVR9r9pYvfTY0KHpB
         +jtIQj4fPEoKikqETU/4BO7Mi6CdqyQmXEGiH/HS1bFeevKezFrkMyBKye6JQ/Qx3mFf
         2ku4y6AZoGDw6LwahCU8oEDTBUpLr4g4EOrBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5qx2yny/3a6sB+pnR8n4tAXQHVZfmTnOhS607Q7LaBA=;
        b=IW+ULWrpTMgsn/81qd3+jUfJBS0SJfM8Ifo8nZJB0J/fgSr/b9EB8cVXgKI8y1erpN
         swZJ3qjYL9tZWKrkBUh/sD0T4ErsW3bRDB5S+7n2uP9g9zQ6rZ4nMN5rkAAvAHHxPhnM
         5hLp+JutIURdkvgwbCpx++N+3y29bTt4D88ehDQsYHW3iJzndbdeq/lihrMp1tgJvsdM
         Oy9Iu9FwJmAX4EcVyP0+9k4HQNxM9iMbvuvijqaq9vip8BRTJsVRAsa1/vD6VhRPCBNu
         p9gXUtBr8AXEY8WXBDWYyG0qrE7kWCu+2qGN80yGTIoZSoaLlIgXfYceeMfvtuIK4+wi
         /mxg==
X-Gm-Message-State: AOAM533WFgTZ5KVgK4kxcNtCmH3RrtmxbVrmQ5FmAImKTsAaDRqAK6ka
	oAF1UPe3GTfEPi1rsz2+/KE9Bw==
X-Google-Smtp-Source: 
 ABdhPJx1cPxLWcCmPvTzauRz1C5pJMDfMBaRd+dD4isRw2YVInSOSw7O8/uY3Lv6NKkO3aU6IaPdLw==
X-Received: by 2002:a05:600c:3583:b0:381:6974:e9d4 with SMTP id
 p3-20020a05600c358300b003816974e9d4mr6074813wmq.72.1646122874797;
        Tue, 01 Mar 2022 00:21:14 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f88:ec89:14b:c380?
 ([2001:8b0:aba:5f3c:5f88:ec89:14b:c380])
        by smtp.gmail.com with ESMTPSA id
 h9-20020adff189000000b001ea913352c9sm12803154wro.100.2022.03.01.00.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 00:21:14 -0800 (PST)
Message-ID: 
 <95f7b7a87d37215c4c5145f6a9316486e6ecc6e4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] coreutils: fix statx failure on native
 builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 01 Mar 2022 08:21:12 +0000
In-Reply-To: <7e92775d-b2b1-6482-4221-fb47935f1c47@windriver.com>
References: <cover.1646119426.git.liezhi.yang@windriver.com>
	 <373dcd3613b74ba10dba54f5116576bc172c222f.1646119426.git.liezhi.yang@windriver.com>
	 <6e3a32402d372d518e6c4bce86f54f4791aa5081.camel@linuxfoundation.org>
	 <7e92775d-b2b1-6482-4221-fb47935f1c47@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Mar 2022 08:21:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162533

On Tue, 2022-03-01 at 16:19 +0800, Robert Yang wrote:
> 
> On 3/1/22 3:59 PM, Richard Purdie wrote:
> > On Mon, 2022-02-28 at 23:24 -0800, Robert Yang wrote:
> > > From: Davi Poyastro <davi.poyastro@nokia.com>
> > > 
> > > Coreutils configure only checks glibc compatibility for statx
> > > syscall but fail to check kernel support.
> > > 
> > > Fixed on RedHat Enterprise Linux Server 7.6 (Maipo)
> > > Host kernel: 3.10.0-1127.8.2.el7.x86_64
> > > Docker distro: Ubuntu 20.04.1 LTS
> > > 
> > > $ bitbake coreutils-native
> > > find the binary ls and run it as "ls -l ."
> > > The result is something like: "?????????. ? ? ? ? ? foo"
> > > 
> > > Signed-off-by: Davi Poyastro <davi.poyastro@nokia.com>
> > > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > > ---
> > >   meta/recipes-core/coreutils/coreutils_9.0.bb | 5 +++++
> > >   1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/meta/recipes-core/coreutils/coreutils_9.0.bb b/meta/recipes-core/coreutils/coreutils_9.0.bb
> > > index e4633949f42..40fad72bbf4 100644
> > > --- a/meta/recipes-core/coreutils/coreutils_9.0.bb
> > > +++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
> > > @@ -152,6 +152,11 @@ ALTERNATIVE_LINK_NAME[kill.1] = "${mandir}/man1/kill.1"
> > >   ALTERNATIVE_LINK_NAME[stat.1] = "${mandir}/man1/stat.1"
> > >   
> > >   python __anonymous() {
> > > +    from distutils.version import LooseVersion
> > > +    # statx syscall require glibc >= 2.28 and linux kernel >= 4.11
> > > +    if LooseVersion(os.uname().release) < LooseVersion('4.11'):
> > > +        d.appendVar("EXTRA_OECONF_class-native", " ac_cv_func_statx=0")
> > > +
> > 
> > Shouldn't that be EXTRA_OECONF:class-native?
> 
> Yes, you're right, I took this patch from hardknott and built it, but didn't 
> realize that I need change the override syntax.
> 
> > 
> > Which makes me worry about where this was tested/needed?
> > 
> > I'm then a bit worried we have two different signatures for coreutils-native
> > depending upon which host this runs on, which will cause a number of other
> > issues. I don't think we can do this.
> 
> That's a problem, maybe we need disable statx for coreutils-native?
> 
> The errors happens when glibc has a higher version (Ubuntu 20.04 in docker) 
> which has statx(), but kernel version is low (CentOS 7) which doesn't support
> statx.

Disabling it unconditionally which a comment about the version issues may be the
only option we have. I'm not sure everyone will like that but if we want to
support that combination, I'm not sure we have much choice.

Cheers,

Richard


