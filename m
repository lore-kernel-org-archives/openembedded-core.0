Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7C4C433F5
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 11:09:34 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.6868.1638443371965866857
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 03:09:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q/qNYyts;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id p18so22660703wmq.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Dec 2021 03:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=r6MBgYsxKk0PWyPlDkMTqR9ORtCU1Y7AaTc1MaqbXjo=;
        b=Q/qNYytsTLvTUPZ2gwljnkYGlDYc/4RfBglj157czxmMVxLtkoG1bzLUUVsyctRBGp
         gZM8oL1ruSYr5Pi/qdMtQqKy0nUnque0+TKJQwr1ij+UHsQ/8fymkWUou40biKSmLx4X
         D3LXG7CNFjzVxn7CuROHFDBtCeW/MV3k36ThI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=r6MBgYsxKk0PWyPlDkMTqR9ORtCU1Y7AaTc1MaqbXjo=;
        b=TiIGfj4JtWCrrbT9i5bZ99uz2p3+9Bw0GrLrJInGdiC5+SZSGhQQNkUHNRIezRE43r
         G1c+jwICELaaJcuKPXYveMhCTor8tMSoIh4W3qBt6PMYX3D9ixL7FH5sWMFy7Tq2fyfF
         7zjSly0cc4tzhuqciGkPfDamXUWezykr8cg9TSrG2f+smoomRt8UAy33hKJuCNzSgPaB
         qYsDTDIvhANdtNTWgFYxkJvnHxJ3khDrGHjQczSFk5JO+fqMO2cBOzUj8CnpX4cewuyR
         ZXpKQfNuog29eziKUzHEoagbHfUSU7T3OmHtpnkGKGl8Mq89QhB42lfwxZWz09KPm9tY
         Dd1g==
X-Gm-Message-State: AOAM530EUxeTM4RgdlrbmxGvtekNX2N5jUuxNprZDsD6WfqifKVhi3Gd
	QIeR48LiVBHMUiRe+88hf4ro+Q==
X-Google-Smtp-Source: 
 ABdhPJw/pohG3+bD3vM+bCTSrZbjFPOdsVrf+Ev7xG2S1ExnicwLFkVbbmGdb0HUKkj6ry3FJlB7Dw==
X-Received: by 2002:a05:600c:c1:: with SMTP id
 u1mr5397589wmm.163.1638443370226;
        Thu, 02 Dec 2021 03:09:30 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:d27a:3e0:de4a:4b51?
 ([2001:8b0:aba:5f3c:d27a:3e0:de4a:4b51])
        by smtp.gmail.com with ESMTPSA id
 t189sm1847479wma.8.2021.12.02.03.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 03:09:30 -0800 (PST)
Message-ID: 
 <c95df2f5084fd93bb10e308e5b501c92c0779d44.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH v2 1/2] bitbake.conf: Pad rpath and remove
 build ID in native binaries
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 02 Dec 2021 11:09:29 +0000
In-Reply-To: <b83fcbb2-ecb1-6788-0a1e-1702f35165a6@gmail.com>
References: <20211130223722.852434-1-jacob.kroon@gmail.com>
	 <20211130223722.852434-2-jacob.kroon@gmail.com>
	 <89904fc65013c82975f32d0ffa6c4761019590e0.camel@linuxfoundation.org>
	 <fcaf8ef0-f2d0-a950-6c7b-527259446e98@gmail.com>
	 <0ea48dd5b84dcba4971886b35790aad516b7b6dd.camel@linuxfoundation.org>
	 <b83fcbb2-ecb1-6788-0a1e-1702f35165a6@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Dec 2021 11:09:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159085

