Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D87C6FD1C
	for <webhook@archiver.kernel.org>; Tue, 14 Mar 2023 12:58:31 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.7865.1678798704437751692
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Mar 2023 05:58:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E+ivFUBo;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id g17so19911613lfv.4
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 05:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678798702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+FC+ILHZNZ/r5rr0tAVuDaPu3NRaMyBnsTxMnAYTh14=;
        b=E+ivFUBoVa1Om4Z991isVBlpME75suXnCXxXKFs4lh5yW7i1wnbTtzy/RDBUBJUdad
         3SZd1fCxsmbMRX+7L89BApwapBdA0terALii+R4Pbf73iBiNthF52MDnKRg4cDbdqLly
         km0zryo0DUQp68NKIzKdZopYNsN+xFS2AH5uxgkWeAx/dlJJlPPZV91QQ0RnQKRG+de4
         5gxxcPpudY4zp741zPcyYU0z86ZGLcSP+PP2EVj/akNfzkL5XrCfHicOpJq2oV1gQlz2
         /03JbcRWMTSexDixg6l6SQX2F7iNEk4Lhq79KcrD+GbZm66s66KGI+IzM3G84/md8T0l
         2S5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678798702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+FC+ILHZNZ/r5rr0tAVuDaPu3NRaMyBnsTxMnAYTh14=;
        b=oU9sc5H3fnmT8dcHtCna6rXqj++/kHTUFdNH4RE8/9TVXgP6J9YI74HCoyA2LEwXGr
         5DI92PZLGO4Ix+SeqC8Aa7lLrngsB13RMosRwK+chUuF6a4uncsCFK4hvcvZp9Cj1hQE
         ZkWtoQvPQhNpe0pPlE8G/mW45JSt+P9Vfn+uic2DnS1uhlmJaMaIywvY54zPD6ich2pA
         QLJmy8fcRfxUUCvQfR7XNqwk8RUohIdWSZUk6ekHZH2hOJ/4M0fwCPJz/qQi725YVC+F
         DXtGosyAqKBHWtYB4tUrYpHJyY5IWBvVsTsVCtjJtntn1NCiqDS5aYi9Zhoa4VGkntGT
         eQ5g==
X-Gm-Message-State: AO0yUKVGJzSkyH+Hm8m7VAcygZbXUG/mModx9q1L7sw/LxV9+2JDJofX
	49/VQdpSQWFodQgcezpqCveTuUFeOKGwdBBBWK+jMMnMTgE=
X-Google-Smtp-Source: AK7set8d79ZFG5fuiG/E2WJ3N6iH31Ej7MS8NVBqUBVQXl4iSUQIwDq2x5P9yL1SfFMNlsgeEcIxZNr1Ba2Qx2My3Kk=
X-Received: by 2002:ac2:5dfa:0:b0:4d5:ca42:aeec with SMTP id
 z26-20020ac25dfa000000b004d5ca42aeecmr702628lfq.12.1678798702705; Tue, 14 Mar
 2023 05:58:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230312065517.61051-1-frederic.martinsons@gmail.com>
 <CANNYZj9ah1rO9FH3a_m2ftgrDik_NtcLa_15r6+sqD5iwBXsiw@mail.gmail.com>
 <CA+cAkeqZjC=L=_v-3K4VDtdWKxc3crDaqfwp_30B9KFAVrfJuw@mail.gmail.com>
 <CANNYZj9vyfkez+iL-EeeV0Yb3o1Fz9FDrbz+ZRjg5EjUHiAisA@mail.gmail.com>
 <CA+cAkepYqf_hJWe5HBpKcJrF37P7V81AWCZJJ_tUYtBH=BqHqg@mail.gmail.com>
 <CANNYZj-srm78_c6abE2WX8L6gGqW=GM0uqUyHiMkVmO+t0ZWwA@mail.gmail.com>
 <CAO5Uq5SaqUHzS93eyki1-3OGK2w_tGizJZmHMrJKGx5LdRZryA@mail.gmail.com>
 <CA+cAkeqLOVAT7bz+HXKyC7=vwyrRAfE76buQ7C9cog6WQ6k1gw@mail.gmail.com>
 <CAO5Uq5QnyWqi5_CaX7sHTrewVRhvT_SKdXTY7PvKe4dPryCQ6w@mail.gmail.com>
 <CA+cAkeowE7BUYie9rdFPpJ972DHK+d3WGXLKFPAKcYcVYy_AXA@mail.gmail.com>
 <CANNYZj_xAGD8x9=axLxDuEpaJF2K2yLUVH6VO1j0i5tKSvPi=g@mail.gmail.com>
 <CA+cAkeoP7ScYgbRG3eV1RR5R9bqEXm1b3cw7_gASG4uhJw=WfQ@mail.gmail.com>
 <CA+cAkerKf8yyHraJxWOyAQp91tVkgs08LSX4f3Navu1qJ+tV6w@mail.gmail.com> <CANNYZj9nxUwbJ6yQbnDZMtraM+Fv05LFkUQ8gKEkSbk1_70w+Q@mail.gmail.com>
In-Reply-To: <CANNYZj9nxUwbJ6yQbnDZMtraM+Fv05LFkUQ8gKEkSbk1_70w+Q@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Tue, 14 Mar 2023 13:58:09 +0100
Message-ID: <CA+cAkerXmysSTdZyXzkQvURo9vpdtSxz1M5rBCcZBg5k7TV65g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] cargo_common.bbclass: do not use buit-in git to
 fetch crates
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alex Kiernan <alex.kiernan@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Mar 2023 12:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178485

On Tue, 14 Mar 2023 at 11:35, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> --offline seems like the right thing to add, if it produces better errors.
>
> Generating Cargo.lock on the other hand is not right. We rely on rust
> checking the source tree against the checksums in Cargo.lock (to
> prevent supply chain attacks), and this would completely subvert that.
> There could be better diagnostics around missing Cargo.lock, and steps
> to address the issue, but such steps must be manually taken (even
> though they could be codified in a special task, similar to how
> generating list of crates in SRC_URI is a task).
>
> Alex
>

Ok I see what you mean, generating the Cargo.lock in a dedicated task
inside  meta/classes-recipe/cargo-update-recipe-crates.bbclass
or maybe a dedicated meta/classes-recipe/cargo-generate-lockfile.bbclass ?

