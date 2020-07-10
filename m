Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
 by mx.groups.io with SMTP id smtpd.web11.9916.1594385262189796923
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 05:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=etgoGbSc;
 spf=pass (domain: gmail.com, ip: 209.85.208.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f67.google.com with SMTP id by13so4539023edb.11
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 05:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hUREOaktmwwISDTpt3RNlyFKnE0AiFadcrSmZS1vHLA=;
        b=etgoGbScwK3R9fLPk5IZkcyGDjSKG5muueXZpXb5HP+AsIaE7nuEaXXwC926LRtVHX
         ZsbHnTPNHGN3ZHU0TXbtpW2LSgHgc2wHgNuyb2HFrpf5ZS7SEN//fZUVF4AUKe3q34zg
         A8s4BvwnjV9BEXXs3jbCyBfHLbsXZmY6226gg9A17GaAPiKCShE4ue/Q5rarpI42phor
         u0pm801vnp32x0RmgEjmeXrCnrbEgZ5v22R8/rQFCZKd2mnyTd+CR0QXyKXE6CjEYQM5
         bDn4mZIia+i1o/e1RwfmE8CvUxQ44aeKAG6/aJIS10t9lissLmPdRTCOgi2nB5VY5svI
         36MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hUREOaktmwwISDTpt3RNlyFKnE0AiFadcrSmZS1vHLA=;
        b=fCbKfVGr1kkAXeMc1F4Kaef5mDY9kp4BKnVLO9oJ6gYMmHxxha94VdAfk4hyi9pegp
         /GL5ZPoaza1NJRYG7pSBoA3fYZmFZviCaFRaW1nv4e3qV2iYKdlCd+RTIZ/N9wdgmult
         tXS1caZ09Ym/0K+IVIbSgyriPZVmNYbNG764c/kc2KojWbNhwwk5y+y0NShSBho5Qfvt
         5x1lnvB3DqGKNPqHgjjbGIr5P440mPAamugYll6WbFXfm1lYsl7chFDm4SGw4ckmeO4E
         Un/+7oJ3tnaR6lpAIm2opYkPju6DgSG7v+ONxHwvhBiHmgoSKFIygoYKVaG3/6ysoroF
         mz7A==
X-Gm-Message-State: AOAM530u7gwg19zUyAC6+SEOhTWk9l61rtbpWDUQwE2brbuOd7+oA6OA
	RAMGL5EA1amkETw2F8IRJV1eBbaKpe3Av//tC30=
X-Google-Smtp-Source: ABdhPJwoFyVz16Bqxho42ch0qqlEoOPKKKBXNOMmwMfmYC572nRrzt7kjDlEzHjtpc2Cf7X15OIXSH4uj13D1j65Fbk=
X-Received: by 2002:aa7:d6cf:: with SMTP id x15mr75272782edr.164.1594385260697;
 Fri, 10 Jul 2020 05:47:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200710090514.440-1-max.krummenacher@toradex.com> <20200710090514.440-2-max.krummenacher@toradex.com>
In-Reply-To: <20200710090514.440-2-max.krummenacher@toradex.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 10 Jul 2020 08:47:29 -0400
Message-ID: <CADkTA4PA0N8W7+jUbV+ao__tY8Q_623=yLZ47YC=z4dD4fiGmA@mail.gmail.com>
Subject: Re: [OE-core][Patch 2/2] kernel-yocto.bbclass: force creation of config.queue
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Max Krummenacher <max.krummenacher@toradex.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 10, 2020 at 5:06 AM Max Krummenacher <max.oss.09@gmail.com> wrote:
>
> In the case of no patches or no configure fragments, during
> do_kernel_metadata() scc is not called, and thus
> kernel-sources/${meta_dir}/config.queue is not created.
> Later do_kernel_configme fails because the file is missing.

This is a really strange case, since in tree and defconfigs go through
the queue.

How are you ending up in this situation in the first place?

I'd rather not force create this, but detect the misconfiguration and
output a useful error message.

Bruce

>
> | ERROR: Execution of 'run.do_kernel_configme.24874' failed with exit code 1:
> | exit 1 from 'configs="$(scc --configs -o ${meta_dir})"'
>
> Forcing at least an empty config.queue file fixes this.
>
> Fixes: 23dcff0d396c (kernel/yocto: ensure that defconfigs are processed first)
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 7cedb05e93..7ea3cb5e51 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -220,6 +220,8 @@ do_kernel_metadata() {
>                 if [ $? -ne 0 ]; then
>                         bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
>                 fi
> +       else
> +               touch ${S}/${meta_dir}/config.queue
>         fi
>
>         # if KMETA_EXTERNAL_BSPS has been set, or it has been detected from
> --
> 2.20.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
