Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDC01C48BE5
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:07 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web12.15033.1650497093319780286
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 16:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mIh0YYQG;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id p10so5641459lfa.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 16:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iJp4gMsK8pykkiu0mOe+mdG3jXysL6UX5yUK9cROnFM=;
        b=mIh0YYQGOcVuw1Ho1JmM0yjKZNSR0HlceM6Es8b2qrOCg+DKRGCx4CobWueVzw8bwc
         pjcJoFbVztQZagYyiio1VGvlBPhItqKJzT9WxkRdD+TMEEGHqb5ivnPztyo2x+rQtrd7
         vxFBnvx+ca/VhZ4XXCwBl7uIbuFysPauorlfmD9m0+fKtI3MoDKxE8iZnqfCbL8RCw5g
         L4/VG3o9U010D2ymTN4tF98/0NI4T072hGR11FD03wuP/3XlExd8w00sslmL/X6GqC7w
         kEf7H87AZvlVxtQDRbYVCQAqlQ/o/tgzH7IRf84k+clVFOPvePHDmFnOhcYqcm3orr/p
         9uRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iJp4gMsK8pykkiu0mOe+mdG3jXysL6UX5yUK9cROnFM=;
        b=MQlmBYhqatLM5RrsEEYN+K4rCVVVkMIOqlpIo0jO+/v8uZgi8kd85C5YijYVNJ12f0
         oqBcZoNuY/WN8teQj2reu3VVY6eePypUSY1iRyabga5Zg2/Q9ekExwyHayvxQdtocVwE
         mywce+1P6fvw8NPD1RsqIM6ByuzYNgDMAxE80lcWPdJI/kEI/Cfu9FumQMcq1bdbW9xw
         6LI3y+OV3dGJOE4GL68tW4f79D89vwXGcmX1SjxA84fiDsSS/TN6L6Ucd7auQa5J2VnR
         M0E3tlu3c/tySwD/ta4xnEhQn6XxRHzK6JqPHffoYf4B45NkK7AIsN0GFPIs/ct95rGg
         kryw==
X-Gm-Message-State: AOAM530bTrR1b6B2+MPAbZx9tLy/WwZYVxeTEieHXx2a3mWp8/j+M4KQ
	qmFV34PnmCmkMxwqkGHYKzx810klzcbFqhw2VR8=
X-Google-Smtp-Source: 
 ABdhPJy0nC8kEDaHwCW3ojp6jY6KtT6E8PGcuo5EFrc0+658GMX5olTrOs9rkMGoq4o0Mu2HmxrK0c5PIHJyRAtA6bs=
X-Received: by 2002:a05:6512:3d88:b0:471:b3e2:5b7b with SMTP id
 k8-20020a0565123d8800b00471b3e25b7bmr5534997lfv.160.1650497091278; Wed, 20
 Apr 2022 16:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220420151141.25027-1-paul.gortmaker@windriver.com>
In-Reply-To: <20220420151141.25027-1-paul.gortmaker@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 20 Apr 2022 16:24:34 -0700
Message-ID: 
 <CAJ86T=VPsbzm3uUDupi9EchuVJPfywLONj+AvWk+eK-tB2Xaaw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] devshell: introduce intercepts as per native /
 nativesdk
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164739

On Wed, Apr 20, 2022 at 8:12 AM Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
>
> In a devshell, recent versions of git will complain if the repo is owned
> by someone other than the current UID - consider this example:
>
>  ------
>   bitbake -c devshell linux-yocto
>
>   [...]
>
>   kernel-source#git branch
>   fatal: unsafe repository ('/home/paul/poky/build-qemuarm64/tmp/work-shared/qemuarm64/kernel-source' is owned by someone else)
>   To add an exception for this directory, call:
>
>         git config --global --add safe.directory /home/paul/poky/build-qemuarm64/tmp/work-shared/qemuarm64/kernel-source
>   kernel-source#
>  ------
>
> Of course the devshell has UID zero and the "real" UID is for "paul" in
> this case.  And so recent git versions complain.
>
> As the whole purpose of the devshell is to invoke a shell where development
> can take place, having a non-functional git is clearly unacceptable.
>
> Richard suggested we could use PSEUDO_UNLOAD=1 to evade this issue, and I
> suggested we probably will see other similar instances like this and should
> make use of PATH to intercept via devshell wrappers - conveniently we already
> have examples of this.
>
> Here, we copy the existing "ar" example and tune it to the needs of git to
> combine Richard's suggestion and mine.
>
> As such we now also can store commit logs and use send-email with our user
> specific settings, instead of "root", so in additon to fixing basic
> commands like "git branch" it should also increase general usefulness.

It looks like this will address the performance issues of using git
from a devshell too. Trying to run git log, git blame, etc for
largeish repos in a devshell is annoyingly slow due to the overhead of
pseudo.

I always wondered what people do in a devshell which actually _does_
need to run under pseudo...

> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>
> diff --git a/meta/classes/devshell.bbclass b/meta/classes/devshell.bbclass
> index 62dc958d9a4a..7ac134e0950f 100644
> --- a/meta/classes/devshell.bbclass
> +++ b/meta/classes/devshell.bbclass
> @@ -2,6 +2,8 @@ inherit terminal
>
>  DEVSHELL = "${SHELL}"
>
> +PATH:prepend = "${COREBASE}/scripts/devshell-intercept:"
> +
>  python do_devshell () {
>      if d.getVarFlag("do_devshell", "manualfakeroot"):
>         d.prependVar("DEVSHELL", "pseudo ")
> diff --git a/scripts/devshell-intercept/git b/scripts/devshell-intercept/git
> new file mode 100755
> index 000000000000..8adf5c9ecb71
> --- /dev/null
> +++ b/scripts/devshell-intercept/git
> @@ -0,0 +1,19 @@
> +#!/usr/bin/env python3
> +#
> +# Wrapper around 'git' that doesn't think we are root
> +
> +import os
> +import shutil
> +import sys
> +
> +os.environ['PSEUDO_UNLOAD'] = '1'
> +
> +# calculate path to the real 'git'
> +path = os.environ['PATH']
> +path = path.replace(os.path.dirname(sys.argv[0]), '')
> +real_git = shutil.which('git', path=path)
> +
> +if len(sys.argv) == 1:
> +    os.execl(real_git, 'git')
> +
> +os.execv(real_git, sys.argv)
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164701): https://lists.openembedded.org/g/openembedded-core/message/164701
> Mute This Topic: https://lists.openembedded.org/mt/90585970/3619030
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [armccurdy@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

