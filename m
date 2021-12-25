Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96CCC433F5
	for <webhook@archiver.kernel.org>; Sat, 25 Dec 2021 19:41:36 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web08.10147.1640461295353478029
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Dec 2021 11:41:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JudDanpn;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id m2so9358355qkd.8
        for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Dec 2021 11:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nsiUdsy7/aQi8UEFQ8zDf/q69l8yK00HdrtLSXyyWhY=;
        b=JudDanpn4zAL8z9Rcbu6sJ9//1htopYDJu0OYf+Rn/YoP5sEeKadHlzWf1dw4KixIQ
         ZhljNlJp64BrcS6X2BuGF4WPdJFBQiOdyoxUQe6kbhnafZorrHEkNX0DtKvvEKQd59Tf
         w9RPtwPDLczLrbroFO0nWrYj2X08PgUbqDIIDs0Fp909IKND7JhfzenIH68XaHqOJwsV
         by2xswgXKw1iRrpsgqhJ3q/CR+K+FkOyaGEbAglJvp9FwCYiSxKuXAvQwAeoijJDzKiE
         Ad93Ek8/ByiEE7ya86ins44wKnJLPKHKVfRTZNb6uCp41DCKg97+DXPbV2P+sXw5jpL7
         lT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nsiUdsy7/aQi8UEFQ8zDf/q69l8yK00HdrtLSXyyWhY=;
        b=ymV2QWpxezV3cM/oldh0Rd2AtCWDJQtfn9A73ZNlQ+d9kKI3mnbzDNFuda6Em7WMQh
         IOPaaD9b2Bww1mn1Cph+5jE/H2pM7cwuNwb/KZ6DoX6fi9Y4hvsYXsWAXcJOur3/tEEr
         az1qN8aHWiGSOyAW0HTaidmfzk0+iZxlsuQRLJhvvmp7Cl5OV8acW9L3hX037VdlMzr4
         bjvg/HfUiMuKOKWpxYR/zGZTKBQ9pbvqNbQNTFtnWmfg8vw3KpKIffDDSXw6yX8zWFAd
         cS7AfHRcWM5fAFdAbWbC9ZpdHi59XsM+0TmQGtAAlS3u/2w6hW/2w7kqiehemNCNse6b
         yBZQ==
X-Gm-Message-State: AOAM533YYAfrFUL7EgbrZinrIeysLjJMoXJbDTv0OyG1UaDbMh0dxEsP
	aTaOfVwMDa+gsVVYE7hLMvNVvV61YFEoxUR6y7U=
X-Google-Smtp-Source: 
 ABdhPJyAa8oaMG1oI1pM0TJFb2XI/yQ5PN+WUU8tVjKofJH6PMCUtyqB9LiXRSbyxKyDP6tqH0cg7r4+wgnF4vRWH5k=
X-Received: by 2002:a05:620a:1496:: with SMTP id
 w22mr7910969qkj.463.1640461294216;
 Sat, 25 Dec 2021 11:41:34 -0800 (PST)
MIME-Version: 1.0
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
 <CAMKF1sotV_QuheVfSyCBndQiKr_suBEnzDuWfExf=LgfT0yRww@mail.gmail.com>
 <3cf5e25c0e49befed250ec01f58a6ed086e4b65c.camel@linuxfoundation.org>
 <AM9PR09MB46425B8EEB7D75744A976E6EA87F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB46425B8EEB7D75744A976E6EA87F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 25 Dec 2021 11:41:08 -0800
Message-ID: 
 <CAMKF1sqwLRvy7o9cmhOq7PBvPFsD3F22jN3b2cDykCrxpsLjsw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Dec 2021 19:41:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160006

On Fri, Dec 24, 2021 at 2:36 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
>
> I had a look at the failures and most of them are fairly easy to fix -
> all but the go recipes like influxdb.
>
> I'm not sure how to deal with that, so there aren't that many options here.
>
> Either
> - inject all the needed with a fixed revision, but that would prevent
> devtool from catching updates to them properly
> - create recipes for all of them and pray that there won't be a circular
> dependency in any of them
> - allow go to work with network (the least favorable option IMO)
>
> in the case of influxdb for instance we are talking about
>
> github.com/peterh/liner
> golang.org/x/crypto
> github.com/influxdata/influxql
> github.com/influxdata/flux
> github.com/BurntSushi/toml
> github.com/influxdata/usage-client
> golang.org/x/text
> go.uber.org/zap
> github.com/klauspost/pgzip
> github.com/prometheus/client_golang
> github.com/jsternberg/zap-logfmt
> github.com/mattn/go-isatty
> collectd.org
> github.com/bmizerany/pat
> github.com/dgrijalva/jwt-go/v4
> github.com/gogo/protobuf
> github.com/golang/snappy
> github.com/tinylib/msgp
> github.com/opentracing/opentracing-go
> golang.org/x/sync
> github.com/apache/arrow/go/arrow
> github.com/pkg/errors
> google.golang.org/grpc
> github.com/kraj/xxhash
> github.com/influxdata/roaring
> github.com/xlab/treeprint
> golang.org/x/time
> golang.org/x/sys
> github.com/jwilder/encoding
> github.com/dgryski/go-bitstream
>
> where especially the golang.org/x modules are known to have circular
> dependencies like x/a relies on x/b, while x/b requires x/c and x/c
> needs x/a for building.
>
> Not sure how to tackle this - any thoughts?

right. Unless we can fix these modern language ecosystem use in OE
this is going to be quite worrisome to enforce
unless there is a tool for folks to convert these innumerable
dependencies into DEPENDS or SRC_URIs, perhaps devtool
could be enhanced. Asking folks to add so many entries by hand is a no go.

Perhaps its better to apply this in stages, where it is enabled on
C/C++ and some of other ecosystems where package management
and build systems are not part of language ecosytem.

I don't even have a formulated idea in my mind as to how to solve them
for OE and bitbake method of fetching.

>
> On 24.12.21 09:30, Richard Purdie wrote:
> > On Thu, 2021-12-23 at 22:00 -0800, Khem Raj wrote:
> >> is this list of failures due to this patch ?
> >> https://errors.yoctoproject.org/Errors/Build/137579/
> >
> > Looks likely, yes. Recipes shouldn't be attempting downloads in do_compile :(
> >
> > Cheers,
> >
> > Richard
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#159996): https://lists.openembedded.org/g/openembedded-core/message/159996
> > Mute This Topic: https://lists.openembedded.org/mt/87909311/3647476
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

