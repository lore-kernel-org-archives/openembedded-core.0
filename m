Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23AE9CD4F41
	for <webhook@archiver.kernel.org>; Fri, 22 Sep 2023 09:17:49 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.17598.1695374261264210460
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Sep 2023 02:17:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G3Vkbrg+;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2bff776fe0bso32096571fa.0;
        Fri, 22 Sep 2023 02:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695374259; x=1695979059; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q9V1jANl8LGgJwqHVOEygFFMI353a1lf+TbGADsMo3Y=;
        b=G3Vkbrg+Bm04rAJSxqBHhJUcH8H453iHHZt0I8lEqHgmgH5S9M0Iy60/JrbwrBc0kn
         hC8TB//t4iWhVGDpZ3nOMr6zCgYOCy+59J3L9muidOqbs4E9lDdM9MMl2I/1QiA0nwIL
         x4H/44clk4Nn8p+sczeqSSkH5wqwp03qigGvm6iETaB5WdRjx4kSPGTVkJ6KoRlOvCFJ
         +1L4wNgFGXT6n6SLntyKFO1cr4AvorXBVpa1ker7TK8GA6RPre6eIZETVz9fuTRwahuQ
         IjlHaBOgxQowOSwd/ARHByge9/ZX1vzdUUhP7q+bU3flFRtdjt/jV0Yj1EpNUTTsJxgK
         eieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695374259; x=1695979059;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9V1jANl8LGgJwqHVOEygFFMI353a1lf+TbGADsMo3Y=;
        b=WjrVd6xYeq1qzD1k2ZEzaAgov5zc/34o54EhKjT0rWORevF2ysfVccPD+ZQqwYXQZB
         om8aYnsltAJpxTHUBcFfpCu3umspHfTKjLjQd7bTI8wCMMCG55oQSGfZOpFK3x8j0VBi
         Up0//4BtIWRV1I957nR9YHkJnW2ydenjwL7ZGrjbPD2hTX+yd1Kxts9eF4eSdUaqj6OQ
         K2G1jTueVb9QSnG9ohDzmKo1O8R1vQi2KZ/Ul7o3XBBZGhfcsBUf4h1tXweTAkh4Qu+8
         OQvLynQyPo0BSuFyqbOGo7ESVWlUp6wli9hvwhYDzWX8a3f0SwAGCkUyZ7FT379jR5n5
         /c4A==
X-Gm-Message-State: AOJu0Yyo4Jh+Stkhw7VfA+swg/HC9KX5Eu9Ntd00f56M5tnOQBw8fuZx
	zY8xKT4uYMwaBFPcqUjJ5lYgWwxlHf7lzonVyYM=
X-Google-Smtp-Source: AGHT+IEWGw/4ix88z4mLDtnxCd9rw7SpHrOpO9kg2GZABXf4xRx04gwAOTbmvYpLY+5hfq7oT2/uWQ8m3yqJaWtTHRc=
X-Received: by 2002:a2e:9b42:0:b0:2bf:fa62:5d0e with SMTP id
 o2-20020a2e9b42000000b002bffa625d0emr7593118ljj.2.1695374259114; Fri, 22 Sep
 2023 02:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
 <CANNYZj_uSknujoQUK2yV7U4N+WW_RkUH=sJnFDBfZgV0G5fv7Q@mail.gmail.com>
 <5ef99df95ab74e74df6f1e07ef4877487230d9fe.camel@linuxfoundation.org>
 <CANNYZj8RAvj=sJtQuH9J_zKKAsUbhcdKe0hiA2JJy1wwxuzDNQ@mail.gmail.com> <DM8PR12MB54304C00CC6C924121E1CBDF8BF8A@DM8PR12MB5430.namprd12.prod.outlook.com>
In-Reply-To: <DM8PR12MB54304C00CC6C924121E1CBDF8BF8A@DM8PR12MB5430.namprd12.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 22 Sep 2023 11:17:27 +0200
Message-ID: <CANNYZj8eSZZOfPGYCdYPrWjHf74dmRW5uYAZfTBp7JemPXxQCg@mail.gmail.com>
Subject: Re: [Openembedded-architecture] Core workflow: sstate for all,
 bblock/bbunlock, tools for why is sstate not being reused?
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	Yocto-mailing-list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Julien STEPHAN <jstephan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Sep 2023 09:17:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188089

On Thu, 21 Sept 2023 at 16:39, chris.laplante@agilent.com
<chris.laplante@agilent.com> wrote:

> That is very impressive and I'd also love to hear about what heuristics it uses.

It's actually rather simple. It uses glob.glob on stamps in tmp/, then
on local sstate to find possible matches, then sorts them by mtime and
takes the most recent. It's what would work most of the time, but we
could add printdiff-all (print difference with all sstate matches) or
printdiff-N (N most recent). It also could abstain from dumping
locked-sigs.inc into cwd with both -S none and -S printdiff, unless
explicitly asked

I just discovered there's also scripts/bitbake-whatchanged (that
hasn't seen activity in years and is neither documented nor tested).
Unsurprisingly then, it doesn't work in the same scenario:

================
alex@Zen2:/srv/storage/alex/yocto/build-sstate$ bitbake-whatchanged
libsolv-native
Figuring out the STAMPS_DIR ...
Generating the new stamps ... (need several minutes)

=== Summary: (0 changed, 0 unchanged)
Newly added: 0
PV changed: 0
PR changed: 0
Dependencies changed: 0

Removing the newly generated stamps dir ...
================

Maybe this is what RP was referring to when he said the tools don't
work properly?


Alex

