Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0ED5CAC5A7
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 14:09:41 +0000 (UTC)
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.29524.1758463771405796450
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Sep 2025 07:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=BhrvSucO;
 spf=pass (domain: baylibre.com, ip: 209.85.222.194, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-84827ef386aso27228585a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 07:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758463770; x=1759068570; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i7N5W4Jf5abzJaTXUdBwz5lfe3c62p5aX4UkB6m4CIQ=;
        b=BhrvSucOW82LZ2TGA2DeOG3WxLELqGnkNembim+5zOgdmGHYRErRnwEdbornGFhT0q
         Nc9tMyIsiCIvi3hG0MFjCbrzlKNxRXPvrJVorPqqPAYrHK/y6LbpavpVddDKNYKQfbiu
         H4mNiwZrwNnwNxRUyN1jcs7ycKB/FZDiVQhV6Mzb27aIsxmsl9gL+PBomdy07Q4nZjsm
         CJiob/iCywKvKar0OXdQ4JrmP7KqxPzMuTwyxV2dY5ZCqY75egOiD46bbefZWZO0xMFZ
         rrO8sEYKexOfnxzcC8O5bUR+4QElYCUj9f/S75Uc6K89SZ+c+rJ37O1w5V/EtPBG+wBR
         Ktyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758463770; x=1759068570;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i7N5W4Jf5abzJaTXUdBwz5lfe3c62p5aX4UkB6m4CIQ=;
        b=PL7eqAbmXGZNCoon2MKRTGpVeiJl+JmspWgNGXrxruMnoyWw7XuULx/zKO3uiW/1Io
         x7cUojYp11OepKNWURBq3fnJJla88y2kAAdP02IWmESQJwX6UFtDiZOka/suvaNKvccI
         nKnJVSZZowKxdAlNCWSSwP30/v/JCJHMLnWKWQy3y+Vz73CI0rIRZZpEWmfYs520RdM/
         9Hffn0MwlOWH+93caC9H6v8XPkR6gVozXzzFuDZKPtjneqDtqv3/Dd1zko/KFxXtu6oq
         wMiwiTCYPm9lnYt74M2mSKdD11Uyr8P30oXcQNd0ehMKk86h53E5ZkM75Y6fQJpAFqR0
         3S2w==
X-Forwarded-Encrypted: i=1; AJvYcCXklIFw99cM9OZVkMPmEAsOE+s1AMzpdtrSu+sySsFqUxBdZDOcK1A4HHvHE5Ly2R7GcZT7xE76tN1pzCc7pdrnmA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyR/oST9ah29xOd8JnTrewFY/nlYq8/vAaZzkN3Qxg1RzVbqlvI
	JXt/hemvqkaC7XVPOXSR/XBMbYMaI2vlRVJo16ALiCe5PoBiOFugwVZ2O2gSPpXEExY=
X-Gm-Gg: ASbGncvq5Z8764sUebDylvcyfZ7T8FQEr54Ra52eXD0LJLEffZqPZIVgk1mS4mqBYY0
	y4SyqT8BHSOscpTkIRyWDEw/wGYnyYkQ4B5iG6oHA070juKS+qL2LLxBF3mDXaW15yHb0g58XIw
	Z3rTBrzE5cVtY7bJCqMAQ8xSIYmL9/q5s8osraSN3VLrAOXDTKW84VNkikllVtcVTtD8hfInVUd
	jl953AkKu5qfIGtvbeiaWkqklMBqvncN/Pw1Yy+BhZCjGmVwy+7CgfS8oDZAYpVPYpAMERHmOnT
	HUpqCncc6CX92Q4QTRQYLnTOhPhwBBJMT+/v8TBnZZbh1utX+Sgl4hCr1aMfbRhkD/QZ0ujqejf
	pJhqmXeCmzITMbCiv64Mi9nfu4xja2EMZNUu8cCD+02YpUqu4q1Yjm0Cc5l4H/O3hScw=
X-Google-Smtp-Source: AGHT+IH0h9ZyzDpJW4qb4vqwcs7vH5ajRp1/SJul4M/kKfjenESk7wpinIUYfFWWaGpUMu15smgYkA==
X-Received: by 2002:a05:620a:40d4:b0:84a:51a8:b28f with SMTP id af79cd13be357-84a51a8b324mr51609485a.15.1758463770064;
        Sun, 21 Sep 2025 07:09:30 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-836278b8082sm661874985a.22.2025.09.21.07.09.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 07:09:29 -0700 (PDT)
Message-ID: <e639013c-4bc4-44f6-b1af-10ef025a3087@baylibre.com>
Date: Sun, 21 Sep 2025 10:09:27 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH 6/6] python3-setuptools-scm: upgrade 8.3.1 ->
 9.2.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 openembedded-core@lists.openembedded.org
