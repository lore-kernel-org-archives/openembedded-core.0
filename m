Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DA0C54EBC
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 14:31:36 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.104864.1673361092476537140
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Jan 2023 06:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OMfYi2NJ;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id bu8so18711693lfb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 06:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8Nt5NOkK7TRWExeru6ngHdWGc/YUPt93eoHWqTYHOuc=;
        b=OMfYi2NJBM6A0YqSSgUvbq5oVtS4jEigLcFh5eW5CRF4JE2Cr6wJZ99fgg5jYN1u82
         vvZhDALAgXkqBGqrOTEMyRXR4F1HywqJe4e16f7mHTmaxYs0HI46mCSGtHvvrbrpYWUX
         hvUNqx5lahbRj0eIfb6rhF4bLZAgEpWBGtIquAkPv3Psv1Yox4kyBXI8r8/73MxozzMJ
         ICrNf2Y0AVj+9NmlIUI7/mlS3gx04pr9/+EGgP0Y9mpknhMVAnOlwj5+4Q7S9R3UgXIL
         wIHyClsadIoOWJVhFH2Upue33fIPP6Po+ZF6l/LzEGyVcHsjQTuEewmn6Rx98oXGjzMN
         5QGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Nt5NOkK7TRWExeru6ngHdWGc/YUPt93eoHWqTYHOuc=;
        b=AU0GdFHjwqDnsyVHfoqnIcj7adzfj0oNPh4+vBFnpi5Hm4NPC0ztKvCe+fUFOjz5nl
         JZm0kaBWHP2aOUrJg/Aqtecn047JW5esNl8jS0YiL+sxHwUqNNU0GDXsBUChaEUorMaH
         KJa7ZKGafwtZFpR1EsaLb/J14DOXWCNpqcp08xkPrL3ZcGx5kaZs8HCS3Acft0QaxabP
         BlExAb8UQF02mn/daetwtd6MsrlNxEMdzJCBrx3eT/pzLNW6iLg+jNyHt+dZxzWzVe+v
         RU1iNFycdhW3BvnzMlUe9X2gDxzQ5pMaqaofbApPAY1ZCFVx2+kE5Sw27W1mMz+ZmSt1
         uZTQ==
X-Gm-Message-State: AFqh2kpExEHSuP8fuZkr2Qt5mf//OspRYgyGfGVwOhs84iO+zv2AtSxQ
	IRFCtifIdoSGNBrlCWuY+zrhAIyRXL7Z3YayGvQ=
X-Google-Smtp-Source: AMrXdXtPv7DE6C4ADK1wQMAC1h65YVBGbEJ32+Vb1hUzd28Dk05H/vGMU0csE3qWgLg44UDhxKINm48RsHcYV7qo2Vw=
X-Received: by 2002:a05:6512:1107:b0:4cb:2508:f535 with SMTP id
 l7-20020a056512110700b004cb2508f535mr3137465lfg.131.1673361090577; Tue, 10
 Jan 2023 06:31:30 -0800 (PST)
MIME-Version: 1.0
References: <20230110142902.1464524-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20230110142902.1464524-1-richard.purdie@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 10 Jan 2023 15:31:19 +0100
Message-ID: <CANNYZj97ADCb00wbQMbQoPfGPJq2H2OvK=qLgPuuPZgS_At75w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] qemux86-64: Reduce tuning to corei7-64
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Jan 2023 14:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175715

I'm sad to see this, but I can't disagree. Latest tuning can be easily
re-enabled from local.conf or distro conf.

Alex

On Tue, 10 Jan 2023 at 15:29, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Much as I'd love us to use the latest tuning, we do have some autobuilder
> hardware which isn't ready for this yet which breaks KVM and some qemu
> user mode usage. I suspect we're not the only ones with such hardware.
>
> Drop the tune back to corei7-64, anyone can easily customise it
> themselves if they need it. We can revisit this in a year or two
> as we should be ready then. It has beena  good test of the rest of the
> support which all seems ready.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/machine/qemux86-64.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
> index d355375f13c..968e3c82a2a 100644
> --- a/meta/conf/machine/qemux86-64.conf
> +++ b/meta/conf/machine/qemux86-64.conf
> @@ -9,7 +9,7 @@ PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
>  PREFERRED_PROVIDER_virtual/libgles3 ?= "mesa"
>
>  require conf/machine/include/qemu.inc
> -DEFAULTTUNE ?= "x86-64-v3"
> +DEFAULTTUNE ?= "corei7-64"
>  require conf/machine/include/x86/tune-x86-64-v3.inc
>  require conf/machine/include/x86/qemuboot-x86.inc
>
> --
> 2.37.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175714): https://lists.openembedded.org/g/openembedded-core/message/175714
> Mute This Topic: https://lists.openembedded.org/mt/96177763/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

