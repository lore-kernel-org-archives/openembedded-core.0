Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85EB1C4332F
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 11:52:20 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web09.10253.1667562738380101864
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Nov 2022 04:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BglSAJSX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id z14so6711870wrn.7
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 04:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78ji5OICCrsZEVmyprU95/GmwiFKXJsa49Y8YGOxupw=;
        b=BglSAJSXHxhf9oUa6NP7bve4XkNtKnnvYGsX7p/SM/vTof4ltBk75bPl2herKAdyf7
         3SpO1nXOim+sOOHv0No6iGgQCnn7HCDA6vNbrcd3Ho4RWoMkui6eJvpTbEUQIJPgEHJw
         ObO3VDtq06ped/LZUoM0ToQhSWkR/bYOzepVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=78ji5OICCrsZEVmyprU95/GmwiFKXJsa49Y8YGOxupw=;
        b=bNv25TcbOBcqUK+PHlUYabGORlf2Cp0e6NMixZCkcOIik+4ymT15uUCB6b77O+JQcX
         F0IA+sdidSS/jGmPYGZdGXaB9EEGWh35N8RksnvIBkHtbnOVL3g65NiNSFe3rKdB5Yg5
         iaC7uWk4AeThsIJE0fRNTJ+YLM35+gtGzMQtNUiVgAEMjyCNEvmLmJw26ho4RG/euWw/
         sd45hFwaq3hQw1sInCRDdJcxMRKVwhc9kpDdE34mMUV98cT3TLq/mMlZa4kvnGCu+7mN
         U9gZP6qS2oCdqFlS56t/gv2mAGXRX/d7IHBpEPNJEGh3Adq/6g9p14rqMOpdqr6K+dyW
         9kQg==
X-Gm-Message-State: ACrzQf2XJajEfOugfHRoHIefOzVYX280sUO25MqrAnF11nrYt5/b80VJ
	lqLoFLvgUeMquXviUHq21SqxOg==
X-Google-Smtp-Source: AMsMyM7TRcU2O2c8X+oe3C4TfXu9rqnnzB6ILI0wDR3EXsjgWyf0g2n70QMzxwqEd5Nsj/3RtcEv8w==
X-Received: by 2002:a05:6000:16cd:b0:236:cd1a:ba1c with SMTP id h13-20020a05600016cd00b00236cd1aba1cmr10831593wrf.261.1667562736731;
        Fri, 04 Nov 2022 04:52:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:28c5:bec7:4f4d:2683? ([2001:8b0:aba:5f3c:28c5:bec7:4f4d:2683])
        by smtp.gmail.com with ESMTPSA id n4-20020a5d6b84000000b0022e653f5abbsm3184665wrx.69.2022.11.04.04.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 04:52:15 -0700 (PDT)
Message-ID: <49223fb956876d85594aa4422f059b2a77a5b4db.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] wic: make ext2/3/4 images reproducible
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Sergey Zhmylev <s.zhmylev@yadro.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 04 Nov 2022 11:52:13 +0000
In-Reply-To: <f7e064ae844cd96077a0a2425b0a6bfec2ef3c28.camel@yadro.com>
References: <20221103152607.3940380-1-s.zhmylev@yadro.com>
	 <70a1078f7098f7f1a83b88edac014be98b2da46b.camel@linuxfoundation.org>
	 <a4cb2d144c4987413a90c6dfa4821c7ae27be753.camel@yadro.com>
	 <6f749c3ed28b0bfa7be8e55c5e9c9befbea15c09.camel@linuxfoundation.org>
	 <f7e064ae844cd96077a0a2425b0a6bfec2ef3c28.camel@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 11:52:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172710

