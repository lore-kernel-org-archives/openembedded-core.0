Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2146C64EC4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 11:30:57 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.12347.1676287856022828756
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 03:30:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kYvSs/AN;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id b30so2726015ljf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 03:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HHtVH/8mwdHMexwRibFxDr/wXKL35J+jtFbK1Cs4LE4=;
        b=kYvSs/ANn7ZOOJCo2+2iaBRcCXzrjSkD/sAeP8KIn+iOdg0YYaS/b6Bby7yZRD7kPn
         U1vY4qENLh6QwkgD0HcCJNK7Zz7FvPNIQpKLoTtEnL3CQ8ausO1FUoE3vUjnfH/Nb0E4
         5YGbQNmV0zqjH0R3oNgLEvZuYoBRsXujllbFFrsbM3OdGkVGNxEl0p1hhEYEzrWpre2t
         PsqI688CzLYm8KuiRaUwpuFKwNs1CXX5aNWHEXqJshaYjhVXFoqLBkZD/ppnTbGGg5uZ
         IrFVZKiE5+qstpxnQ15YVHbCNygDTTZJw+mWHyPFMcFVJ0wmAF1co720ckIzAVPlUiNj
         aKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HHtVH/8mwdHMexwRibFxDr/wXKL35J+jtFbK1Cs4LE4=;
        b=bu96vlcKXuH4vGvt9G/RlCgteX2BNT3xxnWB2TJhyU17sbu+KGezY7ld+dDpLgcXVv
         jCFWwBn5Yn19LApJ5WYaIdsHL7lH0gEgX2xo+U1b2v64tHIJQaY8IPr3tqwblR0xmTXm
         C+Sm4smfI2z6qD3Z8a9wKtC5k1XWI7a9KqUZbrlcFR6ToKTx4imyOCh33j+Im4/Wf/9w
         rnnBM7kU+O1Hs3UmoyHAkPGcTaJ4ao6jYNdy+KuUpib3Mc/MY748R7uTY9jQoQ6h3p2v
         Og7PylieWZJ04vwsPlC6a4JuG9797vNmskn1EPRLmVoCfl45rKCZ8Pg8AdKnXtJ7YRcv
         KTTA==
X-Gm-Message-State: AO0yUKU6tvWLdqpBAaxqayLHxJs7VRgzLFv6tjInPc+Q4tXnsA/r/b+U
	cINiDTmfFjTjF4r3TqJjMfZw4no+TSSY3BvTCig=
X-Google-Smtp-Source: AK7set8rYfPL9wFhKOiIycEKgYRhojITxw/bJoolmFZyVNdayE+NkHMeW44CVaz+5hGf9DPM4AdExo3sGr/VLLCdvjI=
X-Received: by 2002:a2e:7c0e:0:b0:293:2b48:d2a9 with SMTP id
 x14-20020a2e7c0e000000b002932b48d2a9mr3211847ljc.74.1676287854252; Mon, 13
 Feb 2023 03:30:54 -0800 (PST)
MIME-Version: 1.0
References: <20230213104228.1067057-1-f_l_k@t-online.de> <CANNYZj8KiZfFD6-BvTNv5oSQ5pNg_KX7_qF1hfNpip8WLM=G-g@mail.gmail.com>
 <17435D409BDFDC2E.12482@lists.openembedded.org> <RPN0QR.78GW1EDG5GW2@t-online.de>
In-Reply-To: <RPN0QR.78GW1EDG5GW2@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Feb 2023 12:30:42 +0100
Message-ID: <CANNYZj-r5n+s6P8TyOuSdniATzPZnvGsxLSMb33rQF+FfBTUWQ@mail.gmail.com>
Subject: Re: [oe-core][PATCHv3] graphene: add a PACKAGECONFIG for arm_neon
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 11:30:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177099

Does enabling neon break the build on non-aarch64?

If not, then it could just be added to the default weak set.

Otherwise,
PACKAGECONFIG:append:aarch64 = " neon" seems most sensible. It can
still be undone with :remove (which is ugly but possible).

Alex

On Mon, 13 Feb 2023 at 12:25, Markus Volk <f_l_k@t-online.de> wrote:
>
> Am Mo, 13. Feb 2023 um 12:00:08 +0100 schrieb Markus Volk <f_l_k@t-online.de>:
>
> just remove the '?'
>
>
> No. That didn't help either.
>
> The only way that seems to work for me is:
> PACKAGECONFIG:append:aarch64 = " neon"

