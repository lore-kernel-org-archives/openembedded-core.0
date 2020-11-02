Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web08.29100.1604312938139245788
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Nov 2020 02:28:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hwP32C3v;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id a9so13898985wrg.12
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Nov 2020 02:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=u53dceV2Txdu+Us9GqaAImb3eYJ8HvKSHHeCxafhigQ=;
        b=hwP32C3v+NpoOAMBID3WAtrFh9oPbtxZ9xjxRhMBZom1BFk4lqAfE76118LhZOpkZz
         P7y0OeBnDKUr/jT8fDf+8ZbFKEt9o4OSr5+gGaXaIszfIcMtO/HVWOL7P2PJjqa6DmtH
         zNNJVKqPi8ERA7zwQTZU/5m/IUPkv7pZ4OvcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=u53dceV2Txdu+Us9GqaAImb3eYJ8HvKSHHeCxafhigQ=;
        b=U9AcTf0ESoc7u9+1189TtHJmw8RhFdbaVqPFBH+QhLsEqw5W7yHWbuHX8HowTXlyx9
         PRxne+K87BaYYUJDlO3NIU+GIRSm6oqCWwCCyJsmQuqnucyoUMwXwI7tht9CwPo5QNwX
         d5Hik9jFeW4+i4RCFmemsYQKaeVQQ+YIL8rz8uepb5W9wxp3/8SYcSqtWbU5YXwiZhX2
         Vb5nz+kDv7nrkUGlE4sSp4hWkykjRRBGG09bTZQy5N4CEUqO3G3v5kMbTFtG8MGVbGJY
         JoIgn6y8i8kFfgReyG3yTPEBKWBqnI3lMfCHyV6D0MzQx2nI+hPKt6tqYqQi5f2e/Xjg
         VWIA==
X-Gm-Message-State: AOAM5321A+LsJPT4CXFTWlVtq4QAiAIdC9SMJZezufOPFfetOJf6/la8
	XHmWuCwBUCyVwjmah9ZxWL0ceg==
X-Google-Smtp-Source: ABdhPJydsN3U4TMTM63tks4y1Wp4KngideawcQAgd27v53KoY2VhyK+eU8uyt4ny67iEVOo4f9SbpA==
X-Received: by 2002:adf:e610:: with SMTP id p16mr12750840wrm.302.1604312936540;
        Mon, 02 Nov 2020 02:28:56 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.3.f.c.c.4.3.5.e.4.0.8.b.a.1.1.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:11ab:804e:534c:cf3d])
        by smtp.gmail.com with ESMTPSA id z6sm14228285wmi.1.2020.11.02.02.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 02:28:55 -0800 (PST)
Message-ID: <f6eefc135edfb68788e1151d71035ef085fcfd6f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/2] Example of how prebuilt binaries and locked sstate could work
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mikko.Rapeli@bmw.de
Cc: openembedded-core@lists.openembedded.org, nicolas.dechesne@linaro.org, 
	vkraleti@codeaurora.org
Date: Mon, 02 Nov 2020 10:28:53 +0000
In-Reply-To: <20201102090100.GS1246345@korppu>
References: <20201101125302.350160-1-richard.purdie@linuxfoundation.org>
	 <20201102090100.GS1246345@korppu>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-11-02 at 09:01 +0000, Mikko.Rapeli@bmw.de wrote:
> Hi,
> 
> On Sun, Nov 01, 2020 at 12:53:00PM +0000, Richard Purdie wrote:
> > At the Yocto Project Summit, there was some talk about how prebuilt
> > binaries could
> > be better supported. There was some discussion about how "locked
> > sstate" could 
> > actually handle this quite neatly. I thought I'd have a look at
> > that and came up 
> > with a few patches to illustrate what I was talking about.
> 
> Interesting, thanks for bringing this up also on mailing list!
> 
> How could one implement a variant where source recipe vs. pre-
> compiled
> binary build would be chosen based on access rights to a git tree in
> SRC_URI?

That gets hard since it would have to determine that at parse time. If
you have to check that for each repository, its going to slow things
down quite a bit. It would end up needing to be written into
immediately expanded python which set a variable to switch between the
include files.

Definitely possible, particularly if you write out some kind of cache
but its not going to be particularly neat.

Cheers,

Richard



