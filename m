Received: from mail-io1-f68.google.com (mail-io1-f68.google.com [209.85.166.68])
 by mx.groups.io with SMTP id smtpd.web12.267.1589480557436888879
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 11:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WiTkJ6RN;
 spf=pass (domain: gmail.com, ip: 209.85.166.68, mailfrom: raj.khem@gmail.com)
Received: by mail-io1-f68.google.com with SMTP id o5so2285671iow.8
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 11:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SSc6SnEFsHnCojDq4x1h06uKKRReXG324s6IRcIvVTs=;
        b=WiTkJ6RN0GOCIHD8iqXh5vP28ohSEuYHf1ZH2STL0snAoOmTsHQs+aM6Akvx+1mOdf
         q+XbwLdOXCYSM/L2qXjEJuroBf+JMCuF9woVgVYq80ZympDx31NkoEGL1+1XIDJTMTcw
         seIAzdBGBntVwgH332hpzS9klsEUyuyDTpo5JskMAK5QXKtRqRfvTTMzVHOysc5jK0nY
         gk4/IwQY109KTO31pGiYVf5Nknm58qwfeF4ETFFRLddW8Ms4qZdgKPFCasbnJGmj6B+U
         nY8lOoHPaP6w1WMOZFHi0jdP/q3tf+hBPk9jnOGwZGCB9E092JGl9X+U58XhIIMXt8Zr
         ackQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SSc6SnEFsHnCojDq4x1h06uKKRReXG324s6IRcIvVTs=;
        b=NTlQs9FIiMwQg97x/BWQ3wOzI9kcoFbuVPa3eCWSXaton1WCK4zMrhpzZmWPlhICLS
         5WYGTjxECguknQ9Jj0ZiN/7TwFYCSdgccW6Opms3VBO31/CjYVtzMbIVmvl05l0WQbIC
         zgc9lss9sJ0O/2BNSdTDT8Fot9MekG/RUoqxwZ7zu7V3KeDQqQLEa0sMr/vyMOJGeqwf
         HMvBtdLi1L+w61aAywFhP/k3z80BBvsTrzwNLtdRUzkoUypOAOgNMRMhWPM5c7rgFGqG
         YMRwVbLhQ10pxXOxgkQOC9xi+wWjfiOYMbO5g11uhQkq8T8fPa8umWfsx4hOD9HrKcVn
         FWDQ==
X-Gm-Message-State: AOAM530gZvXxwVtievb8J0RzDvRYOen+wqM+0BKqT1w3/2uEnvdM1Vjw
	q67TEXZrjELldxwW6V/8YQhGLoXuec4=
X-Google-Smtp-Source: ABdhPJwLYKznNf2rI2PIo89pF9JuIT4hAKHhLxHEXwMW1zwZNFV0O+GVquk3BsIC5cxtguY5QTIkEg==
X-Received: by 2002:a6b:3805:: with SMTP id f5mr5454649ioa.156.1589480556452;
        Thu, 14 May 2020 11:22:36 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:c5b6:5bca:e472:ded4? ([2601:646:9200:4e0:c5b6:5bca:e472:ded4])
        by smtp.gmail.com with ESMTPSA id m14sm1403530ilq.68.2020.05.14.11.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 11:22:35 -0700 (PDT)
Subject: Re: [OE-core] [PATCH V3 3/3] gcc10: Revert using __getauxval in libgcc
To: Adrian Bunk <bunk@stusta.de>
Cc: openembedded-core@lists.openembedded.org
References: <20200511182812.441561-1-raj.khem@gmail.com>
 <20200511182812.441561-3-raj.khem@gmail.com>
 <20200514152934.GC21399@localhost>
 <7111a5b8-12b5-d683-eb39-6661223697ad@gmail.com>
 <20200514181917.GA28774@localhost>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <5f87e63e-d827-c615-44b7-0071b1e80694@gmail.com>
Date: Thu, 14 May 2020 11:22:33 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200514181917.GA28774@localhost>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 5/14/20 11:19 AM, Adrian Bunk wrote:
> On Thu, May 14, 2020 at 10:18:53AM -0700, Khem Raj wrote:
>> On 5/14/20 8:29 AM, Adrian Bunk wrote:
>>> Disabling -moutline-atomics would also workaround this issue.
>>
>> I think this is a good suggestion and I do not like to revert gcc patches if
>> we can avoid doing that. I will propose a fix to disable outline-atomics for
>> valgrind on aarch64
>> ...
> 
> Not just for valgrind, globally.
> 

so far just doing for valgrind is enough. I am not averse to enabling it 
globally but perhaps we need to do some pre-work to decide that, maybe 
some benchmark numbers.

> The main effect in Yocto distributions is (slightly) slower and larger code.
> 
> cu
> Adrian
> 
