Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0852CECAAA1
	for <webhook@archiver.kernel.org>; Wed,  7 Sep 2022 02:34:42 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web12.3275.1662518073884511391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 19:34:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h7ThHQ9m;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id 9so9899831plj.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 19:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=GFJkiCHxTi/wFPvaaOcDG335331QPgVej3aHVSoZRPk=;
        b=h7ThHQ9m8TfCEv21tRCLVj+8sjW28k3/bFtB8DuwICWDkAmHJP1/dUbFv+y3dpZ9JS
         4gI88zP8unpQJSw7F8eaoB9iJy/WBGL2M55g9hgXgpL21bEHsWey0LrEPsxOQif0KYTa
         iue1+40AUKDQZzaq3Hd95DfpaOBPRHkhXskfLK9CkVFBJlcg8yR5NV0y2RVP0Xt1KM9r
         71ErUYJ/czvLQa+AcwRML2a1a7WMwsybclGb0UywsB6fCP4XAWD8HmsqYVFlpx85yFlP
         J5EJyBv3rbJ/PP3YQe9VyH9/se6utwYium6MfugNVyLnKgys+AfufRJsr/cevSGtOC12
         un3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=GFJkiCHxTi/wFPvaaOcDG335331QPgVej3aHVSoZRPk=;
        b=tTEx8Zca6O19V1HjmiATtWvv3wjoRfatQpiWN4BKYkxXzOfgxaetP/Jfnt83M6cn1R
         S6qLza0XIs/yISDfwVjwUBzEuOciUE2LIG41daivJdxQRuuhden4F/AhiW8f3ZJhTQWM
         ArUjjY0pLYunrLl3a0tFziQ7gKKPAdhN5vp/LjXMYuyopjo63lu3PSszNCUSatpihADq
         iDzcz+AKJEzluAWUjjZsh7p4gM3+hVxBJHDcNCO+R8mH1hyp8X1NSvQ2TL92frlCx5TI
         KO55PInszUTwD0SmDB2bryVvJfM6remUhcSb43d29vVYKqof3ZfpEHZeLM0zkAk/xksq
         gv9A==
X-Gm-Message-State: ACgBeo1uysKjEhGMzg7ltNbgvxfLG5LjjWEyw3RoZh8RjG6mxre4CUhk
	QE+1MRJXNQMdI1M5rmkJUrcNow2sbK7ABhTFndU=
X-Google-Smtp-Source: 
 AA6agR4PCJfhYx5EpJpkQrzjlEsRJF71053BV/zdDMA1d1YHFCkmjBL6ODeuJGitJo5lo2qpDzGb4keIRD3T3Lix7Dc=
X-Received: by 2002:a17:90b:3912:b0:1fe:34a0:e74c with SMTP id
 ob18-20020a17090b391200b001fe34a0e74cmr28599043pjb.233.1662518073137; Tue, 06
 Sep 2022 19:34:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220720113043.196185-1-jose.quaresma@foundries.io>
In-Reply-To: <20220720113043.196185-1-jose.quaresma@foundries.io>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 6 Sep 2022 22:34:22 -0400
Message-ID: 
 <CADkTA4Mkr874wEBnFEhAogHZSc0pqcs97k4KPTm7=KYj45QTGQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] kernel.bbclass: Add shared_workdir_prepare task
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Sep 2022 02:34:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170369

Sorry for the late reply, but we were discussing this patch on IRC
today, and I wanted
to follow up with some questions / clarifications.

On Wed, Jul 20, 2022 at 7:30 AM Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> The task do_compile_kernelmodules runs after the shared_workdir and
> is installing some files in STAGING_KERNEL_BUILDDIR, this can races
> in other recipes that depends on "virtual/kernel:do_shared_workdir"
> as the STAGING_KERNEL_BUILDDIR is not fully populated when the
> shared_workdir task ends.

I remember considering this when we did the update of the module.lds in
do_compile_kernemodules(), but we had at the time (and still do) use cases
that there are no modules, so there isn't always an update to the shared_workdir

Is that the race that you were seeing ? And dependent builds are seeing
missing elements of it ? Or is there something else ?

We also were (and also still are) concerned about making the already long
kernel build dependency even longer, without a way to at least allow
recipe authors that know what they are doing, to avoid the extra time required
for modules to build.

Which leads to one question. Tasks that do need module.lds or update it,
could just use do_compile_kernelmodules() as their explicit dependency.
Was that considered and did meet the need ? Admittedly doing that leaves
a gap that a new developer could shoot through and cause themselves
some failures or subtle mis-behaviour.

>
> To address this issue a new task is added in place of the previows one
> so the shared_workdir will run after the do_compile_kernelmodules and
> the new shared_workdir_prepare will replce of the old shared_workdir.
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/classes/kernel.bbclass | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 5d2f17c3be..5558769c92 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -504,7 +504,8 @@ do_kernel_version_sanity_check() {
>         exit 0
>  }
>
> -addtask shared_workdir after do_compile before do_compile_kernelmodules
> +addtask shared_workdir_prepare after do_compile before do_compile_kernelmodules
> +addtask shared_workdir after do_compile_kernelmodules

Assuming that we do go for the extra compilation in the default shared_workdir
dependency chain, can't we just change shared_workdir to be after
do_compile_kernelmodules
for a smaller footprint change ? ... unless the
do_compile_kernelmodules() are using
part of the shared_workdir for its build, but I don't recall that
being the case.

Bruce

>  addtask shared_workdir_setscene
>
>  do_shared_workdir_setscene () {
> @@ -520,10 +521,16 @@ emit_depmod_pkgdata() {
>
>  PACKAGEFUNCS += "emit_depmod_pkgdata"
>
> -do_shared_workdir[cleandirs] += " ${STAGING_KERNEL_BUILDDIR}"
>  do_shared_workdir () {
>         cd ${B}
>
> +       kerneldir=${STAGING_KERNEL_BUILDDIR}
> +}
> +
> +do_shared_workdir_prepare[cleandirs] += " ${STAGING_KERNEL_BUILDDIR}"
> +do_shared_workdir_prepare () {
> +       cd ${B}
> +
>         kerneldir=${STAGING_KERNEL_BUILDDIR}
>         install -d $kerneldir
>
> --
> 2.37.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#168359): https://lists.openembedded.org/g/openembedded-core/message/168359
> Mute This Topic: https://lists.openembedded.org/mt/92502346/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

