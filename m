Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C970BC71153
	for <webhook@archiver.kernel.org>; Mon,  4 Sep 2023 13:32:53 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.48245.1693834370530334217
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 06:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=e9Pjbdgz;
 spf=pass (domain: baylibre.com, ip: 209.85.128.45, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-400a087b0bfso15021555e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 06:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1693834369; x=1694439169; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gcxLgtBnHpAxsnHZEcgWg4puzraA0mkUYnR4E0DqETw=;
        b=e9PjbdgzVr0n4hruaPU/Axfo2L19JclI+wpIfnDxrL+ClcphwoKMcMKqwr/K+qe5Ae
         b722WgNHuY999htIU6y34RYi4OLwfvhbBgB/7mda7FH9k9AZlufoLnWMsp7NXHIPBnwh
         1RTRFR+S80fQlu3KR78CMprCmAwGBUDkE46UJw/dhamFFTOq1CboYX8RIEmTEVHxI5rt
         VjRf5A5mSNZs+BbiBYGNRelWeHi9PdKyv6ghAnNtIGrn1/MPmplsT1UbK2bh5NIHC23F
         t/+6bDAgO/CXW3JM4oJOu+MaEap3weCfzwTEpRWEp+KQSwmzl6yVViLHJW8Q5Si1Fxfo
         ICRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693834369; x=1694439169;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gcxLgtBnHpAxsnHZEcgWg4puzraA0mkUYnR4E0DqETw=;
        b=AtBWRqBQy8LTWoHEqu0sMaHbFeXc9eJO7EQamzPqvgka3FetiBQ3bN2xFkwSr1SYxE
         Pq1+LXQ5RHJKEmtm0PLSW+q/uFrsXe0IeRZozaYrCbDrQL+aUCxtaD8vRFy+az7wAHJy
         yMhOqQdVbJKmTG3djHHBnm/l/0F+xwtjWOe0isn/M8Fd/Dq4WGQecSuu4n5XFuDGUTMg
         vR9C2n+1BRYnidD2JOuiLaI3jZieq8KjWGqUAbEIFJuKmgtAuav4PY/1+PDjfeLAG1Oo
         uzSEu0hF+Lgn4KCfArec5eSYytwHir2E1oc8sB+xLjUka4bx3bs8CNtGaVpD/pk3aCKD
         TXUQ==
X-Gm-Message-State: AOJu0Yz5jeAg8qGhtFSCIamcrgGIkFSKwMvgmPTeKoReEiWHdd6nc3LT
	dhwg71PXgcJL/icLtj8ZlkLmwQ==
X-Google-Smtp-Source: AGHT+IHqcaGoK/xotuTHDKkFYadVcHqFfq3q9md/ZlviHzpNuC97oVJn6a47+FYf7hayzDPFReNTig==
X-Received: by 2002:a5d:45c8:0:b0:317:6b0d:1b1 with SMTP id b8-20020a5d45c8000000b003176b0d01b1mr6178153wrs.4.1693834368781;
        Mon, 04 Sep 2023 06:32:48 -0700 (PDT)
Received: from [192.168.178.55] ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id d17-20020a056000115100b00313de682eb3sm14436239wrx.65.2023.09.04.06.32.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 06:32:48 -0700 (PDT)
Message-ID: <688d6b76-da5a-cb64-67f5-c205091b043f@baylibre.com>
Date: Mon, 4 Sep 2023 14:32:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core] [PATCH] update_mandb: Point to correct /etc/passwd with
 man
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20230830123912.2052665-1-pidge@baylibre.com>
 <6965c5634e674335fcfc02e2540d5c2e0bd1caf3.camel@linuxfoundation.org>
 <1923dbe0-a0a6-275d-459d-895aecdd2463@baylibre.com>
 <54cfce0bb884640b5bf1e40bfd7dab5d419fa1be.camel@linuxfoundation.org>
 <66ee8cdb-967d-ced7-8247-53a38416b708@baylibre.com>
 <17804216F153645F.29905@lists.openembedded.org>
 <3f421bfedaad2abb8f8f8d858e2fad0be8c546e7.camel@linuxfoundation.org>
From: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?=
 <pidge@baylibre.com>
In-Reply-To: <3f421bfedaad2abb8f8f8d858e2fad0be8c546e7.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Sep 2023 13:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187174

