Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com [209.85.167.67])
 by mx.groups.io with SMTP id smtpd.web11.3011.1592468858080998022
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 01:27:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RGtB2BuF;
 spf=pass (domain: gmail.com, ip: 209.85.167.67, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f67.google.com with SMTP id d7so2940305lfi.12
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2020 01:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=WahDETyUwb38ADo/HgTjdpZZA9sfyFzwXGEUkWSh7j4=;
        b=RGtB2BuFyMmHOB3QkmmdoU/qmVCyDHANXQD6dEuOyq5X+bcFqreMCDSEVJDuoI32CR
         M4Drp9kwEp8CJZpIACU3wU9IpeQFHMKueMD7FyfgyedlHn3kAy7q1CE/yUSPCHXjf+NK
         zbCyATgJcITgtVJrPN6Ez9eTccKHmzq0ADCf/8l0fVurM0EPBL1eFufSDVRza0fFj0zM
         CFbjcfc/qt7jihTPltvI/0nE8IrR5souhvCmmH8Ga64UVZZQCgZNrI2zfKaS0lU8VI4H
         e22kxkM57LFaEiycp/TCtJYmzI9mbElOxGAT1qrb3YGJTOr2F6hwJailOh0TDhi6gCNq
         haVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WahDETyUwb38ADo/HgTjdpZZA9sfyFzwXGEUkWSh7j4=;
        b=BWN792WUXLJIoboWfEU5aatAtFU9sz/X+Ur7dx2F7Ao5ZRdghjXJofY80RF61zxOmv
         K0CCznq2yjBQ/DO0b8IJUTCEFjfrfO5xbO4Chwg4tmnRUnknBFAV1n5J5DsQ7AFrgHHv
         6LibuBUDDnaLqi4T7/XnxIBhcxXfLLAqt4HnyqerUpAPgMYEyW9SWa1JragqcZCJ/Ubp
         ee4zJXYCfGG4oNLj/gEOqAkamuJ0/NGxwiy1sK0UDGPmNu9W0gPZB4nZr7kZwise0GBu
         h+jNDKmoGWS9pXD0xzXfHQ4jAdgqUzibTjpdSxqGiwek1QGb/zpY4o8MCFp8gEBxhTgs
         5ePw==
X-Gm-Message-State: AOAM531pQtYmZy/zShDfAVQhVJQvGCdkrtiF0+VJgISRDarElKXc5DM+
	b83czCp1+5l9u+UOVJHQaKrVJtOF
X-Google-Smtp-Source: ABdhPJwJZRqo14Y/N8defx9Z+nPJwnAmYEhY7ypI7k8QKAz8Y8FtA8skM+fFY6oqQ/8da3eHoGoUWw==
X-Received: by 2002:a19:8b8a:: with SMTP id n132mr1710378lfd.45.1592468855703;
        Thu, 18 Jun 2020 01:27:35 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id h16sm484056lja.87.2020.06.18.01.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 01:27:34 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] grub-efi-native: use RDEPENDS on grub-native instead of duplicating tools
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20200617230710.9163-1-christopher.w.clark@gmail.com>
 <afb6222235af73893eb979a1f486108e902d4eaf.camel@linuxfoundation.org>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <a2dcab79-dd9f-168a-c391-07897ad1b556@gmail.com>
Date: Thu, 18 Jun 2020 10:27:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <afb6222235af73893eb979a1f486108e902d4eaf.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/18/20 1:12 AM, Richard Purdie wrote:
> On Wed, 2020-06-17 at 16:07 -0700, Christopher Clark wrote:
>> Both grub-native and grub-efi-native included packaging for the
>> grub-mkimage and grub-editenv tools, which prevented concurrent
>> installation of both the grub-native and grub-efi-native packages.
>> This caused errors on image generation with wic when populating
>> partitions with both legacy and efi boot support, so resolve this by
>> removing the duplicated tools from grub-efi-native and add a
>> runtime dependency from it to grub-native.
>>
>> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
>> ---
>>   meta/recipes-bsp/grub/grub-efi_2.04.bb | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb b/meta/recipes-
>> bsp/grub/grub-efi_2.04.bb
>> index b9d6225d27..ed43dee152 100644
>> --- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
>> +++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
>> @@ -6,6 +6,7 @@ GRUBPLATFORM = "efi"
>>   
>>   DEPENDS_append_class-target = " grub-efi-native"
>>   RDEPENDS_${PN}_class-target = "grub-common virtual/grub-bootconf"
>> +RDEPENDS_${PN}_class-native = "grub-native"
>>   
>>   SRC_URI += " \
>>              file://cfg \
>> @@ -61,9 +62,7 @@ do_install_append_class-target() {
>>   }
>>   
>>   do_install_class-native() {
>> -	install -d ${D}${bindir}
>> -	install -m 755 grub-mkimage ${D}${bindir}
>> -	install -m 755 grub-editenv ${D}${bindir}
>> +	:
>>   }
>>   
>>   do_install_class-target() {
> 
> I think we want to PROVIDES_append_class-native = " grub-efi-native" in
> grub and then drop the BBCLASSEXTEND from grub-efi?
> 

Just for the record, I tested building grub-native (x86-64) both with 
platform "pc" and "efi", and in the same build directory, and all tools 
in ${bindir} were binary identical. Asking in #grub on freenode also 
confirmed this, apparently Debian packaging also assumes this.

So no grub-efi-native required, and we can remove that 
_class_target/_class_native special handling as well.

Jacob
