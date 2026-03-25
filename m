Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25167106B51F
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:26:53 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21304.1774441605291117541
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mxKqJnNS;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so48095875e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 05:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774441603; x=1775046403; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hMYS8qE0x1GtVS2GMSsmBHrq14mc2u7TdMLs9/sMDAc=;
        b=mxKqJnNSgJ0PAqWBs3i7cBy3PDZQkVVqWEvh9SheekNvr9tPUM6ljBE5FDLqBzSpdL
         XWLouqhHfrLoAEO2inHlKnhSbi05gdBCPGGgXuspnqMMrUb5wCwAplzAJ397Y1mQ/DAn
         dd+HCT8ReBZorHaiGQxyO/0qJPvtMa5VnN/1U0SdzNDl+E5C3wIxWmQRI+HYH8Ez3KAn
         Ud362Pptu+5qBJeXzMMi/E9K4gJX03FRY5i0qbGZpwQQcQmz//3ZpPyZ3Mn0tDq1/IOT
         Evt0oVAhMIm0kbJLzVX+fn2CuAPS/cqGxN/dgKXISfvDYYBaMxYfNrJU+jB9Ssw/6Mdi
         2BMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441603; x=1775046403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMYS8qE0x1GtVS2GMSsmBHrq14mc2u7TdMLs9/sMDAc=;
        b=JmIFZeHquFKOUg72t8UK3aSE3xdyQ6Yj13Z6YHuvsmI87ftZZUs2Dig3UxY/rzM7fg
         zUxRdIE6BERNxbTVmRuiajdDAMaZ+rwBrETFP3Phzc83ectwuvbbfa2Jvg0uRChN8wXu
         WSRG6F+TGAHlZuyU4yoHbd9kgW9Eo7851++mChhcATth3qL4bAbdhfmy9g/4iR3z+yFi
         uQQJVS0qz8NAft03HpK9pkeS0h3aIphEt3pPgQqIP0qwHUtHcKYZlULzCVWfhU3xkUcf
         fP4xPCf2YlcSI/fh99d8RFXDjSyRFZpraIxA8i1TpbbQQ6dfUrrxAy3CUAUM6GfR+sf0
         ZzLw==
X-Forwarded-Encrypted: i=1; AJvYcCXrvTWCg4S/b2hfUEgWELVoWJPqPFQXKrPn5iAyCosR6vWJRQ71QqgoGP8H10J3JmSNfZu+aOTuMtHOZtTA7F9vKQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx9x/uQurp7z5MWAeW/YMGN04aRXK0odF3RyWdzTEnqSAOiSOf8
	4QroRX2S5+IfRcOCjSX6y9ND7Jzt9NGdWXOsOijrfw+PFsh013cpWW3Z
X-Gm-Gg: ATEYQzyFW3HQPo6Ee3/NKQ1e4zGuYnS2pZkI4nK28wGNnnFfE4aVUaCbS79wtWyiGrx
	+M+/N9fwUdYraWgXUj32Z7kkMsmyJ/eI4EiTd9Yj6z9+p+ZjS+wQ12Yc17Qx0xWllNSEd3w5vpf
	2IO0zmF8LCcTkMgHiaun/SWWFaCu6Y7qIard+iPoqvx6r8h7jroZhbc1MmfuS/6X9K2Bs4H1+fi
	HX4cT5HgoSr/MLj7Sf4IX56VpIqZ6+/HE0k+Dlmvd6F7HdMp4j3QgVHCKs/exiheklsnu/wffv4
	whTF6AGZXv/AEMnpReJ+o60HFVIuPm/9qA2FXr8a5ZebpOM5/se4NAnVRWHo04OWavrKcjizFTi
	mtC4PRM9xN3kX5PKFaE9wpijx7WTqSIykELi+aC2X7e34VF1inpelQuvCj1+BXLAQO5p0llD6xG
	cEHGRTI3xVPKMqU2oN+n58xGUswOQC6bS1f4VhA/6fC6MHs0lDZJIM6LU=
X-Received: by 2002:a05:600c:190e:b0:486:ffa3:55f with SMTP id 5b1f17b1804b1-48716050973mr51775395e9.27.1774441603313;
        Wed, 25 Mar 2026 05:26:43 -0700 (PDT)
