Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.8657.1589881673213616789
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2020 02:47:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MYTdYqv2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id l18so15131150wrn.6
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2020 02:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=jW7Xt4aSVbYRJejJ4hWeAiP2ixrLqGZQkwoNbBpPPoc=;
        b=MYTdYqv2uWZQ7FdzJhywAo8FeaUhY5BnZnzvu0Ql4cN9QHgPS+Pt6tuT1rz+MxUbvl
         sGUf2PwYWTbl6y4tKlKmYG1oeb0B9fsQUmcO+pYLqRbz20eiwCv5ygFdTd0rAs9lmL+n
         B3sMFx7v/0w7PEvu5dL3EScMIsf9vS6YSptCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jW7Xt4aSVbYRJejJ4hWeAiP2ixrLqGZQkwoNbBpPPoc=;
        b=ggyPY/7N6GAevU6Q/e1zzdrVwdGJrD6AKqKvclRb9ryKY5rhBDHTzxP+7BsfhfGF4I
         NeHY61uNVf/AGZuhXEskmnko2nUJnskeWdr0zrb/mQBBzhVadsTt6vaic8dyjz57vhD3
         Mf6MX9z7gAI0dEzGNlUtC+hfxZMRBAapUwKCUozcPHse1GstX0KiJba6aDACK6AI6xOm
         gtw5CQxEs+EpV6CRorYCXAanLq6hU6gIJ0rIPACuNLZWXHiiCL414SBvNkSB/D+jhwf2
         LOlFLcCAJVhNlI44rXj62gbfeBxleZPLdKl0t1/u/O0+GxLUEC0gy1pElWHdyESBVMgk
         hK9w==
X-Gm-Message-State: AOAM531mThbe3C7eWEM1t8uNAJPdLoJN2LPmjDm8upUV7j9IvKSRUv5b
	joHsm3FVui60KdkgLL9gti76Ug==
X-Google-Smtp-Source: ABdhPJyzFs4ITypFP5ANPjBcz3zLrYMfoP4JnvqBXznenYKtCfwU04KBQkOeEfj4Q1Nkgc6GiaTigA==
X-Received: by 2002:a5d:62c2:: with SMTP id o2mr13266024wrv.51.1589881671614;
        Tue, 19 May 2020 02:47:51 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id h74sm21237960wrh.76.2020.05.19.02.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 02:47:50 -0700 (PDT)
Message-ID: <f64f41b06d98bac00dd5501f253cf2fdc37dc2fb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3: add pydoc and urllib to core
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alejandro Hernandez <alhe@linux.microsoft.com>, "Yu, Mingli"
	 <mingli.yu@windriver.com>, openembedded-core@lists.openembedded.org
Date: Tue, 19 May 2020 10:47:49 +0100
In-Reply-To: <c82bf9fd-4ca4-6d7c-a2eb-8c28c5cb5ab6@linux.microsoft.com>
References: <20200518073201.23647-1-mingli.yu@windriver.com>
	 <1610296324895336.31912@lists.openembedded.org>
	 <ae41e89e-8f14-fc87-b4ae-5d9a7763e259@linux.microsoft.com>
	 <73eb24f4-91dd-bc2c-2b32-9a1fec299163@windriver.com>
	 <c82bf9fd-4ca4-6d7c-a2eb-8c28c5cb5ab6@linux.microsoft.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-05-19 at 00:51 -0700, Alejandro Hernandez wrote:
> 
> I still believe python3-core should be left as small as possible, the
> use case
> of an embedded device calling help() is probably seldom, IMO that
> fits more in
> the workflow of installing the netlib and pydoc modules for that
> specific usecase.
> It also looks like simply installing python3-pydoc would do what you
> want, since
> the error to load urllib is coming out of loading pydoc itself and
> the manifest
> does specify the dependency from pydoc to netclient.

I have to agree with Alejandro here, whilst help() not working is not
ideal, we are targetting "embedded" systems where something like this
is not unreasonable for the size gain.

Does anyone have any size information about the implications of this?
I'd guess there could be quite a chain of modules that could end up
installed with this change.

If you don't like the import error, we could just patch it to say
"Sorry, pydoc not installed".

Cheers,

Richard

