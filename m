Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E92CCC6370E
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:14 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.32425.1650905913897799211
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 09:58:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WsHquxsX;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id t11so3835647qto.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Apr 2022 09:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hsKnIIX78b2G2Qbv2atgA3mTrO+N82RvdeakveDwZ3I=;
        b=WsHquxsXWDLo2zbeVaFgjnPJI/6OEFn8uW9ECwdUXmF6jX0T2gieGw8pI3obBs2xi9
         Ar1tmtZQ0vLSzoXifenvJo0vy9td7lCPue8KvJX8uixqf0QGBCNSge+eYhp7V4VpCNuY
         AEx6z+6CLNsnCGzMh08FcivrjV/7C71mY3llWMiVk+8bGUortQOrwzQDiLagAvvmUP4T
         51bBApriRts89QfFa58L9Dn7zDVpwogKeisLq8NO9h+D3bxLz18xKjhAxhMcHwtJnAaa
         F/NBrIU+gZyLvC04OczgW2iTmrWyOsfCvY7m1p6GTXcDIzzlcxERG5D2pXZQFtvYxLv3
         Lm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hsKnIIX78b2G2Qbv2atgA3mTrO+N82RvdeakveDwZ3I=;
        b=2WVvwp2Qssipt7CnlHRnnOqQg4Yt+aI+DshIlqBItRepMGQ3u2VSsm82ep+FIt7pjw
         2LBmpCMTL4LSuDi6quYsx7/Y32eWEeLiL9oS1RQFT/8EFodJNo+LlHx+giNOY22tH/Be
         6G+qiR+aSYLM0VjLjaVP9AtoZST53eM+g8Oi60uljAz9iqlHmrrdp3mZcE3+EALih/Ym
         PypFHTsMQkOEtjlqMCw5rMU8/kiHMSBJ4EhFPkTnvC8rgyeGoFH8zE9Ov2Jg2foecUbN
         djABvqMdH7IkudqHZUsqtjy9s3TBc68g3a8O7PFGfl6YDXu6uLiyh4hzUoOp79NOTiBX
         ncOA==
X-Gm-Message-State: AOAM531lZM7C9XhioV8J253MeN9fwbdZzus68INqR56CH7obUCRC1kTY
	68GA8XxpgGEQRPUChm/CERhK32Wor1LgEngBYG5nJ03WLsQ=
X-Google-Smtp-Source: 
 ABdhPJxUGwzamFA/WG9c+P79C09Q0F5oy8DCdLwo77vSAN4nTCnVfmldqFkXhSnTTDoIcsK5oXFuQ4s+RO1WDS921so=
X-Received: by 2002:a05:622a:2cf:b0:2f1:f3aa:e861 with SMTP id
 a15-20020a05622a02cf00b002f1f3aae861mr12465775qtx.532.1650905912964; Mon, 25
 Apr 2022 09:58:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220425140102.2743203-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220425140102.2743203-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Apr 2022 09:58:06 -0700
Message-ID: 
 <CAMKF1spk5uj2DGq56=efxwT-=_6Xbh_On8+WakMuXPCF3-8jgQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] scripts: Make git intercept global
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164837

I see git describe hung during bitbake parse stage in few of meta-oe
recipe and also kernel recipe with this patch.

On Mon, Apr 25, 2022 at 7:01 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> The previous minimially invasive git intercept simply isn't enough. For example,
> meson used in the igt-gpu-tools recipe hardcodes the path to git in the configure
> step so at install time, changing PATH has no effect.
>
> There are lots of interesting things we could do to try and avoid problems but
> making the git intercept and dropping fakeroot privs for git global is probably
> the least worst solution at this point. It will add slight overhead to git calls
> but we don't make many so the overall impact is likely minimal.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/base.bbclass       | 1 -
>  meta/classes/devshell.bbclass   | 2 --
>  scripts/{git-intercept => }/git | 0
>  3 files changed, 3 deletions(-)
>  rename scripts/{git-intercept => }/git (100%)
>
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index b54b56d6248..3515720bf95 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -367,7 +367,6 @@ addtask install after do_compile
>  do_install[dirs] = "${B}"
>  # Remove and re-create ${D} so that is it guaranteed to be empty
>  do_install[cleandirs] = "${D}"
> -PATH:prepend:task-install = "${COREBASE}/scripts/git-intercept:"
>
>  base_do_install() {
>         :
> diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
> index 75604d0c076..62dc958d9a4 100644
> --- a/meta/classes/devshell.bbclass
> +++ b/meta/classes/devshell.bbclass
> @@ -2,8 +2,6 @@ inherit terminal
>
>  DEVSHELL = "${SHELL}"
>
> -PATH:prepend:task-devshell = "${COREBASE}/scripts/git-intercept:"
> -
>  python do_devshell () {
>      if d.getVarFlag("do_devshell", "manualfakeroot"):
>         d.prependVar("DEVSHELL", "pseudo ")
> diff --git a/scripts/git-intercept/git b/scripts/git
> similarity index 100%
> rename from scripts/git-intercept/git
> rename to scripts/git
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164823): https://lists.openembedded.org/g/openembedded-core/message/164823
> Mute This Topic: https://lists.openembedded.org/mt/90685316/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

