Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com [209.85.208.194])
 by mx.groups.io with SMTP id smtpd.web10.3702.1592906069569399948
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 02:54:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=idDDOWE7;
 spf=pass (domain: gmail.com, ip: 209.85.208.194, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f194.google.com with SMTP id 9so22685799ljv.5
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 02:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=x2SLmch+yuveeDsvss7szyx54u2fH/AryAM6DZ6PTh8=;
        b=idDDOWE7STHgtcgtPlIalmCxjHLOW4SU/s4Z3VdSCtvyQIS/QJ2Utt6dt82DtG/LFO
         aevsfIX3BelO7lMkdc2CU32smSuaXfL2VzZ7CPaHLo1s9ppyog0QA0JbGTgmFkN1f4wm
         N5qmE9iZplBNxj0i7TU/xRFQMkht9eFtT8pW8tFrmIe/9bQVhMjsge0BlLF5CfQqkB2I
         W/CfhhmpPWeA0GTDZnEat/jb8DNeS8i+liwbSHDnl5HYSvktTOvVZkK0zXHggdfB3NoX
         ZnFLvLcF0Mkr2Y9eZj9iN47mrHkfrxdNA+gCRT3Ltyr+O00AyBGzs6vdaymuaaaAJkLc
         r7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x2SLmch+yuveeDsvss7szyx54u2fH/AryAM6DZ6PTh8=;
        b=AGNANHSfrIfCijm75JzCpoI0CabqS9ro7TYqRG1qP3IV6ZRPOtiUexJoF8507Vt91y
         KjUWc39/UatQB/fpvUCo10HUBJlvz4KWMg+yNP+mJdJYWuAOwt+YDVSFEE/8sb8fYfUv
         OPx4jA2km9GH6hkh8dhEvwHvs/8p/wW2zXRMWnkL5BsJNF2I5wLcKf1f3oQu7Pb1GTsr
         ALtpERThkRh33kBrVQoxQIZu0Zmn9TdDOfIqRx0QxnqMlcP8u+hLGDzUGkcefvjf1Jzv
         2fd9i3YTvIs6N8ZlqVCK/imH8IWQvFAz/zN239GW+EQ51FtGcTcp+ltfvY++dOgoutnp
         Mt3Q==
X-Gm-Message-State: AOAM532/va9pUnVBuk+4H5lAgChgUqLYCZENbCb4ENTTsHRAi/ShNtL2
	PwLtS33s7uhJL4TB9zst5veQX8PB
X-Google-Smtp-Source: ABdhPJyPwtxnZ6vwPzZnXBI2Ld7j6qErfwURRt3uBEY3DypSN60vEvk+ApS0cEiNMNM4YbhjBHsFNg==
X-Received: by 2002:a05:651c:1028:: with SMTP id w8mr10276023ljm.136.1592906067253;
        Tue, 23 Jun 2020 02:54:27 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id x10sm3185830ljx.67.2020.06.23.02.54.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2020 02:54:26 -0700 (PDT)
Subject: Re: [RFC PATCH] grub: Remove native version of grub-efi
From: "Jacob Kroon" <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
References: <20200622114343.481513-1-jacob.kroon@gmail.com>
Message-ID: <d1d3a67b-5eaf-312a-aa8d-09f49137a53b@gmail.com>
Date: Tue, 23 Jun 2020 11:54:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200622114343.481513-1-jacob.kroon@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 6/22/20 1:43 PM, Jacob Kroon wrote:
> The native version of grub-efi only installs the tools
> 
>    /usr/bin/grub-editenv
>    /usr/bin/grub-mkimage
> 
> to sysroots-components/, but equivalent tools are already provided by
> grub-native, the difference on x86_64 being 4 hardwired paths in grub-mkimage
> (values taken from grub-native):
> 
>    LOCALEDIR       = $TMPDIR/work/x86_64-linux/grub-native/2.04-r0/recipe-sysroot-native/usr/share/locale
>    GRUB_DATADIR    = $TMPDIR/work/x86_64-linux/grub-native/2.04-r0/recipe-sysroot-native/usr/share
>    GRUB_LIBDIR     = $TMPDIR/work/x86_64-linux/grub-native/2.04-r0/recipe-sysroot-native/usr/lib
>    GRUB_SYSCONFDIR = $TMPDIR/work/x86_64-linux/grub-native/2.04-r0/recipe-sysroot-native/etc
> 
> If grub-native and grub-efi-native are built with the following patch
> 
> --- grub-2.04.orig/configure.ac
> +++ grub-2.04/configure.ac

For the record, embedding the two lines above in the commit message was 
probably a bad idea since it seems to confuse "git am".

Jacob
