Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2D8CCF9FE
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 13:37:31 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20683.1762177046388152792
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 05:37:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SuNg0n0B;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: skandigraun@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-591c9934e0cso7234343e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 05:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762177044; x=1762781844; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NREGDe92xrbIKcGpMeqR1RIeoY0NXNQYXQAxl2P7Sv4=;
        b=SuNg0n0BSZVnrh7RbE5W5/3CFg22UTv8bME7bY1sgaP7UuIC1WS78fIGml9fHe5Aro
         He6ylZ5eBMinMzIYewBTiOIl6l7U91xv47F3ALJ2k+qTCLmkml7K0q0HFC8cTMQtbYQB
         lYh6qsZ0OkpYdrRxDzebjOE4Q0NdGhkkiw3kfaW6aNQjzIIIK1bHC70OC43sIuy7aSMl
         63B8GlP0Objl2tdzm2z5Yc3fzl82Y8Rf4UFmXvN5EasUavNeX9KvmFJpEbsg2QqRrZKO
         65m+yO751cXxRMzGupZAZc20DpAF0iURKT+rFo3ft/Tlue9D555on39DGL8BR0cVn/iA
         wsOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762177044; x=1762781844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NREGDe92xrbIKcGpMeqR1RIeoY0NXNQYXQAxl2P7Sv4=;
        b=PhD6VlRHcdwXj8nNkhOxJjctyNZoZzRZ/1UdLtGFZjZhJvwlsRUufBj//xISXf8iE+
         EfMvF2hBoMmHOAHo/6cPv/AIGIst8mxFUNqe6jUiwHLFjDlflUZyRbKZb9JzHQMHySVo
         DQVRr1JI7YyzGOJZrg9oc+PI9/vYrDI1r7mk7dwqNwtDXlhBQi6p+qbr9dehbS54eiyt
         Alko5mFOb3TSTmeZBZZ6vi9WViOGVXVYkdG4lV3y9XKy9FSE3ojTH0v6Ym0b0IqcXvur
         2xluYPJyLHRsNK67DYtsAsd8Mjj53/XUbGcG1HLrTLfzZSIQnszi5+FcE3oUUS2geehm
         83tw==
X-Gm-Message-State: AOJu0Ywa8Kur6LlQTjpU3CoEX+U5mT5OJnNVLnVZ4NKlkthMfMVL1mse
	w0cXVnGPMqD9wQWL5GDriETD5aqrbhbURyn8HEDVjkbTmWOZD8Frz5Lr
X-Gm-Gg: ASbGncsZV4Gq1pFiV87j+vCpZMe1gp+hXEiFQaf8fiSQuyXG94lYfUDyRTSraof/qtx
	W1rvfUSVNY9XZvLX1B/228KPBl8WNqsu1ZZw6Ofx9uG09BEgvIC2U4JFPu6qEnA56avBifmx23o
	ofQ74XWYkzQsB3fHHuOnppjoBnSYBIQZMHBHJiEdRxS2pSXauzLqZo/3BrFUuFLy9Fy05hsajXo
	0aPLlhfQu1T8U8qeilC+TgqvNcCrO012DCMFNJSmU2Khg9aR2eiqUBdPp7eg4CSdkqvxk1DHb2F
	4gADFXXvSCO6QF9EdBLXtzlTHUzAyO46q22+DUad26RphZGlXY+z/e+M1myMaVJCxCfrgCsuAWN
	b4dW8m7NQYB2ksxqZs+KPKzvHN3KqjuvonwI8GzTs9QsjtYNISnSwGk58J4iTpxdFJZ4z9+8il1
	+Jumb+n3qs
X-Google-Smtp-Source: AGHT+IGHP5Pj3aSqBiwWGuThwMKX3cn+10py/IrruO9m/cfk5M7DzUQnXGoYFdGXcaIBcrWVa7KGTg==
X-Received: by 2002:a05:6512:1153:b0:57d:b8a1:832b with SMTP id 2adb3069b0e04-5941d508660mr3962609e87.24.1762177044139;
        Mon, 03 Nov 2025 05:37:24 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59427a91396sm1630656e87.99.2025.11.03.05.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 05:37:23 -0800 (PST)
Message-ID: <8c567231-4373-4179-a259-af3daed9a2aa@gmail.com>
Date: Mon, 3 Nov 2025 14:37:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH 15/19] gtk+3: rename tracker
 dependencies
To: =?UTF-8?Q?J=C3=B6rg_Sommer?= <joerg.sommer@navimatix.de>
Cc: openembedded-core@lists.openembedded.org, f_l_k@t-online.de,
 richard.purdie@linuxfoundation.org
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
 <c1641c15f747f70250ab3257edee3640d8cb916f.1762157680.git.joerg.sommer@navimatix.de>
 <fa662162-32b7-4be3-b93d-ca879b9219b4@gmail.com>
 <j76kdjsr2gfjkcn2ouhaoy34kzyydmjzqdve52ttriip5tseah@xypzq6gqwcun>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <j76kdjsr2gfjkcn2ouhaoy34kzyydmjzqdve52ttriip5tseah@xypzq6gqwcun>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 13:37:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225654

On 11/3/25 11:59, Jörg Sommer wrote:
> Gyorgy Sarvari schrieb am Mo 03. Nov, 11:15 (+0100):
>> I'm not sure if this patch can work. I believe tinysparql was added in
>> Walnascar in meta-oe, and I'm sure that it's not in Kirkstone.
> Yes, it fails to build. I would drop the following commits, because there
> should be no user of/need for these PACKAGECONFIGs.
>
> * gtk+3: add PACKAGECONFIG for libcloudservice and tracker; fix cups backend
> * gtk: Add rdepend on printbackend for cups
> * gtk+3: rename tracker dependencies
>

Don't know about the middle one, that sounds like a bugfix that fixes
something that's broken now... but I could be wrong
I agree about the other two, I think also that they could be dropped.

>> On 11/3/25 09:22, Jörg Sommer via lists.openembedded.org wrote:
>>> From: Markus Volk <f_l_k@t-online.de>
>>>
>>> This is required for gnome 47 update in meta-openembedded
>>>
>>> (From OE-Core rev: 51864b3494bd8fe456fffb2e0ccf70fee13cc013)
>>>
>>> Signed-off-by: Markus Volk <f_l_k@t-online.de>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> Cherry-pick-of: 07d2dc4c98f2fe1e2c8c0aae5ce863e7bc190b5f
>>> Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
>>> ---
>>>  meta/recipes-gnome/gtk+/gtk+3.inc | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
>>> index e1603b43fc..03913768b1 100644
>>> --- a/meta/recipes-gnome/gtk+/gtk+3.inc
>>> +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
>>> @@ -47,7 +47,7 @@ PACKAGECONFIG[wayland] = "-Dwayland_backend=true,-Dwayland_backend=false,wayland
>>>  PACKAGECONFIG[cups] = ",,cups,cups gtk3-printbackend-cups"
>>>  PACKAGECONFIG[colord] = "-Dcolord=yes,-Dcolord=no,colord"
>>>  PACKAGECONFIG[cloudproviders] = "-Dcloudproviders=true,-Dcloudproviders=false,libcloudproviders"
>>> -PACKAGECONFIG[tracker3] = "-Dtracker3=true,-Dtracker3=false,tracker,tracker-miners"
>>> +PACKAGECONFIG[tracker3] = "-Dtracker3=true,-Dtracker3=false,tinysparql,localsearch"
>>>  
>>>  prepare_gtk_scripts() {
>>>      mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-3.0


