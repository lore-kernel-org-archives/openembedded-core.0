Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.15257.1622649665626046383
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 09:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p+5FuREP;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: jacob.kroon@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id g18so1539558edq.8;
        Wed, 02 Jun 2021 09:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=GiasF1NtWWYyy1A0sf3qRUwTkLvU+/XEBVkKNGcQElA=;
        b=p+5FuREPUlZf+oFq8DlP8+Z1snBt49XdIdf/geaH3DVvZn/wKFkPlNJae4yfR/l8UH
         5XhwtjnA8cgqsjRRJQ6cmTTQyK/GIRKj4iZzhQAjYiv2+1aYMeFEtPMYD0BzI3rT0mzt
         BoJSD73a3HYT/6UzghaCuHs0Bp1Q/pVCJ1A7Z+cval+2+3AwTPQNtDUak3Eg3a9FXfDs
         OKQcnUGlAg77P0w064FW6Yuq/Om2bvBU+mX7HYJTMyiguoSiymrC3fWtvRqEEd9lBsbb
         /6U+LXrZsikW2PZl70rKQGK6YUd1aw8Nohgtbkk7GVLFylX5Q+a1KtZELJGg0KqZbTZV
         egVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GiasF1NtWWYyy1A0sf3qRUwTkLvU+/XEBVkKNGcQElA=;
        b=aUTxgQ7K039nCW/H2sVwD8coiBusQmXONpf6n7DKXTesv9oynMpXi+1lGD419qlzam
         NzeDrF8A3A7lbwoqYO0YKtXAFPX/npWLrh7rMh7Tk40wlunDvcZl93GB7oXoq28ckywZ
         xgbB6O0XHZaFzVcsgPHPGdoQIBNBvMjBKiX6HXNbk/ybIloFWd+FT3qOvKoV4q7Hbq57
         TzOyCofmP86dG4HTq0fZMY/Fe+VzX9LJ9lwMofFnLjBBISsMtbPtf8xH9gTDcKKCqYdd
         MlcTiRjqGFHQzNo/i8lHJs8G1gzPaqtkLbz2PswZAOqS5HOPOsU7vLrdF0baFI3dWyiw
         Z4vQ==
X-Gm-Message-State: AOAM530qseu1f7dxNtKk0Go6M1ywjmnvlk4fm1ve3NK7rpC+U+Ly8eQJ
	M1A/1cLZqIRlygjkijzh3o9Vr+OvVioSbyT2
X-Google-Smtp-Source: ABdhPJwUeCTb5SixrI5i09AOtUmpkgp+9VYkpU+/PyN8s5WU0w2oMDFghoD1vopgKmNDZP5ZfUQt9A==
X-Received: by 2002:aa7:d3ca:: with SMTP id o10mr25519890edr.197.1622649663806;
        Wed, 02 Jun 2021 09:01:03 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from [192.168.10.102] (37-247-29-68.customers.ownit.se. [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id de19sm201728edb.70.2021.06.02.09.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 09:01:03 -0700 (PDT)
Subject: Re: [oe] Fedora 34, shadow-native/icedtea7-native, umask problems ?
To: openembedded-core@lists.openembedded.org,
 openembedded-devel@lists.openembedded.org
References: <1684B03940C4F27A.14073@lists.openembedded.org>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <8a7e0a08-fd81-7925-4d84-f8ab48e410e8@gmail.com>
Date: Wed, 2 Jun 2021 18:01:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1684B03940C4F27A.14073@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 6/2/21 8:32 AM, Jacob Kroon via lists.openembedded.org wrote:
> Hi,
> 
> I'm using Fedora 34 and OE-Core/Bitbake/layers from git master as of 
> today, with reproducible builds. Sometimes when rebuilding my image I 
> see sudden changes in file permissions (jumping back and forth) in the 
> buildhistory output for two native recipes:
> 
> shadow-native: (OE-Core)
>> -drwxr-xr-x -          -                  40 ./var/spool/mail
>> +drwxrwxr-x -          -                  40 ./var/spool/mail
> 

I can reproduce it reliably with these commands:

After I do:
# bitbake -c cleansstate shadow-native && bitbake shadow-native
I get:
drwxrwxr-x - - 40 ./var/spool/mail

After I do:
# bitbake -c clean shadow-native && bitbake shadow-native
I get:
drwxr-xr-x - - 40 ./var/spool/mail

shadow.inc does:

<snip>
do_install_append() {
         ...
         install -m 0775 -d ${D}${localstatedir}/spool/mail
</snip>

So it looks to me like those permissions are either not recorded in the 
sstate cache, or they are not restored when extracting the cache.

/Jacob

> icedtea7-native: (meta-java)
>> -drwxrwxr-x -          -                 120 
>> ./usr/lib/jvm/icedtea7-native
>> -drwxrwxr-x -          -                 800 
>> ./usr/lib/jvm/icedtea7-native/bin
>> --rwxrwxr-x -          -               15016 
>> ./usr/lib/jvm/icedtea7-native/bin/apt
>> --rwxrwxr-x -          -               15016 
>> ./usr/lib/jvm/icedtea7-native/bin/extcheck
>> --rwxrwxr-x -          -               15016 
>> ./usr/lib/jvm/icedtea7-native/bin/idlj
> ...
>> +drwxr-xr-x -          -                 120 
>> ./usr/lib/jvm/icedtea7-native
>> +drwxr-xr-x -          -                 800 
>> ./usr/lib/jvm/icedtea7-native/bin
>> +-rwxr-xr-x -          -               15016 
>> ./usr/lib/jvm/icedtea7-native/bin/apt
>> +-rwxr-xr-x -          -               15016 
>> ./usr/lib/jvm/icedtea7-native/bin/extcheck
>> +-rwxr-xr-x -          -               15016 
>> ./usr/lib/jvm/icedtea7-native/bin/idlj
> ...
> 
> Before I start debugging them, does anyone have an obvious fix or hint 
> for any of these ?
> 
> Regards,
> Jacob
> 
> 
> 
> 
