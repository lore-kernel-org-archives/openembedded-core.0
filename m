Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D04DC8302D
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:12 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.19367.1650534801124840216
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 02:53:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EjcEX6NB;
 spf=temperror, err=temporary DNS error (domain: linuxfoundation.org,
 ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id
 n40-20020a05600c3ba800b0038ff1939b16so3037422wms.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Apr 2022 02:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=pSU9IqW7mWltax/9Do+VUHxlrRyjHOYg55dS4xvxfy4=;
        b=EjcEX6NBTDe2HQp/GGObStPWnZGio4KsLdOZP6KVeZnik/2L26FZGxUDzyAx8PzLzX
         xRVrpcaQ7rqtIrf7B1QdxyJYHRpWbJsKa+ydRY4wP4ZVPomG/jmWRrKCAhMs8R5KDtG2
         LAilsZ4bJoeFZ7VVt8gVD2QEiMtbZK58ol5uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=pSU9IqW7mWltax/9Do+VUHxlrRyjHOYg55dS4xvxfy4=;
        b=goOqJ3vUF21hxo4AIQmIBbxSFbSdSnyvY6NfEeuDhdgIigodk9SncAEEsT+VtESF6Y
         hug/5jZu/mQ9t7Ixb442HCrCUOsBXWIAmy1tKHzdjmKZ9cgfIIrZxxj6zYAlfr0BM88v
         vTQKqnTYBgPvJ7Nrpjn10k/nt7z4dlWDv98vzbGtT7l3lDUqdNr0aiXNpokk96ZWsoRA
         SgyPiqC1LExmS8R5RxhJP2rGNJ09MBdroRwNDXxm8ZLbsDUx1jWTV7hfgFMmWaHNO82D
         2mBWZ/4TTJTG4qmIP7g2A5NM+/yY/LKrSkKHjeS6Pp1YqKL9lKgqae1ff0+9aCpT4V1o
         Cz5Q==
X-Gm-Message-State: AOAM533crWlkNUkIkNauPTG2AdAUBT8Ll/Xk8ge02lQVXIGeHHM/hiRd
	Z0C7AG7OEUwgKJPDbMAQWCdPFA==
X-Google-Smtp-Source: 
 ABdhPJzeSV7HhrYFX3AWhLvf42ODU7Qzsk17VzErO9VjZKWlZDS/Et7/Ie4vTAWrix2O467X47xqjQ==
X-Received: by 2002:a05:600c:19c6:b0:392:88e2:7426 with SMTP id
 u6-20020a05600c19c600b0039288e27426mr7778763wmq.132.1650534799467;
        Thu, 21 Apr 2022 02:53:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:be2e:566:8fa4:996b?
 ([2001:8b0:aba:5f3c:be2e:566:8fa4:996b])
        by smtp.gmail.com with ESMTPSA id
 g8-20020a5d4888000000b00207a49fa6a1sm2188430wrq.81.2022.04.21.02.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Apr 2022 02:53:18 -0700 (PDT)
Message-ID: 
 <5089dcb4899e2b3bbd1ee12f742eaf87c0021f97.camel@linuxfoundation.org>
Subject: Re: [PATCH] devshell: introduce intercepts as per native / nativesdk
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2022 10:53:17 +0100
In-Reply-To: <20220420151141.25027-1-paul.gortmaker@windriver.com>
References: <20220420151141.25027-1-paul.gortmaker@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164751

On Wed, 2022-04-20 at 11:11 -0400, Paul Gortmaker wrote:
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
> 
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

I just realised, we can't do that! It would apply globally and mean builds
change behaviour depending on whether devshell is inherited or not. It also
means all git calls run through the wrapper, not just devshell ones.

I've also realised we have a bigger problem since some software is running git
to get the version during do_install.

My proposal is to change scripts/devshell-intercept to scripts/git-intercept,
make the PATH change in the do_devshell function below but also add something
like:

PATH:prepend:task-do_install = "${COREBASE}/scripts/git-intercept:"

in common code.

Since this hasn't merged yet, I can tweak the patch if that works for you (or
you can)?

Cheers,

Richard


