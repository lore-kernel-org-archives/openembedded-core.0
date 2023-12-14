Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD852C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 18:58:20 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.31562.1702580299443993480
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 10:58:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=kM0X18vy;
 spf=pass (domain: baylibre.com, ip: 209.85.128.46, mailfrom: pidge@baylibre.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40c2718a768so82224485e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 10:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1702580297; x=1703185097; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nuB2VS0vOEytiP8nxnbnQZbhdAR+4JIEPVDZI9Ugw2w=;
        b=kM0X18vyxIY/BxUVl11TndQ5P53MpzPZy28KrwuhsPT2MXEA/3vjY3iCTZGjhWFzYs
         TQVVZ3Z/gy8t8LYnbTlJ2xlf5JoMLC4lNvQqJsvEJGwcjpeKVnJtocobxrL85l1VKbHw
         Bt+Cw8QZ20MQIHoNWfk0hh9Ky5Vv6qO0B4wueeE5RnLnpKXACra8MvL5U240k/oK4nqL
         zTEvK/kDmSN6ENNl+tDoJj9eAJmpD2BKPkFNLdtA+uPKXZOv/We5ya3y26l5euYVRFQt
         GOy3O0MRfHI5UmGn+1vPm4baKPhO7I298Kn75x3GdtBZndLipKPli2sGAtIOvWje0AdQ
         5mqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702580297; x=1703185097;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nuB2VS0vOEytiP8nxnbnQZbhdAR+4JIEPVDZI9Ugw2w=;
        b=HjWYlL01whR/OVdPJlesi9WyU4VIWhHCjg18TZoZys+UDxwlKQD9f4y66fmjaXTUw/
         cTONMnYCG8tbPpbT3l6j+A2gGBtamRUvfiq6RXIdyeqN2aoqeqvMG8ol+i/KbVOAvhxX
         a3QkAETvibDum02Dyn8UEMQyZCWvdMqnjLoJt5tLea66BweOUQ8dNI9DKWz1+POtLBJM
         2nRbILkBPVlS+fD9zm5Ep4nwAL4EnSGUMeM1jslpfohXkRPq4M6OyonQdHKBs8XsurY6
         eV9vLep2N56ufbU8nqaXVUMdQgLfEQOIM78o6qP7DR1hn/2H/PKZcf1t3MsQWIkqQKWh
         u0Aw==
X-Gm-Message-State: AOJu0YwcecOcWjfF1eSNmRieBRJSmbp6pb1DZfSUEM4o+QH5kxNdZHFH
	SrudRSye+Nhf88MPMtL+/VkK9Q==
X-Google-Smtp-Source: AGHT+IGI82oMK+M1UjM0oTofoUW/h/FKB4b7Qiwp+k/LDbRDq+SYBOyX3o3wb1cFNELJkGQuuj42KQ==
X-Received: by 2002:a05:600c:2113:b0:40b:26f1:57a2 with SMTP id u19-20020a05600c211300b0040b26f157a2mr5136303wml.27.1702580297227;
        Thu, 14 Dec 2023 10:58:17 -0800 (PST)
Received: from [192.168.178.55] ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id e12-20020a05600c4e4c00b0040b398f0585sm26257146wmq.9.2023.12.14.10.58.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 10:58:16 -0800 (PST)
Message-ID: <3b2aa56c-4b78-46ad-b5f0-a06018b891ad@baylibre.com>
Date: Thu, 14 Dec 2023 18:58:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCHv2 4/4] login.py: Proof of concept for screenshot
 testcases
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
References: <cover.1702499299.git.pidge@baylibre.com>
 <e43f9d74edb8a9504075964ac9a277dc031560cb.1702499299.git.pidge@baylibre.com>
 <dc83ff18c96bd6bd5326e07139043699b0fb099e.camel@linuxfoundation.org>
 <c5ad4f86-5aa9-4529-9a6d-44641b65600b@baylibre.com>
 <d82201043114b03ea7b2cdc5fd65da7084b1c443.camel@linuxfoundation.org>
From: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?=
 <pidge@baylibre.com>
In-Reply-To: <d82201043114b03ea7b2cdc5fd65da7084b1c443.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 18:58:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192400

