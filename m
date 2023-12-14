Return-Path: <pidge@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378A8C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 16:32:30 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.27258.1702571541025126776
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 08:32:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=x3gd9Oto;
 spf=pass (domain: baylibre.com, ip: 209.85.221.44, mailfrom: pidge@baylibre.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3363aa2bbfbso1878551f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 08:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1702571539; x=1703176339; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wDb/IjG2zi6xQy+lOSYlc8L9w0qIAwIh3RRpMT5u5nU=;
        b=x3gd9Oto7NH/eNO9jqALIuA1PbcccBPaxANy38ArqVCdBLwh+43wEO9mCCYBKm0nqi
         +N99grjPLFdFmaJNDClglbgA8HqO45JWet+BKf0HXGhQkcezNJMFG+nIqDOOc4qeDfkb
         +0j3zV6IYxCp3m2DoSYSg05PGCGItYCnR5C/HzApdmiH+Y54FGv32SxxpZeQGo8BEYaD
         uclHkHQHCZlxWvXWKCCmyelKO7FLEuIbMF+0qgEgou6HEoXUB3bXAJFfBKkBzItvCRSk
         7dhW1/rgLEO4UVnPl8Kg2/mzN8DNoupmEjo3qSvt7a11Xovb8nbbc2qGothjTs9+U3N4
         9VeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702571539; x=1703176339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wDb/IjG2zi6xQy+lOSYlc8L9w0qIAwIh3RRpMT5u5nU=;
        b=LxslhTX8ZzIriMdm96/+vZuXaTlDEYMB9mrEkhnlfv1X62aWnJRdAZBShCEqk3Se/Q
         NLFuoS0W9UcjpON11DloHzOeanfB5rrP8NqChiflZaa59g5iwcvi6Zjm6FV85xBpkyf6
         1OKo6q2ydppo9RXfiFxEjMCdLqyelGQx5pW3hks/eVx6B+tnbTlq+9ouu7fF+x3qVWnS
         6qLhu/650ZVx21YvRhEklnUa1xlFTVD15nxHY4Xdi/VcQvgkShbtxnwT1bgkF5klUnba
         gQK9r1HoowNG4CO0CZ8i1Ce82QNjLzunESPMfT1ka4GjbUsmSyRFG5vUBFeFGJ/cBPfq
         u8Dw==
X-Gm-Message-State: AOJu0Yx8iT42eBeRTQv26on53rYy+Eex5DpPmF3JARkNs6kc5HkVhD5g
	haWAOSvR9yBO96drv2sAlU6V0w==
X-Google-Smtp-Source: AGHT+IF0jzfQDo/4qUWUg7xvXhAsVYado2on+qH/Ftl/s8vxs/GsMDR/uHhuHEGaXyzjVG1E1gjZuQ==
X-Received: by 2002:a5d:534b:0:b0:336:4353:1c5 with SMTP id t11-20020a5d534b000000b00336435301c5mr1255726wrv.142.1702571538835;
        Thu, 14 Dec 2023 08:32:18 -0800 (PST)
Received: from [192.168.178.55] ([194.110.145.184])
        by smtp.gmail.com with ESMTPSA id a14-20020adff7ce000000b00336445e8a4fsm2932571wrq.3.2023.12.14.08.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Dec 2023 08:32:18 -0800 (PST)
Message-ID: <c5ad4f86-5aa9-4529-9a6d-44641b65600b@baylibre.com>
Date: Thu, 14 Dec 2023 16:32:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCHv2 4/4] login.py: Proof of concept for screenshot
 testcases
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
References: <cover.1702499299.git.pidge@baylibre.com>
 <e43f9d74edb8a9504075964ac9a277dc031560cb.1702499299.git.pidge@baylibre.com>
 <dc83ff18c96bd6bd5326e07139043699b0fb099e.camel@linuxfoundation.org>
Content-Language: en-US
From: =?UTF-8?B?RWlsw61zICdwaWRnZScgTsOtIEZobGFubmFnw6Fpbg==?=
 <pidge@baylibre.com>
In-Reply-To: <dc83ff18c96bd6bd5326e07139043699b0fb099e.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 16:32:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192391

