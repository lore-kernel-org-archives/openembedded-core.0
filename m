Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.4815.1614159549310134006
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 01:39:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EVNTdk/u;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id w7so1185190wmb.5
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 01:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=lCG4d/yNBv98voU8QRYEgzKjT9mpIVNK+5eIbRvJ64A=;
        b=EVNTdk/u4DE7FK4p3RB5lEqhaNGkC6l7RMvR0XAbW/0KLTr/3z9KXUNnbRzLs5kUlm
         79ouajc1+1Ak0ILzOrzTH3XLhEfDqbSjEiSpCF9yQGvQwRWa3RsodFyKdx9bnvH3zaVb
         RujHvzohzfquN3ofqyzTsYfzF+ERogbHfzFcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=lCG4d/yNBv98voU8QRYEgzKjT9mpIVNK+5eIbRvJ64A=;
        b=Ro5wQdiDPLegqT9fErtkUKzIooiXlQvaYlkx7ZVFYSBXGvxA+F0UbCEBYI6Wqi4g6g
         Qsghb2tcGCanX5YUAClPl3WcHQKCNmoxHEfsGOyo7QMKwCEi72cbqQ1uyjjRgU4839wf
         EOJVXg6lv+I2/9S0LpPa3FaQtzGtu+VLeekXNPUcMoTMfny8HURysrkMzZBOhi5CNEH8
         KW0OdRn9ERJOEp4ilbrYq4vx8vxqCWKNmiHapfxAj4uB1S3pGBxzXT12yS1i0VyPOLzW
         3a7OyyNTREhprs8YtKIM+zDpB5oR6xTjNthBIqIhTuExMbCRLAACBwFgl2QuIETIZKk4
         bH8A==
X-Gm-Message-State: AOAM531xAn/qfaIheZ8VFqUCQGHiXW75xLjE4TH4ttTlTUfhK4WdyRDu
	isYjkCApjPEopb60WXNGYx0SEg==
X-Google-Smtp-Source: ABdhPJy5bE4s0d/IuSYwmsEjOK9T+TDXDCedP8XRhO0tzl0InzOw7gAawYqBbx4EcNNLtApmcyqy/g==
X-Received: by 2002:a1c:5419:: with SMTP id i25mr2956568wmb.166.1614159547489;
        Wed, 24 Feb 2021 01:39:07 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4476:47d0:b128:f21a? ([2001:8b0:aba:5f3c:4476:47d0:b128:f21a])
        by smtp.gmail.com with ESMTPSA id o13sm2767019wro.15.2021.02.24.01.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Feb 2021 01:39:07 -0800 (PST)
Message-ID: <a373f6be54f63987eb9cb0ce994b807fcca01062.camel@linuxfoundation.org>
Subject: Re: [OE-core] Merge meta-rust to oe-core
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2021 09:39:04 +0000
In-Reply-To: <20210224030201.349588-1-Randy.MacLeod@windriver.com>
References: <20210224030201.349588-1-Randy.MacLeod@windriver.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-02-23 at 22:01 -0500, Randy MacLeod wrote:
> Clean-up the merge of meta-rust to oe-core by squashing most of the 
> meta-rust history so we are left with:
> 
>   35da4b252f rust: add a language demo image to test reproducibility
>   088374371b cargo/rust/rustfmt: exclude from world
>   7df10d2a22 meta-rust: merge commits
>   4187796cd6 rust: mv README.md to recipes-devtools/rust/README-rust.md
>   03b9c60ef4 meta-rust: move code to oe-core from meta-rust layer
>   2c62874204 libgit2: pull in updates from meta-oe
>   24cb3db88c libssh2: pull in additional commits from meta-oe
>   e9a0a3bad2 Add libgit2, libssh2 from meta-oe for rust
> 
> The full diffstat is below. (1)
> 
> I didn't really notice the scripts shown below since they are mostly harmless.
> I'll review them and remove them in v2 if they don't make sense for oe-core.

This is better, thanks. My feedback from a quick glance:

a) Need maintainer entries for the new recipes
b) The scripts in scripts/ look at the very least inappropriately named
   for OE-Core, I suspect we don't want/need those.
c) Not entirely sure about the languages demo image, its not how we test
   any other language
d) There aren't any tests in meta/lib/oeqa!
e) The rust README starts "This OpenEmbedded layer provides" and has a few other
   issues.

Cheers,

Richard


