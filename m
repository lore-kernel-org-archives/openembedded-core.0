Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.12553.1623265486518937374
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jun 2021 12:04:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Fye2rP87;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: uvv.mail@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 131so1253108ljj.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jun 2021 12:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=VPux790VKJ9khPXv/Pvv7ARvZ6xgQX09AFY/i8kXANY=;
        b=Fye2rP87fDQSUngmRQUH6wJNSFCR9lRs1z1JP90dvCJTbFSadvshwQr/DBK4CmCLtM
         KkNh7jF9C0ux5vYUXekKjv2DIqEmDYFVDhh7hSmHcH3UXJsqXFkMTF4bH60PHKWBAEC4
         8S/3ZE9ZhIrYCeJAquSEpbQz+pVFuXFClUFZbkgjuIseTuOnYBydP6/2Raw2YrIiIYtq
         gV4TDI6g5KIfnEUIFxFiI6pOahdQ8GRNFIkggGnw1K/msBIH74p0eY4jgclm6iPLAcIq
         VWkZGqeP1gnmnxg+q+sWYQxpnoRtJmDASroR/IuOeMhE7/Y1U6KzguiFHFUiW7Amrkog
         Jdzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=VPux790VKJ9khPXv/Pvv7ARvZ6xgQX09AFY/i8kXANY=;
        b=Ex6yUdDt/NIboQK4wfDXKrUmlje5nF52GJhi2tZ2Xm09iskT6AqNSKwT7S8McfDtiO
         28Tkj8EweLQQ+6KjWPP9FFUzbpLkWe/fU3ttsbi0sRc3wwyeOh293Gwg3dkilLkC9eaH
         jPqwcp+b7oD3AOQv6XIdnxnI3OoZRgs6izaqUq8Ej+dT9UED0ujVUORrT7nUwig4NYTE
         VvNWNmelOUHaeLdIvfzU26X7rHjfC4wffiehG9nhH/y8yImd4co/+UZDSI6MXTdsHk3i
         DoT/C1Xfin0IsCotQwjwJ5R7L43LvcYHBeqJV5ceMX7NeYfOxjXuQG0IgUE1g1KXfEu5
         NO2w==
X-Gm-Message-State: AOAM530/mpYXWgP4dUPE6yf7MOrFPzv/QwXgqI6ppTsAwqS6gQfyRv9p
	HRjR6K1YWQPIiGe35r1iuC6vQo02RRT9kSmxtz0=
X-Google-Smtp-Source: ABdhPJyG8ma5qz2zp3VSMtgstyNzf8zbX6pSBUqRgOG5Dpf0jevJ4ESX9QkiU6JJaFNLIkRCTCC8gA==
X-Received: by 2002:a2e:9a05:: with SMTP id o5mr966159lji.249.1623265484175;
        Wed, 09 Jun 2021 12:04:44 -0700 (PDT)
Return-Path: <uvv.mail@gmail.com>
Received: from Vyacheslavs-MacBook-Pro.local ([185.150.116.55])
        by smtp.gmail.com with ESMTPSA id h2sm63474lfv.288.2021.06.09.12.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jun 2021 12:04:43 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] overlayfs.bbclass: generate overlayfs mount units
To: Andrei Gherzan <andrei@gherzan.com>,
 openembedded <openembedded-core@lists.openembedded.org>
References: <20210603142106.115932-1-uvv.mail@gmail.com>
 <57850109-e942-4b7e-ad3b-7536d779a2ba@www.fastmail.com>
From: "Vyacheslav Yurkov" <uvv.mail@gmail.com>
Message-ID: <ea8e72a3-dbb3-c7b8-2786-1290e0b69801@gmail.com>
Date: Wed, 9 Jun 2021 21:04:41 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <57850109-e942-4b7e-ad3b-7536d779a2ba@www.fastmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Andrei,
Like you mentioned, it's application specific. The advantage of 
overlayfs here is that you preserve the data that was changed by user 
(in case of persistent storage), which of course would hide the data 
from rootfs, or your just see the defaults from rootfs if the data was 
not changed. With bind mounts you would need to copy default data first 
into your tmpfs/ext4 bind mount if you wanna have defaults.

Vyacheslav
> I was looking into something like this lately. There are actually two kinds of write access - volatile (tmpfs) and persistent (to disk). So my approach would have been to use bind mounts from a tmpfs/ext4 based on configuration per recipe. Is there any advantage to working with overlayfs in this case? The main idea is to have state that doesn't come from the ro part of the OS because otherwise, updates will be shadowed by the overlayfs. So I fail to see the advantage of using a set of overlayfs mounts instead of bind mounts. At least with bind mounts, it will always shadow the rootfs bits so you can catch early this case.
>
> Depending on your use case, most of the times, you'd want this "state" setup happening pre init (in initramfs, for example), especially if you want to handle persistent systemd logging or machine id, etc.
>

