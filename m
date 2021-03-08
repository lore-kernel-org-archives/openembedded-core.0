Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.4136.1615241493092542626
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 14:11:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EfQU6hGp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id a18so13043709wrc.13
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Mar 2021 14:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=bltw8/M1zHlaVgFggXS23L7rHlm5P26+df9G7wn47vo=;
        b=EfQU6hGpdY76M7eP9OvIMlhHnKmDN0Vv1Dqn5jQa5cYNiEeYcP3U//o02pzPanNw0z
         glVRGLu9zDifUBuDkGXYxP6XDnNvMMX9maoKi/9WdEyPj8ZpmppZbkJTpF/W9PExAerU
         B/CMeIHQxmlyo4LOYNiuyl+Oq/GlXYd4z1OLc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bltw8/M1zHlaVgFggXS23L7rHlm5P26+df9G7wn47vo=;
        b=ZlxU+L0QBxDCeIAq0Wg+JI7jtZn0GWjUU5Bj89YOGa13vIrmisf5zeXgVt0+jlv9zf
         +HqVa/JOy6fPzIM4Ah0hdPtkOxVUPuguzMIO7xr05w6VMw5pK6XCpuoqCmsBkgHsXYoY
         ABI4CKL2AIlDCtf5PSH6Fnt+VFn5ZoEp1EAZLSAvNk6HJBKXZdb+hNM9nDV6UO3m3d+b
         xekI/poejAxCOVD3CC0BEbtqZgyBu08SdSJ9Fjjng1EGY7pvTjh5SBNTCBKaLQS6iWps
         s4/k6YGkccjFndOrwO7fFzlOzU16sc2AnPHPB3fU7p4U50m8sSVZJCmY8RzVgxBjbD5+
         2mIQ==
X-Gm-Message-State: AOAM533Ft39UDnClIFs2Qt0BfzuNaXAgmAcwyoHgvzGcx/1hbPjzaZVS
	gOq6Xemk2Yxou9DeoFTps0M+4A==
X-Google-Smtp-Source: ABdhPJw2yhS0RC4DENdPdbb19c9dDtsHXmqk7IAGGE846oHCrrdKMLNzCudnIKVBFUvpo8bDDDOi+g==
X-Received: by 2002:adf:d0c9:: with SMTP id z9mr25913949wrh.396.1615241491517;
        Mon, 08 Mar 2021 14:11:31 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from [192.168.1.6] (dan.rpsys.net. [217.169.23.60])
        by smtp.gmail.com with ESMTPSA id k4sm26043806wrd.9.2021.03.08.14.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 14:11:31 -0800 (PST)
Message-ID: <78d7c30d3d642353fbd52202beb49e1dd74fb7f2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] scripts/oe-timeout-dd-test.sh: add script
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Sakib Sajal <sakib.sajal@windriver.com>, Randy MacLeod
	 <randy.macleod@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 08 Mar 2021 22:10:00 +0000
In-Reply-To: <2b197274-5e89-2648-5881-4f2671a1e6aa@windriver.com>
References: <20210307205817.5679-1-sakib.sajal@windriver.com>
	 <a8d69435-a6cc-4daf-a22a-cb190c04f781@windriver.com>
	 <847ee37ec1bc1545e0a13d11c4eeac6358ef3fa8.camel@linuxfoundation.org>
	 <2b197274-5e89-2648-5881-4f2671a1e6aa@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Sakib,

On Mon, 2021-03-08 at 15:46 -0500, Sakib Sajal wrote:
> Randy and I could directly use autobuilders and make the necessary 
> changes to run the tests/experiments, if you prefer to do it yourself, 
> read on for more details.

I'm happy to have the help. I'm thinking that rather than instrument 
one build or a specific test case, we should add something to 
yocto-autobuilder-helper on a test branch, that way we can run an 
"a-full" or "a-quick" target on the autobuilder under the test and see
if we can get any interesting data.

The autobuilders have a shared output directory we could use to collate
the information, it is exported to the environment as 
OEQA_DEBUGGING_SAVED_OUTPUT in config.json in -helper.

I think we therefore need:

a) poky-contrib branch with this change in
b) yocto-autobuilder-helper branch with the config enabled in config.json
c) a further patch to collect up any interesting data and save it to
OEQA_DEBUGGING_SAVED_OUTPUT as a post build event handler for further
analysis. We may be able to patch the existing results collection script
to do this in helper? Obviously the naming of the files on 
OEQA_DEBUGGING_SAVED_OUTPUT needs to be multi build safe.

Does that sound like a reasonable approach?

Cheers,

Richard




