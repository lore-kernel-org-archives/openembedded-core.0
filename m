Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.9513.1624462870648427984
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jun 2021 08:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TafgJqoW;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id y14so2071040pgs.12
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jun 2021 08:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=8QmgyYuTjvp77xePQiHvtHmfwqnqzgpFk3AiE4UkuKs=;
        b=TafgJqoW8fatwBXc9Es7QHGKwTklAwhkkg0vr4RZGf1mMnkQXkTQ44gF9HY0nPDRtW
         dTnKTCaAQUAPE9EZEw91Stw4wvHOsAk/NKX9P94W8Etf5FOTbDhg1LRT/8FlxD0ZzA2f
         Pksey3VAxPEFQZ6b/EgrpmaS6S71/CeCII+Q9xPMlDRNG0eoety43RDP66U7Gt51nDSi
         vfiW544RGP6PxLgFNg3s71ahe5h46bBukbJl3XE5hCMrK71lSxtJo+XFIUc03LlEbdWm
         dJTVO/ILa/U9bmF/Q7kYLvsvfSN83VbjPXTIVzoqqLwmqXApM3RGh1lh5gDh4lpwA8mb
         Nu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8QmgyYuTjvp77xePQiHvtHmfwqnqzgpFk3AiE4UkuKs=;
        b=RsAEdoeTkVQvnZVpfh6ACJ8n7+GArOU3PmI6BdPfT8P+WivdgLpxUyGQ+l6+UJGWsN
         jcpx5JF8Xy1WMSYlqWSkFdzwwyUmPZtewsB6C3ichZlAO62SPRLebbfBspyfoHWj6dsl
         9JkDqTp7+d21z3xknjI3pOPGj0uQHciXAWrRb1yPzrEb1B6VTzAb7ZpgRMJs7krxhyhq
         gpnyGYzZhH0U8yKu07JxprGLOprrI/7TswpkDEaM0e0vcnLFLgvHGTg3gFHS3sx28g7D
         hTF076lAf/Ut6QZw2tx41kvxTaryw5+ADpipBwklnCAKFmidrGUU+dBsZ0VrDgoLt1mw
         ePtA==
X-Gm-Message-State: AOAM532m8cK9Q95TIY1Ss6cYKsklItDiVj1G8jb2aXgYfprc6Gn/8R5w
	vauINVxNNh0wAEL80TsoxHZ8tnmGAMvYFQ==
X-Google-Smtp-Source: ABdhPJxI4BSP5jq0L2CfEHVC+eGiAJWrk2BGeblIYzrtAPfar7N/orEBA4DcOrJzsggs1/mlSgVoeg==
X-Received: by 2002:a65:5c4a:: with SMTP id v10mr134215pgr.142.1624462869743;
        Wed, 23 Jun 2021 08:41:09 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::bfd0? ([2601:646:9200:a0f0::bfd0])
        by smtp.gmail.com with ESMTPSA id r14sm268581pgm.28.2021.06.23.08.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jun 2021 08:41:09 -0700 (PDT)
Subject: Re: [OE-core] should a layer supply its own "local.conf" file?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <b58585ae-7c43-731a-71fa-2832828ead6@crashcourse.ca>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <0b66a272-b15f-1fab-fbdd-f52e3e7460ee@gmail.com>
Date: Wed, 23 Jun 2021 08:41:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b58585ae-7c43-731a-71fa-2832828ead6@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/23/21 3:48 AM, Robert P. J. Day wrote:
> 
>    long story short -- was having trouble figuring out why basic
> settings i was adding to my build directory's conf/local.conf were
> being ignored, and traced it back to the internal layer i was using
> having its own "local.conf" file (in its conf directory, sitting
> quietly next to the layer's "layer.conf" file).
> 
>    argh.
> 
>    i'm assuming that it was *that* local.conf that was being consulted
> by the config process (overriding mine). is there some rationale for
> that? that doesn't strike me as proper design, but i'm willing to be
> educated.

you can check output of bitbake -e <some recipe> and see which 
local.conf is being picked up and also trace the history of it
sometimes it could be included by layer.conf from particular layer etc.
there are multiple ways it can come into mix.

> 
> rday
> 
> 
> 
> 
> 
