Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web08.4877.1616325589066240482
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 04:19:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HyOI5O1u;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id f22-20020a7bc8d60000b029010c024a1407so9754226wml.2
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Mar 2021 04:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=XRtSH8B5D4/nnHUkA6nqY7mXuc/1fILL6X4BwvbF4zQ=;
        b=HyOI5O1u0DYXtIwRy8ZZd+KUiOAKkCMiPFiHY5HrpdZAFkLZEh3HsFAoV7lVSsFjc2
         +Sz7dWRcIyRbXu1zUWL28t7VW9yV5HKZPSLOGeNPZVX9TSPkt56CHejI+Vb1cnAZ8sEb
         FpBdax5rSejccWm4BD1C5/Z8k1J6bmttC1iho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=XRtSH8B5D4/nnHUkA6nqY7mXuc/1fILL6X4BwvbF4zQ=;
        b=MGxlWQIYHl0T/S1DfZ+5k4JzsoaQ0AXQzj3JRrc5efj4/0nh26DZKp3qp9JD4Xyttw
         mt9EX1COs0hfylhbQwzIZduE+NA6jaojIm3vI6VDXzUh0cYY98EPIdgYzyUkbgXNnc3R
         zal9d9uQ8QZ9vED/6h9AD6lGDk4W0iX7pcHMaytCWSkHLdvBnYrV6i2gnNiay7+4xE4b
         /OBz61gvjwZFmxNjrZmefwo3dqDUejdekXOlrcxKevxGA75JHryBjimdlp5P2tizezPY
         OsWNKUtSU0Vm+8Xnt3qkU/Y2gOt0pcusvNk2YrZfWt+sOmgFBg/YLHEIkEhPhi5MbQbV
         gddw==
X-Gm-Message-State: AOAM53189tlxf8wO76uqJbn2ZNj7zJ6jJPDCo8hZIuL0mf9aNhxkOfbA
	AWzJHQU7Cu/SwyORPvshYtMhtB2p6bhDkA==
X-Google-Smtp-Source: ABdhPJx+36K7W9A/rF50Ljfi9szy5d/e0VZbm9e6rr1Ysmcve1f1eJgCyeOmC1TynC8vjwWCCkKsBg==
X-Received: by 2002:a7b:c0d1:: with SMTP id s17mr11350473wmh.153.1616325587396;
        Sun, 21 Mar 2021 04:19:47 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e174:7e34:4115:aacb? ([2001:8b0:aba:5f3c:e174:7e34:4115:aacb])
        by smtp.gmail.com with ESMTPSA id q15sm16020823wrx.56.2021.03.21.04.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 04:19:47 -0700 (PDT)
Message-ID: <cb631b57a2b601603add54e3c46ecbdbfa88d894.camel@linuxfoundation.org>
Subject: Re: [OE-core] is 'T_task-clean = "${LOG_DIR}/cleanlogs/${PN}"' still relevant?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Sun, 21 Mar 2021 11:19:43 +0000
In-Reply-To: <52b8d29-a375-ab1-911-6b341d7ca2f@crashcourse.ca>
References: <52b8d29-a375-ab1-911-6b341d7ca2f@crashcourse.ca>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2021-03-21 at 05:37 -0400, Robert P. J. Day wrote:
>   perusing some of the content in meta/classes/utility-tasks.bbclass,
> and i see the snippet:
> 
>   T_task-clean = "${LOG_DIR}/cleanlogs/${PN}"
> 
> which takes one all the way back to 2012:
> 
>   commit eef9d6c2d52f5264a6e7a9d882f8323f9793fd7f
>   Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>   Date:   Fri Aug 17 14:19:22 2012 +0100
> 
>     utility-tasks: Set T to alternate location during do_clean
> 
>     There is a race where do_clean tries to clean WORKDIR but there are logfiles
>     written into ${T} by bitbake and this can lead to exceptions due to open files.
> 
>     The easiest solution is to redirect T to a different location for the do_clean
>     task, hence avoiding the errors and also allowing the logfiles to be visible
>     somewhere. ${LOG_DIR} seems an appropriate place for this.
> 
> does that race condition still exist?

Yes.

Cheers,

Richard

