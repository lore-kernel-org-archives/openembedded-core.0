Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.23642.1617031608341914386
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Mar 2021 08:26:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u/AeDd37;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so6080692pjg.5
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Mar 2021 08:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lCLhDN5KS2r5QvmMG1jzDHP2dLZfNuFrfciBER+hH3g=;
        b=u/AeDd37BRzE+fHMVe6NSmhWfYG7oc+vh1MIPvR4xdvBCd/XYEZdKMHjRnbN7lBkD8
         wIuG3pOK5Qw0u8AGzlK8CFlFt5Hs51HRVWUTyGVkVNPBm0UJFYc4lR5lDdAEr70qYk9m
         4HWF/mUIfuKdiy1KFOP+mB1YEeh0iDPW4NYnO24nt9hk3xqj+WTH0rgcrKnMJm9kiES8
         MD/ijAgzJW3lMqOvTlWoa8qpU5SU0/HICrtneeDx4L/lDrzRzpKcvLgVeTHewKrxpx2W
         HZXvLmcXITZeJxsH+GtNWf1smglEUwyF2Ujnnl+1oyJm5mDX5OK8XCvFYc8SI/C5y9Yw
         XWVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=lCLhDN5KS2r5QvmMG1jzDHP2dLZfNuFrfciBER+hH3g=;
        b=pNkFkcSKLDfPlga91avzDDZcI0ri8d7GeLQ85rPs65e2Xru5caJuiJJ/1JcoxPvcZi
         zrOxuhdy0UXYlkVeK4dLmHavU+hBY+EiCJdOBy08L31txlkrgIfWf11JV1k02IJZ9ivF
         QCUeIj7mSdbTZfuPuW4PKI7pwtfuytGSkpNr/TaMXroQEc4dKuhT/PCZ2unybx7Z9Shr
         81L/YDa95P1xWFawowPUJ+fbtdL/phWQooZ885+7C2ZpWIja8BjaU3R4gsSWreUhwLdO
         XTyJuSsy2TuhcIUjAIrCVcYU6upgx7W6OkoxtWKsWs9jHI+e0xFIJkJ8qkzotomK7otg
         AsaA==
X-Gm-Message-State: AOAM533/wtu8MZXzppZdz3uKBXMe7zCOb9wLjs5oRN7dax5HlcwohKkt
	2/0k0rzt1F5Wc7CqTw3HbL+90/Xc6OfaUg==
X-Google-Smtp-Source: ABdhPJyotO3Thp49gqS/HJE5p9VczPgBnahzg/yUlYqrrebkE0PwyXuXMrEnTJjuqOvKW3cMmXS6/w==
X-Received: by 2002:a17:902:a404:b029:e6:23d:44ac with SMTP id p4-20020a170902a404b02900e6023d44acmr28637361plq.50.1617031607555;
        Mon, 29 Mar 2021 08:26:47 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:4986:10f4:29b0:2119? ([2601:646:9200:a0f0:4986:10f4:29b0:2119])
        by smtp.gmail.com with ESMTPSA id c12sm18302692pfp.17.2021.03.29.08.26.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Mar 2021 08:26:47 -0700 (PDT)
Subject: Re: [OE-core] [PATCH v2 1/3] meson: fix native/host confusion in gobject-introspection
To: Ross Burton <ross@burtonini.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <20210325173901.3057180-1-ross.burton@arm.com>
 <CANNYZj_mMCVjamiimbWki=r4GFAOXkRPjH6xm3rcSbYkmpewWw@mail.gmail.com>
 <CAAnfSTvXHyX_MvHbtpcUso92K=DQT1_7hMwAGCDPJ9RMW0zVPg@mail.gmail.com>
 <CAMKF1sqMj-d-Dj-Kq3N5gAJBZtFDzGY=Rcc2J9uKD_gA-i9e8g@mail.gmail.com>
 <CAAnfSTt-wfkc2ZMDZ1hXAqGij5eQAcpvvwtoFNOS9PfMtkuJZA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <28e7cafa-521e-1fec-1f85-1112548c5ae2@gmail.com>
Date: Mon, 29 Mar 2021 08:26:45 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAAnfSTt-wfkc2ZMDZ1hXAqGij5eQAcpvvwtoFNOS9PfMtkuJZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/29/21 2:25 AM, Ross Burton wrote:
> This is the universe telling you that one line native file should have
> been put in oe-core. :)
> 

yeah I dropped it from meta-gnom now

> Ross
> 
> On Fri, 26 Mar 2021 at 18:49, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> I am seeing some failures
>>
>> https://errors.yoctoproject.org/Errors/Details/574541/
>>
>> On Thu, Mar 25, 2021 at 12:08 PM Ross Burton <ross@burtonini.com> wrote:
>>>
>>> On Thu, 25 Mar 2021 at 18:15, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>>>> I don't think I fully understand this. Is g-i in meson projects already broken for a while (there was a bit of refactor in the latest meson version, which I tested, but perhaps not well enough), or is this necessary for the other patches in your set?
>>>
>>> I just sent a mail which sort-of answers this question without seeing it.
>>>
>>> Basically, the change is that Meson now knows that it should call
>>> pkg-config-native for native pkgconfig lookups.  Before, it was using
>>> pkg-config.
>>>
>>> As far as I can tell there is very little code which hits that
>>> codepath, so we didn't notice.  When setting pkgconfig-native
>>> correctly, this broke.
>>>
>>> Ross
>>>
>>> 
>>>
