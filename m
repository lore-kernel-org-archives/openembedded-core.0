Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62944C433FE
	for <webhook@archiver.kernel.org>; Sat, 22 Oct 2022 03:20:12 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.3010.1666408806158738177
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Oct 2022 20:20:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QoSz7d8V;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id j4so8372776lfk.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Oct 2022 20:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qiEc/bKLunnmgU66b6kqM6PgMaZb0GmD8A+AQvivbc0=;
        b=QoSz7d8VVOgrC8n/JU+2N1Wj8eIjEh1mZM4/+CheZDMxeCr9E3PFbiJC8xAoF1ny2m
         jY9jQiXI3iiJmpm9dCmJArLALpvNaMTLBE3uNCCq0dJK72ZYYWYr5AfIZwnc/UWwONH8
         USaL+3ODN8Z47m/h6KZE8ckiEMA4/EoegNlzsIHLmyONNKPIUYbORDb5t8dxroY1YgRd
         88jCnUgkTerJK1WjiM4OHS00hUBqm+BN/OQzkynaoRHZNxOpoYxgGMPg2W+CHpOBEbYO
         I8yTLQZrrcwJX+1mlLYzIkSUacT3IMp6K0mmvKeLasW3ar/2pMdZ+EcNvA7zHempCg6k
         O40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qiEc/bKLunnmgU66b6kqM6PgMaZb0GmD8A+AQvivbc0=;
        b=Ww9YSwDS/l3/k+1jrKIo1tLnFtwYDT1zMdXI3LpX2hQ9lmlCtveaGskJ+fb1Jam814
         xcgOqErFM4lonRMohOyR8iNEmhHaPS7iDO8k0EDI7X1wIiHwtLNtfyWLu9r/3Wn+2ab7
         22AauRFSNgBJemzzBxwV+OspQRBQvHdewdSCtQXYRtui9fHm3AjcUkLaoXIECV3wIMR3
         ABDVZYj4V+TyVxzT2sbr81YHOCU37ZxQ53g53RoNyf+s0viSLzknEMrBOVT0MqToWyBq
         DRdege4f8BNNUkaU3sw+gXhWR8LW4Dir+eBPZ+vXmvXcg4tkjPj1aHIwBUbvmncWN9L+
         93Vg==
X-Gm-Message-State: ACrzQf1mJnUddhUmOVX+sKHWEGLA9XWSJ2yWw2azCKQ5oroipTik7tk+
	dyUh1V651GFO4slr6BsPPjnXM3oVdzjxaCHiLXE=
X-Google-Smtp-Source: AMsMyM7Mn+j0lXwNUXmO3SS7pqdY11ajJjEC4/S2f5DYfT6PnufX3lF1PWxO1hpL02zPTYiciqsT3AmkKIXsqcnaT0o=
X-Received: by 2002:a05:6512:3989:b0:4a2:7d73:495a with SMTP id
 j9-20020a056512398900b004a27d73495amr7921686lfu.492.1666408804084; Fri, 21
 Oct 2022 20:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20221021200514.1918359-1-raj.khem@gmail.com> <CANNYZj9X45DmDddF=p=4ZVkwAN5q2a8TB3ref27_rj1YiRFhYQ@mail.gmail.com>
 <CAMKF1spDPVJXLmWdz=FiG19AAgUcThRfee8JOdBXiS=EYpwW2A@mail.gmail.com>
 <CANNYZj8saTph1iKeu+SeQzaEVjHQNxw3Z-TsY8JXNs3FugF2WA@mail.gmail.com> <CAMKF1spc-WB976e+cVLKSf-TQir6GD+jMyHQWxu-xQXGmX8SwQ@mail.gmail.com>
In-Reply-To: <CAMKF1spc-WB976e+cVLKSf-TQir6GD+jMyHQWxu-xQXGmX8SwQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 22 Oct 2022 05:19:52 +0200
Message-ID: <CANNYZj8s+uY0NiF7uOO0ORrg14MF2tMvc5EmhuccZGwMA5SO=g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rust: Disable 64bit atomics on crossbeam on riscv32
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Oct 2022 03:20:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172059

On Sat, 22 Oct 2022 at 05:07, Khem Raj <raj.khem@gmail.com> wrote:

>>> we should apply the v1 of patch and move on.
>>
>>
>> No again. Riscv32 is already listed so it=E2=80=99s on you to use existi=
ng mapping to use those entries, and not add new ones.
>
>
> ?
> v1 is passing the needed options via cflags. No patching needed. If you h=
ave better suggestions come up with a better patch

Ah, gmail showed me v3 as v1. Sorry.

The mapping (which is being done in two places, in meta/lib/oe/rust.py
and in rust-target-config.bbclass), the patch to crossbeam and the
triplet list in crossbeam's upstream are supposed to work together. So
the correct fix is to expand the mapping with a riscv32 entry, and if
it does not fix the issue, then figure out why is that. Your patch
bypasses all of that and brings us back to manually maintaining
exceptions, because?

Alex

