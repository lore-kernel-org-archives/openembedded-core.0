Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.14145.1628717907015922576
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Aug 2021 14:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NQQnBumO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id r7so5123955wrs.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Aug 2021 14:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=RS17mx2QJBHBsyn6NIgLvUzsOXjoMfCcAzYs/ry4U1g=;
        b=NQQnBumOxtjpO18vv9+Pk3TAFYnv/z05B8QthAXvbGG95/z0Tt4BEsl3QMNfjxuMx6
         WG9FgJKKmjKSeaQz+91GHsgq3SzrmqgG1evyVMetPa4p3FM0MTiFSIKGFI7uHzEHw/EL
         Rk3659yisbLDMOlmcyDh8+hU7Fm/CO4332avE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=RS17mx2QJBHBsyn6NIgLvUzsOXjoMfCcAzYs/ry4U1g=;
        b=S+L8c824iyzcWIGmim9wJUNz8+06SqOvIPpmUB4MZYQnNGc67rGtC6ZgGES3QTC8nZ
         TCBmzKlPYAWxdoxzNqbNgqPof3FT7VMunzObgw8woL9Klz6KgAmjDs3/Cev5BoPba9Oq
         /pRg6NKXWRT4pDhrcYcW5xJfV6Izt0k/NUstzHNqFYG3Wi5MJ7U47AyhDuoYfzwMTwG1
         KDkb4yf0kYqDekFvI+imcxy4fn/HaizwzXDF3g2FO8xRjoVNT9jDL5FiDBcuITmETIZX
         uop5jfrxLZJEjkLlk2X1HckhSSLCbKyCv8QRbg21/mgA9hSY11wtOVniUlws3rNsfj5U
         TmDQ==
X-Gm-Message-State: AOAM532ykY5+GbGpLowkauUVZrs7RMJYlNh+VWsod5+4xfhOR5qpvedl
	IeXAP5799Met3B2ZkF/Z1vtrIQ==
X-Google-Smtp-Source: ABdhPJxbY2pCJbluGnRRkYFDH8dfg4HegdzypN8u04rKCndbmnHOBe4L9rBAJTpj3uwFJ7i9gqejuQ==
X-Received: by 2002:a05:6000:247:: with SMTP id m7mr454808wrz.335.1628717905557;
        Wed, 11 Aug 2021 14:38:25 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4cdb:e268:791:eee0? ([2001:8b0:aba:5f3c:4cdb:e268:791:eee0])
        by smtp.gmail.com with ESMTPSA id s14sm376791wmc.25.2021.08.11.14.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 14:38:25 -0700 (PDT)
Message-ID: <20a5e86d077daf76bfc1398729b3a8ab71f9633c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [pseudo][PATCH] fcntl: Add support for F_GETPIPE_SZ
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: yocto@mac.mcrowe.com, openembedded-core@lists.openembedded.org
Cc: Mike Crowe <mac@mcrowe.com>
Date: Wed, 11 Aug 2021 22:38:23 +0100
In-Reply-To: <20210811155821.863938-1-mac@mcrowe.com>
References: <20210811155821.863938-1-mac@mcrowe.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-08-11 at 16:58 +0100, Mike Crowe via lists.openembedded.org wrote:
> When running the test suite on my Debian 11 box I see many occurrences
> of:
> 
>  unknown fcntl argument 1032, assuming long argument.
> 
> (for example from test-execl.sh.)
> 
> It appears that this is F_GETPIPE_SZ and it takes no arguments. Let's
> add it to avoid the warning messages.
> 
> I could add F_SETPIPE_SZ too, but that apparently takes an int argument
> which would mean moving the va_arg call into the switch statement. :(
> 
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> ---
>  ports/linux/guts/fcntl.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/ports/linux/guts/fcntl.c b/ports/linux/guts/fcntl.c
> index 434c7f3..e9c6140 100644
> --- a/ports/linux/guts/fcntl.c
> +++ b/ports/linux/guts/fcntl.c
> @@ -37,6 +37,9 @@
>  	case F_GETOWN:
>  	case F_GETSIG:
>  	case F_GETLEASE:
> +#if defined(F_GETPIPE_SZ)
> +        case F_GETPIPE_SZ:
> +#endif
>  		rc = real_fcntl(fd, cmd);
>  		break;
>  	/* long argument */

This goes make to making pseudo host specific which will break uninative/sstate.
We'll probably have to add a define if it isn't defined to get the behaviour we 
need.

It is probably only a question of time before some program is using F_SETPIPE_SZ
too :(

Cheers,

Richard

