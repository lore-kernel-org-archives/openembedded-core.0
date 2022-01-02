Return-Path: <matt@madison.systems>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89ACBC433F5
	for <webhook@archiver.kernel.org>; Sun,  2 Jan 2022 12:40:04 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web09.12455.1641127203478939385
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jan 2022 04:40:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@madison.systems header.s=google header.b=P3LF1uBX;
 spf=pass (domain: madison.systems, ip: 209.85.167.47,
 mailfrom: matt@madison.systems)
Received: by mail-lf1-f47.google.com with SMTP id o12so69759667lfk.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Jan 2022 04:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=madison.systems; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cpTbqXa2KyQNUQyL73f8haMDUtqOulaCzIKLUSJLt0E=;
        b=P3LF1uBXmuFoh34/tDdiBePBsy+SeeKdLCGIzmdwwYF9QSGnF+bUt+9Eyev6m8XsN4
         xni/SLfW41zxFFgppXvaE818TZ1aBJJ7IslA+7mPZLUxYN0a7TW7liSBCOJ0pggBI5L6
         +/GKYJniTtzJ5dd+21nfVnkDo9lWt5As3Do9jPD2hSWMKWtLMk1Qv/qRwhL4FqxU/oee
         qo4d8P3Wts0nnxbhH3HCJTEoP36Yrwe3vx9lhotcSP/rrYD1JKTYnnCOv/rAsJsjdLni
         nk0PPaMLqeGYv0wG/5a179uPORlF59hj/Br8IzH/qWWrokCTrLwcoAvceTzF5c7zB6oU
         9wdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cpTbqXa2KyQNUQyL73f8haMDUtqOulaCzIKLUSJLt0E=;
        b=XauZtYXBN6JfUY9V93v7xtN8JPczyCjVYCByydjprTI1xowEPJVZR0KpqA+Zp2hEli
         MNMnaAFXwEkfwXcQtDMutHfp+4E+NZuz/WoOxoyD8iMBo1HgapqDw91+EYr53+Nq2f/F
         L7zSSjmBqW3b6y0uPXkRoZAYtZo6U5q3f75fd0QPKktx4WKgsATqjEnYGNGIiFEtgY8/
         kNgQ4RWzGeWwA7m71Ci24aAAGwKvDFuerPS4mUvOilx+2cKQVViRzi+7HS0YLE8jS1n3
         wf7545A+mpVb68NwumawVUPqrzj0zSZuuFXQID2Jk6oPq/qLUnEbh5K+Nup4EVqG5Kno
         0RVA==
X-Gm-Message-State: AOAM530UVaTpMtNuJLkqkKe4AijHJkzbIRB885XYNOOVoZRLiOX1AOGm
	aDBAYYKuzXgqSJXyopIdBg4jxcpOhwJx8FwqhKfOag==
X-Google-Smtp-Source: 
 ABdhPJybt86oxjLYdOAP2PW0rOHI5p/J7EgO+f2gGZ/T0i0Zi5EnRtBNUJ49nDkjrHN4EadAavOalQleb+HlC/FRbWY=
X-Received: by 2002:a05:6512:3f17:: with SMTP id
 y23mr26111602lfa.176.1641127201190;
 Sun, 02 Jan 2022 04:40:01 -0800 (PST)
MIME-Version: 1.0
References: <20220101112959.1866747-1-alex@linutronix.de>
 <20220101112959.1866747-4-alex@linutronix.de>
In-Reply-To: <20220101112959.1866747-4-alex@linutronix.de>
From: Matt Madison <matt@madison.systems>
Date: Sun, 2 Jan 2022 04:39:50 -0800
Message-ID: 
 <CAGgRHJogKK0dDsu9vE9jVOYMdqUO_frmCkLLRVvDSFJmxs954Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/6] go-runtime.inc: do not make installation
 set dependent on host
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Jan 2022 12:40:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160100

On Sat, Jan 1, 2022 at 3:30 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> This cannot be right: what we install for the target should not
> depend on what host it's being built on. If this was fixing
> some problem, there needs to be a different solution.

IIRC, I added this because the go toolchain doesn't really do
host/target separation like gcc does. The runtime packages for both
host and target get populated during the compilation, and if the
target architecture matches the build host's architecture, you'd get
just one copy in the tree. And back then, at least, the go-runtime
package needed those files, so the check was there to make sure they
didn't get deleted just because the two architectures were the same.

That's the way things were 5 years ago, though, and the toolchain has
changed a lot since then. It might not be needed any more.

-Matt

>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-devtools/go/go-runtime.inc | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
> index a08d44dd3a..106017bd89 100644
> --- a/meta/recipes-devtools/go/go-runtime.inc
> +++ b/meta/recipes-devtools/go/go-runtime.inc
> @@ -43,10 +43,8 @@ do_compile[cleandirs] += "${GOTMPDIR} ${B}/bin ${B}/pkg"
>  do_install() {
>         install -d ${D}${libdir}/go/src
>         cp --preserve=mode,timestamps -R ${B}/pkg ${D}${libdir}/go/
> -       if [ "${BUILD_GOTUPLE}" != "${TARGET_GOTUPLE}" ]; then
> -               rm -rf ${D}${libdir}/go/pkg/${BUILD_GOTUPLE}
> -               rm -rf ${D}${libdir}/go/pkg/obj/${BUILD_GOTUPLE}
> -       fi
> +       rm -rf ${D}${libdir}/go/pkg/${BUILD_GOTUPLE}
> +       rm -rf ${D}${libdir}/go/pkg/obj/${BUILD_GOTUPLE}
>         rm -rf ${D}${libdir}/go/pkg/tool
>         rm -rf ${D}${libdir}/go/pkg/obj
>         rm -rf ${D}${libdir}/go/pkg/bootstrap
> --
> 2.20.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160097): https://lists.openembedded.org/g/openembedded-core/message/160097
> Mute This Topic: https://lists.openembedded.org/mt/88071321/3618418
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [matt@madison.systems]
> -=-=-=-=-=-=-=-=-=-=-=-
>

