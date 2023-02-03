Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7E5BC05027
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 16:33:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.15582.1675441999925491067
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 08:33:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=0X13FIxZ;
 spf=pass (domain: baylibre.com, ip: 209.85.128.52, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f52.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso4286458wms.4
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 08:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0pG6wAWVTfOW57/Q/k0969woPJpnCF8+nHG+35dKH1U=;
        b=0X13FIxZJ4tWP9eRiopx79tgI/rk2kp3XB7vDy5Aj7cFzGrgGu1y/tsNRoeIIBYjYe
         Y5b8o9E4SHu4BdIi4KCJbn32Y+RdXTvxux8hcCVmrPBryIqgSwOajUniRf1UpzVglSUG
         pI/O7n1mJkQEVYHzT1jhnzSgu2jB7ni1pY/IsW+v6AUdE/4ZLTOqcAJKaA4cuSKU6C3S
         QBBIVTGbRnKYwA97B9WHGMlO1phAkhyZZxfBkgoHSGhn3enu1q/f32U/gNa1fEQIglGn
         ZaF3p9uU4GQuoRnYf0ELlasmm0i7g6r/A6DM6/dJLWetjR/3HFDxjtmPx359RLd5D+b0
         CZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0pG6wAWVTfOW57/Q/k0969woPJpnCF8+nHG+35dKH1U=;
        b=mclQlRXiT1/F5VUTHG8cfQUPBfn23W8Sgia1+205FbA0DcBUKQWq/wCr5dmHcYsKTe
         PU2ZNxYelSvQpQy5zfHdZieVO5h0+f9QWUXmKTZNJDdG6xjGHLhWu2uxszkuzp1m4hLU
         F6+UCwE3MEPmLoBe2FAexxUMuchFFie8rifGl8yXHfcJoazmj2bmIyevJwjG4CywJoHH
         9VhPCE+8KjexTBfJfIT3M5gvL0Mm1ai5SJ4mcaMjitF1iosd34YgAP8gatrG/yFc3fwL
         OEkbYmLR3Z3if0kYMcNAFS1AdOqPr8+PNe+nS8AEinwxXNlhbBmPhDQ8bgdXKxmJgrAZ
         c6TQ==
X-Gm-Message-State: AO0yUKUcgbC8VObL4LHopnVIU7j7Ojagx11Bc3q+/xymNSx8cjA7Paml
	xe61BBdpE/PpMJdISK5qwGIRxA==
X-Google-Smtp-Source: AK7set937NurxCiogC4mDAreYiVCKLHwXwh+Mdq2Hm1RWRy5JRt4b9XGJp12m6+zoTSssfbjPFMRrw==
X-Received: by 2002:a05:600c:2e06:b0:3dc:51f6:8f58 with SMTP id o6-20020a05600c2e0600b003dc51f68f58mr10620339wmf.6.1675441998061;
        Fri, 03 Feb 2023 08:33:18 -0800 (PST)
Received: from ?IPV6:2001:912:1ac0:700::635? ([2001:912:1ac0:700::635])
        by smtp.gmail.com with ESMTPSA id l17-20020a056000023100b002bdf8dd6a8bsm2360464wrz.80.2023.02.03.08.33.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 08:33:17 -0800 (PST)
Message-ID: <778f895b-6fea-4290-cea3-1727478de64f@baylibre.com>
Date: Fri, 3 Feb 2023 17:33:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [OE-core] [PATCH v2] oeqa/selftest/locales: Create selftest for
 locales generation
Content-Language: en-US
From: Louis Rannou <lrannou@baylibre.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: "khilman@baylibre.com" <khilman@baylibre.com>
References: <20230127153344.2868589-1-lrannou@baylibre.com>
 <b3320afb6afb6508d5f4d0f3ceb75e87e97ed450.camel@linuxfoundation.org>
 <92bff1e0-aa88-c713-049f-51f074569a55@baylibre.com>
 <913abc23f1ba2691f7c676b182b1ec0303e5d30d.camel@linuxfoundation.org>
 <1749af1e-dce3-ec14-32a1-fe5a50848f25@baylibre.com>
 <845d6037af51cb2ba78a6d139f5a27301a0a77a0.camel@linuxfoundation.org>
 <52b723c5-e5b4-54b8-7cbf-f50649a0b746@baylibre.com>
In-Reply-To: <52b723c5-e5b4-54b8-7cbf-f50649a0b746@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 16:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176728


On 02/02/2023 14:58, Louis Rannou wrote:
> 
> On 02/02/2023 11:53, Richard Purdie wrote:
>> On Thu, 2023-02-02 at 11:41 +0100, Louis Rannou wrote:
>>> On 01/02/2023 18:57, Richard Purdie wrote:
>>>> On Wed, 2023-02-01 at 16:02 +0100, Louis Rannou wrote:
>>>>
>>>>
>>>> I was able to take a quick look at this. The locale generation on
>>>> target is broken, it throws errors upon boot. I was able to make it
>>>> work with this patch:
>>>>
>>>> diff --git a/meta/recipes-core/glibc/glibc-locale.inc 
>>>> b/meta/recipes-core/glibc/glibc-locale.inc
>>>> index 7f70b3ca4f..c39007b573 100644
>>>> --- a/meta/recipes-core/glibc/glibc-locale.inc
>>>> +++ b/meta/recipes-core/glibc/glibc-locale.inc
>>>> @@ -60,7 +60,7 @@ DESCRIPTION:localedef = "glibc: compile locale 
>>>> definition files"
>>>>    # FILES:glibc-gconv will not be automatically extended in multilib.
>>>>    # Explicitly add ${MLPREFIX} for FILES:glibc-gconv.
>>>>    FILES:${MLPREFIX}glibc-gconv = "${libdir}/gconv/*"
>>>> -FILES:localedef = "${bindir}/localedef"
>>>> +FILES:localedef = "${bindir}/localedef ${libdir}/locale"
>>>>    LOCALETREESRC = 
>>>> "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
>>>> @@ -87,6 +87,7 @@ do_install() {
>>>>           find ${D}${libdir} -type d -empty -delete
>>>>           copy_locale_files ${datadir}/locale 0644
>>>>           install -m 0644 ${LOCALETREESRC}/SUPPORTED 
>>>> ${WORKDIR}/SUPPORTED
>>>> +       install -d ${D}${libdir}/locale
>>>>    }
>>>>    inherit libc-package
>>>>
>>>> could you see if the same test will now work with that patch applied?
>>>> I'm happy to have the basic test but if we can fix this and stop it
>>>> regressing that would be even better.
>>>
>>> The patch does not change the result. I have actually nothing in the
>>> image/usr/lib/locale directory.
>>
>> Testing locally, if I don't have the patch and "runqemu core-image-
>> minimal snapshot kvm", I see errors about locale generation failing
>> during first boot as the directory isn't present.
>>
>> If I add the patch and then boot the image, I see the locale generation
>> happening at first boot. If I then run the locale commands, I can see
>> the locales present.
> 
> I wonder which package do that, because this is not something I see on 
> my qemu. I run a kirkstone qemuarm on poky. Perhaps I need something 
> more recent.
> 

Here is what I have at boot:

```
Configuring packages on first boot....
  (This may take several minutes. Please do not power off the machine.)
Running postinst /etc/rpm-postinsts/100-sysvinit-inittab...
update-rc.d: /etc/init.d/run-postinsts exists during rc.d purge (continuing)
  Removing any system startup links for run-postinsts ...
   /etc/rcS.d/S99run-postinsts
INIT: Entering runlevel: 5
Configuring network interfaces... ip: RTNETLINK answers: File exists
Starting syslogd/klogd: done

Poky (Yocto Project Reference Distro) 4.0.6 qemuarm /dev/ttyAMA0

qemuarm login:
```

Would you recommend to try on langdale ?

Regards,
Louis

>>
>>> I am not sure to understand... If I add to my image the packages
>>> glibc-localedata-fr-fr and glibc-charmap-utf-8, then I have something in
>>> /usr/share/i18n/locales and /usr/share/i18n/charmaps, and then I can
>>> generate the locales with `localedef -c -i fr_FR -f UTF-8 fr_FR`
>>>
>>> In the end, I believe this is correct that I have nothing in
>>> {libdir}/locale, but perhaps the settings IMAGE_LINGUAS (or
>>> GLIBC_GENERATE_LOCALES ?) should specify a rdepend to the locale/charmap
>>> packages, so the locales would exist in the image, but would not be
>>> generated at build.
>>
>> The locale generation can happen at build time or it can happen at
>> first boot on the final target. For the second test case, the locales
>> will only appear during the boot process.
>>
>> I've merged your patch with the first test case, thanks! I did tweak
>> the comment message to match that it is just one test so far. Thanks
>> for getting us that far, it is great to be adding tests around this.

