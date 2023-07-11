Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D2BFEB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 18:24:08 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.3653.1689099847245972292
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 11:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=O3jlrHnT;
 spf=pass (domain: baylibre.com, ip: 209.85.161.47, mailfrom: tgamblin@baylibre.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5636ab8240cso3243062eaf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 11:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689099846; x=1691691846;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BUWtGIaUHJf1qip1KhikaPncFTyVbRRhZPyPCy96bqY=;
        b=O3jlrHnT0iUefTWKuH0wuuNQdK1nccNBpa5Kpc2E1Yqx4MaRVZ+XSzYz5y2hHSY0qT
         eBoEefyQAxAUtQJHqT4rtCPEGDFm/y9QQw1bIfJr1uDa5l2/qe42ZUrSrZ2zXB4Ob6uV
         eKGFhRGB/eIV2aDcmb+zFh9nLPeLrcCggJzLPsfusG+a00I9yypRyEoYgRGQtdCq0pPu
         edz9f8C4WA+NtGtivUFUsLJa+Ay6c51CJCN7e4DL+EWDNJzTeeg1UZRLVoW5VWHbHUv/
         8Z2J0CWvY5Eu81hPanqgocccA1uP3HVfpyuO1DfuWx33Lr9E5mX2rJY9MLaYNxKEbkny
         ZZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689099846; x=1691691846;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BUWtGIaUHJf1qip1KhikaPncFTyVbRRhZPyPCy96bqY=;
        b=hIEzUwVtUqne3II+N0wiWK/lasqaW/KZOtX6rvqu5fomO8ZRjnSehDBshqoUTN2vXj
         jNWg7PxBIT796xsGpCAm9vq7Db3LojNch0YJvGgTUKNg5nFmFpoCDHerbloEAG1UL9+p
         cVrtn/dsH+iHgtmjc7A196Osv6Od00F4OwU2yBrcp3yDacFWNBQBBW0uGNOffUHzgHMx
         ZBejWEhLe8dmQ6ge4UM7hDrLC+YIRUIbFSGRIB75dG2kV9wSliq55lFM6pE8PT0RpjF+
         2Ewy89WkP0assRDHbeBJjaXSXTfQ0zx0/Xxi1OLEDNEJWQdLWLGT4H82/SSk96jGqdkt
         Cezw==
X-Gm-Message-State: ABy/qLZrFrNnfZKQ/CyVbAJo5HrOvR8EPN3w53v4Wv6DZ+VGImp7ZWNA
	KRvb8KXX3JYj3uu+wggS9C5lVoKPc6UQTdyIFFI=
X-Google-Smtp-Source: APBJJlE+6CxPa0WWHRaotTsCBibRfiaj5TUcuSTVwaRokzrRJrr1QG2WGd9WdO+MaMI/Z8foo+mz8A==
X-Received: by 2002:a05:6808:20aa:b0:3a3:766b:7c31 with SMTP id s42-20020a05680820aa00b003a3766b7c31mr15445896oiw.35.1689099846530;
        Tue, 11 Jul 2023 11:24:06 -0700 (PDT)
Received: from ?IPV6:2001:1970:5b1f:ab00:d875:6297:4e81:e577? ([2001:1970:5b1f:ab00:d875:6297:4e81:e577])
        by smtp.gmail.com with ESMTPSA id c20-20020a0cca14000000b00635e9db359bsm1350452qvk.82.2023.07.11.11.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 11:24:06 -0700 (PDT)
Message-ID: <9b60f438-79e7-2b70-3c45-7b78530d284e@baylibre.com>
Date: Tue, 11 Jul 2023 14:24:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [OE-core][PATCH 1/3] python3-pylibfdt: add recipe
Content-Language: en-US
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230711011104.2807078-1-tgamblin@baylibre.com>
 <CADkTA4O0K8jxWJb-_7-ijdCzPVc7KcCw75xUYtUxa+4HGjZkMw@mail.gmail.com>
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <CADkTA4O0K8jxWJb-_7-ijdCzPVc7KcCw75xUYtUxa+4HGjZkMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 18:24:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184150


On 2023-07-10 21:26, Bruce Ashfield wrote:
> On Mon, Jul 10, 2023 at 9:11 PM Trevor Gamblin <tgamblin@baylibre.com> wrote:
>> This is required by python3-dtschema (already in oe-core) and
>> likely some other modules, so add the recipe.
> We are now on the 3rd (or 4th) iteration of attempts to add this.
>
> Rather than re-hashing the discussion, I suggest searching the mailing
> list for libfdt.
>
> The summary is:  the pypi version is not up to date, and this python
> library should be built out of the dtc repository and provided that
> way.

Thanks for the heads-up, I hadn't seen the others. I noticed that you 
have python3-dtc in meta-virtualization and that seems to cover 
python3-dtschema's needs. Will it be an issue for meta-virt if I move 
that to oe-core?

Trevor

>
> Bruce
>
>> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
>> ---
>>   .../python/python3-pylibfdt_1.6.1.bb             | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>   create mode 100644 meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb
>>
>> diff --git a/meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb b/meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb
>> new file mode 100644
>> index 0000000000..9dd01a1449
>> --- /dev/null
>> +++ b/meta/recipes-devtools/python/python3-pylibfdt_1.6.1.bb
>> @@ -0,0 +1,16 @@
>> +SUMMARY = "Python binding for libfdt"
>> +HOMEPAGE = "https://pypi.org/project/pylibfdt/"
>> +LICENSE = "BSD-2-Clause & GPL-2.0-or-later"
>> +LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>> +                    file://BSD-2-Clause;md5=5d6306d1b08f8df623178dfd81880927"
>> +
>> +inherit pypi python_setuptools_build_meta
>> +
>> +PYPI_PACKAGE = "pylibfdt"
>> +
>> +SRC_URI[sha256sum] = "90c667c5adf44c6ab2f13bdc566598897784c7b781bed91064e7373bd270b778"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> +
>> +DEPENDS += "python3-setuptools-scm-native swig-native"
>> +
>> --
>> 2.41.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#184109): https://lists.openembedded.org/g/openembedded-core/message/184109
>> Mute This Topic: https://lists.openembedded.org/mt/100070604/1050810
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>

