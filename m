Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web09.9864.1623253650743843403
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jun 2021 08:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nEA668Rp;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: jacob.kroon@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id g20so39223203ejt.0;
        Wed, 09 Jun 2021 08:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=i7NoHao+5OEjeB5QIdqEPtweUSlCXxkxAAypQ4KSSBo=;
        b=nEA668RpLFT5wLOGD5K+AjQ7wOcKdiqOYrDvHv+5Xxws7M+IcSbu3j8aYKFM+uZ8iY
         cBdQKXa7elxi/X9DnYHik5X9GrWNOiO9ouKW9eGpj7eGds6kH9DbM+b5dRv9yiFFddSx
         XBEr71TtA+F4zu3tXzRtLPzccGrPiyp8JkKvw8SGNWOl/iW9bRQ7is9uhB+W8opl1bBu
         mI8xXcnve+utrz6tFtgrAybJ2Tg7ag2dpihyiiD3mzHOKKzYFr9ZK3N1AFkzDa28adX4
         n8bPZgBgea3lXX9UmSQRvla/fglH7fb/oA7Snz5j32lCKRtb+5NRuposjJyfsQnJMP8t
         3DIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=i7NoHao+5OEjeB5QIdqEPtweUSlCXxkxAAypQ4KSSBo=;
        b=ELtiI0Z5adhVvYKVdBOp2/PX6kOgDGojALHH0OFVOkveAsXNVDqOijUeI46KYiTPCb
         kRBTNHYN2W2LaCXfrnCtPHFcUGvOl+CzJ0LXnm2HsaqpRYcTs+/knprJmZF4a9mGuCj2
         z8XF/+U/yz2m1Sv9ALrAp/eLgKV/nhdXm0njCu3yWJnqdOiKwowfkbCk2S4GObvaWCbO
         z2OFpyrAmaBpITUbImVhrnlW9W25YrOO3cWoS0EuNS+fcr2dTF1oAQgXtXuT3QFMY79d
         vo5oEPZAtbg6J3ZhVpt1MybwPOb7UX5vOaHpvXXgVY0+i+Rr111aA6E1wqsyfyx4SGO+
         BIRA==
X-Gm-Message-State: AOAM532rNXCRvP4BHsPxkJM96W58IPOjc7ilLbKM5HxmQHxaYlTpSjz+
	dKHMZcwVcoWjjEm9XFtPwcr1DBU+G0AFVlpJ
X-Google-Smtp-Source: ABdhPJyYEx+P7sVOij5679sYyXculRRDEbQ5JZ66jegV9KXdoXSsUvUFeXfuGeV/ev/XZFg1FLfOXQ==
X-Received: by 2002:a17:906:228b:: with SMTP id p11mr494159eja.169.1623253649050;
        Wed, 09 Jun 2021 08:47:29 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from [192.168.10.102] (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id c7sm53886ejs.26.2021.06.09.08.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 08:47:28 -0700 (PDT)
Subject: Re: [oe] Fedora 34, shadow-native/icedtea7-native, umask problems ?
To: openembedded-core@lists.openembedded.org,
 openembedded-devel@lists.openembedded.org
References: <1684B03940C4F27A.14073@lists.openembedded.org>
 <1684CF463EAE073F.7311@lists.openembedded.org>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <56978a91-0c98-1294-007b-e0e0fda7caae@gmail.com>
Date: Wed, 9 Jun 2021 17:47:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1684CF463EAE073F.7311@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 6/2/21 6:01 PM, Jacob Kroon via lists.openembedded.org wrote:
> On 6/2/21 8:32 AM, Jacob Kroon via lists.openembedded.org wrote:
>> Hi,
>>
>> I'm using Fedora 34 and OE-Core/Bitbake/layers from git master as of 
>> today, with reproducible builds. Sometimes when rebuilding my image I 
>> see sudden changes in file permissions (jumping back and forth) in the 
>> buildhistory output for two native recipes:
>>
>> shadow-native: (OE-Core)
>>> -drwxr-xr-x -          -                  40 ./var/spool/mail
>>> +drwxrwxr-x -          -                  40 ./var/spool/mail
>>
> 
> I can reproduce it reliably with these commands:
> 
> After I do:
> # bitbake -c cleansstate shadow-native && bitbake shadow-native
> I get:
> drwxrwxr-x - - 40 ./var/spool/mail
> 
> After I do:
> # bitbake -c clean shadow-native && bitbake shadow-native
> I get:
> drwxr-xr-x - - 40 ./var/spool/mail
> 
> shadow.inc does:
> 
> <snip>
> do_install_append() {
>          ...
>          install -m 0775 -d ${D}${localstatedir}/spool/mail
> </snip>
> 
> So it looks to me like those permissions are either not recorded in the 
> sstate cache, or they are not restored when extracting the cache.
> 

I see this issue in master and hardknot builds, but not in dunfell builds.
/Jacob