References: <20250919164803.3174518-1-tgamblin@baylibre.com>
 <20250919164803.3174518-6-tgamblin@baylibre.com>
 <DCYB3P86O998.3GPS55UV93JDF@bootlin.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <DCYB3P86O998.3GPS55UV93JDF@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 14:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223798


On 2025-09-21 03:40, Mathieu Dubois-Briand wrote:
> On Fri Sep 19, 2025 at 6:48 PM CEST, Trevor Gamblin wrote:
>> Release notes (https://github.com/pypa/setuptools-scm/releases):
>>
>> v9.2.0:
>>
>> - reiterate version inference by RonnyPfannschmidt in #1202
>> - simple activation now requires a extra instead of setting up many
>>    pre-existing projects for failure/error
>>
>> Note that there were several v9.2.x releases yanked upstream before this
>> one was added on August 16th.
>>
>> Add python3-tomllib to the RDEPENDS list so that the module imports OK.
>>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
> Hi Trevor,
>
> Thanks for your patch.
>
> It looks like this is breaking the build of some package:
>
> ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/python3-dbusmock/0.33.0/temp/log.do_compile.2316634
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | * Getting build dependencies for wheel...
> | /srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/python3-dbusmock/0.33.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/dist.py:759: SetuptoolsDeprecationWarning: License classifiers are deprecated.
> | !!
> |
> |         ********************************************************************************
> |         Please consider removing the following classifiers in favor of a SPDX license expression:
> |
> |         License :: OSI Approved :: GNU Lesser General Public License v3 or later (LGPLv3+)
> |
> |         See https://packaging.python.org/en/latest/guides/writing-pyproject-toml/#license for details.
> |         ********************************************************************************
> |
> | !!
> |   self._finalize_license_expression()
> | /srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/python3-dbusmock/0.33.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools_scm/_integration/version_inference.py:51: UserWarning: version of python-dbusmock already set
> |   warnings.warn(self.message)
> | Traceback (most recent call last):
> |   File "/srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/python3-dbusmock/0.33.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/config/expand.py", line 71, in __getattr__
> |     return next(
> |         ast.literal_eval(value)
> |         for target, value in self._find_assignments()
> |         if isinstance(target, ast.Name) and target.id == attr
> |     )
> | StopIteration
> |
> | The above exception was the direct cause of the following exception:
> |
> | Traceback (most recent call last):
> |   File "/srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/python3-dbusmock/0.33.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/config/expand.py", line 185, in read_attr
> |     value = getattr(StaticModule(module_name, spec), attr_name)
> |   File "/srv/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/cortexa8hf-neon-poky-linux-gnueabi/python3-dbusmock/0.33.0/recipe-sysroot-native/usr/lib/python3.13/site-packages/setuptools/config/expand.py", line 77, in __getattr__
> |     raise AttributeError(f"{self.name} has no attribute {attr}") from e
> | AttributeError: dbusmock has no attribute __version__
> |
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/2434
>
> Can you have a look at this issue please?

Seems to be fixed with an upgrade to python3-dbusmock - they recently 
changed the build configurations upstream. I've sent a patch to do that 
upgrade and CC'd you.

- Trevor

>
> Thanks,
> Mathieu
>

