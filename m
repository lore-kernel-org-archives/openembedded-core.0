Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.7981.1586004576231167152
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2020 05:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PiqJOAsO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id z14so4163635wmf.0
        for <openembedded-core@lists.openembedded.org>; Sat, 04 Apr 2020 05:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=SyOSushcy41BFsZH+1WQkqrxh4D+8bLNvLhy2c3nvJw=;
        b=PiqJOAsOVwQbE06Y9kjnbRSofJ9of01FCB9BRXiu+jcSQXaw/IyM+wdVupWOJECqEi
         1qkju0cc3J9gkcJNNR8B6qUeCTR4Q5fpHtwCLmyl4+tBQOa+/xxkiSrPPiaVru8NM6oX
         eLfI43hjiV2ERlZlqV3Qt6SkzVC0PTK9B/li8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=SyOSushcy41BFsZH+1WQkqrxh4D+8bLNvLhy2c3nvJw=;
        b=kB3lmoVo0GXQaxnYaRHfzh2+RiTPncTL+2y80nwP7hFEeGi2PLQUP9EfBeMgnKa4lI
         mkahgvjoS7kXVzpJJSR0sxOHbYzjjqAgb6tm+byhS0eJuFLoDt2Urb0AHmaMrg++/PRE
         rc4gOpNaQL3Vt1zReiX6qTigODi0VKB6LyL4EwE5rvSBZ8Y8UBAnaYOcvxLCaHqFm23q
         8qdjHp7+MCZTR79CjVXKH82E83n/xW15JL8exzlyL4/yiebmMdKO1Vp8tTpiVMh1bvWW
         rEldjrNZiGkiyAkmYBdDGrohWUYdBsVtPQnntCRsXrTGQ0MweXgJmgG76BfHHs18SE33
         IbVA==
X-Gm-Message-State: AGi0PuafTQ9A4yqfqEJOgPs7UBbsOz7mYdywn6iyOf85yA82xGoNogwE
	BVdXAYkAUM9WSk65IIZz+7Fz0A==
X-Google-Smtp-Source: APiQypKZ6DN1BFFYDQoBD6NDW2ZHWXbU68je9DYgcdBCvWZKpY5lDj33vNZuJnBFku4UoYT7EwPXxA==
X-Received: by 2002:a1c:9c15:: with SMTP id f21mr13283921wme.18.1586004574763;
        Sat, 04 Apr 2020 05:49:34 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id r9sm16378966wma.47.2020.04.04.05.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 05:49:34 -0700 (PDT)
Message-ID: <e67a1e376aacd73587ebc4f6c938b732e87a3fd8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bin_package.bbclass: emphasize setting of S with "subdir"
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 04 Apr 2020 13:49:32 +0100
In-Reply-To: <alpine.LFD.2.21.2004040758090.11753@localhost.localdomain>
References: <alpine.LFD.2.21.2004040758090.11753@localhost.localdomain>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-04-04 at 08:00 -0400, rpjday@crashcourse.ca wrote:
> Clarify the setting of "S" so there is absolutely no confusion.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 
> ---
> 
> diff --git a/meta/classes/bin_package.bbclass b/meta/classes/bin_package.bbclass
> index cbc9b1fa13..4e74557967 100644
> --- a/meta/classes/bin_package.bbclass
> +++ b/meta/classes/bin_package.bbclass
> @@ -14,8 +14,8 @@
>  #
>  # SRC_URI = "http://foo.com/foo-1.0-r1.i586.rpm;subdir=foo-1.0"
>  #
> -# Then the files would be unpacked to ${WORKDIR}/foo-1.0, otherwise
> -# they would be in ${WORKDIR}.
> +# Then the files would be unpacked to S=${WORKDIR}/foo-1.0, otherwise
> +# they would be in S=${WORKDIR}.
>  #

I strongly disagree actually. Setting subdir in SRC_URI does not change
the value of S. What happens is what the comment says, its unpacked to
${WORKDIR}/foo-1.0, or ${WORKDIR}. The value of S remains at whatever
its set to.

Cheers,

Richard

