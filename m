Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web11.1489.1589476736034866240
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 10:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iwjhVh8s;
 spf=pass (domain: gmail.com, ip: 209.85.166.194, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f194.google.com with SMTP id r2so1067886ilo.6
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 10:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wPYO9ByyT5mXdONq5+dMKFXbqRnowpIKL2pa7Flm4qk=;
        b=iwjhVh8sI/CPMvgY3e3u33KEYGBoyLzJCkroENVDNgnT6rC1we9FD0ASji+Upmx1Gj
         rdJT/7Wbl3A+1rxjacORWhXZWDrkNd17oKeKILg55u2jeEQfRMn7n/dOPWkA2kpwvXRD
         Lnoi9RYfjPA7SvNIxsWab8BeDPernFVs9FX7lzMOKhYztAe1jyImBKYIv5lLweeaBzpu
         ai/fKaWFWRfgTGl48t6/OzR5VJfz6dgYaTRKpkRfJ/rtElr6TIcfBB/1fdLezPVAfjMz
         CLHreSP47e8nyaEI7acs8b3Q+P1WgLBkCMZMZ2+OFInH4OB9it0uPiRZRcFtTkipXlWB
         aT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wPYO9ByyT5mXdONq5+dMKFXbqRnowpIKL2pa7Flm4qk=;
        b=h9YgxwxS367+YHnTTF5+AOMZM+Eu2JUinBX95Gdh5jEhHSZRfuwZ7O7O1LXV9ND+f7
         UC5GPfIlm8R5XAjwvd/7i60xcOgwbrKZKVW3aIO+pcU6l8aF9G4BHoQx7OGfJJKnGMNY
         /2WAi3g9gAgE1+YjqOGwbnQ4AvqK88ZVd93r9exFLaN+tQf/jAwsfP0tbd1+CrWYwddy
         rYU9OZWR7yo8M7cCYtr+phDHNsZEEYcSv3v8jdmBSGYPn3XOw1nfrKNWtHx2ODNXXpwc
         T3AezyhqXxLXbv0ASmtbYY+gb+mN8N/q1PUutRtLzrOSK6Q/6hipC5cSpuy/eCxbeuRV
         mZig==
X-Gm-Message-State: AOAM533UvU/j3D+/LFimck/nUFCqrA/OdefeE4vXEaeOb78wW7g59bpK
	O+Na/9cqWWYj0CeBb7R6BFRGe2th1KU=
X-Google-Smtp-Source: ABdhPJw9hT1Z3KHt10H5b6v0YJZHevVSSRESxk32vLGADf4ViBHkNRevn84R9TKGLrOyZ2rraBqgdQ==
X-Received: by 2002:a05:6e02:cc1:: with SMTP id c1mr5853422ilj.260.1589476734981;
        Thu, 14 May 2020 10:18:54 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:c5b6:5bca:e472:ded4? ([2601:646:9200:4e0:c5b6:5bca:e472:ded4])
        by smtp.gmail.com with ESMTPSA id 17sm1349978ill.14.2020.05.14.10.18.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 10:18:54 -0700 (PDT)
Subject: Re: [OE-core] [PATCH V3 3/3] gcc10: Revert using __getauxval in libgcc
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-core@lists.openembedded.org
References: <20200511182812.441561-1-raj.khem@gmail.com>
 <20200511182812.441561-3-raj.khem@gmail.com>
 <20200514152934.GC21399@localhost>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <7111a5b8-12b5-d683-eb39-6661223697ad@gmail.com>
Date: Thu, 14 May 2020 10:18:53 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200514152934.GC21399@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/14/20 8:29 AM, Adrian Bunk wrote:
> Disabling -moutline-atomics would also workaround this issue.
> 

I think this is a good suggestion and I do not like to revert gcc 
patches if we can avoid doing that. I will propose a fix to disable 
outline-atomics for valgrind on aarch64

> And I think it would be the right thing to do for Yocto in any case.
> 
> -moutline-atomics makes sense for binary distributions that want to
> offer both high performance for heavily threaded code on >= ARMv8.1
> and support ARMv8.0 in the same binaries.
> 
> I do not see usecases for this in Yocto that would justify
> the small performance penalty from -moutline-atomics.
> 
> cu
> Adrian
> 
