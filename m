Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7C6C61DA4
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 10:42:05 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.11741.1675334519638791474
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 02:42:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=XlKNtshU;
 spf=pass (domain: baylibre.com, ip: 209.85.128.41, mailfrom: lrannou@baylibre.com)
Received: by mail-wm1-f41.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so3370081wmb.4
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 02:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3d5sK7xHIk8BkiL/XeV7AhRCGUCnh8EWXvSKRuQ9BOg=;
        b=XlKNtshUWZPtuMpHBuFUVGj+e9cf//V5xghSvu7ZELsA4yTIAjdmBCQB0SuSu71ZQf
         jv/mdqcOGhZa+Ca/egw+lJnLD6MtfmtBh3ZDRVfySUr40zug9b9oDKgnfRyE1p9s8fKX
         mEE2oRzxHflYEi/6fzoPnXQtB/lrxRsTrzJrlikvV+XxI0Pu3ZzFyQDROfLdUYkUI8b7
         i346fbDR56JddCwlGcRaUVIdltlui7OpHE3nbS5zxsC2x6zGL+5nVt5JprxR0wnV89PD
         iRvoN30GZXrVg2IKDPXry0Hklw0MOFnOIk5/xyiTGD85cvgmOp+6yFpUUDMsSu4h6V2O
         j3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3d5sK7xHIk8BkiL/XeV7AhRCGUCnh8EWXvSKRuQ9BOg=;
        b=eZCaZC5N7OAgwm+kYpUC/a3YUxKJm8JzgTKqxp2eUbMBkzTd1pXh4DIu2XSPVCYXGw
         p6/SwimyPZytcBF0pvj75Kcbb92zl9t7tpB5czXgWFXr0yyBVHzcW6ODi7WpV75gMErS
         9kgAUsR+cjXtarHPzYTirj4j4i2OXXERDwECrG85HZP3fCCOoahtvWnkU3IOCyP/+b6e
         JO29n4cry8gm6haZPNW+7H/UpGHQwsaimAeKs5L2QnQ/8Uy81VkWiKrO0KUrsykllDDO
         Mla9t/w2jT2PKWcrTYgDKdZX4+dXxz8DLxQKdva9FR0flPdyv19sY9HI51aidBjCX3sL
         vEYg==
X-Gm-Message-State: AO0yUKXlJyR2zOLl3YXwWHJzPGusG2cfM20w12i2SwjxQ+nL41LTi8Wd
	oj0ZRMSft3E2vcp8mkUyaj4kbg==
X-Google-Smtp-Source: AK7set9GXUz8bGnI5EKg1kJi1vp49q/Vf485hKlgRQk4G+Vrx61DxJHKTOCNZ0cTZHOLxx3nL6GoTw==
X-Received: by 2002:a05:600c:3513:b0:3df:b5ae:5289 with SMTP id h19-20020a05600c351300b003dfb5ae5289mr2323380wmq.8.1675334517646;
        Thu, 02 Feb 2023 02:41:57 -0800 (PST)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id h18-20020a05600c2cb200b003dd1bd66e0dsm4811617wmc.3.2023.02.02.02.41.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 02:41:57 -0800 (PST)
Message-ID: <1749af1e-dce3-ec14-32a1-fe5a50848f25@baylibre.com>
Date: Thu, 2 Feb 2023 11:41:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [OE-core] [PATCH v2] oeqa/selftest/locales: Create selftest for
 locales generation
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: "khilman@baylibre.com" <khilman@baylibre.com>
References: <20230127153344.2868589-1-lrannou@baylibre.com>
 <b3320afb6afb6508d5f4d0f3ceb75e87e97ed450.camel@linuxfoundation.org>
 <92bff1e0-aa88-c713-049f-51f074569a55@baylibre.com>
 <913abc23f1ba2691f7c676b182b1ec0303e5d30d.camel@linuxfoundation.org>
From: Louis Rannou <lrannou@baylibre.com>
In-Reply-To: <913abc23f1ba2691f7c676b182b1ec0303e5d30d.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 10:42:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176687

