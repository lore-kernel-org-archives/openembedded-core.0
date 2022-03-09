Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676F4C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 17:23:25 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web09.188.1646846604374794504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 09:23:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IRNnIrlW;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id c4so2488157qtx.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 09:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SzoTHh3aP91D6xtBZ+QK7MRLuXDOmPuI36hLbuxcYL4=;
        b=IRNnIrlWTT1NT2hggaiYmOxmNRERs6Cd/Wae+0yiVjKwDwC1hIB7v/mWEJs5wjYQw1
         +mki5FxnGsjJKkesNO5AAodvR/BDQ5D4CeQ1i01dam+tqJB0s+Fk6/SAhmY9hqGxZu6s
         irwAJ3vGnuvNpQgVlF9sdeOizZCKLGGZKFZ8b5XAoZ3hzl7kAaklVNiNMtFd0RKtsCnD
         GAP1GQh8lxi/jiw2tcEcS8O/K3T+Z0X79Khd7BcRgjOMhjQYji1B1gFvmePhfLEiBZg7
         wA3UER5PCzqJ6GdsThb0k6s5i3y8gb+vzbTJSQ79jUuBqO7ZlAkCv+Rc7/vpMhYCWbms
         nWkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SzoTHh3aP91D6xtBZ+QK7MRLuXDOmPuI36hLbuxcYL4=;
        b=QvwPL3ZIOVjNf13luoTelUOUA2o5eBpW37oYnyPQfS2Hmj1KsWDHAf0HW9iXC0EEDG
         ue/5Nm7mCdu13cGZjvhw4wGHcD/NkCXo8eH8b+rUZ9KdtFJIJ+Zg6PSLkRP6ZZr9UTT2
         5R+LCDu0QY81tNL4jCCIzo1P49/AuifTXGPMX+3wNXAh7G8+L9vOczf901G3eHf0Ogas
         Azb2aRkUr8OvZcOTiGNLKHRoLXGwv+LNMK0ZbqrJtsO8TfSaft/eXes/vMzlh7AzZp01
         NMZ3Ly2r4WdjM5fz0v/aO9vEUIxWHlwtdKMyqR376ocl4ecOJa6/sjfnHWb/1mBBxiOX
         qRng==
X-Gm-Message-State: AOAM531jHbOTBcLYcWIRBUrS+l1VXEtKEo2Ycfo9F2rlhyFu91nTJRzt
	XFISk/QR6tCTUnRuK/pMyAjLFiT94akVvIOeiHnTDcBM4rA=
X-Google-Smtp-Source: 
 ABdhPJzkEGyRDay/hhscAArFc4l/ok0avsJUTka4bfrhW5nxIomgFHmD2G4+deOj3/MSO51fsgRWh7cpbMX9+oBNCL4=
X-Received: by 2002:ac8:7dd0:0:b0:2e1:a2c8:7dc1 with SMTP id
 c16-20020ac87dd0000000b002e1a2c87dc1mr643154qte.532.1646846603307; Wed, 09
 Mar 2022 09:23:23 -0800 (PST)
MIME-Version: 1.0
References: <16CC0B71E636B8E0.7993@lists.openembedded.org>
 <20220309100259.607050-1-michael.opdenacker@bootlin.com>
In-Reply-To: <20220309100259.607050-1-michael.opdenacker@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Mar 2022 09:22:57 -0800
Message-ID: 
 <CAMKF1spbtsjhkVa2pkP+X7KD40Yx08bU2Y3fbhgXQ9ivod6shg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH RESEND] conf/machine: fix QEMU x86 sound options
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 17:23:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162983

On Wed, Mar 9, 2022 at 2:03 AM Michael Opdenacker via
lists.openembedded.org
<michael.opdenacker=bootlin.com@lists.openembedded.org> wrote:
>
> This updates the QEMU sounds options for x86 emulation,
> when "runqemu" is called with the "audio" argument,
> to fix the below error:
>
> runqemu - ERROR - Failed to run qemu: qemu-system-x86_64: warning: '-soundhw ac97' is deprecated, please use '-device AC97' instead
>
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  meta/classes/qemuboot.bbclass                  | 2 +-
>  meta/conf/machine/include/x86/qemuboot-x86.inc | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
> index 755d49acd6..ad8489902a 100644
> --- a/meta/classes/qemuboot.bbclass
> +++ b/meta/classes/qemuboot.bbclass
> @@ -29,7 +29,7 @@
>  #
>  # QB_AUDIO_DRV: qemu audio driver, e.g., "alsa", set it when support audio
>  #
> -# QB_AUDIO_OPT: qemu audio option, e.g., "-soundhw ac97,es1370", used
> +# QB_AUDIO_OPT: qemu audio option, e.g., "-device AC97", used
>  #               when QB_AUDIO_DRV is set.
>  #
>  # QB_RNG: Pass-through for host random number generator, it can speedup boot
> diff --git a/meta/conf/machine/include/x86/qemuboot-x86.inc b/meta/conf/machine/include/x86/qemuboot-x86.inc
> index d3b91070a8..b7b6428e44 100644
> --- a/meta/conf/machine/include/x86/qemuboot-x86.inc
> +++ b/meta/conf/machine/include/x86/qemuboot-x86.inc
> @@ -8,7 +8,7 @@ QB_CPU:x86-64 = "-cpu IvyBridge -machine q35"
>  QB_CPU_KVM:x86-64 = "-cpu IvyBridge -machine q35"
>
>  QB_AUDIO_DRV = "alsa"
> -QB_AUDIO_OPT = "-soundhw ac97,es1370"
> +QB_AUDIO_OPT = "-device AC97"

we are also dropping es1370 here, can you comment on it.

>  QB_KERNEL_CMDLINE_APPEND = "oprofile.timer=1 tsc=reliable no_timer_check rcupdate.rcu_expedited=1"
>  QB_OPT_APPEND = "-usb -device usb-tablet"
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162955): https://lists.openembedded.org/g/openembedded-core/message/162955
> Mute This Topic: https://lists.openembedded.org/mt/89658861/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

