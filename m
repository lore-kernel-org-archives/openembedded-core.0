Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBD6C636CD
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 15:02:22 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.25776.1675263740184338382
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 07:02:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=g2K+wm2/;
 spf=pass (domain: baylibre.com, ip: 209.85.221.41, mailfrom: lrannou@baylibre.com)
Received: by mail-wr1-f41.google.com with SMTP id h16so17561926wrz.12
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 07:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=75umPJM2hhPIddmKVqh5BAb64Zl1T8lmAKI3D8XWvFI=;
        b=g2K+wm2/ig5mq4YQ3EHx/NmUSjT/cjUemEKzEc/xDbdSW1q2CGNg7AwejOa7Ekklfk
         LwDawKw0ZS9HX6uqMVfWk74EldQr6MRgW9lZ/pjlaisA/7pP64dIk1jwJGU1K3InlePe
         j9eiCfff34Al5QBfupEPBhtQXloABfUr7OMaMgYyvx7pxyQ25EAC/f4ZuhpXLBJb8ZiH
         10wXQwMECCwjTmxdOGEkg4i+8FliZJcwIjSG1L1NRrrwh4dH++H8jez8lw6C59D53Dpu
         KOjmkX3NBchRKQLHXEAn1nZlwiCmZBCciJ48S88oK5G1VOr58x+eles8Zh1CjfVgp3CB
         lbJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=75umPJM2hhPIddmKVqh5BAb64Zl1T8lmAKI3D8XWvFI=;
        b=xAXpGH1eWZJDbEejfmpXjEIwUr/2Pj7OfWBf4rj6WCj3/ZXjzUfQyD2zyRyGYxprtI
         LRELjlJAb6WU2wFAJwYHo5ww/eazyNz7drX7RrAUqFJmbH9uatB6S3zgopp/GFgaV6JO
         XZu4z0/ZtGr1eeEMp1GlCL/qdCRvSEdt9sa3/xVxK3BS37gNDPw3mQR8OBBXOrhs+GsJ
         zNXLhN8H73aQm+qddK8Ntt/2KvjHvCKFaQwLQWYENt4h754SUSs7Bcgchc3aHFfI5piu
         dj8NCjL6E/waQ1/h+cuvrYyFP1vXzIK/9F3zloP1sQdlvwBkdEviHVVHkKy+m5GhCbCT
         W0qA==
X-Gm-Message-State: AO0yUKWRN51pywDK6dMsyTefFaLKr5XKdmSZ+wm7xSknhYIkfpaRlji1
	N6P7fL9FdgI2iw2z+NkQaGyoug==
X-Google-Smtp-Source: AK7set+7STFZFPnt88dbA+zL9la4d4lHTmS5iqjFtmFCoGLPROxtFkQBV3caakKhuWbROrAHdIXU7A==
X-Received: by 2002:a5d:5b1a:0:b0:2bf:d3dd:6f65 with SMTP id bx26-20020a5d5b1a000000b002bfd3dd6f65mr2748315wrb.41.1675263738028;
        Wed, 01 Feb 2023 07:02:18 -0800 (PST)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id l7-20020a5d5607000000b0029a06f11022sm17418892wrv.112.2023.02.01.07.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 07:02:17 -0800 (PST)
Message-ID: <92bff1e0-aa88-c713-049f-51f074569a55@baylibre.com>
Date: Wed, 1 Feb 2023 16:02:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [OE-core] [PATCH v2] oeqa/selftest/locales: Create selftest for
 locales generation
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20230127153344.2868589-1-lrannou@baylibre.com>
 <b3320afb6afb6508d5f4d0f3ceb75e87e97ed450.camel@linuxfoundation.org>
Cc: "khilman@baylibre.com" <khilman@baylibre.com>
From: Louis Rannou <lrannou@baylibre.com>
In-Reply-To: <b3320afb6afb6508d5f4d0f3ceb75e87e97ed450.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 15:02:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176554



