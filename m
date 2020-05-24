Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web10.11452.1590315431079077598
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 May 2020 03:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EAHNfE0I;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f65.google.com with SMTP id e1so14527496wrt.5
        for <openembedded-core@lists.openembedded.org>; Sun, 24 May 2020 03:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=EhTAtdRzykGfCkGCR6IC1nrkIDs7X5R6IAAu2YXZ42M=;
        b=EAHNfE0I+v7zSyeDRkHhOYAGaFH0lPg0ol2a1hoSgkIYbzp9igx2ygct53/LGYIPU/
         l1uhWbS0myU9XK//A0bj/sTf3hWyg/aRCmoq7zJ/bjXMM1OGysckRSgXJEe23PewgpAp
         wpIE+O54IUic39HVoSH75S+PWvAysJfEDoedY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EhTAtdRzykGfCkGCR6IC1nrkIDs7X5R6IAAu2YXZ42M=;
        b=iKnsLqWtr54Kl5Vk5dKw651C5Soru0x/7bdxYmjkTwNwEwYFpxZkPEppBtf0rSiN18
         pZbaNcwhEKPewh+EOmCBjHwC6KtwLCmPB5oqrG52pLTdUHDCBVcmg6xTVy7yP4WlM+CP
         W7hzNHoGA0TI4UfZhVOq2v7T0c2BSEeeizZsAvCA8A3Dsc4Fk/2UKEwghNduBZ2oE2Vq
         glhPBy9U0gqTNoUJurTlZnevg2oxnvEaHoGPzA7s9zEY6rbB5GwQs/u8X5WHbTtLnM/T
         HWxAonAEhp7lDIachUruNF6uulwUOFb9Hv0b9wVPx1dv7sI35TqzVOxccKvafZ0iuDtS
         nTlg==
X-Gm-Message-State: AOAM53310+TWthnq6Wnt3MnGcRt+4LFNEorp9hFYR9JMbRVRWLCacEZr
	0o7YDWeq+PGAfQw8HbnbZwzMCQ==
X-Google-Smtp-Source: ABdhPJyhj+ArdsowxDawFmFs08eIQATRlqdW7IlwtuNTlZw84MfXCBiAiV0UMIuP3bW84kLH5RRWbw==
X-Received: by 2002:adf:dc0a:: with SMTP id t10mr11355940wri.342.1590315429554;
        Sun, 24 May 2020 03:17:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id b132sm1525505wmh.3.2020.05.24.03.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 03:17:08 -0700 (PDT)
Message-ID: <435fae8732a790bd0fb7311d507c772624c1bec9.camel@linuxfoundation.org>
Subject: Re: [PATCH] file: add bzip2-replacement-native to DEPENDS to fix sstate issue
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Gregor Zatko <gzatko@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Jan-Simon Moeller <dl9pf@gmx.de>
Date: Sun, 24 May 2020 11:17:04 +0100
In-Reply-To: <20200524100433.3919445-1-gzatko@gmail.com>
References: <20200524100433.3919445-1-gzatko@gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2020-05-24 at 12:04 +0200, Gregor Zatko wrote:
> From: Jan-Simon Moeller <dl9pf@gmx.de>
> 
> file-native when built on a Debian 10 host will embed a dependency to
> 'libbz2.so.1.0' (instead of 'libbz2.so.1'). This can cause issues
> when sharing the sstate between hosts e.g.:
> 
>  recipe-sysroot-native/usr/lib/rpm/rpmdeps:
>       error while loading shared libraries: libbz2.so.1.0: \
>         cannot open shared object file: No such file or directory
> 
> To avoid this situation, let's add the bzip2-replacement-native to
> the
> file recipe's DEPENDS_class-native .
> 
> Details in https://bugzilla.yoctoproject.org/show_bug.cgi?id=13915 .
> 
> (From OE-Core rev: 4a996574464028bd5d57b90920d0887d1a81e9e9)
> 
> Signed-off-by: Jan-Simon Moeller <dl9pf@gmx.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/sanity.bbclass | 6 ++++++
>  1 file changed, 6 insertions(+)

I think you've mixed up two different patches here, merging Jan-Simon's 
patch with your own inherit one...

Cheers,

Richard

> diff --git a/meta/classes/sanity.bbclass
> b/meta/classes/sanity.bbclass
> index 292c5591dd..e021b9d240 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -784,6 +784,12 @@ def check_sanity_everybuild(status, d):
>      if "." in paths or "./" in paths or "" in paths:
>          status.addresult("PATH contains '.', './' or '' (empty
> element), which will break the build, please remove this.\nParsed
> PATH is " + str(paths) + "\n")
>  
> +    # Check whether 'inherit' directive is found (used for a class
> to inherit)
> +    # in conf file it's supposed to be uppercase INHERIT
> +    inherit = d.getVar('inherit')
> +    if inherit:
> +        status.addresult("Please don't use inherit directive in your
> local.conf. The directive is supposed to be used in classes and
> recipes only to inherit of bbclasses. Here INHERIT should be
> used.\n")
> +
>      # Check that the DISTRO is valid, if set
>      # need to take into account DISTRO renaming DISTRO
>      distro = d.getVar('DISTRO')