On Fri, 2022-11-04 at 11:16 +0000, Sergey Zhmylev wrote:
> On Thu, 2022-11-03 at 21:51 +0000, Richard Purdie wrote:
> > =C2=AB=D0=92=D0=BD=D0=B8=D0=BC=D0=B0=D0=BD=D0=B8=D0=B5! =D0=94=D0=B0=D0=
=BD=D0=BD=D0=BE=D0=B5 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=BE =D0=BE=D1=82 =D0=
=B2=D0=BD=D0=B5=D1=88=D0=BD=D0=B5=D0=B3=D0=BE =D0=B0=D0=B4=D1=80=D0=B5=D1=
=81=D0=B0=D1=82=D0=B0!=C2=BB
> >=20
> > On Thu, 2022-11-03 at 18:53 +0000, Sergey Zhmylev wrote:
> > > Hi Richard,
> > >=20
> > > Thank you for the comment!
> > > Well, the environment described in reproducible guides currently
> > > does
> > > not provide binary reproducability due to extfs implementation.
> >=20
> > Agreed, there is an issue here. I just don't think the patch looks
> > quite right.
> >=20
> > > Moreover, building on some FS (for example mounted with noatime or
> > > not supporting crtime field at all like UFS) makes the extfs
> > > creation
> > > process totally not reproducible in spite of any modifications on
> > > the
> > > source files.
> >=20
> > You're arguing we need to set crtime, ctime and atime which I can
> > believe. The mtime however should be fine from the package manager so
> > I
> > don't think this patch should be changing it.
> >=20
> > There may be a case for just setting the others to mtime instead of
> > SDE
> > too?
>=20
> Unfortunately, there is no other way to properly get mtime of the files
> in order to clone it into atime/ctime/crtime, than create a large
> listing of the files and ask debugfs to print stat information, and
> then parse the long output creating a debugfs script.
> This process can lead to additional bugs and will take a time.

What about adding a new command to debugfs which basically does this
for us?

There are two options I can see, one to clone the fs info, the other
could be a clamp operation, process all the files and change any file
with a timestamp later than SDE, to SDE.

I'd imagine upstream could understand a usecase for this.

> > > I've checked the behaviour under multiple conditions, double
> > > checking
> > > that I've set as much reproducible stuff as possible, and it comes
> > > out that in certain circumstances rootfs files have incorrect
> > > timestamps -- they're set to the build process time.
> >=20
> > Which timestamps though? Isn't mtime ok?
>=20
> mtime "mostly" looks ok, while the others were definitely bad.
> There were several files, not only fstab before my previous patch, but
> also rpmdb.sqlite and some dnf-related stuff, and so on, on which mtime
> was set improperly anyways.
>=20
> According to https://reproducible-builds.org/docs/source-date-epoch/ if
> the user specified SDE, the "last modification of something" (aka
> mtime) must be set to this value.

That link is a guideline, not a hard requirement. We go to quite some
lengths to preserve file timestamps throughout our build process so I
don't feel that destroying them all when creating the filesystem is a
particularly great solution.

I'd like to see mtime preserved and only values greater than SDE being
clamped.

> Taking all the above into account, there is nothing bad in changing all
> the inodes timestamps: mtime (SDE requirement) and atime/ctime/crtime
> (to overcome extfs building issues) to the same value -- specified by
> the user.=20

Yes, there is. It isn't what the package managers created or expected
and the timestamps don't match the packages.

SDE is a tool but the reproducible builds people would not advocate for
setting all timestamps to SDE, only those that otherwise wouldn't be
reproducible.

> >=20
> > > So I'm sure that if the user set SDE to a particular timestamp, we
> > > should also modify atime, ctime and crtime.
> > >=20
> > > P.S. overriding only the time later than SDE could have also been
> > > an
> > > option, but in reality we can not surely gather stat info for each
> > > file without debugfs or similar tools and this will tremendously
> > > degradate performance of already pretty slow image creation
> > > process.
> > > Due to this I suggest the patch I've sent.
> >=20
> > That stat information should already be present?
>=20
> Right, but as I said, it's pretty tricky to obtain it for later use.

I think we should think about a slightly different approach with more
involvement with the tools. It may be worth talking to upstream to see
what may or may not be acceptable.

In particular, I don't want to destroy all the mtime data.

Cheers,

Richard



