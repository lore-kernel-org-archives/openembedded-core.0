Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web09.9088.1614345585665981241
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 05:19:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L1c8bGXb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id b3so8556413wrj.5
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 05:19:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=M/xHeqhZysWs+HVyF739v8a/CI/EsviATV3zyzAVlCE=;
        b=L1c8bGXbJUjODA6nTiLAyLCLY7b44nqZWX3v6fpoPyX3cVzW59NCQvdLvKeMYEHfLL
         OhRf/Eg1SwEAIKxOuccZ0QK41jDIPgYwVH+klTheYKEs6Mgtgly7A88GLx6NM3SfbMUi
         tr28UZQwdo2oQ1Tx8oEMhGslB5NJN1ZxDhY1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=M/xHeqhZysWs+HVyF739v8a/CI/EsviATV3zyzAVlCE=;
        b=n4nZaLOA05qGw6WwcEhmwNV9j2WdZ8ChUXfF/jjXCtlK/Mfn0YO/qRPZXP0R0G9Esf
         ZxsCWZXBaZPbOcdYpcXBnsTd9qOpQVX9YLML1k/7vbCYpTOGncUwWDnbek6s5nrTS5Qb
         Ejv6xQTMAfb0P/HFOmwHXxT9aYlAE7fJYf3NJSqbuo9CJXOOtPUN7pXCf1/2PyvatLSG
         WmXys8IOQ3P+fUE89USx4mbkEYPMSBSC3Oe2C2WEG/GJvN7LG5naVuBBN0hGvcW1MLWI
         CQBYSCRM3LMpsjks78r5WTgRu/D7rY45tDRmW1c+rV1IOs5SbL2pJk8kJwOGJ2UpPjq7
         9Dgg==
X-Gm-Message-State: AOAM532Nf9tLQX6ayxzqFyAIvfMwrE8tXPc0HtCmL4P2K5+UV1nFCKhF
	SA/an22QXepNg1jvWXbIlqBm8Q==
X-Google-Smtp-Source: ABdhPJxeWPj2F/y5klWrUHI9CdSRcThGvItXbLM3xV7G/VTiBLutHkF6eJOWYYgV+LOKDHUN7q+7pA==
X-Received: by 2002:adf:f0cb:: with SMTP id x11mr1849752wro.206.1614345583904;
        Fri, 26 Feb 2021 05:19:43 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f? ([2001:8b0:aba:5f3c:e9fa:5b01:958e:e80f])
        by smtp.gmail.com with ESMTPSA id u4sm4844400wrm.24.2021.02.26.05.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 05:19:43 -0800 (PST)
Message-ID: <53900be46ea10c63824c84f999e98b874a187510.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] ffmpeg: add ptest install for ffmpeg
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: suji.velupillai@broadcom.com
Cc: openembedded-core@lists.openembedded.org, Jonathan Richardson
 <jonathan.richardson@broadcom.com>, Scott Branden
 <scott.branden@broadcom.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Date: Fri, 26 Feb 2021 13:19:40 +0000
In-Reply-To: <CAJHBTCAnhk=5-EbbKeMTNY7w+98Zq+FdL4uG0yjJR7T9rGN99g@mail.gmail.com>
References: <16663BAB94E51B8F.6890@lists.openembedded.org>
	 <CAJHBTCAnhk=5-EbbKeMTNY7w+98Zq+FdL4uG0yjJR7T9rGN99g@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-02-25 at 10:12 -0800, Suji Velupillai via lists.openembedded.org wrote:
> This change got dropped from the master-next branch.
> Did it break any builds? Is there anything I can do to help to get this change accepted?

Sorry, there was a bit of a mixup in the triage process and this
took longer to work through than expected.

Yes, I'm afraid it did fail in testing, there was a reproducibility issue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/118/builds/34/steps/12/logs/stdio

which says that the ffmpeg-ptest package has paths which change
depending upon the directory it was built in.

This is bad, firstly as a reproducibility problem, but secondly as
those paths won't make sense on target so they show something else
is wrong.

I was a little concerned that it appeared you're copying the entire
source into the ptest package too, not sure we need everything?

Cheers,

Richard

