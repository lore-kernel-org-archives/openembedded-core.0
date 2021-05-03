Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web08.31397.1620036115437184383
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 03:01:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XsH5OtdO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 82-20020a1c01550000b0290142562ff7c9so3179451wmb.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 03:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=tCjdCIeuKih3Cpq640fjCaBo8jmY4Kw4BxstnfJLYpA=;
        b=XsH5OtdOj7jprQN97uKcX+m23FD+VagxbyY6AImtwBpPeK7EjzR+JLCob2bcryuq36
         xYw4IaQ7OOalQax7FLq0nixlBUhhtZpdvAYQgHG4h7QLlh7v3iZc8iZUP1TiHjHj+oXC
         18UxDYAzDhzAt9bX3k6atBZPtG+RVITh1AsIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=tCjdCIeuKih3Cpq640fjCaBo8jmY4Kw4BxstnfJLYpA=;
        b=fj7UHLvFjBGp/i54yyqQf411xjDv2mw/oi3A723Pk5gfyaNldtcYhfSGsyUEwb2Kq2
         tIjpD+qu7TH1MLheSMBPzrTx/anIn0phkbtG0bkq1LtrLtyboJC+hlUqbeTcAYPlqk61
         xQLVXlhl7/m9YY4S+pNfBR/dlxNGQk3NMM/+g98SsB5ZNG2DFiar9dPV/7h0y+92VvQy
         WU2BiPMSAkSwUnGAcXuIhS7G5tFCSuWRnLcnGx3t4qtOO+HTJBhp+Wnwb/tQTdRvL/9d
         E3pM/xDnMFC9S25ZlCvVMuzpWNAp6mKKQGguHzoWC7aINoUWokCSUmHEDby1Ks330ISp
         0ing==
X-Gm-Message-State: AOAM531IikqqTAwD5HsI6TOoW4crDGMjFzHGujHwYvJkYTQGELYk2r7A
	1QF/vUMA9A+IDO67SK7+86+Yog==
X-Google-Smtp-Source: ABdhPJwDnNmEDHrUzQ994bYyo+E7fX0aO1SGoHlsfzWmfLNeAMIx6mKJpfNbZrnRPR8gZ1OgJPd42Q==
X-Received: by 2002:a1c:e089:: with SMTP id x131mr20378820wmg.102.1620036113692;
        Mon, 03 May 2021 03:01:53 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:2abe:bb29:590f:e028? ([2001:8b0:aba:5f3c:2abe:bb29:590f:e028])
        by smtp.gmail.com with ESMTPSA id h8sm10634147wmq.19.2021.05.03.03.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 03:01:53 -0700 (PDT)
Message-ID: <0f76cf2f943856ab08111ab3825f43da53e5aad2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/3] ptest-runner: libgcc must be installed for pthread_cancel to work
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Mon, 03 May 2021 11:01:39 +0100
In-Reply-To: <CANPvuRkbQSr+J8LcAzzBnzvXD4TQbj8AXgqH9A0=V-D8_HvA4w@mail.gmail.com>
References: <20210502175441.368688-1-quaresma.jose@gmail.com>
	 <a7cd5d19859941f77793559f61cf64fbbc603d53.camel@linuxfoundation.org>
	 <CANPvuRkbQSr+J8LcAzzBnzvXD4TQbj8AXgqH9A0=V-D8_HvA4w@mail.gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-05-03 at 09:47 +0100, Jose Quaresma wrote:
> Hi Richard,
> 
> Gstreamer is on top of the glib and uses it for everything so I have
> doubts that it can call pthread_cancel but I'm not sure.
> On the other side, I can see that ptest-runner calls the pthread_cancel
> http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/tree/utils.c?id=cce0edb4282ee081d043030bfdf29f3e4052f86c#n542
> 
> So I think this is a missing symbol in ptest-runner.

Makes sense, thanks, just wanted to double check. With the tweak Khem 
suggested, it sounds good.

Cheers,

Richard