On 01/02/2023 14:49, Richard Purdie wrote:
> On Fri, 2023-01-27 at 16:33 +0100, Louis Rannou wrote:
>> From: Louis Rannou <lrannou@baylibre.com>
>>
>> [YOCTO #9070]
>>
>> Add a new selftest to validate the locales generation. This selftest builds a
>> complete target with GLIBC_GENERATE_LOCALES, IMAGE_LINGUAS,
>> ENABLE_BINARY_LOCALE_GENERATION set.
>>
>> The tests has two cases: GLIBC_GENERATE_LOCALES=1 and
>> GLIBC_GENERATE_LOCALES=0. When set to 1, we check that the locales exist in the
>> local-archive and if it does exist for the glibc. When set to 0, we check it
>> does not.
>>
>> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
>> ---
>>   meta/lib/oeqa/selftest/cases/locales.py | 81 +++++++++++++++++++++++++
>>   1 file changed, 81 insertions(+)
>>   create mode 100644 meta/lib/oeqa/selftest/cases/locales.py
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/locales.py b/meta/lib/oeqa/selftest/cases/locales.py
>> new file mode 100644
>> index 0000000000..f053cc8e31
>> --- /dev/null
>> +++ b/meta/lib/oeqa/selftest/cases/locales.py
>> @@ -0,0 +1,81 @@
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +
>> +from oeqa.selftest.case import OESelftestTestCase
>> +from oeqa.core.decorator import OETestTag
>> +from oeqa.utils.commands import bitbake, runqemu
>> +
>> +class LocalesTest(OESelftestTestCase):
>> +
>> +    @OETestTag("runqemu")
>> +    def test_locales_on(self):
>> +        """
>> +        Summary: Test the locales are generated
>> +        Expected: 1. Check the locale exist in the locale-archive
>> +                  2. Check the locale exist for the glibc
>> +                  3. Check the locale can be generated
>> +        Product: oe-core
>> +        Author: Louis Rannou <lrannou@baylibre.com>
>> +        AutomatedBy: Louis Rannou <lrannou@baylibre.com>
>> +        """
>> +
>> +        features = []
>> +        features.append('EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login"')
>> +        features.append('IMAGE_INSTALL:append = " glibc-utils localedef"')
>> +        features.append('GLIBC_GENERATE_LOCALES = "en_US.UTF-8 fr_FR.UTF-8"')
>> +        features.append('IMAGE_LINGUAS:append = " en-us fr-fr"')
>> +        features.append('ENABLE_BINARY_LOCALE_GENERATION = "1"')
>> +        self.write_config("\n".join(features))
>> +
>> +        # Build a core-image-minimal
>> +        bitbake('core-image-minimal')
>> +
>> +        with runqemu("core-image-minimal", ssh=False, runqemuparams='nographic') as qemu:
>> +            cmd = "locale -a"
>> +            status, output = qemu.run_serial(cmd)
>> +            # output must includes fr_FR or fr_FR.UTF-8
>> +            self.assertEqual(status, 1, msg='localedef test failed: output: %s' % output)
>> +            self.assertIn("fr_FR", output, msg='locale -a test failed: output: %s' % output)
>> +
>> +            cmd = "localedef --list-archive -v"
>> +            status, output = qemu.run_serial(cmd)
>> +            # output must includes fr_FR.utf8
>> +            self.assertEqual(status, 1, msg='localedef test failed: output: %s' % output)
>> +            self.assertIn("fr_FR.utf8", output, msg='locale -a test failed: output: %s' % output)
>> +
>> +    @OETestTag("runqemu")
>> +    def test_locales_off(self):
>> +        """
>> +        Summary: Test the locales are not generated
>> +        Expected: 1. Check the locale does not exist in the locale-archive
>> +                  2. Check the locale does not exist for the glibc
>> +                  3. Check the locale cannot be generated
>> +        Product: oe-core
>> +        Author: Louis Rannou <lrannou@baylibre.com>
>> +        AutomatedBy: Louis Rannou <lrannou@baylibre.com>
>> +        """
>> +
>> +        features = []
>> +        features.append('EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login"')
>> +        features.append('IMAGE_INSTALL:append = " glibc-utils localedef"')
>> +        features.append('GLIBC_GENERATE_LOCALES = "en_US.UTF-8 fr_FR.UTF-8"')
>> +        features.append('IMAGE_LINGUAS:append = " en-us fr-fr"')
>> +        features.append('ENABLE_BINARY_LOCALE_GENERATION = "0"')
>> +        self.write_config("\n".join(features))
>> +
>> +        # Build a core-image-minimal
>> +        bitbake('core-image-minimal')
>> +
>> +        with runqemu("core-image-minimal", ssh=False, runqemuparams='nographic') as qemu:
>> +            cmd = "locale -a"
>> +            status, output = qemu.run_serial(cmd)
>> +            # output must not includes fr_FR or fr_FR.UTF-8
>> +            self.assertEqual(status, 1, msg='localedef test failed: output: %s' % output)
> 
> This should really say locale instead of localedef here to be clear
> which command the error is coming from.
> 
>> +            self.assertNotIn("fr_FR", output, msg='locale -a test failed: output: %s' % output)
>> +
>> +            cmd = "localedef --list-archive -v"
>> +            status, output = qemu.run_serial(cmd)
>> +            # output must not includes fr_FR.utf8
>> +            self.assertEqual(status, 1, msg='localedef test failed: output: %s' % output)
>> +            self.assertNotIn("fr_FR.utf8", output, msg='locale -a test failed: output: %s' % output)
> 
> We did run this through tests on the autobuilder and the tests did
> pass. I did wonder rather than duplicate the whole test with a line
> change, could we share the code between the two?
I think the things we can share are only about the features 
configuration and the bitbake command. Going further would require to 
create an if/else statement for the assert. I think this will not 
simplify the code.

> 
> I then start looking at the code and I'm a bit worried the locales are
> not present when binary locale generation is turned off as I think they
> should be. Going from memory, I thought that they should be generated
> on target at first boot in that case so they should be present in both
> cases.

I am not sure to understand. But if you suppose there should be 
something in /usr/share/i18n/locales, there is nothing there.

> 
> To keep things simple, lets merge the first case in and file a bug for
> the other case? I think we'll need to investigate that and check
> whether we're broken something somewhere.

Ok, I'll send a v3 with the first part only. Let's forget about the code 
sharing before we get clear about what the opposite test will be.

Thank you,
Louis