On Thu, 2021-12-02 at 12:03 +0100, Jacob Kroon wrote:
> On 12/2/21 11:51, Richard Purdie wrote:
> > On Thu, 2021-12-02 at 11:19 +0100, Jacob Kroon wrote:
> > > On 12/2/21 00:11, Richard Purdie wrote:
> > > > On Tue, 2021-11-30 at 23:37 +0100, Jacob Kroon wrote:
> > > > > Try to make sure that the RUNTIME dynamic entry size is the same for all
> > > > > binaries produced with the native compiler. This is necessary in order to
> > > > > produce identical binaries when using differently sized buildpaths. I've
> > > > > tried using only patchelf, and keeping the linker flags as they are, but
> > > > > I am unable to produce identical binaries. Has anyone else managed to do
> > > > > this with patchelf ? If not, maybe we can write a new tool that can handle it ?
> > > > > 
> > > > > The build-id also needs to be removed since it is calculated based on
> > > > > the data present at link time. This includes STAGING_LIBDIR_NATIVE
> > > > > and STAGING_BASE_LIBDIR_NATIVE. Both will differ and they need to be temporarily
> > > > > preserved since some recipes will execute the binaries during do_install()
> > > > > (for example python3-native). Later on these are removed in chrpath.bbclass.
> > > > > 
> > > > > This hack is the first step for producing identical native binaries when using
> > > > > different build paths. 'zstd-native' is a working example.
> > > > > 
> > > > > Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> > > > > ---
> > > > >  meta/classes/chrpath.bbclass | 3 +++
> > > > >  meta/conf/bitbake.conf       | 5 ++++-
> > > > >  2 files changed, 7 insertions(+), 1 deletion(-)
> > > > 
> > > > I'm a little torn on this. Our other option would be to hardcoded a specific
> > > > dummy path and then edit it later to the correct value. That may be neater than
> > > > adding the padding. It will change the end binaries but hopefully only after
> > > > they're installed so should give the same net end result more neatly?
> > > > 
> > > 
> > > Hmm not sure I follow. This patch adds a new dummy rpath entry,
> > > "/rpath-padding-xxx...", then we remove it in chrpath. I don't know what
> > > other value we would like to put there. If I understand you correctly,
> > > we could perhaps pad one of the ones we already pass
> > > 
> > > -Wl,-rpath,${STAGING_LIBDIR_NATIVE}
> > > -Wl,-rpath,${STAGING_BASE_LIBDIR_NATIVE}
> > > 
> > > with spaces, like:
> > > 
> > > -Wl,-rpath,${STAGING_LIBDIR_NATIVE}
> > > -Wl,-rpath,"${STAGING_BASE_LIBDIR_NATIVE}${RPATH_PADDING}"
> > 
> > 
> > I'm wondering if:
> > 
> > -Wl,-rpath,/not/exist/our-native-libdir-marker
> > -Wl,-rpath,/not/exist/our-native-base-libdir-marker
> > 
> > would work.
> > 
> 
> Right, I'll give it a try.
> 
> > > If that works that would be less intrusive I think.
> > > 
> > > > If we separate out the build-id patch we could hopefully get that piece merged
> > > > as that shouldn't be controversial? 
> > > > 
> > > 
> > > Yes, I can split it out into a separate patch.
> > > 
> > > But now that I've looked at this for a while, I've asked myself what
> > > good does all this do ? The only optimization I can think of is that if
> > > we rebuild a native recipes, and the sysroot component turns out the
> > > same, then we don't need to create a new sstate cache entry. So we save
> > > disk space, but disk space is cheap. We still need to build it. What I
> > > would like is to have a common sstate dir for multiple build
> > > directories. So if I build libtool-native in one build path, then at my
> > > other build path it would just pick it up from sstate cache when I build
> > > there. In the end, is that something that would be possible ?
> > 
> > We originally started here with gcc-cross so lets consider that and multiple
> > build directories where a patch changes gcc-cross in a way that is irrelavent to
> > the output.
> > 
> > The "win" is that regardless of whether I build in location A or B, I get the
> > same gcc-cross binary. Hash-equiv will then not rebuild the target binaries.
> > Yes, I pay the price of a gcc-cross rebuild but hashequiv saves the targets
> > rebuilding.
> > 
> > Currently it would only happen if you always build gcc-cross in a specific build
> > path.
> > 
> 
> I know the build path will change if I upgrade to a new version of gcc,
> but then the output is most definitely gonna change as well.
> 
> > Like everything, it is a question of looking at the changes and deciding whether
> > they are worth any maintenance burden/code complication or additional overhead
> > they generate. I don't know the answer here yet but I do appreciate the research
> > in helping get us data to make decisions on!
> > 
> 
> I was thinking if it was possible to add a "build-path-does-not-matter"
> .bbclass that would make the signatures independent of build path and
> then scan the output to make sure it didn't contain any references to
> the build path. Then those recipes who didn't depend on build path could
> inherit from that class, and then maybe their sstate could be reused
> from multiple build directories ? Not sure reliable it would be though..

Another crazy thought is our sstate really is already path independent,
regardless of the binary content. You could therefore make the hash function
replace the path with a fixed string. The downside is that doesn't work well on
binaries due to offsets, alignment and so on.

As I read the above I was reminded that insane.bbclass does sanity check the
output for build paths and does have a configurable control mechanism. It
doesn't do that for the populate_sysroot output though since it is for
do_package.

Lots to think about here but you're right that adding some kind of scanner to
mark up recipes over time would help us preserve this.

Cheers,

Richard




