Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFCF5C8303A
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:12 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.20655.1650544311420640368
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 05:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=epBjvp0X;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id y10so9685591ejw.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 05:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CwDD4TuXYSS9k1YXVk1eJHIfVAChGGoH3WV+1j4Oa0Q=;
        b=epBjvp0XP7KlLBWdqCD+9zM7P4/gzZ0xXji5LGmI48Nn8yHKmxq6eE4pGP7f+EZa7Q
         AVsw2RqCmSZC8SlFzshZBybJq1/qRbRqGuWyRwUbsgwBR6qm44jfRy4XKz7gh3DNqKWr
         CbvonEB6+uJSpzdk00c720hjltAwGAp+zcjjl0opZXPJCyBpm+U0WIUeKSv3A7Pq2sJT
         0Zt2ykGXf7wppdEUoVtmGldz4h32MfKLXWCq/Z5XW5Hbl0XeF+3YCLdUuqYrRYjpMiec
         F8joFcEe5YDFmKzXuGWnhpkUkqcbLnX6lJSFAVVOdp0XoHE5H3q9WBKDuiwNHe9PkkmF
         IM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CwDD4TuXYSS9k1YXVk1eJHIfVAChGGoH3WV+1j4Oa0Q=;
        b=feptLKrF/T4KUniCXbAk10QIVQ5N+pu3IOtnGULzdiEv0NLMkfB3fdhSwo61uOhmjL
         vDZYCzBTyguaTKk1wA/Cb527N1bhBAbuPD95Yf/Lpt+pqMZQ9P7w9dRaZmCCJYgs0///
         ZSluQ2/8ipzVnCjbEi3/rI9xXiMonCqwVLocnSNm5fniSGwi4ySCZ16hyLTNL0GK1xTL
         CjisJypdSAarHT4nEOTHQQ58qs2nA8KefU9DuaHkEty/19MIiuWtGrbZ28DuArnqtNeN
         IVYhQiT3ywqhwap4h4k1cvPzsqUCt/g3w3IkIc0FC3DM0ZW8BwJwYfmc2LKmFVa5o5ug
         HwVQ==
X-Gm-Message-State: AOAM530xSTS/n4Cty3H/VxD+swnGbbudXm/PiH78siPj/KkYJ6pZslQu
	ECVih7mWahGRQfjsFgMEDm3xCfaNpzGl8rdOk+U=
X-Google-Smtp-Source: 
 ABdhPJzyyaddKprB0C/x5nd/PxwI1db6+uCy+KuFnupufy6G0FFClouY9ZroAvCmBmpn6PUl9XBqqDhEFZwZ0gQFXgI=
X-Received: by 2002:a17:906:dc8f:b0:6e0:5ce7:d80e with SMTP id
 cs15-20020a170906dc8f00b006e05ce7d80emr23120755ejc.435.1650544309618; Thu, 21
 Apr 2022 05:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220421035819.3741349-1-russ.dill@nikolamotor.com>
In-Reply-To: <20220421035819.3741349-1-russ.dill@nikolamotor.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 21 Apr 2022 08:31:38 -0400
Message-ID: 
 <CADkTA4PQUq-ZRMZD46SKyhRUgRoFYQ0kavs2Ds-PU=augwpCCA@mail.gmail.com>
Subject: Re: [PATCH] kernel-yocto.bbclass: Fixup do_kernel_configcheck usage
 of KMETA
To: Russ Dill <russ.dill@nikolamotor.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164759

On Wed, Apr 20, 2022 at 11:58 PM Russ Dill <russ.dill@nikolamotor.com> wrote:
>
> The do_kernel_configcheck task requires a meta directory, normally
> set by ${KMETA}. The meta directory is taken as a relative path
> from ${S}:
>
>         outfile = "{}/{}/cfg/mismatch.txt".format( s, kmeta )
>
> However, when checking for the presence of ${KMETA} the current
> working directory is searched. This will almost always fail and
> "kgit --meta" is used instead. If the user does have a path in
> their current working directory that matches the ${KMETA}
> variable but the path is not present within the kernel source
> directory, the build will fail if it tries to write config errors/
> warnings to that path.
>
> If ${KMETA} is not set, the same problem exists with the hard-coded
> "meta" directory.
>
> Fix these issues by checking for ${KMETA} within ${S} rather than
> the current working directory. Additionally, drop the hardcoded
> backup directory "meta" as it hasn't been functioning and
> probably has no users

Looks good to me. I continued to poke at this yesterday, and can't
think of any users this will break .. and if it does, I'll be around to
fix any fallout.

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>

>
> Signed-off-by: Russ Dill <russ.dill@nikolamotor.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 1d5a8cdf29..4cb638864c 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -521,15 +521,15 @@ python do_config_analysis() {
>  python do_kernel_configcheck() {
>      import re, string, sys, subprocess
>
> -    # if KMETA isn't set globally by a recipe using this routine, we need to
> -    # set the default to 'meta'. Otherwise, kconf_check is not passed a valid
> -    # meta-series for processing
> -    kmeta = d.getVar("KMETA") or "meta"
> -    if not os.path.exists(kmeta):
> -        kmeta = subprocess.check_output(['kgit', '--meta'], cwd=d.getVar('S')).decode('utf-8').rstrip()
> -
>      s = d.getVar('S')
>
> +    # if KMETA isn't set globally by a recipe using this routine, use kgit to
> +    # locate or create the meta directory. Otherwise, kconf_check is not
> +    # passed a valid meta-series for processing
> +    kmeta = d.getVar("KMETA")
> +    if not kmeta or not os.path.exists('{}/{}'.format(s,kmeta)):
> +        kmeta = subprocess.check_output(['kgit', '--meta'], cwd=d.getVar('S')).decode('utf-8').rstrip()
> +
>      env = os.environ.copy()
>      env['PATH'] = "%s:%s%s" % (d.getVar('PATH'), s, "/scripts/util/")
>      env['LD'] = d.getVar('KERNEL_LD')
> --
> 2.25.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

