Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFBDC433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 10:51:19 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.6662.1638442277936784807
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 02:51:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LXYiKTwY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id o13so58582910wrs.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 02:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=lM2GxIKw3HWd4R8hrxb7hcuwcbU4MOLcX1dktB+Cw64=;
        b=LXYiKTwYH4Aptw3d/PtzF5a5p1okPjIcyu12b4C7G+eUQeObQ7mV5bSJMH9VpjXrmy
         gjwqA1q31kNjMZiIgl1pM7CZDOJJ93fN5Iwfflokq/3ylSmvZbmJlvq9SW6jkaE4FdNJ
         E3fOvbiTNzzSw/7MriI1V+8/Q5pTOCX3BXz98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lM2GxIKw3HWd4R8hrxb7hcuwcbU4MOLcX1dktB+Cw64=;
        b=6t6ea9wPY2+WFaN9ClhqbMEEAsFpa6xLkFNrvo/vrIpk190twjweKjb7YnrZRLdnNT
         nOqS6OU2SJkXYUSasllB10Dtu4nyovoPXa6M2/P48zVNUbbiyiRz8blXdjo2T/0idX1P
         GI0Iq6l3+CR28KwEPk+JPo50B+gUAO19so7DEaCPrcjrErmjKjksefMpHouaq0qVbzO7
         KyGIZIMGB42cUxaALgq62CahUHjT9YmGaCEMJICJ5Hlnn8LX3igShGg8ttwNFfU/c0up
         T2QaiQfV2E2gKp4lVjQtQt2NsPuU3aIk6aXeIL3yY0nnBnnshNEk8lZ5xbMr2zTtlZmO
         qqbw==
X-Gm-Message-State: AOAM531tBuFtmlIDbCKjWvg/hRm3ljwIFj92HbYE3P52YHfEkyCZmU5U
	q6yO/QNw4TcZ3iL1BeueANuwzQ==
X-Google-Smtp-Source: 
 ABdhPJzpI2yEO8Muek078xK0SmT9uTq6HF+p5RFVJwUl9rkjcoxI68ajmJnS5Ox//fgYJbsWhW1Xqw==
X-Received: by 2002:adf:8b1e:: with SMTP id n30mr13600526wra.75.1638442276026;
        Thu, 02 Dec 2021 02:51:16 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d27a:3e0:de4a:4b51?
 ([2001:8b0:aba:5f3c:d27a:3e0:de4a:4b51])
        by smtp.gmail.com with ESMTPSA id
 b197sm1804803wmb.24.2021.12.02.02.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 02:51:15 -0800 (PST)
Message-ID: 
 <0ea48dd5b84dcba4971886b35790aad516b7b6dd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH v2 1/2] bitbake.conf: Pad rpath and remove
 build ID in native binaries
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 02 Dec 2021 10:51:13 +0000
In-Reply-To: <fcaf8ef0-f2d0-a950-6c7b-527259446e98@gmail.com>
References: <20211130223722.852434-1-jacob.kroon@gmail.com>
	 <20211130223722.852434-2-jacob.kroon@gmail.com>
	 <89904fc65013c82975f32d0ffa6c4761019590e0.camel@linuxfoundation.org>
	 <fcaf8ef0-f2d0-a950-6c7b-527259446e98@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 10:51:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159083

On Thu, 2021-12-02 at 11:19 +0100, Jacob Kroon wrote:
> On 12/2/21 00:11, Richard Purdie wrote:
> > On Tue, 2021-11-30 at 23:37 +0100, Jacob Kroon wrote:
> > > Try to make sure that the RUNTIME dynamic entry size is the same for all
> > > binaries produced with the native compiler. This is necessary in order to
> > > produce identical binaries when using differently sized buildpaths. I've
> > > tried using only patchelf, and keeping the linker flags as they are, but
> > > I am unable to produce identical binaries. Has anyone else managed to do
> > > this with patchelf ? If not, maybe we can write a new tool that can handle it ?
> > > 
> > > The build-id also needs to be removed since it is calculated based on
> > > the data present at link time. This includes STAGING_LIBDIR_NATIVE
> > > and STAGING_BASE_LIBDIR_NATIVE. Both will differ and they need to be temporarily
> > > preserved since some recipes will execute the binaries during do_install()
> > > (for example python3-native). Later on these are removed in chrpath.bbclass.
> > > 
> > > This hack is the first step for producing identical native binaries when using
> > > different build paths. 'zstd-native' is a working example.
> > > 
> > > Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> > > ---
> > >  meta/classes/chrpath.bbclass | 3 +++
> > >  meta/conf/bitbake.conf       | 5 ++++-
> > >  2 files changed, 7 insertions(+), 1 deletion(-)
> > 
> > I'm a little torn on this. Our other option would be to hardcoded a specific
> > dummy path and then edit it later to the correct value. That may be neater than
> > adding the padding. It will change the end binaries but hopefully only after
> > they're installed so should give the same net end result more neatly?
> > 
> 
> Hmm not sure I follow. This patch adds a new dummy rpath entry,
> "/rpath-padding-xxx...", then we remove it in chrpath. I don't know what
> other value we would like to put there. If I understand you correctly,
> we could perhaps pad one of the ones we already pass
> 
> -Wl,-rpath,${STAGING_LIBDIR_NATIVE}
> -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE}
> 
> with spaces, like:
> 
> -Wl,-rpath,${STAGING_LIBDIR_NATIVE}
> -Wl,-rpath,"${STAGING_BASE_LIBDIR_NATIVE}${RPATH_PADDING}"


I'm wondering if:

-Wl,-rpath,/not/exist/our-native-libdir-marker
-Wl,-rpath,/not/exist/our-native-base-libdir-marker

would work.

> If that works that would be less intrusive I think.
> 
> > If we separate out the build-id patch we could hopefully get that piece merged
> > as that shouldn't be controversial? 
> > 
> 
> Yes, I can split it out into a separate patch.
> 
> But now that I've looked at this for a while, I've asked myself what
> good does all this do ? The only optimization I can think of is that if
> we rebuild a native recipes, and the sysroot component turns out the
> same, then we don't need to create a new sstate cache entry. So we save
> disk space, but disk space is cheap. We still need to build it. What I
> would like is to have a common sstate dir for multiple build
> directories. So if I build libtool-native in one build path, then at my
> other build path it would just pick it up from sstate cache when I build
> there. In the end, is that something that would be possible ?

We originally started here with gcc-cross so lets consider that and multiple
build directories where a patch changes gcc-cross in a way that is irrelavent to
the output.

The "win" is that regardless of whether I build in location A or B, I get the
same gcc-cross binary. Hash-equiv will then not rebuild the target binaries.
Yes, I pay the price of a gcc-cross rebuild but hashequiv saves the targets
rebuilding.

Currently it would only happen if you always build gcc-cross in a specific build
path.

Like everything, it is a question of looking at the changes and deciding whether
they are worth any maintenance burden/code complication or additional overhead
they generate. I don't know the answer here yet but I do appreciate the research
in helping get us data to make decisions on!

Cheers,

Richard



