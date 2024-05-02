Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F98AC4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 18:00:50 +0000 (UTC)
Received: from esa9.hc324-48.eu.iphmx.com (esa9.hc324-48.eu.iphmx.com [207.54.69.27])
 by mx.groups.io with SMTP id smtpd.web11.1478.1714672846755947583
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 11:00:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=LBF1UKtY;
 spf=pass (domain: bmw.de, ip: 207.54.69.27, mailfrom: prvs=8451f0b36=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1714672846; x=1746208846;
  h=message-id:date:mime-version:subject:to:references:from:
   cc:in-reply-to:content-transfer-encoding;
  bh=h/WgtDwC0sGfvrIj73m9xn+LT25VsGiBkoY9fkaqHy4=;
  b=LBF1UKtYImP6w1wgdWkqwWZzJLy0S1We5Bw4Tg54icabdFvw7/uys+gK
   CzVLuv6/Vs3etvs6nOysuWfdxyl69gQ9sT1prLgiuFRMkKfYz7alNUrfZ
   hLR0TQsJeDtSH0H/+pZrv+XY/fgBVJinqvFSw1p3AGsXUxePACUIvPFLa
   s=;
X-CSE-ConnectionGUID: WWuz+AvtSdWKY7QHIsnbtg==
X-CSE-MsgGUID: dHKnmc8nTneW5clh3B2rFQ==
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa9.hc324-48.eu.iphmx.com with ESMTP/TLS; 02 May 2024 20:00:44 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw4.muc with ESMTP/TLS;
 02 May 2024 20:00:28 +0200
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb2.muc with ESMTP/TLS; 02 May 2024 20:00:29 +0200
Received: from [10.242.8.5] (10.30.85.208) by SMUCMP10E.europe.bmw.corp
 (2a03:1e80:a15:58f::2027) with Microsoft SMTP Server (version=TLS;
 Thu, 2 May 2024 20:00:27 +0200
Message-ID: <a0cff382-4302-4f27-96b6-ec41c243588b@bmw.de>
Date: Thu, 2 May 2024 20:00:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] ipk: Do not hardcode payload compression
 algorithm
To: Quentin Schulz <quentin.schulz@cherry.de>
References: <20240502142716.2112863-1-philip.lorenz@bmw.de>
 <af6e8a05-7c2d-4310-9414-a747593275c7@cherry.de>
From: Philip Lorenz <philip.lorenz@bmw.de>
CC: <openembedded-core@lists.openembedded.org>
In-Reply-To: <af6e8a05-7c2d-4310-9414-a747593275c7@cherry.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: smucmp15d.europe.bmw.corp (2a03:1e80:a15:58f::1:62) To
 SMUCMP10E.europe.bmw.corp (2a03:1e80:a15:58f::2027)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 18:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198930

Hi Quentin,

On 02.05.24 19:19, Quentin Schulz wrote:
> Sent from outside the BMW organization  - be CAUTIOUS, particularly 
> with links and attachments.
> Absender außerhalb der BMW Organisation - Bitte VORSICHT beim Öffnen 
> von Links und Anhängen.
> ----------------------------------------------------------------------------------------------- 
>
>
> Hi Philip,
>
> On 5/2/24 4:27 PM, Philip Lorenz via lists.openembedded.org wrote:
>> [You don't often get email from 
>> philip.lorenz=bmw.de@lists.openembedded.org. Learn why this is 
>> important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> The chosen payload compression algorithm can be changed by overriding
>> `OPKGBUILDCMD`. Ensure that package extraction deals with this by
>> globbing for "data.tar.*" to select the actual payload tarball.
>>
>> Signed-off-by: Philip Lorenz <philip.lorenz@bmw.de>
>> ---
>>   meta/lib/oe/package_manager/ipk/__init__.py | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/lib/oe/package_manager/ipk/__init__.py 
>> b/meta/lib/oe/package_manager/ipk/__init__.py
>> index 8cc9953a027..0f0038d00d9 100644
>> --- a/meta/lib/oe/package_manager/ipk/__init__.py
>> +++ b/meta/lib/oe/package_manager/ipk/__init__.py
>> @@ -4,6 +4,7 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>>   #
>>
>> +import glob
>>   import re
>>   import shutil
>>   import subprocess
>> @@ -134,11 +135,16 @@ class OpkgDpkgPM(PackageManager):
>>           tmp_dir = tempfile.mkdtemp()
>>           current_dir = os.getcwd()
>>           os.chdir(tmp_dir)
>> -        data_tar = 'data.tar.zst'
>>
>>           try:
>>               cmd = [ar_cmd, 'x', pkg_path]
>>               output = subprocess.check_output(cmd, 
>> stderr=subprocess.STDOUT)
>> +            data_tar = glob.glob("data.tar.*")
>
> What happens if we have two consecutive builds with the same build 
> directory but different compression algorithms? Would we have two 
> data.tar.* matches?

Each call to extract() creates a new temporary directory into which the 
content of that particular IPK are extracted. IPKs should contain only 
one data tarball and as such the described scenario should never occur 
(and the length check I added is a merely a safety measure).

I initially considered introducing a dedicated variable to specify the 
IPK compression algorithm, but this would have also required to introduce

* another variable for the parametrization of said algorithm (see 
ZSTD_DEFAULTS, XZ_DEFAULTS)
* a mapping from opkg-build algorithm name to the actual file extension 
(see [1])

This seems overly complex when a glob achieves the same effect so I went 
for the submitted solution instead.

Br,

Philip

[1] https://git.yoctoproject.org/opkg-utils/tree/opkg-build#n157

-- 
Philip Lorenz
BMW Car IT GmbH, Software-Plattform, -Integration Connected Company, Lise-Meitner-Straße 14, 89081 Ulm
-------------------------------------------------------------------------
BMW Car IT GmbH
Management: Chris Brandt and Michael Böttrich
Domicile and Court of Registry: München HRB 134810
-------------------------------------------------------------------------


