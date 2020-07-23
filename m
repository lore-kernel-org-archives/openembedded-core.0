Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web10.3830.1595469511672742456
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2020 18:58:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uB+aBULz;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id q4so98080edv.13
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2020 18:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LvqvlsLhBc3vbSF1ahfGS2JjF6pum8kmMwvQkLb0Eyg=;
        b=uB+aBULzH5kiIihgNdxRqROMoY1DXL0PFWWZLoh7LhTzfP1X+5281UkO33mt+f40OA
         +IcrvFH8LfLyw2moA3D8OtTTEo7tu5BzXR281KAZd3N35jAMXHYN2CGFLNCxjs9Rs64A
         4ldB2qMxjLGK6maMl1aCwn433fT8n8cLI6MNW4Ujg36tvG2Iya/nQKvSJHnI3KYccX3X
         spC3g45hd0xWNStKcNZv6UcogSbJBRTLEY1XVzoPVQ6x82VoXeZdWMAlQtaoKBMfWCrg
         ua0h3RPaE9ZNIdQeKhK1GYSBRWs1DHPlFe//7MdZEyV7he9wMOhxPyl9zcIuPlIh5UDR
         cUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LvqvlsLhBc3vbSF1ahfGS2JjF6pum8kmMwvQkLb0Eyg=;
        b=K/5x4p8jNyu2dxsdvkNdXqPTJ4j8W6r6kNrJR7uDH0kDIu79O9UTyuciQKWkOafKfd
         eQZ9h6ruAVaH1KFkIfAUQDdlASZYAFPyye2/+/a6Yf2OnSSrMV/YJMwglS2igKS7JHm9
         IfjbeeEYP728QJ9TSP5XgSH0KgxCbTt77dQBW2PHxO6ziaFjpSrRE8Zrvh/Nly164pMf
         g/moMd70xY1idxZSTtLGVbVHToGSMZ54W1aUK0D21LUfGYNlbYxHXXdCU5ETgSeS/fGz
         j/EYT0f+7LTT9pEmM8+tNtmDg+qNORJTbNoVaGUi7qBJg7M8AzKwp/IZSFOJ6OpXA0XM
         DDew==
X-Gm-Message-State: AOAM531M6rbt/HVDqh1NqpsQZBMLZeYGGpSWdhSMJHPcWIRaB06TuxXM
	1LxKDs44g9/J77YTTW+PPPA1p8N8s/6Iuk1DSds=
X-Google-Smtp-Source: ABdhPJzhezph4wqyokVNeXVsvOHsLdUfn96KYru1F+PSR7wiiC3WZUK61EE2rpf9buWcTjn7V8oPGNXURPwrt07aByA=
X-Received: by 2002:aa7:d6cf:: with SMTP id x15mr2062955edr.164.1595469509995;
 Wed, 22 Jul 2020 18:58:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200722075354.1568251-1-gary.bisson@boundarydevices.com>
In-Reply-To: <20200722075354.1568251-1-gary.bisson@boundarydevices.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 22 Jul 2020 21:58:18 -0400
Message-ID: <CADkTA4N+PY9VBNZFfQtkM=mWmJEf1WLDAozTndmqAmwHT2nrJA@mail.gmail.com>
Subject: Re: [PATCH][poky][dunfell] kernel-yocto: account for extracted defconfig in elements check
To: Gary Bisson <gary.bisson@boundarydevices.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: poky@lists.yoctoproject.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Adding oe-core, since that's where this would be noticed (and is the
right list for it).

Steve: this change is good for backpor, and puts everything back to a
working state, the bug this fixes only came in after the initial fixes
had gone to dunfell.

Bruce

On Wed, Jul 22, 2020 at 3:53 AM Gary Bisson
<gary.bisson@boundarydevices.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> The test for whether or not scc should to invoked to generate a
> config.queue was missing the newly created sccs_defconfig variable.
> We need to test for that variable as well, or we may miss generating
> the config.queue in some cases.
>
> (From OE-Core rev: 3a95e171d3eaa6ab143d4f422c98a0ac7ad31761)
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> Hi,
>
> I believe this patch log should also say:
> Fixes: 23dcff0d39 (kernel/yocto: ensure that defconfigs are processed first)
>
> What I see on dunfell HEAD currently is that it's impossible to build my
> kernel (that uses KBUILD_DEFCONFIG) as the configme step fails because
> the config.queue in meta folder is not created.
>
> Adding this patch on dunfell branch fixed the issue, hence this backport
> request.
>
> Let me know if you have any questions.
>
> Regards,
> Gary
> ---
>  meta/classes/kernel-yocto.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 54a1a1627a..3311f6e84e 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -213,7 +213,7 @@ do_kernel_metadata() {
>         meta_dir=$(kgit --meta)
>
>         # run1: pull all the configuration fragments, no matter where they come from
> -       elements="`echo -n ${bsp_definition} ${sccs} ${patches} ${KERNEL_FEATURES}`"
> +       elements="`echo -n ${bsp_definition} $sccs_defconfig ${sccs} ${patches} ${KERNEL_FEATURES}`"
>         if [ -n "${elements}" ]; then
>                 echo "${bsp_definition}" > ${S}/${meta_dir}/bsp_definition
>                 scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_defconfig $bsp_definition $sccs $patches ${KERNEL_FEATURES}
> --
> 2.27.0
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
