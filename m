Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D1EC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Feb 2022 11:31:16 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web08.7916.1643887875785508943
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 03:31:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=XudyTOXJ;
 spf=pass (domain: madison.systems, ip: 209.85.167.48,
 mailfrom: matt@madison.systems)
Received: by mail-lf1-f48.google.com with SMTP id u6so5262801lfm.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 03:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DC5iPPZAQlmufNfqgNqLx07DvMDV62BJq9prjGpKLtc=;
        b=XudyTOXJh0OyUEqvJORK8yRRhQBCzApoH+00tAOy68AXPDgoXsrpW2vwGy34rjxFR/
         5l8t6EFStVhoQC8L1dLpl8Tv1piVK+QC+T3uVN7g75yUUgUyh8GHhvFtOnhCMrrjhtq2
         MsFkJgnXJCYR/r31tnbpbAZRgktcpXKdng+epxxeZY5YXxswyZoB3RtNfb4aSWJaYzZC
         KzTc1iLv1S9e75LR1YSs7LNHSK1SKRjojkDgRdFi1CBJuGvndpYms1ySALrjlJukFWWd
         Fk1MqeVhDW8vyTXmIO3scRTgTBGgOHICb9/iySCEy0SOzjR+lNPQp4DSRspSLA8jZnC3
         Rteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DC5iPPZAQlmufNfqgNqLx07DvMDV62BJq9prjGpKLtc=;
        b=A0rikAYxCEpslxt8jh1cgwMQj5R5rsKltfEFsvlQ2sPiCwU1D8XzfXRrcc9Tjxrn/B
         JApRZmDcmc9me1aRmE+RIPzPpufNm3O5N6Un/MbHfvvsGqlJeSvnGcKK1XdmNyindDSO
         gUbKfEHismDFsC5gt180BVhgP8e2GSUjaIkFPRRsA/9Q9CWu+NpMPIWeHpLQAXMV9nju
         rASqGdvulMvnu5xl2DRl5J0HqXpSdiTIdure/hmcziwrr+VnmjVSMGFe6w17Pbez0swF
         f2oO8NsfPVnhp2fQL2DyQbTQFyefte+OSbHepIN7fE4NWQpZ/XYEPEgwru6763cZIFCi
         l9mg==
X-Gm-Message-State: AOAM531LGiiA30EOGWitOb8ayuldmRpodz+BnfuvMrrLkCjiWfI3+D9w
	1uaMantZpWj6KUU4LmPkbSVIJeLmQznaaeOD9ynb/A==
X-Google-Smtp-Source: 
 ABdhPJxhZYhZnyyHKtxFx1JmD0xpBhdx6tXY8s2kB0tIOTNbeIcbB0RJpWW3ryxc26F6/w7xaM+YcImPro1IMERO9SM=
X-Received: by 2002:a05:6512:e87:: with SMTP id
 bi7mr27247316lfb.550.1643887873646;
 Thu, 03 Feb 2022 03:31:13 -0800 (PST)
MIME-Version: 1.0
References: <20220203112534.2389621-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220203112534.2389621-1-richard.purdie@linuxfoundation.org>
From: Matt Madison <matt@madison.systems>
Date: Thu, 3 Feb 2022 03:31:02 -0800
Message-ID: 
 <CAGgRHJrs4moW+hhunwgmvRu2z6fDFjGxHjKXPMfsqkgXRjBv6Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] staging: Add extra hash handling code
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Feb 2022 11:31:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161274

On Thu, Feb 3, 2022 at 3:25 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Target build output, stored in do_populate_sysroot or do_package can depend
> not only upon direct dependencies but also indirect ones. A good example is
> linux-libc-headers. The toolchain depends on this but most target recipes do
> not. There are some headers which are not used by the toolchain build and do
> not change the toolchain task output, hence the task hashes can change without
> changing the sysroot output of that recipe yet they can influence others.
>
> A specific example is rtc.h which can change rtcwake.c in util-linux but is not
> used in the glibc or gcc build. To account for this, we need to account for the
> populate_sysroot hashes in the task output hashes.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/sstate.bbclass  |  2 +-
>  meta/classes/staging.bbclass | 35 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 35 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index 17dcf4cc175..fd9acbab9b4 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -94,7 +94,7 @@ SSTATE_ARCHS[vardepsexclude] = "ORIGNATIVELSBSTRING"
>
>  SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
>
> -SSTATECREATEFUNCS = "sstate_hardcode_path"
> +SSTATECREATEFUNCS += "sstate_hardcode_path"
>  SSTATECREATEFUNCS[vardeps] = "SSTATE_SCAN_FILES"
>  SSTATEPOSTCREATEFUNCS = ""
>  SSTATEPREINSTFUNCS = ""
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> index 25f77c77350..3ea9c974eb5 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -21,7 +21,7 @@ SYSROOT_DIRS_NATIVE = " \
>  "
>  SYSROOT_DIRS:append:class-native = " ${SYSROOT_DIRS_NATIVE}"
>  SYSROOT_DIRS:append:class-cross = " ${SYSROOT_DIRS_NATIVE}"
> -SYSROOT_DIRS:append:class-crosssdk = " ${SYSROOT_DIRS_NATIVE}"
> +SYSROOT_DIRS:app:class-crosssdk = " ${SYSROOT_DIRS_NATIVE}"

Did you intend to drop the "end" from "append" here?

-M

>
>  # These directories will not be staged in the sysroot
>  SYSROOT_DIRS_BLACKLIST = " \
> @@ -624,3 +624,36 @@ python staging_taskhandler() {
>  }
>  staging_taskhandler[eventmask] = "bb.event.RecipeTaskPreProcess"
>  addhandler staging_taskhandler
> +
> +
> +#
> +# Target build output, stored in do_populate_sysroot or do_package can depend
> +# not only upon direct dependencies but also indirect ones. A good example is
> +# linux-libc-headers. The toolchain depends on this but most target recipes do
> +# not. There are some headers which are not used by the toolchain build and do
> +# not change the toolchain task output, hence the task hashes can change without
> +# changing the sysroot output of that recipe yet they can influence others.
> +#
> +# A specific example is rtc.h which can change rtcwake.c in util-linux but is not
> +# used in the glibc or gcc build. To account for this, we need to account for the
> +# populate_sysroot hashes in the task output hashes.
> +#
> +python target_add_sysroot_deps () {
> +    current_task = "do_" + d.getVar("BB_CURRENTTASK")
> +    if current_task not in ["do_populate_sysroot", "do_package"]:
> +        return
> +
> +    pn = d.getVar("PN")
> +    if pn.endswith("-native"):
> +        return
> +
> +    taskdepdata = d.getVar("BB_TASKDEPDATA", False)
> +    deps = {}
> +    for dep in taskdepdata.values():
> +        if dep[1] == "do_populate_sysroot" and not dep[0].endswith(("-native", "-initial")) and "-cross-" not in dep[0]:
> +            deps[dep[0]] = dep[6]
> +
> +    d.setVar("HASHEQUIV_EXTRA_SIGDATA", "\n".join("%s: %s" % (k, deps[k]) for k in sorted(deps.keys())))
> +}
> +SSTATECREATEFUNCS += "target_add_sysroot_deps"
> +
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161273): https://lists.openembedded.org/g/openembedded-core/message/161273
> Mute This Topic: https://lists.openembedded.org/mt/88880595/3618418
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [matt@madison.systems]
> -=-=-=-=-=-=-=-=-=-=-=-
>

