Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD310C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 14:30:37 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.6970.1645799436103986973
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:30:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=EilmJ5i1;
 spf=pass (domain: burtonini.com, ip: 209.85.221.47,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f47.google.com with SMTP id u1so4778751wrg.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Feb 2022 06:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1QjToRjU2IIrNOf7e5NYthEsyrSFAOdE1TGkMZe4mn4=;
        b=EilmJ5i18/cxZje9o4gc5feqwVd3l54mUXwijdyzdjp/1h1x1S9WrOTo3erhKXU/HM
         tzxnDwyB1ootDd0ZbMI9hTtQ3eGPcSkNKCeoEqEpzIGAmWQoY1JAV71cLopLv3EN84Bc
         QM4lZXOEKHCrev4YfLn9Sr16LYF+paLIQ7VeNvmUxgiS4KsO4kz+HogVb9c1Nr93FiRI
         vNER8LunsXFpUk8fxl+cV/MkK72S17xnn6Y1Q3mTRywBjQwDOLTxW5DtKsyuYzc49a1k
         Idv2A5OALdQcXp1S++xOgY8aGGuH1BumH/KtyXFTmpkQ53Kb4h/dC2L32xvGaodESR1e
         ZxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1QjToRjU2IIrNOf7e5NYthEsyrSFAOdE1TGkMZe4mn4=;
        b=MAw07dbrQp7Ert5auI+dR+xO9HLR/UiLRXHDydncIW0QxDIo2IGIND9v4PkDYVc4OG
         s8NGoM76YXzwAKN30bpMp63PqFCXcxkidNkhy70crgQ0nKX2qsZQDyuO4uwy0v/l5wj4
         nkA4Y++plFRU8vFDepAKArdBFnsnskod9waMVMBUYCuKS/k+tFaV6ciBmI+Beqk0ElCF
         QM4HXmY/3p94FheM4d2T5t07sy/piJY7bXh6aOmEy2R8EVluQfOBgDi5ksQgCzWUWpZb
         efpHnzTDA1SjR/t51NgYZA68c4ld6Ry0R+rmIIOvwVB5exfFYPWr2rNbQZYr/vLM0n9O
         cplQ==
X-Gm-Message-State: AOAM530NetrwrS8yZgLWSoRXCCkiysHMmJON1wq3iXASzQP6ysGUOFgo
	uzG0gV5j29rqZ7q0zHf5wo//ijdLRqFLbDQBpmzr4A==
X-Google-Smtp-Source: 
 ABdhPJxDqYwqL5LxQUg2bD4JOkGVsh6CuvEDVrrxJdwtK6yKQnE+fq9+4digyNxiEzxXzZ1dSbNb31d1mKUf1aHwzxo=
X-Received: by 2002:a5d:45ca:0:b0:1ea:9bf9:ce5a with SMTP id
 b10-20020a5d45ca000000b001ea9bf9ce5amr6326535wrs.620.1645799434512; Fri, 25
 Feb 2022 06:30:34 -0800 (PST)
MIME-Version: 1.0
References: <20220224150302.1341776-1-alex@linutronix.de>
 <20220224150302.1341776-4-alex@linutronix.de>
In-Reply-To: <20220224150302.1341776-4-alex@linutronix.de>
From: Ross Burton <ross@burtonini.com>
Date: Fri, 25 Feb 2022 14:30:23 +0000
Message-ID: 
 <CAAnfSTtk-evP=V0OOjKqFX1+a+RqAeS0tCVFHRnvft=8mvRRNQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] insane: use HOST_ variables, not TARGET_ to
 determine the cross system
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 14:30:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162397

On Thu, 24 Feb 2022 at 15:03, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> Almost everywhere those are the same, except when making a cross toolchain
> where HOST_ is where it's going to run, and TARGET_ is what it's going to
> produce.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/classes/insane.bbclass | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 4fc3c06c64..890e865a8f 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -325,8 +325,8 @@ def package_qa_check_arch(path,name,d, elf, messages):
>      if not elf:
>          return
>
> -    target_os   = d.getVar('TARGET_OS')
> -    target_arch = d.getVar('TARGET_ARCH')
> +    target_os   = d.getVar('HOST_OS')
> +    target_arch = d.getVar('HOST_ARCH')
>      provides = d.getVar('PROVIDES')
>      bpn = d.getVar('BPN')

Interestingly I was just looking at this code.  Does this change mean
we can remove the skipping of nativesdk recipes in the arch check?

Ross

