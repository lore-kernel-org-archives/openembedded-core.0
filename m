Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2D0EB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 17:28:01 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.30757.1688664474981339990
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 10:27:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=t75IqjiW;
 spf=pass (domain: baylibre.com, ip: 209.85.222.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7659dc74da1so94646285a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 10:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688664474; x=1691256474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uP9QhEd9Yv3qmOe8fsPbjG1kmAGuG6db7DqD5xBDUTc=;
        b=t75IqjiWhzcHgfN2D8Vuqx3v9mDpIxKjsPt9RjmG0Ld/SL22quw/EkfoMwe2IkTpRW
         N70hjXOIkbCeRi8HsElKERNFlJw1if6tYWjX6TgWRneS5z850dr5uG7XtfhGcNdYjthy
         WwdbirXQTzcJ8o4eA89L6FhKJ3tuvGsSxGIGoD5l1t7Ej6A+8owScNnBszMrvwg3Tdjf
         YbAcjXrB9aG1H8GRtS4ekqEXMPRszVvlWRQx+sltT9JTvpI8f2Y7tNgUAHAC1Rv+NETR
         U8gg8EW5qrp8P+KNnVPsHqB31Nfwk/xA430sULtASSeeENO/LDyuZmIhAFQFZBN8SJDI
         6xqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688664474; x=1691256474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uP9QhEd9Yv3qmOe8fsPbjG1kmAGuG6db7DqD5xBDUTc=;
        b=MMsgHZrfYUPr8DXhvB+QbUWHdhLQHDDc8OHJH5xSNvK7YeVybfHj43oSNwkRlyRAUR
         VDyXY6PpH2RJGylsgKJJz/U/d4q0msAg4JgP3YzRJ9I8DvptyszKgN+i90jj6/GpMGvW
         kQjOBPdWw9AK9fmIhjcRWnaKcaMZjEFBsmoA5rQnQglwm43+iLm+Zw8tPWSjYK0ZOH90
         n3Ffx3aTPWS0HUhgZ8/+hoCZIl1Ats88V36ywjnJPjGEt5BPkOahU7u4KWbiR1hduC/i
         S6i6v6HhRrBMH1ftUQcLVLobj20A8dH1YqjFMns/giT7EiS+aWcEv8cdlhL5Qdv2MwzK
         78hg==
X-Gm-Message-State: ABy/qLZ9dNPPPj3YEx68lBCD/hOa1xB6BMto22H0Y8mxmA6tgkvbgE48
	65MTBM7+jnTStxJtIQYA+MhdmUdTe/1lNav/YpE=
X-Google-Smtp-Source: APBJJlE6F6vfUTPKrFxwovPauAfUlxBnP+tYn71OTBHpb3J6iXv78ePIYRFQ/pwd2wKdvdYZF5knsQ==
X-Received: by 2002:a05:620a:d8b:b0:75b:23a0:e7e2 with SMTP id q11-20020a05620a0d8b00b0075b23a0e7e2mr2448869qkl.67.1688664473978;
        Thu, 06 Jul 2023 10:27:53 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id k5-20020ae9f105000000b00766fbeb3e7csm915495qkg.132.2023.07.06.10.27.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 10:27:53 -0700 (PDT)
Message-ID: <bc0b2289-3741-ab64-e80f-bd4755a218f5@baylibre.com>
Date: Thu, 6 Jul 2023 13:27:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [OE-core][PATCH] python3: disable test_cppext ptest
Content-Language: en-US
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20230706134556.2824413-1-tgamblin@baylibre.com>
 <77240D4C-769F-4AE2-9D89-7308ABB9761E@arm.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <77240D4C-769F-4AE2-9D89-7308ABB9761E@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 17:28:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183985


On 2023-07-06 10:50, Ross Burton wrote:
> On 6 Jul 2023, at 14:45, Trevor Gamblin via lists.openembedded.org <tgamblin=baylibre.com@lists.openembedded.org> wrote:
>> + class TestCPPExt(unittest.TestCase):
>> ++    @unittest.skip('requires gcc, g++ - excessive for ptest build')
>> +     def test_build_cpp11(self):
>> +         self.check_build(False, '_testcpp11ext')
>> +
>> ++    @unittest.skip('requires gcc, g++ - excessive for ptest build')
>> +     def test_build_cpp03(self):
>> +         self.check_build(True, '_testcpp03ext’)
> So torn.
>
> First, it’s probably better to do the excludes in the run-ptest script instead, python3 -mtest takes an —exclude argument so you can filter out tests there.
>
> Also, it seems that the test should be skipped if the tools it needs are not present, and that’s potentially upstreamable.
>
> As Alex says, we’ve several other ptests that pull the toolchain in, so I’m not against adding the dependencies.
Alright. I'll look at the other options for skipping the tests for now. 
I'll wait before submitting again just to be sure I wasn't 
misunderstanding the original conversation.
>
> Ross
>

