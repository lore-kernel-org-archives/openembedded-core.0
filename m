Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web09.15131.1611079899917004374
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 10:11:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MMfJWOjq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id c124so625812wma.5
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Jan 2021 10:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Yjkll2cTBYx/+PfSar3qcVo0Kn49VGrHt34EDVACBK0=;
        b=MMfJWOjqhqNOQOoq8XuVQUVB/cwGk9EyUdWm/KJPklPhRk9nBskNpjmsZIbXMzrbBw
         dJgGzP/Yrv3y7uo4p6gZalmUbLftWjiqVK1exY+llXF6dU//oM6ci/1JLSDMRQQ29yzI
         lD3WB1f86cijPQ5qDqpLI7CB8CEYGg7eayNv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Yjkll2cTBYx/+PfSar3qcVo0Kn49VGrHt34EDVACBK0=;
        b=EGflNAOFzu93I8nHKBqDaej9RN61FivxE2kj1sIuxWx6ERjNbhCza8HHapRMXxEGcq
         WBGlNch9y2ZsAxxVGzJwEKdegWGnz+xz6G4XlKyi3WiTW9I1+Bm+LSp28TWh//nc7q8A
         2zK010dG6e2KGJHxsMq9oDu7tJLJ/PlJEmtLa1m5VAFYtp/WMAO8vwm3csxwt1drexJr
         Rt8RjiuEAVnOvYj4dh7fxwDPASQaSqGtoPM79CseuoF63p6UnMqo+fwS0dtkvLAjmTWk
         dSDQNp9bZ0WexX+y9IFb7aASZG0V41U5YGoWzc2UuVFnpJK6ljmR99E8Doht5gmRDrx4
         uN3A==
X-Gm-Message-State: AOAM531zEOQeTiMmTivWxZ9WrqnQn55zCTaz9B185biW/5jcXVbCLr2y
	5IGph7KIrsQjkLomRvbvBHA97Q==
X-Google-Smtp-Source: ABdhPJx//zaOIago2/2IQ9UzEeg47Gx0eHPRvs4oh7a2YuGh4LKGjl9pVvjt+qUY+5ZBOkxSxGjX9A==
X-Received: by 2002:a05:600c:198e:: with SMTP id t14mr769018wmq.109.1611079898428;
        Tue, 19 Jan 2021 10:11:38 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:f7a4:851a:48d5:440b? ([2001:8b0:aba:5f3c:f7a4:851a:48d5:440b])
        by smtp.gmail.com with ESMTPSA id u205sm5752921wme.42.2021.01.19.10.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 10:11:37 -0800 (PST)
Message-ID: <75dd1f1859c454c2f3ddf14707292f5ab444a834.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] devtool: Fix source extraction for gcc shared source
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jan 2021 18:11:37 +0000
In-Reply-To: <CAJkqNs2jU7FVs5zdeBto2CysdyDUBgyFsWe2gDQKKxLR9UEgQw@mail.gmail.com>
References: <20210119155325.351554-1-tomasz.dziendzielski@gmail.com>
	 <107314c0428cf791bc195dd27d3cfe11bb9a4c3e.camel@linuxfoundation.org>
	 <CAJkqNs2jU7FVs5zdeBto2CysdyDUBgyFsWe2gDQKKxLR9UEgQw@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-19 at 19:05 +0100, Tomasz Dziendzielski wrote:
> > > diff --git a/meta/recipes-devtools/gcc/gcc-shared-source.inc
> > > b/meta/recipes-devtools/gcc/gcc-shared-source.inc
> > > index aac4b49313..9ef80f2074 100644
> > > --- a/meta/recipes-devtools/gcc/gcc-shared-source.inc
> > > +++ b/meta/recipes-devtools/gcc/gcc-shared-source.inc
> > > @@ -2,6 +2,7 @@ do_fetch() {
> > >       :
> > >  }
> > >  do_fetch[noexec] = "1"
> > > +do_patch[noexec] = "1"
> > >  deltask do_unpack
> > >  deltask do_patch
> 
> > This is in itself a little odd. The "deltask do_patch" line deletes
> > the
> > task, so there is no task to set as noexec?
> 
> This was added because from the devtool script I couldn't find
> another way to determine if the task is run or not. If I add
> "do_patch[noexec]" (which logically doesn't change anything) even if
> task is deleted, I can check "if 'noexec' in d.getVarFlags(task,
> False)" and tell devtool to execute do_configure task dependencies
> (to prepare gcc sources).

Try checking if the "task" flag is set for "do_patch"?

Cheers,

Richard


