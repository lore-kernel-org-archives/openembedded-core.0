Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.1589.1585936019161109344
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2020 10:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SUnUgYnL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id e9so8638641wme.4
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2020 10:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Xc0QWB0MfcXqJ3EF8g77IWWEabwsC2C5HLw2v8EHd6g=;
        b=SUnUgYnLksMrRTv4Daljw77qJNy/Znk+6rwx1AOd1FMMJ4G2G+jqwe0pe3JHT7Ll/g
         /G7WFuLLVPXgw/xSptgJBIoLw+E+rFsWpkKQN7AZw75z9xFbhO8Y2iWyzIHpcddzDE38
         iHd58bcL5J4yIPhgJC92v8XQHzLS5NSXSRWkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Xc0QWB0MfcXqJ3EF8g77IWWEabwsC2C5HLw2v8EHd6g=;
        b=QL8lIvCKUxsFQbL6gm/ILztrsOULAePrXMOKApWFNdJseIRXjtUEvJ2N/kxerjNHYc
         54TmwRvFaNReeF+luM87ZWfNMvrPG/E4ksRe3uUtD7hDu4DdU+LEYX/vDjDC406J0cGf
         X66N/llLhK/AYytFdHg/h83SUGYfRfFPnCknq1SIUt9Pi/56z97Nt1Pg+e3pS3NUXMxQ
         PyhLbcavMSKDzYnzM/9US7NrO9PuC8H6vixkKPiHWg8jwnooVKUps7DsHikGDF2UToDo
         TydnpX8xEO7EUKSrXs52BHJIrD3G6D3Gi8yybwEXvCJW6Ko51x5hP+SmN7CN/UYQYvRV
         T+Ow==
X-Gm-Message-State: AGi0PuaWWf3JBL5ZWqzohczyu52tex4xZQ9gyUGoP/JQ+oTy8YyG2/b0
	dXVPmwMv0KcBjNYhpRNRdOyLBA==
X-Google-Smtp-Source: APiQypJV1Coo1r1Jz6KqQxUOPALGcgUPKSp2ny7xvLtQ6hrK6sxXzSgeUac++VBuT9j7XEZ3M8ky+w==
X-Received: by 2002:a05:600c:2294:: with SMTP id 20mr9571892wmf.130.1585936016826;
        Fri, 03 Apr 2020 10:46:56 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id e23sm1731957wra.43.2020.04.03.10.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 10:46:56 -0700 (PDT)
Message-ID: <9eed52a88b813418984822caaa6417d009417cb9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] icu: Add knobs to generate a subset of ICU data
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Wouter Meek
	 <w.meek@metrological.com>
Date: Fri, 03 Apr 2020 18:46:55 +0100
In-Reply-To: <CAMKF1srEjB5cg57jWM2dVfESrf17M2diBB_5P4Ws3bgZgmhgig@mail.gmail.com>
References: <20200403015350.1002891-1-raj.khem@gmail.com>
	 <dee2e56432928c971eb0f1512f5945d6af846b89.camel@linuxfoundation.org>
	 <CAMKF1srEjB5cg57jWM2dVfESrf17M2diBB_5P4Ws3bgZgmhgig@mail.gmail.com>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-04-03 at 08:55 -0700, Khem Raj wrote:
> On Fri, Apr 3, 2020 at 8:26 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2020-04-02 at 18:53 -0700, Khem Raj wrote:
> > > Recent versions of ICU (64+) provides a tool for configuring ICU
> > > locale data file with finer granularity [1]
> > > 
> > > Default generated size for libicudata.so.66.1 is ~27M, which is
> > > quite
> > > large for embedded systems and all of them may not even need all
> > > locale
> > > data.
> > > 
> > > This patch calls the icudata buildtool during configure on the
> > > icudata
> > > and utilizes a filter called 'filter.json` ( empty by default) to
> > > create the data, default behavior should remain same but someone
> > > can
> > > add a filter.json in own layer to configure this data, e.g.
> > 
> > Nice idea, fails on ppc:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/411
> > 
> 
> yeah looking into it. Are there any other arch failures ?

mips:
https://autobuilder.yoctoproject.org/typhoon/#/builders/60/builds/1749
mips64:
https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/1753
edgerouter:
https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/414

Cheers,

Richard

