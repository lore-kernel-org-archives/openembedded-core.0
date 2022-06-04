Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EB0C433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Jun 2022 15:12:21 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web09.10912.1654355533732750851
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 08:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=owYY74Fh;
 spf=pass (domain: gmail.com, ip: 209.85.167.44,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id u23so17011674lfc.1
        for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Jun 2022 08:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=b7bkfI8woIvMf4mDpijcU6RgncOQIT9hJQb0tjiSVAs=;
        b=owYY74FhpizS20ZfYDHjBuRgk6K7yscTNeJ86QXrojdnqejeEeMu3KHj6KJAqogSay
         2Vr1qOhRpF9+bwV640c+nybbxOgnHQYeWgAPlm4vAM1SmyIcbcGwQCimL4zsHicjgBpb
         SHRCd0K7t2R9fE7be67Eh5G4eZq6xdn686A5Z/3S5yIKJFOejPFArxG0PU44oTn8NNWM
         8t20YXdBiPxhc3YlNLnpQjgmDGAZqiUseCA1nuYwX7wmcfMEwR7tM/aZuKCxRCNXGsar
         6l8AZ5ax04PWaySP7qKlM5bFBDRqOwLBMRkkDMPfQMHzPyYstIyZ1ZNnmn8w5xp0o7lb
         HfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=b7bkfI8woIvMf4mDpijcU6RgncOQIT9hJQb0tjiSVAs=;
        b=SzNapIPgpQr+bZOAIIDqnYmZbEe/plzvK4FEfeRCehDltILSuGh3jYOZXRhQGh7D5c
         gLrrsONClP15VvNV5sGw5vOTzpfsIwZXqcyCGI94cepd4lBhGbLkLl6AL+EmVQD1enEK
         W+TrHdVjeUNTUNcbdcXvGKnsVLF5vVS5DrewrLXBeLg41IXu9A3pB30HwBXTTwnFc7rz
         PtWj87P1kj/D3XVEyPm/nOw/XTdee0K3Iy3o0zWbPGXxIYf5p4r7oTlBT4gq8BWUDalK
         JeSbzeV3n28rLkdcYnvV4Ex9opQLu+oJFe4HRyBi1i/OaFaJlB//XqOkqAzmXYti64gV
         1juA==
X-Gm-Message-State: AOAM531k9yhRWaHis7diEo2OtV6iWGFULodaK9BjGJczB3hAXVYfvTOq
	ixicSoKYI89I3YNmLaewI0E=
X-Google-Smtp-Source: 
 ABdhPJz4J/yQM+CawE8pIDXA8Iu2XYIVIc+SD+m84ZukLTak+ugDZYxJJVGvyFOF7X5/LKGOLhq3vA==
X-Received: by 2002:a05:6512:22d2:b0:478:6898:15d6 with SMTP id
 g18-20020a05651222d200b00478689815d6mr47001359lfu.577.1654355531936;
        Sat, 04 Jun 2022 08:12:11 -0700 (PDT)
Received: from [192.168.10.102] (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 d9-20020a19f249000000b0047896b86d99sm2130311lfk.105.2022.06.04.08.12.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jun 2022 08:12:11 -0700 (PDT)
Message-ID: <45cc4ad9-f7bc-e0ff-9252-512bb2d3d55e@gmail.com>
Date: Sat, 4 Jun 2022 17:12:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [swat] [OE-core] perl makefile race - any make experts who can
 help?
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Randy MacLeod <randy.macleod@windriver.com>,
 openembedded-core <openembedded-core@lists.openembedded.org>,
 swat@lists.yoctoproject.org
References: 
 <8f3b92e25906a33c828d61941d45a26448ace79f.camel@linuxfoundation.org>
 <CANNYZj_+jtBR77R8pFONWjOCG31AhsSCHA98MLBV4tY7qvSpkw@mail.gmail.com>
 <16F56B1475C84995.11448@lists.yoctoproject.org>
 <061c22b495d0d2b5830332c5258c82ee30aa67fa.camel@linuxfoundation.org>
 <CAMKF1sr+1oX4KbvHEUMnifKOEdjzbWiJPOThOwnLoeYrK9QS0g@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: 
 <CAMKF1sr+1oX4KbvHEUMnifKOEdjzbWiJPOThOwnLoeYrK9QS0g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Jun 2022 15:12:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166570

On 6/4/22 16:55, Khem Raj wrote:
> 
> 
> On Sat, Jun 4, 2022 at 6:23 AM Richard Purdie 
> <richard.purdie@linuxfoundation.org 
> <mailto:richard.purdie@linuxfoundation.org>> wrote:
> 
>     On Sat, 2022-06-04 at 13:36 +0100, Richard Purdie via
>     lists.yoctoproject.org <http://lists.yoctoproject.org> wrote:
>      > On Sat, 2022-06-04 at 13:51 +0200, Alexander Kanavin wrote:
>      > > Here's something I didn't think of before. Has this occurred
>     anywhere
>      > > else except Ubuntu 18.04?
>      >
>      > https://bugzilla.yoctoproject.org/show_bug.cgi?id=14096
>     <https://bugzilla.yoctoproject.org/show_bug.cgi?id=14096>
>      >
>      > I'm struggling to get the data out from the old builds, one mentions
>      > ubuntu1604, there is an ubuntu1804 on both x86 and arm hosts.
>      >
>      > It is possible this is an ubuntu specific make issue or a make bug.
> 
>     Ubuntu 18.04 uses make 4.1 which is old (Oct 2014).
> 
>     I noticed these patches from 2016:
> 
>     https://git.savannah.gnu.org/cgit/make.git/commit/?id=9bb994e8319c2b153cd3d6d61e2c2882895e7c3a
>     <https://git.savannah.gnu.org/cgit/make.git/commit/?id=9bb994e8319c2b153cd3d6d61e2c2882895e7c3a>
>     https://git.savannah.gnu.org/cgit/make.git/commit/?id=4762480ae9cb8df4878286411f178d32db14eff0
>     <https://git.savannah.gnu.org/cgit/make.git/commit/?id=4762480ae9cb8df4878286411f178d32db14eff0>
> 
>     I think we may want to mandate a modern make for both this class of
>     issues and also perhaps for better loadavg support to keep load under
>     control on the autobuilders.
> 
>     I'm torn, on the one hand we need to test the distros people use, on
>     the other we do need to remove sources of intermittent issues. I think
>     this bug must be some issue with make itself.
> 
>     Adding a make-native dependency to perl would "hurt" people on modern
>     distros...
> 
> 
> Make perhaps does not have many complex dependency needs so it might not 
> be as bad
> 

My master build is already building make-native due to a dependency from 
glibc, since 2018:

https://git.openembedded.org/openembedded-core/commit/?id=0cd89e4af625941f8ab8c033f72f900a2979b304

Don't know if that dependency is still valid though.

Jacob

