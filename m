Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.5882.1607036703464171560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 15:05:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CPPKpPRU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id h21so5490264wmb.2
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 15:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=943VdQFJjo/tNvIQHfue8DX+1S3baeC5SiQHBimDB7s=;
        b=CPPKpPRUo4W9YStWuaR1viWx1nn6P4aIiU6CGnCPRtmb/LpvLuLnlTHhw27Ob2oLk5
         jhwXK8vH0Q2aeFTdxQQqk3cY0qGJhJqBYyEHJfoYR6fKd4FFEtvDk1vCbprOUd0dmoM/
         /b/1/f+thozmm2bhQB1XAQIr9HoTSr4djNj3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=943VdQFJjo/tNvIQHfue8DX+1S3baeC5SiQHBimDB7s=;
        b=SkCdm8DNg7lbiDw526EprpBnE3UjvMSveBLepy8qP1wuP+30Prg1apYAUbFXLvcjB1
         CXhJmbinezUQ3qfEw9QDIqkeEbJ7QB5hLlldXuko/AR7S1Pap/B33jqLyCtyqCpjvQnb
         VyUJ2HBa8Uc7Ff6SbRizAA6Rqe3Az6WkPYfdCB4rLcGUjlkrg69bDwS0FK3O2sGx+2PS
         izR1NMuNqqsxAFL0jSCqm2I/7au3dCNQ34PtsXJ6xkGHxkYpfRAj64zz95VDEWcakZ1v
         QM7GpVlFxKSpbGdULPVgNCIb9X9HUDzLPbYiltWak2DaG6HMmK889EYGTE6AHjp+t4lI
         +UZA==
X-Gm-Message-State: AOAM5309khEIXNvA9spPw0MjTZWDTEahZ9kTWonLTJNQSTj/YQYM8toa
	Fyk+lDYLJSEZosKsDjNksMKT8A==
X-Google-Smtp-Source: ABdhPJxRvhmxlYZdC3xrOWq2RAR7nX3fsdB4tMfjOoXu/LxZZKSF43FvvlRum25OCpkrQLwMgiuEGg==
X-Received: by 2002:a7b:c182:: with SMTP id y2mr1049345wmi.57.1607036701926;
        Thu, 03 Dec 2020 15:05:01 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.2.d.8.e.2.1.e.1.8.2.c.7.a.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.2.d.8.e.2.1.e.1.8.2.c.7.a.4.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c4a7:c281:e12e:8d29])
        by smtp.gmail.com with ESMTPSA id o15sm1074070wrp.74.2020.12.03.15.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 15:05:01 -0800 (PST)
Message-ID: <9335029ffaa0db7dff5bb0b4acea4ff381bf4b54.camel@linuxfoundation.org>
Subject: Re: [OE-core] Automatic cap on BB_NUMBER_THREADS and PARALLEL_MAKE
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>, OE-core
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 03 Dec 2020 23:05:00 +0000
In-Reply-To: <CAAnfSTuCTy4U60iJwtMm=N1PEaWjz6XyL_idgRXJVbzuLHggUw@mail.gmail.com>
References: 
	<CAAnfSTuCTy4U60iJwtMm=N1PEaWjz6XyL_idgRXJVbzuLHggUw@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-12-03 at 17:48 +0000, Ross Burton wrote:
> Hi,
> 
> Currently, BB_NUMBER_THREADS and PARALLEL_MAKE use the number of
> cores
> available unless told otherwise.  This was a good idea six years
> ago[1] but some modern machines are moving to very large core counts.
> 
> For example, 88 core dual Xeons are fairly common. A ThunderX2 has
> 256
> cores (2 sockets, 4 hyperthreads per physical core). The Ampere Altra
> is dual socket 2*80=160 cores.
> 
> At this level of parallelisation the sheer amount of I/O from the
> unpack storm is quite excessive.  As a strawman argument, I propose a
> hard cap to the default BB_NUMBER_THREADS of -- and I'm literally
> making up numbers here -- 32.  Maybe 64.  Comments?

I've had no issues on 88 core systems. I'm not sure there is an
"automatic" value we can guess at here and it is mentioned in
local.conf for the user to customise...

What might make more sense is to have site.conf from a user's homedir
working better, although that does have issues of its own.

I do agree with Alex that having bitbake throttle on system load would
be nicer.

Cheers,

Richard