On 30/08/2023 21:10, Richard Purdie wrote:
> On Wed, 2023-08-30 at 21:08 +0100, Richard Purdie via
> lists.openembedded.org wrote:
>> On Wed, 2023-08-30 at 18:07 +0100, Eilís 'pidge' Ní Fhlannagáin wrote:
>>> On 30/08/2023 15:08, Richard Purdie wrote:
>>>> On Wed, 2023-08-30 at 15:04 +0100, Eilís 'pidge' Ní Fhlannagáin wrote:
>>>>> On 30/08/2023 14:19, Richard Purdie wrote:
>>>>>> On Wed, 2023-08-30 at 12:39 +0000, Eilís 'pidge' Ní Fhlannagáin wrote:
>>>>>>> [YOCTO #15023]
>>>>>>>
>>>>>>> In this instance (do_populate_sdk with api-documentation turned on),
>>>>>>> pseudo is going to end up finding the passwd/groups files in
>>>>>>> recipe-sysroot-native which is incorrect and does not have man. The
>>>>>>> solution here should be to ensure that pseudo points to the passwd/groups
>>>>>>> files in recipe-sysroot (which does have man:man).
>>>>>>>
>>>>>>> Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
>>>>>>> ---
>>>>>>>     scripts/postinst-intercepts/update_mandb | 2 +-
>>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/scripts/postinst-intercepts/update_mandb b/scripts/postinst-intercepts/update_mandb
>>>>>>> index a061bb426a6..6bc073bfff5 100644
>>>>>>> --- a/scripts/postinst-intercepts/update_mandb
>>>>>>> +++ b/scripts/postinst-intercepts/update_mandb
>>>>>>> @@ -13,4 +13,4 @@ PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D $D${bindir}/mandb --config-file $C
>>>>>>>     
>>>>>>>     rm -f $CONFIG
>>>>>>>     
>>>>>>> -chown -R man:man $D${localstatedir}/cache/man/
>>>>>>> +PSEUDO_PASSWD=$D chown -R man:man $D${localstatedir}/cache/man/
>>>>>>
>>>>>> Is there a more general problem here? Wouldn't this issue apply to
>>>>>> other postinst scripts too?
>>>>>
>>>>> Yes and No. The other postinst scripts if they do attempt to chown, are
>>>>> trying to do it for root:root (which recipe-native-sysroot's passwd and
>>>>> groups obviously have). We could add this to the others as well, just to
>>>>> maintain consistency.
>>>>>
>>>>> This is all because in image.bbclass, we're setting PSEUDO_PASSWD to
>>>>> STAGING_DIR_NATIVE which I believe normally should be correct, except in
>>>>> an instance like this.
>>>>
>>>> image.bbclass sets it to:
>>>>
>>>> meta/classes-recipe/image.bbclass:PSEUDO_PASSWD = "${IMAGE_ROOTFS}:${STAGING_DIR_NATIVE}"
>>>>
>>>> so it should look at IMAGE_ROOTFS first, which I think is the same as
>>>> $D here?
>>>>
>>>> Something isn't quite adding up...
>>>
>>> In this case, IMAGE_ROOTFS and D are not the same, either at the start
>>> of do_populate_sdk or when the postinst script runs:
>>>
>>> bitbake -e yields:
>>>
>>> IMAGE_ROOTFS="/home/pidge/poky/build/tmp/work/qemux86_64-poky-linux/core-image-base/1.0/rootfs"
>>>
>>> Passing IMAGE_ROOTFS into the update-mandb postinst scripts yields this:
>>>
>>> D="/home/pidge/poky/build/tmp/work/qemux86_64-poky-linux/core-image-base/1.0/sdk/image/usr/local/oe-sdk-hardcoded-buildpath/sysroots/core2-64-poky-linux"
>>> IMAGE_ROOTFS="/home/pidge/poky/build/tmp/work/core2-64-poky-linux/eudev/3.2.12/rootfs"
>>>
>>> Even if we were relying on an IMAGE_ROOTFS that pointed to what we
>>> expected, it is probably the wrong option here because there is no
>>> assurance it's populated with a passwd file when we run bitbake
>>> core-image-base -f -c do_populate_sdk. I've checked on my setup and have
>>> verified that it doesn't contain anything at that stage.
>>>
>>> In my patch $D is actually set to ${SDK_OUTPUT}/${SDKPATHNATIVE} (not
>>> recipe-sysroot, I'll correct this in the log) which incidentally is also
>>> the same place we're running mandb from.
>>
>> This might hint at the real issue :)
>>
>> If this is during do_populate_sdk, it is worth noting that the SDK
>> doesn't have file ownership, either for the nativesdk components or the
>> target ones. This therefore shouldn't be running in that context at
>> all!
> 
> Have a look at
> 
> https://git.yoctoproject.org/poky/tree/scripts/nativesdk-intercept/chown
> 
> The real question is why that doesn't change man:man (or whatever) to
> root:root...

There's a few issues going on. The chown intercept isn't in PATH and the 
intercept seems a bit fragile (it's flaking out for some reason, my 
guess is it's just parsing the chown args incorrectly). I've a patch I'm 
working on to fix this, so yes, ignore this patch. It "fixes" it, but 
you're right, the issue is deeper.

> 
> Cheers,
> 
> Richard
> 

-- 
Eilís 'pidge' Ní Fhlannagáin
BayLibre - At the Heart of Embedded Linux
www.baylibre.com


