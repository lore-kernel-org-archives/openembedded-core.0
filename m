Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web12.11155.1602765895269005946
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2020 05:44:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qtc96xuD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id a72so3016182wme.5
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2020 05:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=kk0IBpx0AMbHIYPIeRVWQia/YQWs8pbM8PCLVjtHGek=;
        b=Qtc96xuDrLI/KNf63XAXt4p6vK5guc2/iJDYsy0YozkxWZss3kf4wUWbEMKOFHTh55
         EX/mBhiX4b6CQJkW4s/UCx/lqWpVckEEIEAnXsk1xD15xcHZCFqo2CNy6VMxKB2EwdsH
         iqqXMVxcDr/kVFcbUDXCf5y6nV6p96ms+JpLI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kk0IBpx0AMbHIYPIeRVWQia/YQWs8pbM8PCLVjtHGek=;
        b=C19uROPfb80FZmHo1vUyneLHln4uRKkubffeCbAXvPwKWO2lYqKWgiIXUhlQuj0UCB
         vT+S6zjhs43a1VNqXc2yh9JfdKzvvAXcMPTtOBrt3ntvhG0tWcxUOi5jSQurkp7LAlvb
         P1k4DXLVVOa4qPq/UXh8OdvZlPodwQmtyG7yZW9GPWXP12NR0fB4OgUkLImNJ/BTWcHQ
         K04HGdR8NS01nLyln+yjVMAWCal3/gbexUglQd8Wb331Mno/ANY0LJx21zBmscMwKRrU
         OtJrsbaaCaO6wQl1vRT3P8YHNUsiz6WMmjTnZAGoQnxzJcullVFa25NNagYDrr5g2ao8
         ZzRQ==
X-Gm-Message-State: AOAM5326npuOKxJSLBjBwmNV9PpdTF56IN/DJycgpNXmgfzbF4fOqeIj
	AGorqykvk7XkcGrIfjpfJBHQKg==
X-Google-Smtp-Source: ABdhPJzs2UwqYw8K3y2gwRpqdewWDb01DnkhGaBqWBqD/wJSUicRHbiLg8Za/Y0OVAca4rGCdJhgPA==
X-Received: by 2002:a1c:2cc2:: with SMTP id s185mr3945592wms.77.1602765892560;
        Thu, 15 Oct 2020 05:44:52 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (f.7.c.a.0.7.9.b.6.d.5.e.8.7.d.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7d78:e5d6:b970:ac7f])
        by smtp.gmail.com with ESMTPSA id t124sm4342031wmg.31.2020.10.15.05.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2020 05:44:51 -0700 (PDT)
Message-ID: <0c555406c8db939a1e35bc7621166bb2b832fa84.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] waf: explicitly run waf under Python 3
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joshua Watt <JPEWhacker@gmail.com>, Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Oct 2020 13:44:49 +0100
In-Reply-To: <CAJdd5GY4QD03+UWP_y-ALi4vE54cf8-DTAYxMNOGrG1BZ-cHUw@mail.gmail.com>
References: <20201014112620.2244199-1-ross.burton@arm.com>
	 <CAJdd5GY4QD03+UWP_y-ALi4vE54cf8-DTAYxMNOGrG1BZ-cHUw@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-10-14 at 07:41 -0500, Joshua Watt wrote:
> 
> 
> On Wed, Oct 14, 2020, 6:26 AM Ross Burton <ross@burtonini.com> wrote:
> > We don't assume Python 2 is on the host and don't expose an unversioned
> > python in HOSTTOOLS, but waf uses the unversion python binary.
> > 
> > Typically this is solved by patching waf (see the glmark2 recipe) but
> > this can be solved centrally by invoking python3 directly.  All wscripts
> > that needed Python 2 would have been fixed by now.
> > 
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > ---
> >  meta/classes/waf.bbclass | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
> > index 309f625a40..df6d4d53e8 100644
> > --- a/meta/classes/waf.bbclass
> > +++ b/meta/classes/waf.bbclass
> > @@ -42,7 +42,7 @@ python waf_preconfigure() {
> >      subsrcdir = d.getVar('S')
> >      wafbin = os.path.join(subsrcdir, 'waf')
> >      try:
> > -        result = subprocess.check_output([wafbin, '--version'], cwd=subsrcdir, stderr=subprocess.STDOUT)
> > +        result = subprocess.check_output(['python3', wafbin, '--version'], cwd=subsrcdir, stderr=subprocess.STDOUT)
> 
> This will break our internal usage... We still use waf 1 which runs under python 2 only :(, although we are working on transitioning

Might I suggest this is parameterised as something like: 

WAFPYTHON = "python3"

then OE-Core can continue on and improve but people with legacy can
handle it better?

Cheers,

Richard

