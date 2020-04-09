Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.5989.1586426877918295297
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 03:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CNIPXklM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id i10so4939610wrv.10
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 03:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=JujBrKzkwnyql7EPj7v/SAiurXPs8lk/AFjD7YvxkRo=;
        b=CNIPXklM8kVM2rXEEaFIMkXWzN/cNqtJ6AbOmiK9pZSFlupCiiykVlzGOpwdHKbb9I
         x2aey6qu3VU90hEBW+ERjTnaOTMfrVmc0STIvDxMagWMXisobkqblwGgAlnsPo7Sy/Ga
         EKae9px6ILzC9ViFjOp+KG5ZRITNdvo1xt5l0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JujBrKzkwnyql7EPj7v/SAiurXPs8lk/AFjD7YvxkRo=;
        b=ZAOCTE7xijmfRuaExPneJxRu704acY6FDxgperRitmaF3Uacii74jmHpSF0YiNRh7U
         RBfr5zJ5fuq3IAvQN6NJ0uBUFSHY5C5BXBTDipxZxYrOB037P1lqd8HlH9AjtFdVKqzS
         MjmqHLu7rZZ5WK54S7TZdkP2qL3wwghqQzm0n+uZWZt3SDQ6cKszDwYmx775Opk25UVV
         mUs4Q5CQNWt8/13FIi1mGTvWLTCq7BxZgzKEqkaVae6erER+3QGVbJ2qVW9UfqminPff
         1tPOPJspZNBqz/70RdjjstD1hs7plQomeWd5HuXUnIrsn+uKvzBcRQZfshHU946WBRfJ
         VxLQ==
X-Gm-Message-State: AGi0PuYqJzx+GK4AUTf1bmVPWOaqdhuj3HPEt1om4r3DMlLJrD2P0wkf
	HSp071wFT34YM86bq4jcJxnM/Q==
X-Google-Smtp-Source: APiQypJZyyPndotZvywCmq4J0angnJ1QWJ4IBxxmSCVugSOvjanT84PwRv+ty/QbdKBx6is/iQabwA==
X-Received: by 2002:adf:9321:: with SMTP id 30mr12686492wro.330.1586426876305;
        Thu, 09 Apr 2020 03:07:56 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id a7sm3130966wmj.12.2020.04.09.03.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 03:07:55 -0700 (PDT)
Message-ID: <b1f74d2ff1a76a6f66c23fe9ee09971346a886b1.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] patch: don't strip GitApplyTree patches
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: bkylerussell@gmail.com, openembedded-core@lists.openembedded.org
Cc: wesley.lindauer@gmail.com
Date: Thu, 09 Apr 2020 11:07:54 +0100
In-Reply-To: <20200409044116.27070-2-bkylerussell@gmail.com>
References: <20200409044116.27070-1-bkylerussell@gmail.com>
	 <20200409044116.27070-2-bkylerussell@gmail.com>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-04-09 at 00:41 -0400, bkylerussell@gmail.com wrote:
> Don't pass a path removal parameter to git am/git apply since GitApplyTree
> always applies patches from the root of the git repo, not from each
> individual patchdir (like quilt).
> 
> GitApplyTree uses `git rev-parse --show-toplevel` to find the root of
> the repo no matter which patchdir is passed into the GitApplyTree instance.
> In most cases, this works fine when applying patches since the three-way
> merge can figure out where the patch should be applied to existing files
> based on the history, even if the file paths are excessively stripped.
> 
> An exception to this occurs if a patch adds a new file to the repo
> and a custom ${S} has been set to a subdirectory of the repo such
> that the patch requires a non-default striplevel parameter.
> 
> When processed by GitApplyTree, the patch will have its striplevel
> parameter given to git even though it's applied at the root of the
> tree.
> 
> For example, consider a patch that adds a new file src/foo to a repo.
> 
>   --- /dev/null
>   +++ b/src/foo
>   @@ -0,0 +1 @@
>   +new file test
> 
> The recipe sets S = "${WORKDIR}/git/src" and the patch is added to SRC_URI
> using "striplevel=2" since the default patch tool, quilt, applies each
> patch at its patchdir, which defaults to ${S}.
> 
> When the GitApplyTree patch class is used (for example, through devtool),
> the root of the repo is passed to git as the work tree, in addition to the
> path removal paramter.  In the case above, GitApplyTree creates
> ${WORKDIR}/git/foo instead of ${WORKDIR}/git/src/foo.
> 
> Interestingly enough, you can take a more typical patch example that only
> changes existing files (instead of adding a new file) and remove the -3
> argument from the git am/git apply commands issued by GitApplyTree.  In
> this scenario, the patch will also fail to apply because the path removal
> arg is still being passed, and the resulting path does not exist.
> 
> Since GitApplyTree always applies from the root of the repo, it should
> ignore any striplevel arguments.

I don't follow this argument. We have several recipes in OE-Core which
set striplevel in SRC_URI (e.g. bash, llvm and a pointless looking one
in build-compare). If you changed the patch tool to git for those
recipes, doesn't it fail with this patch applied?

I think you're right and there is an issue here since do_patch assumes
${S} is the root for patches whilst git assumes the root of the repo is
the patch root. If those are different, it will break.

Put another way, I think your patch fixes one case whilst breaking
others :(.

I'm not sure how we reconcile this. I certainly do not like hoping 'git
am -3' figures it out. We may need to teach GitApplyTree to calculate
the difference between the git repodir and patchdir and adjust the
offsets accordingly?

Cheers,

Richard


