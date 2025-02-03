Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD8EC02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 11:24:28 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.85506.1738581860699012690
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 03:24:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ea8OMxjQ;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-438a39e659cso29174815e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 03:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738581859; x=1739186659; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ocVWdLT9rbbd1a2kGZBCLV7sjyQOlhfzoFEz4wbqGxo=;
        b=Ea8OMxjQvbKI6q5CX2L+YNW/GCyS42ZinId0zbiTlSl+0TmVNG1x/YG7B6sRTKFx/U
         cnNpmaKLXSWoJUc3B06qqcHeN6PNr4/20cgJ/3HWEWhKqpQCEpPVE+I/H637oaacC22Q
         9sbHSbUQmhqdCeldOWCbGkhaj0WwYPFtO4s/Yj3qB8A93sCDtDU7kyC+gnSV8BhdUfkL
         DuS2api33mKUJYuk/H0lhEuD1XjeTQGul/Nxy7fcnABs31PQSbKuFut+7EQ/j6jSNFH+
         mrY+guTT06Mw2RBEAEalWlt96yF5J16aHRnpiGdjGNZx63KIblPAWO1nV4K1ppFITUef
         p3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738581859; x=1739186659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ocVWdLT9rbbd1a2kGZBCLV7sjyQOlhfzoFEz4wbqGxo=;
        b=cAeG/o2Q61ygjOjvUD6KnGGELLyKGBwvMFtd6aWNVOfut21SPP8mofV1kocFrAXQ4V
         tophzaMUjYJPYCbh504cGhN1XPcphJXKp7a5ZTik7mpyUYOW+y9PnuT/Q5g5M9k+w8jq
         X/Gunrv6GPInEb6a0d0jSazy/D+dLzMycIW82740V4BdDX55mrwFa/rq8w8zh2b/Z7fL
         yKNraGpI2WYeRNedj5q1bC0uPpQzkQAmsNo3V737akugvK4KyeiJMhV1DbNY8oudLzU5
         Je2UJx0xr9slZZJ2VC6S2FwbbjpZ5Lh4m9JD1rZS+osZpBcay3V8hETa0N1wZlmq4Yki
         KaoA==
X-Forwarded-Encrypted: i=1; AJvYcCUrK/mRBOMP6J3lMydWYwgugeapa3m5PZYJHZtY34aJKMjfIhsCcDxpDU6H9+SHewcwR4j3dyI7nlbYtquuDXeoPQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzlPn3yDsc1u+lQOjD8eWRR1J23uIXdKBl3Gb4i4RfMbMFo4C5+
	S4yxwnWYs71WX2E27+VK7w15ReogzaIBlYvhkxJPLUn+Z/+7c3Lu
X-Gm-Gg: ASbGncv0gLxTsddOjtYeYXgFQ2dVmFYKrNpVPHUjKPvAUyxW0UXCtlZRda7jE81QNK6
	mFcVMFVPMGxyMkrwCsd4pS9hwYVfZVhb8DD+STiTh/68YS7dA/WjsmA99CNHvL9UsseyJN7IIL5
	HSSzwzK1dTnsyYxHYIYPcn735LO6c1hzathyxmkCsv6AdMz7jK7usFuH6uVIsrT/IEdHOpaeACb
	hO2R5G+e5u4NdTRmgQ3J2HXWEWsxe7UVlca/mrKruxjrh7OC7SVEJp2f815AyDuoUNz3AwMGKkO
	2rjj3QQuYJoiA+9ANnQ9y5kYvThDt4nlj50m2g9FbUgaMwzK
X-Google-Smtp-Source: AGHT+IGOTuGL1BaAmCh9qvuyxyI182Sh88ni3cxKkhBcWZnv00sV4Kd4FZF4uSGRn9HpBP0Mily8/Q==
X-Received: by 2002:a5d:648b:0:b0:38a:5ce8:df51 with SMTP id ffacd0b85a97d-38c51931b2cmr15933899f8f.2.1738581857293;
        Mon, 03 Feb 2025 03:24:17 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2ede0sm188551505e9.21.2025.02.03.03.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 03:24:16 -0800 (PST)
Message-ID: <0be23bce-a08c-4b6d-a8d4-a78f91a6be87@gmail.com>
Date: Mon, 3 Feb 2025 12:24:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH v4 2/2] oeqa/selftest/cases/signing.py: Re-enable
 self-test
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org,
 Randy MacLeod <randy.macleod@windriver.com>, Khem Raj <raj.khem@gmail.com>
References: <D7FH5IEPPGUA.CNZMYM7LM2F4@bootlin.com>
 <20250131064352.2613105-1-zboszor@gmail.com>
 <20250131064352.2613105-2-zboszor@gmail.com>
 <D7H6P74CVGDM.3LTRAMF91XPEH@bootlin.com>
 <182057ACF258490B.1760@lists.openembedded.org>
 <e75d75e4-2b55-4199-b2ee-e9eb26abafca@gmail.com>
 <CANNYZj__itq2zLjW2_ZN4zGw0dvw2oYhXtSVGBOxpKEqZkmALQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CANNYZj__itq2zLjW2_ZN4zGw0dvw2oYhXtSVGBOxpKEqZkmALQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 11:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210644

2025. 02. 03. 12:18 keltezéssel, Alexander Kanavin írta:
> I would recommend you send this change as a proper patch. You should
> not be asking integrators to produce patches out of ad hoc mailing
> list tweaks.

I implicitly asked to switch the host distro. :)

Seriously, I will send it as a proper patch soon.

