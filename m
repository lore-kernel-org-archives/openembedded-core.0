Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.11013.1630439431849288078
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 Aug 2021 12:50:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=iVnLQLyB;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id i6so932244wrv.2
        for <openembedded-core@lists.openembedded.org>; Tue, 31 Aug 2021 12:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=PtPk7L2hoC3UBHhbrOY0yl7mw9c2JjrNYnk44+HsdUg=;
        b=iVnLQLyBpVE9UKHdM9pudr5KSFRVuHm/Nz0SEbvyqwXTfjG0OVCBJFmXmaR0f6GJPU
         zjuWJLB2Yk/8QBS4DSkFREBq9zvrR2nyQjEAFgnZcmkiFQp5eFTXT9fQoCJ0IfBIjYPQ
         ggVMy5WeDub+WM8cclj1dH1cb/yqFQU1Oj/tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=PtPk7L2hoC3UBHhbrOY0yl7mw9c2JjrNYnk44+HsdUg=;
        b=OpUJvQZjR33KLjc5gmS2Us6O6ylBaT247ySr57ewVsYjqo3DoBfSxqDlA/IiyrdOrh
         6M7mjapNcZSSoBHFb2oNMLDcxS0RcKlFvYeRVKFch/z2jvLdeM316D6CBViG5iEJki20
         SVKMbX8jd1FU9jeee5mxB1LAySgSZMShHrzv/Ecfz0ZCF0GTNCQM0iBGXSuy/s7rLzfb
         SF+YYUP9rD9H1ObkfAb1aeKFv4yUFKu+Njknt3EiqElNGJC+zHAxLy9kWkaLF0/q9D7k
         dop8aSKfmsz0YRL4Nrg79/JEz0P8rc6B2VIb4gUDhCQxEBpXbRP0Ldtki7hmzls+GIdN
         gKAw==
X-Gm-Message-State: AOAM533a6gREkhqHVxNj4Sr7JX1kK5LfwoCSBsu8j8+N9ldUDYpjuho7
	gtqrMFTmhD7Vnqn52N2oMxY9cw==
X-Google-Smtp-Source: ABdhPJyoQyMJiu5a56cgT4PdWzfmEd4MmlQiRX2LKhSiny0eNQdGXMYyiaBFEjVQk44VV4Bz59q1Kg==
X-Received: by 2002:adf:e604:: with SMTP id p4mr33767640wrm.37.1630439430300;
        Tue, 31 Aug 2021 12:50:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7e06:66c6:32e7:e304? ([2001:8b0:aba:5f3c:7e06:66c6:32e7:e304])
        by smtp.gmail.com with ESMTPSA id e9sm16659830wrd.69.2021.08.31.12.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 12:50:30 -0700 (PDT)
Message-ID: <67fc67578a54659ae1a8abccdb73dc3597ec6642.camel@linuxfoundation.org>
Subject: Re: [OE-core] Upgrade uninative to fix multiple native build failures in old unprivileged docker
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Robert Berger <oecore.mailinglist@gmail.com>, hongxu
	 <hongxu.jia@windriver.com>, openembedded-core@lists.openembedded.org, 
	raj.khem@gmail.com, Michael Halstead <mhalstead@linuxfoundation.org>
Date: Tue, 31 Aug 2021 20:50:28 +0100
In-Reply-To: <5dee0c30-b658-b730-44ee-a9c2159d21e7@gmail.com>
References: <169FF34664D4ACC1.22970@lists.openembedded.org>
	 <169FF42BF9440142.22970@lists.openembedded.org>
	 <f1f1ee17-1f81-8791-b87e-3692a0cafe2a@windriver.com>
	 <5dee0c30-b658-b730-44ee-a9c2159d21e7@gmail.com>
User-Agent: Evolution 3.40.2-1build1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-08-31 at 20:58 +0300, Robert Berger wrote:
> Hi,
> 
> I just experienced this problem in Docker version 19.03.13, build 4484c46d9d
> 
>  > $ bitbake pkgconfig-native
>  > | configure: error: I can't find the libraries for the thread
>  > implementation
>  > ...
> 
> Can you please tell me what patches I need to apply to get this to work?
> 
> How will this be handled upstream?
> 
> I guess people would want to run a build in an unprivileged container.

You could also revert the last uninative upgrade and use an older glibc
uninative for now.

We'll get a fix merged soon and a new uninative built which can work around the
issue.

Cheers,

Richard