On 14/12/2023 17:29, Richard Purdie wrote:
> On Thu, 2023-12-14 at 16:32 +0000, Eilís 'pidge' Ní Fhlannagáin wrote:
>> On 13/12/2023 20:55, Richard Purdie wrote:
>>> On Wed, 2023-12-13 at 20:30 +0000, Eilís 'pidge' Ní Fhlannagáin wrote:
>>>> This takes the work rburton did on image screenshot testing and
>>>> expands it.
>>>>
>>>> Right now this only works for qemux86-64. Some standardization
>>>> of screensize/resolution needs to happen with runqemu params for other
>>>> machines. There is an issue in qemux86-64 (and possibly others) where
>>>> the screenswitch icon is only half present. This causes the test to
>>>> fail.
>>>>
>>>> This test takes a screendump of a qemu image (for now, just
>>>> core-image-sato for qemux86-64), and compares it to an image we
>>>> have on record. Some normalisation of the different qemu configs
>>>> need to happen to be able to support all machines. Example, the
>>>> qemuarm64 screen size is much larger than the qemux86-64.
>>>>
>>>> The image we have on record contains a blanked out clock. We do
>>>> the same blanking out process for the screenshot, so the images should
>>>> have zero differences. If they do, we fail.
>>>>
>>>> In order to enable this test, you will need meta-openembedded/meta-oe in
>>>> your bblayers.conf and the following in local.conf:
>>>>
>>>> IMAGE_CLASSES += "testimage"
>>>> TEST_SUITES = "login"
>>>> IMAGE_INSTALL:append = " python3-qemu-qmp "
>>>> TESTIMAGEDEPENDS:append:qemuall = " imagemagick-native:do_populate_sysroot "
>>>>
>>>> Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
>>>> Co-authored-by: Ross Burton <ross.burton@arm.com>
>>>> Co-authored-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
>>>> ---
>>>>    .../core-image-sato-qemux86-64.png            | Bin 0 -> 46986 bytes
>>>>    meta/lib/oeqa/runtime/cases/login.py          |  34 ++++++++++++++++++
>>>>    2 files changed, 34 insertions(+)
>>>>    create mode 100644 meta/files/image-tests/core-image-sato-qemux86-64.png
>>>>    create mode 100644 meta/lib/oeqa/runtime/cases/login.py
>>>>
>>>> diff --git a/meta/lib/oeqa/runtime/cases/login.py b/meta/lib/oeqa/runtime/cases/login.py
>>>> new file mode 100644
>>>> index 00000000000..9e351fdeb29
>>>> --- /dev/null
>>>> +++ b/meta/lib/oeqa/runtime/cases/login.py
>>>> @@ -0,0 +1,34 @@
>>>> +#
>>>> +# Copyright OpenEmbedded Contributors
>>>> +#
>>>> +# SPDX-License-Identifier: MIT
>>>> +#
>>>> +
>>>> +import subprocess
>>>> +from oeqa.runtime.case import OERuntimeTestCase
>>>> +import tempfile
>>>> +from oeqa.runtime.decorator.package import OEHasPackage
>>>> +
>>>> +class LoginTest(OERuntimeTestCase):
>>>> +
>>>> +    @OEHasPackage(['python3-qemu-qmp'])
>>>
>>> This only works if we have python3-qemu-qmp in the target? I thought
>>> the monitor was external?
>>>
>>>> +    def test_screenshot(self):
>>>> +        if self.td.get('MACHINE') != "qemux86-64":
>>>> +            self.fail
>>>
>>> So we're going to throw failures on all other machines? Wouldn't a skip
>>> be more appropriate? Can we provide images for other machines?
>>
>> I can get images for other machines, but it's going to take a bit to run
>> everything. I've debug code to grab those images. The other option is to
>> ensure the other qemu machines have something like QB_GRAPHICS =
>> "-device virtio-gpu-pci, xres=800,yres=600" to normalise the resolutions
> 
> One step at a time I guess but I would like this to ultimately work
> with our commonly used machines.

Agreed. I've some patches to the qemu configs that should get us what we 
want, but I need to test them.

> 
>>>
>>> Have a look at things like:
>>>      @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific currently")
>>>
>>>> +
>>>> +        if bb.utils.which(os.getenv('PATH'), "convert") is not None and bb.utils.which(os.getenv('PATH'), "compare") is not None:
>>>
>>> This works for nativesdk-imagemagick but it would need convert+compare
>>> in HOSTTOOLS to work for a host binary. I'm torn on the best way to
>>> find that otherwise.
>>
>> Fixed to rely on the imagemagicks provided by TESTIMAGEDEPENDS:append.
>>
>>>
>>>> +            with tempfile.NamedTemporaryFile(prefix="oeqa-screenshot-login", suffix=".png") as t:
>>>> +                ret = self.target.runner.run_monitor("screendump", args={"filename": t.name, "format":"png"})
>>>> +                # Use the meta-oe version of convert, along with it's suffix
>>>> +                cmd = "convert.im7 {0} -fill white -draw 'rectangle 600,10 640,22' {1}".format(t.name, t.name)
>>>> +                proc = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
>>>> +                output, error = proc.communicate()
>>>
>>> You probably want subprocess.check_result()
>>>
>>
>> check_output, but yes, that works here.... but...
> 
> I meant check_call() since you don't use the output.

Ah, I have it as check_output. I can submit a patch to move it to that 
function with my qemu patches, if what we have is ok.

> 
>>>> +
>>>> +                # Use the meta-oe version of compare, along with it's suffix
>>>> +                cmd = "compare.im7 -metric MSE {0} {1}/meta/files/image-tests/core-image-sato-{2}.png /dev/null".format(t.name, self.td.get('COREBASE'), self.td.get('MACHINE'))
>>>> +                proc = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
>>>> +                output, error = proc.communicate()
>>>
>>> and check_output()
>>
>> ...doesn't here. In this case, we should probably either use run() or
>> Popen() because imagemagick returns non-failing output on stderr (which
>> is what we need) as well stdout (which we don't really want). Using
>> Popen allows us to do this a bit cleaner as opposed to check_output.
> 
> 
> You can use  stderr=subprocess.STDOUT with check_output?

Yes, but doing so mixes stdout and stderr from my recollection. With 
compare (and a few other imagemagick tools) stdout is used for image 
output and stderr is (as in this case), the numerical diff of the image, 
which I wanted to avoid.

In this case, we don't happen to see the output because we're directing 
to /dev/null, but something like:

compare -metric MSE /home/pidge/oeqa-screenshot-loginzm8bokga.png 
../meta/files/image-tests/core-image-sato-qemux86-64.png  png:-

makes a stdout/stderr mess if we use check_output. I eventually want to 
play with piping the output to other things, to get some more info 
(identify is an option), for error tracking and such.

-e

> 
> Cheers,
> 
> Richard
> 

-- 
Eilís 'pidge' Ní Fhlannagáin
BayLibre - At the Heart of Embedded Linux
www.baylibre.com