> Alex
>
> On Mon, 3 Feb 2025 at 11:11, Böszörményi Zoltán <zboszor@gmail.com> wrote:
>> 2025. 02. 02. 9:44 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
>>> 2025. 02. 01. 15:37 keltezéssel, Mathieu Dubois-Briand írta:
>>>> On Fri Jan 31, 2025 at 7:43 AM CET, Zoltán Böszörményi wrote:
>>>>> Enable building rpm with rpm-seqouia for the test.
>>>>>
>>>>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>>>>> ---
>>>> Sorry, I still get some errors while building:
>>>>
>>>> 2025-02-01 14:28:32,979 - oe-selftest - INFO - 9: 40/54 602/618 (56.20s) (0 failed)
>>>> (signing.Signing.test_signing_packages)
>>>> 2025-02-01 14:28:32,979 - oe-selftest - INFO -
>>>> testtools.testresult.real._StringException: Traceback (most recent call last):
>>>>     File
>>>> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/selftest/cases/signing.py",
>>>> line 113, in test_signing_packages
>>>>       runCmd('%s/rpmkeys --define "_dbpath %s" --import %s' %
>>>>     File
>>>> "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/utils/commands.py",
>>>> line 214, in runCmd
>>>>       raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" %
>>>> (command, result.status, exc_output))
>>>> AssertionError: Command
>>>> '/srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3250811/tmp/work/core2-64-poky-linux/ed/1.20.2/recipe-sysroot-native/usr/bin/rpmkeys
>>>> --define "_dbpath /tmp/oeqa-rpmdbsj05eco3" --import
>>>> /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3250811/meta-selftest/files/signing/key.pub'
>>>> returned non-zero exit status 1:
>>>> error: Certificate 7B31316B5D64AD52:
>>>>     Policy rejects 7B31316B5D64AD52: No binding signature at time 2025-02-01T14:28:26Z
>>>> error:
>>>> /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3250811/meta-selftest/files/signing/key.pub:
>>>> key 1 import failed.
>>>>
>>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/893/steps/14/logs/stdio
>>>>
>>>> Do you mind having a look at this ?
>>> I have run the self test on a Fedora 41 host and it succeeded there.
>>>
>>> Probably you need to fix the crypto policy to allow such a cert with a
>>> "no binding signature" or replace the cert.
>>>
>>> This github issue may have some useful pointers:
>>> https://github.com/rpm-software-management/rpm-sequoia/issues/46
>> Can you please try this below?
>>
>> Setting the envvar SEQUOIA_CRYPTO_POLICY to an empty string
>> will use the built-in default policy. See
>> https://github.com/rpm-software-management/rpm-sequoia/blob/main/src/lib.rs#L54
>>
>> ===============================================
>> diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
>> index 51d1c3fa64..9a820ebc72 100644
>> --- a/meta/lib/oeqa/selftest/cases/signing.py
>> +++ b/meta/lib/oeqa/selftest/cases/signing.py
>> @@ -71,7 +71,6 @@ class Signing(OESelftestTestCase):
>>            """
>>            import oe.packagedata
>>
>> -        self.skipTest('This test requires rpm-sequoia support in rpm')
>>            self.setup_gpg()
>>
>>            package_classes = get_bb_var('PACKAGE_CLASSES')
>> @@ -84,9 +83,14 @@ class Signing(OESelftestTestCase):
>>            feature += 'RPM_GPG_PASSPHRASE = "test123"\n'
>>            feature += 'RPM_GPG_NAME = "testuser"\n'
>>            feature += 'GPG_PATH = "%s"\n' % self.gpg_dir
>> +        feature += 'PACKAGECONFIG:append:pn-rpm-native = " sequoia"\n'
>> +        feature += 'PACKAGECONFIG:append:pn-rpm = " sequoia"\n'
>>
>>            self.write_config(feature)
>>
>> +        # Test rpm-sequoia's default built-in policy
>> +        os.environ['SEQUOIA_CRYPTO_POLICY'] = ''
>> +
>>            bitbake('-c clean %s' % test_recipe)
>>            bitbake('-f -c package_write_rpm %s' % test_recipe)
>>
>> @@ -152,6 +156,9 @@ class Signing(OESelftestTestCase):
>>
>>            self.write_config(feature)
>>
>> +        # Test rpm-sequoia's default built-in policy
>> +        os.environ['SEQUOIA_CRYPTO_POLICY'] = ''
>> +
>>            with self.create_new_builddir(os.environ['BUILDDIR'], builddir):
>>
>>                os.environ["PATH"] = nsysroot + ":" + os.environ["PATH"]
>> @@ -198,6 +205,9 @@ class LockedSignatures(OESelftestTestCase):
>>            feature += 'SIGGEN_LOCKEDSIGS_TASKSIG_CHECK = "warn"\n'
>>            self.write_config(feature)
>>
>> +        # Test rpm-sequoia's default built-in policy
>> +        os.environ['SEQUOIA_CRYPTO_POLICY'] = ''
>> +
>>            # Build a locked recipe
>>            bitbake(test_recipe)
>>
>> ===============================================
>>
>> It succeeded for me:
>>
>> $ oe-selftest -r signing
>> ...
>> 2025-02-03 10:53:11,900 - oe-selftest - INFO - oe-selftest () - Ran 3 tests in 2801.617s
>> 2025-02-03 10:53:11,900 - oe-selftest - INFO - oe-selftest - OK - All required tests
>> passed (successes=3, skipped=0, failures=0, errors=0)
>>
>> As for an actual crypto policy for rpm-sequoia, I am not sure
>> how appropriate it would be to create a recipe for Fedora's
>> crypto-policies package in Yocto.
>>


