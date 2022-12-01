Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2B4C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 10:36:51 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.39697.1669891006507688370
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 02:36:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OqZXSaPO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso1146165wms.4
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 02:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F/phmiWmgR+A1BFqw6I/ckenzMTdxTt8BSNP6w77aKo=;
        b=OqZXSaPOSvkbZ53Ne1fEm07en97luoA6vkoQJqm/AKnSKHmWJFqbIQh/WJXxxxOXrn
         jJnJcMgO2FQAv6im3359MhftqIqlSBDsjptIVlZJR06wue8/q8bfzl4k6WEFR7yJ7vIk
         TyhJmWUNMmCp2/16buw2jkuAEX1qks17txWco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F/phmiWmgR+A1BFqw6I/ckenzMTdxTt8BSNP6w77aKo=;
        b=qv2RyK+1NDwqs69/UmC0vl8r3tejouPStVvBFrUMKYUQXOXXWz7oLVzX0p4/Kh6VxX
         OYzZBtznsksMskXnif0on5qswKaJF9+m0oVKllNKNaF8mZyWp71zKbXPUxm6FoUmE/5H
         /ZsRi4RmPBMsyf45CkKpWBJKgbs+DWI/jet4/7MC4avuuuui8NRAeF4C57DG9I/P4N0O
         fSM7cZNQmDmzKyuCG04VW4C8Jc/l7ihdKMmo8vu8U8GZPjQWNrEqdQPD1uA9Jh6SqpKg
         7B0vqJf0hEr9RydBluQZli2FDoC10V/MQohr3Y7Nmy/4jtHMfsf2xE/JeBruM1YrKsyo
         Dbyw==
X-Gm-Message-State: ANoB5pk7aJLDZrhYDopKJU/S9yzEreMBV76jC+Zf5zAO7jAVPEF6Sxs4
	2Oia/4F7YIpKJQAyMVNlg2sO/g==
X-Google-Smtp-Source: AA0mqf6pMhft2SZ91fRjnVEghs5DzC1UGNkqLwTMb9vFq06Bd8IzJDyNIRhh4A5Es5wy5/I+vRzKFA==
X-Received: by 2002:a1c:4b0f:0:b0:3cf:735c:9d5a with SMTP id y15-20020a1c4b0f000000b003cf735c9d5amr41394258wma.113.1669891004593;
        Thu, 01 Dec 2022 02:36:44 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:3f4c:de93:c029:9984? ([2001:8b0:aba:5f3c:3f4c:de93:c029:9984])
        by smtp.gmail.com with ESMTPSA id k10-20020a056000004a00b002365730eae8sm4058578wrx.55.2022.12.01.02.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 02:36:43 -0800 (PST)
Message-ID: <7789406fab498cac64fd21a9bbbd74c9023dd68b.camel@linuxfoundation.org>
Subject: Re: [Openembedded-architecture] Y2038 proposal
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-architecture
	 <openembedded-architecture@lists.openembedded.org>, Yocto-mailing-list
	 <yocto@lists.yoctoproject.org>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 01 Dec 2022 10:36:41 +0000
In-Reply-To: <CANNYZj8dhdVTJVDeq6gxt7y4OUz1yJtrCKQ3TDTKhe9-BqFZWQ@mail.gmail.com>
References: <0b6801d90409$885d6860$99183920$@gmail.com>
	 <CANNYZj8Y37+s6Jzo1XvX0uCYNFc=NqOH8PWrFSL9_=TOS2ja7Q@mail.gmail.com>
	 <bda7b996024942763ae9d03ea0b958c3a38b04c8.camel@linuxfoundation.org>
	 <CANNYZj8dhdVTJVDeq6gxt7y4OUz1yJtrCKQ3TDTKhe9-BqFZWQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 10:36:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174049

On Thu, 2022-12-01 at 11:27 +0100, Alexander Kanavin wrote:
> On Wed, 30 Nov 2022 at 14:15, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > * We need to have a 32 bit ptest run on the autobuilder (qemux86 should
> > work, not sure we can make qemuarm fast). Whether this is manually
> > triggered, not sure. We could have a smaller set of ptests to run for
> > it?
>=20
> I just ran qemux86 full ptest locally. It took 4h:10m (same as
> qemuarm64 ptest on an arm worker). The fails were:
>=20
> {'python3': ['test_deterministic_sets'],
>  'valgrind': ['gdbserver_tests/hgtls',
>               'gdbserver_tests/mcblocklistsearch',
>               'gdbserver_tests/mcbreak',
>               'gdbserver_tests/mcclean_after_fork',
>               'gdbserver_tests/mchelp',
>               'gdbserver_tests/mcinfcallRU',
>               'gdbserver_tests/mcinfcallWSRU',
>               'gdbserver_tests/mcinvokeRU',
>               'gdbserver_tests/mcinvokeWS',
>               'gdbserver_tests/mcleak',
>               'gdbserver_tests/mcmain_pic',
>               'gdbserver_tests/mcsignopass',
>               'gdbserver_tests/mcsigpass',
>               'gdbserver_tests/mcvabits',
>               'gdbserver_tests/mcwatchpoints',
>               'gdbserver_tests/mssnapshot',
>               'gdbserver_tests/nlcontrolc',
>               'gdbserver_tests/nlgone_abrt',
>               'gdbserver_tests/nlgone_exit',
>               'gdbserver_tests/nlgone_return',
>               'gdbserver_tests/nlpasssigalrm',
>               'gdbserver_tests/nlsigvgdb',
>               'gdbserver_tests/nlvgdbsigqueue',
>               'memcheck/tests/linux/memfd_create',
>               'memcheck/tests/linux/timerfd-syscall',
>               'memcheck/tests/origin5-bz2',
>               'massif/tests/mmapunmap']}
>=20
> So I think we could as well fix these, and add full qemux86 ptest to
> a-full? It is not heavy on the builder machine (mostly just runs a
> single qemu thread), it's just long.

I think we should fix those and we should add the target to the
autobuilder but I'm reluctant to add a long test to a-full. The fact it
is relatively clean suggests it doesn't regress that often. We could do
something like a once a month trigger for it?

Cheers,

Richard