Received: from [192.168.2.122] (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48717373ef3sm18502385e9.26.2026.03.25.05.26.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 05:26:42 -0700 (PDT)
Message-ID: <8ce1d1f5-64f8-4996-9379-06275fb382e8@gmail.com>
Date: Wed, 25 Mar 2026 13:26:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] python3: Add a new PACKAGECONFIG knob for
 free threading
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Trevor Gamblin <tgamblin@baylibre.com>,
 Alexander Kanavin <alex.kanavin@gmail.com>,
 "Zoltan Boszormenyi via lists.openembedded.org"
 <zboszor=gmail.com@lists.openembedded.org>,
 openembedded-core@lists.openembedded.org
References: <20260312120024.3745232-1-zboszor@gmail.com>
 <CAMRc=MeFZMGjW-KXngLwq3kjbA9ic4KaOaPjhPd4Be0DMJ+yTg@mail.gmail.com>
 <c0ef676d-27c6-4db4-9fa0-06a78c38954e@gmail.com>
 <CAMRc=Mfa8R1=eVdHdw1pZL5n33nd+nWvR99=9Qh3fZwTdo24kw@mail.gmail.com>
 <c59c3cf6-1cb1-42c9-8155-ecc28dab2ae0@gmail.com>
 <CANNYZj-Z3TKK9RTas0dnn__fvoo+-jP8SRjjLzhKBghR7NiWWQ@mail.gmail.com>
 <d8c59726-e8b9-4dc2-9bf9-48b0647d10dc@gmail.com>
 <d33eccff-ac69-4eb2-9204-086ef9f864a5@baylibre.com>
 <bed42cad-f7a3-4c1b-88b1-cfdf901dee81@gmail.com>
 <CAMRc=Mffe963zy4vEH+TGvXS_iMUNPoan25_szUFfxvGcemEcg@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAMRc=Mffe963zy4vEH+TGvXS_iMUNPoan25_szUFfxvGcemEcg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 12:26:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233893

2026. 03. 24. 9:46 keltezéssel, Bartosz Golaszewski írta:
> On Mon, Mar 23, 2026 at 6:23 PM Böszörményi Zoltán <zboszor@gmail.com> wrote:
>> 2026. 03. 23. 16:03 keltezéssel, Trevor Gamblin írta:
>>> On 2026-03-23 10:52, Zoltan Boszormenyi via lists.openembedded.org wrote:
>>>> 2026. 03. 23. 15:47 keltezéssel, Alexander Kanavin írta:
>>>>> On Mon, 23 Mar 2026 at 15:40, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>>>>>> I also see other issues popping up, first in python3-installer-native.
>>>>>>
>>>>>> Probably this setting ("python-freethreading") should be a
>>>>>> DISTRO_FEATURE and then the python3 recipe would use that
>>>>>> to enable its PACKAGECONFIG.
>>>>>>
>>>>>> PYTHON_DIR in python-dir.bbclass should also be set accordingly.
>>>>> In patch review it was suggested that we should actually have two
>>>>> co-installable recipes, rather than an exclusive choice between.
>>>> Which implies doubling every python3-* recipes, too.
>>> I think that should only be for python3 packages which actually have binary builds.
>> Not just those. Script-only modules won't be found either
>> by one build in the the other build's site-packages.
>>
> Am I getting this right: This is experimental, never worked and
> actually shouldn't even be in openembedded-core master at all? I'm
> trying to figure out if I'm wasting my time trying to make this work.

I have figured out what was needed, it wasn't that bad.
I just sent two series for that, one for openembedded-core and
one for meta-openembedded.

Some projects do not actually expect freethreading to be enabled,
see the ones with moving the installed site-packages directory into
the correct location:

+do_install:append () {
+    if [ ! -d ${D}${libdir}/${PYTHON_DIR} ]; then
+        mv ${D}${libdir}/python${PYTHON_BASEVERSION} ${D}${libdir}/${PYTHON_DIR}
+    fi
+}

I expect a lot of fallouts in CI.


