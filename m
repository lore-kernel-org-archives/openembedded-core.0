Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.8653.1611923172316452783
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 04:26:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UYvtv7f9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id l12so8666555wry.2
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Jan 2021 04:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=cdDZCaftc9dun//5q6Ay50qP0Txbab+hmjQAJgAvCBQ=;
        b=UYvtv7f9Hm7RI1I1H7BrAUhrDh6jb5YnLcB71huuYjm1wrhJKcECLt/rYyOOPzs0j5
         LrN6GnI2aGczFIz3aC0Ik9Qamd1chiTolV6kguxMLh89mFKosy+eN4fuKmuokex1e3Gu
         b0DLE5sawn9W5rn1eKECUMx0xZ4BmFWCiP83k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cdDZCaftc9dun//5q6Ay50qP0Txbab+hmjQAJgAvCBQ=;
        b=o062cu3ruXo/gdGCqH9euU0wm1+1fq4BS9PlUbdCZ4sRsQ1YK9P7v4yBJWfcH6iCns
         Y1xAmRQ1llLz9F982KEjVSRzq8gRloB4fzDMdp9FP0mqmwJ9n7aM7wKBhaydBeRY5u6p
         PsvEYf0kzKUc3YUyXOzH+3+gCqn0BGNdpWsBgrAdKPKgsQMDyLH3XqDSbStiTtJRm69L
         Now2gGFMZBsSc5LfrohmBFQLoCKYbv1giuPBVqdcL9dwM0wmq7AbKFWrED0bFoptndlb
         IaTwvSLDh/6vNLYfyp6nfEUnTraduQTXBrfTbllL2z6zjO0JGQp8vISIgHeEu6sdAVZg
         JmWw==
X-Gm-Message-State: AOAM532Q+BVRJXhciKJ5jaRpRMfPawaTqXV89XpP7UW+wtIAg84Np4zH
	+yFBtLIFR4pbWaDUd6uE9UJkGw==
X-Google-Smtp-Source: ABdhPJxkwxWBvRPtOi0viR6vhvmkURnnM1M/r9uwT5vPRElaLovNYwsbH4wwGHqiQEVDSX+SZ354XQ==
X-Received: by 2002:adf:e48b:: with SMTP id i11mr4342103wrm.406.1611923170770;
        Fri, 29 Jan 2021 04:26:10 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:93ef:509c:4f16:14ff? ([2001:8b0:aba:5f3c:93ef:509c:4f16:14ff])
        by smtp.gmail.com with ESMTPSA id i59sm12866642wri.3.2021.01.29.04.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jan 2021 04:26:10 -0800 (PST)
Message-ID: <421a168b8f2f90bb35cd2369016429ffe4f5c457.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] lib/oe/patch.py: Don't return command stderr from runcmd function
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>, Tomasz
 Dziendzielski <tomasz.dziendzielski@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jan 2021 12:26:09 +0000
In-Reply-To: <20210129114144.lvip5kzzoo2slhqr@qschulz>
References: <20210129113808.16982-1-tomasz.dziendzielski@gmail.com>
	 <20210129114144.lvip5kzzoo2slhqr@qschulz>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2021-01-29 at 12:41 +0100, Quentin Schulz wrote:
> Hi Tomasz,
> 
> On Fri, Jan 29, 2021 at 12:38:08PM +0100, Tomasz Dziendzielski wrote:
> > If a function returns any stderr it will be passed to extractPatches and
> > used as path to patch.
> > 
> > For example subprocess command output can be:
> > > sh: warning: setlocale: LC_ALL: cannot change locale (en_US.UTF-8)
> > > /tmp/oepatchhuqle8fj/0001-foo.patch
> > > /tmp/oepatchhuqle8fj/0002-bar.patch
> > 
> > that will result in:
> > > FileNotFoundError: [Errno 2] No such file or directory: 'sh:'
> > 
> > To fix this I separated output, made the function return stdout and
> > print stderr only in case of command error.
> > 
> > Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> > ---
> >  meta/lib/oe/patch.py | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> > 
> > diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> > index 40755fbb03..8ad70f53f1 100644
> > --- a/meta/lib/oe/patch.py
> > +++ b/meta/lib/oe/patch.py
> > @@ -38,15 +38,19 @@ def runcmd(args, dir = None):
> >          args = [ pipes.quote(str(arg)) for arg in args ]
> >          cmd = " ".join(args)
> >          # print("cmd: %s" % cmd)
> > -        (exitstatus, output) = subprocess.getstatusoutput(cmd)
> > +        proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
> 
> I'd rather avoid having shell=True passed to Popen, read
> https://docs.python.org/3/library/subprocess.html#security-considerations
> 
> Can't we just use args directly instead of cmd in Popen to avoid using
> shell=True?

Whilst that would be nice, we already effectively use this all over.
I'm not adverse to cleaning up all the quoting but I think its a
separate topic. If you don't trust our metadata there are much bigger
and easier ways to run commands...

Cheers,

Richard