On 01/02/2023 18:57, Richard Purdie wrote:
> On Wed, 2023-02-01 at 16:02 +0100, Louis Rannou wrote:
>>
>> On 01/02/2023 14:49, Richard Purdie wrote:
>>> On Fri, 2023-01-27 at 16:33 +0100, Louis Rannou wrote:
>>>> From: Louis Rannou <lrannou@baylibre.com>
>>>>
>>>> [YOCTO #9070]
>>>>
>>>> Add a new selftest to validate the locales generation. This selftest builds a
>>>> complete target with GLIBC_GENERATE_LOCALES, IMAGE_LINGUAS,
>>>> ENABLE_BINARY_LOCALE_GENERATION set.
>>>>
>>>> The tests has two cases: GLIBC_GENERATE_LOCALES=1 and
>>>> GLIBC_GENERATE_LOCALES=0. When set to 1, we check that the locales exist in the
>>>> local-archive and if it does exist for the glibc. When set to 0, we check it
>>>> does not.
>>>>
>>>> Signed-off-by: Louis Rannou <lrannou@baylibre.com>
>>>> ---
>>>>    meta/lib/oeqa/selftest/cases/locales.py | 81 +++++++++++++++++++++++++
>>>>    1 file changed, 81 insertions(+)
>>>>    create mode 100644 meta/lib/oeqa/selftest/cases/locales.py
>>>>
>>>> diff --git a/meta/lib/oeqa/selftest/cases/locales.py b/meta/lib/oeqa/selftest/cases/locales.py
>>>> new file mode 100644
>>>> index 0000000000..f053cc8e31
>>>> --- /dev/null
>>>> +++ b/meta/lib/oeqa/selftest/cases/locales.py
>>>> @@ -0,0 +1,81 @@
>>>> +#
>>>> +# SPDX-License-Identifier: MIT
>>>> +#
>>>> +
>>>> +from oeqa.selftest.case import OESelftestTestCase
>>>> +from oeqa.core.decorator import OETestTag
>>>> +from oeqa.utils.commands import bitbake, runqemu
>>>> +
>>>> +class LocalesTest(OESelftestTestCase):
>>>> +
>>>> +    @OETestTag("runqemu")
>>>> +    def test_locales_on(self):
>>>> +        """
>>>> +        Summary: Test the locales are generated
>>>> +        Expected: 1. Check the locale exist in the locale-archive
>>>> +                  2. Check the locale exist for the glibc
>>>> +                  3. Check the locale can be generated
>>>> +        Product: oe-core
>>>> +        Author: Louis Rannou <lrannou@baylibre.com>
>>>> +        AutomatedBy: Louis Rannou <lrannou@baylibre.com>
>>>> +        """
>>>> +
>>>> +        features = []
>>>> +        features.append('EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login"')
>>>> +        features.append('IMAGE_INSTALL:append = " glibc-utils localedef"')
>>>> +        features.append('GLIBC_GENERATE_LOCALES = "en_US.UTF-8 fr_FR.UTF-8"')
>>>> +        features.append('IMAGE_LINGUAS:append = " en-us fr-fr"')
>>>> +        features.append('ENABLE_BINARY_LOCALE_GENERATION = "1"')
>>>> +        self.write_config("\n".join(features))
>>>> +
>>>> +        # Build a core-image-minimal
>>>> +        bitbake('core-image-minimal')
>>>> +
>>>> +        with runqemu("core-image-minimal", ssh=False, runqemuparams='nographic') as qemu:
>>>> +            cmd = "locale -a"
>>>> +            status, output = qemu.run_serial(cmd)
>>>> +            # output must includes fr_FR or fr_FR.UTF-8
>>>> +            self.assertEqual(status, 1, msg='localedef test failed: output: %s' % output)
>>>> +            self.assertIn("fr_FR", output, msg='locale -a test failed: output: %s' % output)
>>>> +
>>>> +            cmd = "localedef --list-archive -v"
>>>> +            status, output = qemu.run_serial(cmd)
>>>> +            # output must includes fr_FR.utf8
>>>> +            self.assertEqual(status, 1, msg='localedef test failed: output: %s' % output)
>>>> +            self.assertIn("fr_FR.utf8", output, msg='locale -a test failed: output: %s' % output)
>>>> +
>>>> +    @OETestTag("runqemu")
>>>> +    def test_locales_off(self):
>>>> +        """
>>>> +        Summary: Test the locales are not generated
>>>> +        Expected: 1. Check the locale does not exist in the locale-archive
>>>> +                  2. Check the locale does not exist for the glibc
>>>> +                  3. Check the locale cannot be generated
>>>> +        Product: oe-core
>>>> +        Author: Louis Rannou <lrannou@baylibre.com>
>>>> +        AutomatedBy: Louis Rannou <lrannou@baylibre.com>
>>>> +        """
>>>> +
>>>> +        features = []
>>>> +        features.append('EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login"')
>>>> +        features.append('IMAGE_INSTALL:append = " glibc-utils localedef"')
>>>> +        features.append('GLIBC_GENERATE_LOCALES = "en_US.UTF-8 fr_FR.UTF-8"')
>>>> +        features.append('IMAGE_LINGUAS:append = " en-us fr-fr"')
>>>> +        features.append('ENABLE_BINARY_LOCALE_GENERATION = "0"')
>>>> +        self.write_config("\n".join(features))
>>>> +
>>>> +        # Build a core-image-minimal
>>>> +        bitbake('core-image-minimal')
>>>> +
>>>> +        with runqemu("core-image-minimal", ssh=False, runqemuparams='nographic') as qemu:
>>>> +            cmd = "locale -a"
>>>> +            status, output = qemu.run_serial(cmd)
>>>> +            # output must not includes fr_FR or fr_FR.UTF-8
>>>> +            self.assertEqual(status, 1, msg='localedef test failed: output: %s' % output)
>>>
>>> This should really say locale instead of localedef here to be clear
>>> which command the error is coming from.
>>>
>>>> +            self.assertNotIn("fr_FR", output, msg='locale -a test failed: output: %s' % output)
>>>> +
>>>> +            cmd = "localedef --list-archive -v"
>>>> +            status, output = qemu.run_serial(cmd)
>>>> +            # output must not includes fr_FR.utf8
>>>> +            self.assertEqual(status, 1, msg='localedef test failed: output: %s' % output)
>>>> +            self.assertNotIn("fr_FR.utf8", output, msg='locale -a test failed: output: %s' % output)
>>>
>>> We did run this through tests on the autobuilder and the tests did
>>> pass. I did wonder rather than duplicate the whole test with a line
>>> change, could we share the code between the two?
>> I think the things we can share are only about the features
>> configuration and the bitbake command. Going further would require to
>> create an if/else statement for the assert. I think this will not
>> simplify the code.
>>
>>>
>>> I then start looking at the code and I'm a bit worried the locales are
>>> not present when binary locale generation is turned off as I think they
>>> should be. Going from memory, I thought that they should be generated
>>> on target at first boot in that case so they should be present in both
>>> cases.
>>
>> I am not sure to understand. But if you suppose there should be
>> something in /usr/share/i18n/locales, there is nothing there.
>>
>>>
>>> To keep things simple, lets merge the first case in and file a bug for
>>> the other case? I think we'll need to investigate that and check
>>> whether we're broken something somewhere.
>>
>> Ok, I'll send a v3 with the first part only. Let's forget about the code
>> sharing before we get clear about what the opposite test will be.
> 
> I was able to take a quick look at this. The locale generation on
> target is broken, it throws errors upon boot. I was able to make it
> work with this patch:
> 
> diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
> index 7f70b3ca4f..c39007b573 100644
> --- a/meta/recipes-core/glibc/glibc-locale.inc
> +++ b/meta/recipes-core/glibc/glibc-locale.inc
> @@ -60,7 +60,7 @@ DESCRIPTION:localedef = "glibc: compile locale definition files"
>   # FILES:glibc-gconv will not be automatically extended in multilib.
>   # Explicitly add ${MLPREFIX} for FILES:glibc-gconv.
>   FILES:${MLPREFIX}glibc-gconv = "${libdir}/gconv/*"
> -FILES:localedef = "${bindir}/localedef"
> +FILES:localedef = "${bindir}/localedef ${libdir}/locale"
>   
>   LOCALETREESRC = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
>   
> @@ -87,6 +87,7 @@ do_install() {
>          find ${D}${libdir} -type d -empty -delete
>          copy_locale_files ${datadir}/locale 0644
>          install -m 0644 ${LOCALETREESRC}/SUPPORTED ${WORKDIR}/SUPPORTED
> +       install -d ${D}${libdir}/locale
>   }
>   
>   inherit libc-package
> 
> could you see if the same test will now work with that patch applied?
> I'm happy to have the basic test but if we can fix this and stop it
> regressing that would be even better.

The patch does not change the result. I have actually nothing in the 
image/usr/lib/locale directory.

I am not sure to understand... If I add to my image the packages 
glibc-localedata-fr-fr and glibc-charmap-utf-8, then I have something in 
/usr/share/i18n/locales and /usr/share/i18n/charmaps, and then I can 
generate the locales with `localedef -c -i fr_FR -f UTF-8 fr_FR`

In the end, I believe this is correct that I have nothing in 
{libdir}/locale, but perhaps the settings IMAGE_LINGUAS (or 
GLIBC_GENERATE_LOCALES ?) should specify a rdepend to the locale/charmap 
packages, so the locales would exist in the image, but would not be 
generated at build.

Regards,
Louis

