Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.14712.1613595098142414284
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 12:51:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=S8575BPy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id t15so18753159wrx.13
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 12:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=SWpJ1Gf5LJqDlMCPsAzu+39ZAkHmIURjBTZx70EIA44=;
        b=S8575BPyTjCqLcjPHyI4RAf/3EurACJvE9BYk5d2jBsma6NEfiJpJbbcJIMytFdcVJ
         7PO9ziXqyMaLr0IxOmgTy2hr3W0khXlYrtDf6AY/lI3CJ9m1T+ZON9OO4B1wEY9weXq7
         +0C7lzNeFjebUO5+68ao/YMOjiS4Z2nJqASVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=SWpJ1Gf5LJqDlMCPsAzu+39ZAkHmIURjBTZx70EIA44=;
        b=FUnmENkuOu7ij6c/V+jqO/G0RTzP6Ehkm0JwfDGUhXFnAq4LuXVLpJq2fvHrkqOkfc
         hmd9qeXi1mShNf0wfNNhduwEhSFCsnZ4j3Zt8aeoP02E2N2Hkfh3gQgNudZlxctQAkgL
         UlHAg7cbgGCmJK20Ri8o12I31ZNpvz0tx/YSIY1HhyZWGBvIf78SdN2PguJAWw6U66VG
         vJyWWClbtG4GFF9iZDIEcQyuC6eFWfZNTUTylzA+CSTYgE59hCmi+2Jm3BIVg0KiJIpy
         Zgo1tsxzb27KFRkPgaxJmQg4LMIiqGYyKayKvL85luM4cY1mSQf0y194SqcC6XOdWMrA
         Ps1g==
X-Gm-Message-State: AOAM532MZmOy7B31vENTtlynCdO+p+T9Rp21zOQQMZmzOP1ilqChxf9H
	GRhAzfCgHNn1ngRZQ7582C0wxA==
X-Google-Smtp-Source: ABdhPJxdvHKoXgOoqqItBT0wE2YOdCcOdzzVzVich0usWmvLxh1iUDEPkvBKoSGygKt+svDmqabgzA==
X-Received: by 2002:a5d:4902:: with SMTP id x2mr955849wrq.207.1613595096495;
        Wed, 17 Feb 2021 12:51:36 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:7504:d16b:192:2652? ([2001:8b0:aba:5f3c:7504:d16b:192:2652])
        by smtp.gmail.com with ESMTPSA id c18sm13965441wmk.0.2021.02.17.12.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 12:51:36 -0800 (PST)
Message-ID: <a04c7bcd2ac63ea7a9971f011c4755f741deaaed.camel@linuxfoundation.org>
Subject: Re: [OE-core] [poky-contrib][RFC PATCH 4/5] license.bbclass: Add functions to split and canonicalise license strings
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Ida Delphine <idadelm@gmail.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Feb 2021 20:51:34 +0000
In-Reply-To: <CAN7sTgsoLjsnao0ijuidAP_hjTQyibeU7MWHXybbROTU0k290g@mail.gmail.com>
References: <20210217040033.21541-1-idadelm@gmail.com>
	 <20210217040033.21541-5-idadelm@gmail.com>
	 <2efffee96fae455b8cdb77d47c576bfe@XBOX03.axis.com>
	 <06102c024bfec00745d9b2dbde8b19a7fb4207b8.camel@linuxfoundation.org>
	 <CAN7sTgsoLjsnao0ijuidAP_hjTQyibeU7MWHXybbROTU0k290g@mail.gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-02-17 at 17:55 +0100, Ida Delphine wrote:
> Thanks for the feedback. I will get rid of the logic to take care of 
> those licenses with "or-later" and move the functions to license.py. 
> Does this also mean I shouldn't try removing "WITH-Linux-syscall-note" 
> from the licences?

I think the idea of what you're looking at is to remove "noise" from the 
output and see if we can identify real licence issues. Removing the 
"XXX WITH-Linux-syscall-note" where XXX is removed is key to that but 
XXX must me removed too.

> The point of me doing that was for there to be more matches and the 
> number of warnings reduced.


> Also there is more license-related logic in package.bbclass. Will it 
> be okay if I move it as well to meta/lib/oe/license.py putting it 
> in functions?

Possibly, but please do it in a separate patch which we can evaluate 
on its own merit, I haven't looked at which code you mean so its hard 
to tell offhand.

Cheers,

Richard