On 13/12/2023 20:55, Richard Purdie wrote:
> On Wed, 2023-12-13 at 20:30 +0000, Eilís 'pidge' Ní Fhlannagáin wrote:
>> This takes the work rburton did on image screenshot testing and
>> expands it.
>>
>> Right now this only works for qemux86-64. Some standardization
>> of screensize/resolution needs to happen with runqemu params for other
>> machines. There is an issue in qemux86-64 (and possibly others) where
>> the screenswitch icon is only half present. This causes the test to
>> fail.
>>
>> This test takes a screendump of a qemu image (for now, just
>> core-image-sato for qemux86-64), and compares it to an image we
>> have on record. Some normalisation of the different qemu configs
>> need to happen to be able to support all machines. Example, the
>> qemuarm64 screen size is much larger than the qemux86-64.
>>
>> The image we have on record contains a blanked out clock. We do
>> the same blanking out process for the screenshot, so the images should
>> have zero differences. If they do, we fail.
>>
>> In order to enable this test, you will need meta-openembedded/meta-oe in
>> your bblayers.conf and the following in local.conf:
>>
>> IMAGE_CLASSES += "testimage"
>> TEST_SUITES = "login"
>> IMAGE_INSTALL:append = " python3-qemu-qmp "
>> TESTIMAGEDEPENDS:append:qemuall = " imagemagick-native:do_populate_sysroot "
>>
>> Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
>> Co-authored-by: Ross Burton <ross.burton@arm.com>
>> Co-authored-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
>> ---
>>   .../core-image-sato-qemux86-64.png            | Bin 0 -> 46986 bytes
>>   meta/lib/oeqa/runtime/cases/login.py          |  34 ++++++++++++++++++
>>   2 files changed, 34 insertions(+)
>>   create mode 100644 meta/files/image-tests/core-image-sato-qemux86-64.png
>>   create mode 100644 meta/lib/oeqa/runtime/cases/login.py
>>
>> diff --git a/meta/lib/oeqa/runtime/cases/login.py b/meta/lib/oeqa/runtime/cases/login.py
>> new file mode 100644
>> index 00000000000..9e351fdeb29
>> --- /dev/null
>> +++ b/meta/lib/oeqa/runtime/cases/login.py
>> @@ -0,0 +1,34 @@
>> +#
>> +# Copyright OpenEmbedded Contributors
>> +#
>> +# SPDX-License-Identifier: MIT
>> +#
>> +
>> +import subprocess
>> +from oeqa.runtime.case import OERuntimeTestCase
>> +import tempfile
>> +from oeqa.runtime.decorator.package import OEHasPackage
>> +
>> +class LoginTest(OERuntimeTestCase):
>> +
>> +    @OEHasPackage(['python3-qemu-qmp'])
> 
> This only works if we have python3-qemu-qmp in the target? I thought
> the monitor was external?
> 
>> +    def test_screenshot(self):
>> +        if self.td.get('MACHINE') != "qemux86-64":
>> +            self.fail
> 
> So we're going to throw failures on all other machines? Wouldn't a skip
> be more appropriate? Can we provide images for other machines?

I can get images for other machines, but it's going to take a bit to run 
everything. I've debug code to grab those images. The other option is to 
ensure the other qemu machines have something like QB_GRAPHICS = 
"-device virtio-gpu-pci, xres=800,yres=600" to normalise the resolutions

> 
> Have a look at things like:
>     @skipIfNotMachine("qemux86-64", "tests are qemux86-64 specific currently")
> 
>> +
>> +        if bb.utils.which(os.getenv('PATH'), "convert") is not None and bb.utils.which(os.getenv('PATH'), "compare") is not None:
> 
> This works for nativesdk-imagemagick but it would need convert+compare
> in HOSTTOOLS to work for a host binary. I'm torn on the best way to
> find that otherwise.

Fixed to rely on the imagemagicks provided by TESTIMAGEDEPENDS:append.

> 
>> +            with tempfile.NamedTemporaryFile(prefix="oeqa-screenshot-login", suffix=".png") as t:
>> +                ret = self.target.runner.run_monitor("screendump", args={"filename": t.name, "format":"png"})
>> +                # Use the meta-oe version of convert, along with it's suffix
>> +                cmd = "convert.im7 {0} -fill white -draw 'rectangle 600,10 640,22' {1}".format(t.name, t.name)
>> +                proc = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
>> +                output, error = proc.communicate()
> 
> You probably want subprocess.check_result()
> 

check_output, but yes, that works here.... but...

>> +
>> +                # Use the meta-oe version of compare, along with it's suffix
>> +                cmd = "compare.im7 -metric MSE {0} {1}/meta/files/image-tests/core-image-sato-{2}.png /dev/null".format(t.name, self.td.get('COREBASE'), self.td.get('MACHINE'))
>> +                proc = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
>> +                output, error = proc.communicate()
> 
> and check_output()

...doesn't here. In this case, we should probably either use run() or 
Popen() because imagemagick returns non-failing output on stderr (which 
is what we need) as well stdout (which we don't really want). Using 
Popen allows us to do this a bit cleaner as opposed to check_output.

> 
>> +                diff=float(error.decode('utf-8').replace("(", "").replace(")","").split()[1])
>> +                self.assertEqual(0, diff, "Screenshot diff is %s." % (str(diff)))
>> +        else:
>> +            self.fail
> 
> Wouldn't:
> 
> self.skipTest("could not find convert tool from imagemagick")
> 
> be better?
> 
> Right now I can't merge this. With skip()s I can at least merge whilst
> we sort the other pieces.
>  > Cheers,
> 
> Richard
> 
> 
> 

-- 
Eilís 'pidge' Ní Fhlannagáin
BayLibre - At the Heart of Embedded Linux
www.baylibre.com


