Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0903CD4F5B
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 10:42:40 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.18824.1695379354099244207
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 03:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WNPEh/DP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40413ccdd4cso22536045e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 03:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695379352; x=1695984152; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A/8ri9g+yxlUexwGOA2QxjSR20ljRAdlqw3sPSFzzs0=;
        b=WNPEh/DPbTXaUenYb9IeOIqZpn9jZnrw9/KJUeeN+NUG42+daSsUzu9+Nne2C4JWLz
         5R3ALPV5pCjvq9UNFtj4X0jUR6ahSOB30MvBYpsJvE2n7y7NZu8O0CZc798iG3CFIdVS
         axGQU3lrFuc09p8Zx4D75KiiRojOIvytpmshg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695379352; x=1695984152;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A/8ri9g+yxlUexwGOA2QxjSR20ljRAdlqw3sPSFzzs0=;
        b=YlQrJg8rsmRajtFXduQsimegg7xtsa+KeZHZ6D9ltzwkdGcOYjEwvsWH5JcwOlOvlY
         mOP004shSOmMKBEAFAZBhDIlEF8SX4DtJtOecT/+uUb1gZjrqdoBvzWd38Tok2jaUqVk
         HrEIA4c7kFPpm8dI7y+o3nFX/Vpet7lsIEh/SnNO43v5VxSahu4BO68IBg54CTbkRgzc
         avMtXgIdiAINUodfNKYsER4vMtMAIWeLRKXiB/Get8M/QoAukfbjBAo78L3T9bjonYNP
         Xpg19T/K1/Y2JQLF4vx+ff/4xhtmTebd6PDIp9PGZXK6/1E8Oj/4+uUuXvDpuWCCg/sn
         Eb5w==
X-Gm-Message-State: AOJu0YwGJcpqb7FwceJegOEIYk9xEmmqM5xkihM4tEoN98uE/J5Ybz82
	sFkzQSKi+vR6UDCNaO+96iDAyA==
X-Google-Smtp-Source: AGHT+IFLTcJphmI5cLHOQfRWPu/N+FtTxehPnYnWq0qDBfqVTXcATxM2AxLPDl3u5ILvKQjZi5KZZg==
X-Received: by 2002:adf:ef46:0:b0:315:a235:8aa8 with SMTP id c6-20020adfef46000000b00315a2358aa8mr1661974wrp.2.1695379352411;
        Fri, 22 Sep 2023 03:42:32 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f6e4:1bee:736d:f9fd? ([2001:8b0:aba:5f3c:f6e4:1bee:736d:f9fd])
        by smtp.gmail.com with ESMTPSA id y12-20020adffa4c000000b0031f5f0d0be0sm4101996wrr.31.2023.09.22.03.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 03:42:32 -0700 (PDT)
Message-ID: <24b60007a669d075fa1e4ccd18980ada93714c7a.camel@linuxfoundation.org>
Subject: Re: [Openembedded-architecture] Core workflow: sstate for all,
 bblock/bbunlock, tools for why is sstate not being reused?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, "chris.laplante@agilent.com"
	 <chris.laplante@agilent.com>
Cc: openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>, Yocto-mailing-list
 <yocto@lists.yoctoproject.org>, ",openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Julien STEPHAN
 <jstephan@baylibre.com>
Date: Fri, 22 Sep 2023 11:42:31 +0100
In-Reply-To: <CANNYZj8eSZZOfPGYCdYPrWjHf74dmRW5uYAZfTBp7JemPXxQCg@mail.gmail.com>
References: 
	<CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
	 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
	 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
	 <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com>
	 <5ef99df95ab74e74df6f1e07ef4877487230d9fe.camel@linuxfoundation.org>
	 <CANNYZj8RAvj=sJtQuH9J_zKKAsUbhcdKe0hiA2JJy1wwxuzDNQ@mail.gmail.com>
	 <DM8PR12MB54304C00CC6C924121E1CBDF8BF8A@DM8PR12MB5430.namprd12.prod.outlook.com>
	 <CANNYZj8eSZZOfPGYCdYPrWjHf74dmRW5uYAZfTBp7JemPXxQCg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 10:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188096

On Fri, 2023-09-22 at 11:17 +0200, Alexander Kanavin wrote:
> On Thu, 21 Sept 2023 at 16:39, chris.laplante@agilent.com
> <chris.laplante@agilent.com> wrote:
>=20
> > That is very impressive and I'd also love to hear about what heuristics=
 it uses.
>=20
> It's actually rather simple. It uses glob.glob on stamps in tmp/, then
> on local sstate to find possible matches, then sorts them by mtime and
> takes the most recent. It's what would work most of the time, but we
> could add printdiff-all (print difference with all sstate matches) or
> printdiff-N (N most recent). It also could abstain from dumping
> locked-sigs.inc into cwd with both -S none and -S printdiff, unless
> explicitly asked
>=20
> I just discovered there's also scripts/bitbake-whatchanged (that
> hasn't seen activity in years and is neither documented nor tested).
> Unsurprisingly then, it doesn't work in the same scenario:
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> alex@Zen2:/srv/storage/alex/yocto/build-sstate$ bitbake-whatchanged
> libsolv-native
> Figuring out the STAMPS_DIR ...
> Generating the new stamps ... (need several minutes)
>=20
> =3D=3D=3D Summary: (0 changed, 0 unchanged)
> Newly added: 0
> PV changed: 0
> PR changed: 0
> Dependencies changed: 0
>=20
> Removing the newly generated stamps dir ...
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Maybe this is what RP was referring to when he said the tools don't
> work properly?

No, I've believed that should probably be removed. I think there was a
recent change to it.

I think we had a major step change in this functionality working when
this was fixed:

https://git.yoctoproject.org/poky/commit/?id=3D84a7485025dd4473403b8da36a0c=
979a3afd5e93

and this test case was added:

https://git.yoctoproject.org/poky/commit/?id=3D1bdcd76d2968c3cc6ec2815afceb=
a1cf98efd6d5

Things which used to be problematic:

a) changes involving changes to gcc-source since it uses a shared
sources stamps which confused the tools (at least used to). That may
have been before gcc-source became a recipe?
b) changes to a very common component (e.g. autoconf-native's
do_configure) which make it hard to understand where the root cause of
the changes came from
c) changes which affect many recipes at once, e.g. the do_configure
function in base.bbclass

It might be helpful to write test cases for the scenario you showed as
working above and some of the ones I mention above, then we can
document they work and have an easier way to add tests for issues
if/as/when we identify the problematic scenarios in future.

As you mention, it also uses mtime so perhaps issues happen if you run
a different build, then try and go back to the other config? I suspect
once you understand the algorithm the code uses, you can pick holes in
it.

Cheers,

Richard




