Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.5917.1591705607181746291
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 05:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=haPJ0DXo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.65, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f65.google.com with SMTP id u13so2657729wml.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2020 05:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=2wWeTteiOt3yvsGeXd2KOjqhtrBiX2qaG71zkOyFyzo=;
        b=haPJ0DXovROYdJ3LSi7YJ5w6AnX3PXV2LhAuvy3eOH7fv6PZUNvjmRNk2oKaDs5HXr
         1+XCePnrqqvQPkYumuTHJBwOSwXzHRQnvBVBbf7plf3OpSt0lPwBwPee/x8JyyADI3Lf
         QBM8/RPiIyLTdNuyULSke53gyTtBiyjE/YFOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2wWeTteiOt3yvsGeXd2KOjqhtrBiX2qaG71zkOyFyzo=;
        b=DJ7o+tSN65+gnB+3XM5tauMTjKkPdtQlkDp4Z3qAAZOwknhDsSinkhAMbuBHIu3xhO
         obgITvnczjZX2JGPdR3KjHh0mLSR258VcJzf50KuAoDl5vcZvvwyhVu/DemXAfLLTGKH
         0jUucfHVknMj6RtZq7PZq1fyDmkV3FeFVrEJIyeEcV5cTYdYfph9cjFB5S4mAvACKFnm
         iHeb2FNwKxg08hXsmRIyH5vShx1NEXV3NlZBqOLZjO8Fb+dROd7OwC3CHkOuJvjBpZEe
         RKPGR+t8B59Aq/3MyEuZmait4krf9zMFienJ6C0DrdEXFLLt6wvLaLzxbfkchCeJ4zgU
         fxSw==
X-Gm-Message-State: AOAM530FoNJEiLYLysMzLfN3lako7fsdGbktovmtnblVZXoX0ND/JGt6
	yahiNXftDOP+dltuYW0t+SUUKAsf0rd5SQ==
X-Google-Smtp-Source: ABdhPJwgP2z8aUmXBUkXC8BnFNXXlq7pUmrYCQ2hjqmg/Y8GOy++MXciHoR34qjhsgVd8O5uFm8deA==
X-Received: by 2002:a1c:3987:: with SMTP id g129mr3754119wma.139.1591705605830;
        Tue, 09 Jun 2020 05:26:45 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id d18sm3206102wrn.34.2020.06.09.05.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 05:26:45 -0700 (PDT)
Message-ID: <e6e1ddf0c27736677ba9401356efa871d59a6fb3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [master][dunfell] Revert "prservice.py: fix do_package with newer Python in Ubuntu 20.04"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 09 Jun 2020 13:26:43 +0100
In-Reply-To: <1616DF96BBE13D68.17072@lists.openembedded.org>
References: <20200605155012.7175-1-pkj@axis.com>
	 <1616DF96BBE13D68.17072@lists.openembedded.org>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-09 at 13:22 +0100, Richard Purdie via
lists.openembedded.org wrote:
> On Fri, 2020-06-05 at 17:50 +0200, Peter Kjellerstedt wrote:
> > This reverts commit 4b26eaf7152fb712aba47a0c746333578f58ee8d.
> > 
> > Since the problem occurred while importing prserv, the solution has
> > been moved into it instead so it is solved for all cases where
> > prserv
> > is imported, most notably when using devtool.
> > 
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> 
> I can see why you've done this however it really is a bit of a hack
> :(.
> 
> At least in this code its all together with the OE code which uses
> it.
> With it moved into bitbake, its moving "OE" knowledge over there and
> that worries me a lot as people won't find it when changing OE-Core.
> 
> Chris did have some ideas about this which seemed on the right track:
> 
> https://lists.yoctoproject.org/g/yocto/message/49571
> 
> although it seems that solution didn't work.
> 
> I'd like to better understand this issue before we merge things to
> bitbake.

btw, the better question to ask is why is python3-native being used to
execute bitbake code? 

I think the wrong PATH is being used somewhere in devtool. The real fix
is to track down where that is.

Cheers,

Richard

