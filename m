Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.9457.1632049384076848545
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Sep 2021 04:03:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GplJderB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id d21so23295258wra.12
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Sep 2021 04:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=/6ZKOctSPOzYvu8Gv9lNO/xseU0ZhdBwmguwi0qA4JU=;
        b=GplJderB716NX80UpRUaN9/qAXVTfBP+k4ZKg93um+jDTg5RXTegopLIt1GAWNnrdk
         pbX2yvcJ/qignUzQLMVITWoHRi6tUbmA21cunsmXDJcCRifbI3AlUOOZ3ALtqe2Sd9/t
         5uFpLgRXaSIzPrnML9D/eVGhTlr6h+rjhENrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=/6ZKOctSPOzYvu8Gv9lNO/xseU0ZhdBwmguwi0qA4JU=;
        b=1W7ZQbG6ALPb0Y9ZQ9qqij7OA3yocjQURPpVblCWBaeexfq4MoSSgMHEfDzDvUdPEM
         F2ocAcjYTB2balLBK3WLlALrWvNjOpITX2BNmVIGZmXpe4gwi/aGlVckf10I5KxLPjVP
         dWyOqUerWuepQGZzJKL3djXeEDKJG/jrpirZ9fFp9NqyiefO8rnvHsnakV58Bfqiggg7
         bbL1IoAhcten++dqIuH5w1TdnJ2FZcRHiDgQ0rcssiu9B4wf8lPHZvES9AShv0mNgBvS
         0GQfaEr5oL/F6o4Mh4skMbGURECdCXeKO27Ue29M+ahZI2m8Fp/zF7GhYaggKFcjdYoz
         WZOw==
X-Gm-Message-State: AOAM530q/7spTYpNErK8f77527ox5crjUAinZanv2NCCG6KknBNSM+oa
	z6HqaxOPqQFMVPfKcLzxhEhVicuyx4YP8b9z
X-Google-Smtp-Source: ABdhPJyCbq4HRW0ycm53T9o6yB0cIeVnh2khuPn7TZWwlX9y6liI9d9fgz7FGqT9PQvRrsfelTCCMg==
X-Received: by 2002:a5d:590a:: with SMTP id v10mr23297714wrd.87.1632049382294;
        Sun, 19 Sep 2021 04:03:02 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f583:326e:a3bb:7da1? ([2001:8b0:aba:5f3c:f583:326e:a3bb:7da1])
        by smtp.gmail.com with ESMTPSA id f1sm12483876wri.43.2021.09.19.04.03.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 04:03:01 -0700 (PDT)
Message-ID: <38ae386328c67ce4e48930950b8131d7fe2e10f4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH] package_ipk/deb/rpm: Drop recursive do_build task dependencies
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Sep 2021 12:03:00 +0100
In-Reply-To: <16A633F8E639735E.6604@lists.openembedded.org>
References: <16A633F8E639735E.6604@lists.openembedded.org>
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2021-09-19 at 11:57 +0100, Richard Purdie via lists.openembedded.org
wrote:
> This is a controversial change which removes the recursive dependencies
> from the do_build target of packaging tasks of recipes.
> 
> Currently this means when you "bitbake <image>" or "bitbake <recipe>",
> the packaging tasks run for all packaging backends enabled for all recipes
> in the dependency chain. The same therefore then applies to images.
> 
> We don't actually need that, it is a convinience thing. Removing it
> massively simplifies the task graph and causes much fewer tasks to execute
> in many common scenarios. It also means less sstate is fetched for
> example when building an image.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/package_deb.bbclass | 2 --
>  meta/classes/package_ipk.bbclass | 2 --
>  meta/classes/package_rpm.bbclass | 2 --
>  3 files changed, 6 deletions(-)
> 
> diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
> index eca43e17876..8f0eadbcd2e 100644
> --- a/meta/classes/package_deb.bbclass
> +++ b/meta/classes/package_deb.bbclass
> @@ -320,5 +320,3 @@ addtask package_write_deb after do_packagedata do_package
>  
>  PACKAGEINDEXDEPS += "dpkg-native:do_populate_sysroot"
>  PACKAGEINDEXDEPS += "apt-native:do_populate_sysroot"
> -
> -do_build[recrdeptask] += "do_package_write_deb"
> diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
> index c3b53854e8b..756744279e1 100644
> --- a/meta/classes/package_ipk.bbclass
> +++ b/meta/classes/package_ipk.bbclass
> @@ -278,5 +278,3 @@ addtask package_write_ipk after do_packagedata do_package
>  
>  PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
>  PACKAGEINDEXDEPS += "opkg-native:do_populate_sysroot"
> -
> -do_build[recrdeptask] += "do_package_write_ipk"
> diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
> index 88d861c0e75..9f415b234de 100644
> --- a/meta/classes/package_rpm.bbclass
> +++ b/meta/classes/package_rpm.bbclass
> @@ -752,5 +752,3 @@ addtask package_write_rpm after do_packagedata do_package
>  
>  PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
>  PACKAGEINDEXDEPS += "createrepo-c-native:do_populate_sysroot"
> -
> -do_build[recrdeptask] += "do_package_write_rpm"


Just to add a bit more context to this, the bigger impact will be on CI setups
including our autobuilder since "bitbake XXX" will no longer do quite what it
did before. I'm starting to think we should move to the new behaviour and apapt
the CI targets as/where needed.

I have a build running on the autobuilder to see what impact this has on the
automated tests. I'd welcome other people's thoughts on this.

FWIW we have removed a lot of these recursive dependencies, this one is one of
the few left on do_build but it has been left as it has the biggest user visible
impact.

Cheers,

Richard


