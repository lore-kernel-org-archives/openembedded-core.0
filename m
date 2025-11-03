Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF237CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 06:23:37 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14670.1762151008258654718
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 22:23:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ngJ1Iu08;
 spf=pass (domain: gmail.com, ip: 209.85.208.46, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6408f034513so3638155a12.0
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Nov 2025 22:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762151006; x=1762755806; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YaQlnOKURbypcZp1kjgWZMr1i0yIrGA11g3x0SEa4kE=;
        b=ngJ1Iu08smqO5IiZiNEIVq5TjQNgnja3o+iwgzgZwE2+Pkibk0cLGYd1U1/GO2xWeE
         ezMlUg5ovfoBj9dWi/M7xuJa7P8sqcmjin88C0EUWlEILo4gUylKN2CXfCIzmd3lY7Ce
         ZiRKv08wJwXxiHKlW4FNlAYQORL8OKTt7s+lPVc1KLzrPuORbd6dcYzCi1sf8YBR0064
         KFxaMqKttIuPqPnGa8LKFcg4M7hj9LzEz5kQnkUodSk8tjgdw4BU0psCGmNF4iuX9xN0
         UWGj6kgiWreWKe+SlsigfaCjvT9JKB2Wd0WusMSR3y24PkuDa9tPJy7mu7VFcF4Ep9j9
         hAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762151006; x=1762755806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YaQlnOKURbypcZp1kjgWZMr1i0yIrGA11g3x0SEa4kE=;
        b=rvc2tfFM7jvUNXAvd4iuUtFL14cPMSe2Ksih2ZfCYa7/4ekqa0uggeSK4eOoLrL3oB
         6Qixl5dsmm2N6JIY5nzTLuF3Vpn6mJ2VXWYtQTXK9qOnPB8JmDdxCvRgks/KP18eu5yr
         dCv0VSAtmjXdgIzup7dh1TJtuDEhfvzFebmCNurzjhX3Lh7yo19ut15k/ef1a2q1LWro
         Ro0zQb1qLDKUtqxiVL8jYx1jpgxAqAV9SGPZiAdgMrCdzsndCRovgvNpZZppgSKgGGhu
         XJRMHil0D/28c84xKr17TCAGznweL7vGzbzBPKloxuUB3SD6ipQm0geQuOoHfZXsqV+k
         TKpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyF0L7dMMsvjaHREKBvW1BfJmf0SUtP4R63yJTRdIsMNZxIIdV2rd8dr/x25PM7vRvFpi/wDDwZHFahDZyvAjekQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy/BDcW1878uJh3+ro2o9hlhS29QiUzR7SGUZgRhGRGh7JM0qQ7
	CLt0PTEa3pinboAXp2pN3isgOepgQWN8XwNwVQ3X3f50vaCZ/Vl/DAIP
X-Gm-Gg: ASbGncum0MhSS1WEvSSaUdjubpZI8+lsuh+SvYOMvkd/idIkuTbthIRHsBB7ikR1+ul
	fOb2FILOowdQkXX8hVT2Eh//59Bb3hl2W1R+au06JFQ13MIuAVVos4AoY61e24670XRhD8ES8Xh
	uC1p6ICELTB4xKRVhpVhFBhxKv7zknjzyuUWutVrMj4SB+q1jCtPx6oZ2yndCqToyiL1FXRnHnd
	pEWSK1ycueXqp6sEgqO/yFYbxHdo25t7TwOSRs9rjx0hfzeDwnZNIxGyJ2Y29fZ8zYxsRYk1Lxq
	pj19atzYK21IF/K9mlu3FfgOUxVXbPEYYjKlz79SqiMAJ2M7N/BzCnFG7ghSHO5+yafqLChvsgd
	zLWHAxturb+t60WaQ/87xVv9JW6tnUxD7VF3ZMFrK1jEFAK0M39X7yNSsFdF+GaMCnRSUyI08W6
	nrORQ1T1Eu1TxYJjvzqQ35jXjP1YOeSIaZBQ==
X-Google-Smtp-Source: AGHT+IGodRlLM5cRpz8jgufOJQIbxExKS48uBsszWC5GgqnVdikQcZtNVlXhStN22TbPeTbGCDSTaw==
X-Received: by 2002:a17:906:fe41:b0:b3d:73e1:d809 with SMTP id a640c23a62f3a-b707061fd71mr1493443066b.48.1762151006218;
        Sun, 02 Nov 2025 22:23:26 -0800 (PST)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b6c5f832sm331367966b.45.2025.11.02.22.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Nov 2025 22:23:25 -0800 (PST)
Message-ID: <0692a5a4-3b23-4001-846f-f902936b3009@gmail.com>
Date: Mon, 3 Nov 2025 07:23:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] Go 1.25.3 release is botched at Google
To: "Marko, Peter" <Peter.Marko@siemens.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <2b875d1c-50ef-4679-bb41-3e1cf89791b3@gmail.com>
 <AS1PR10MB56979B84CCA46A047E9A9EA0FDC6A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <AS1PR10MB56979B84CCA46A047E9A9EA0FDC6A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 06:23:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225588

Thanks. It's good on my side, too.

2025. 11. 02. 17:18 keltezéssel, Marko, Peter írta:
> I have downloaded the tarballs for sources and precompiled amd64 binaries and it is good now.
> Hashes equal to what we have in the recipes.
>
> Peter
>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Zoltan Boszormenyi via
>> lists.openembedded.org
>> Sent: Sunday, November 2, 2025 8:06
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] Go 1.25.3 release is botched at Google
>>
>> Hi,
>>
>> apparently, the pre-built Go 1.25.3 release, both the
>> * prebuilt tarballs at https://goloang.org/dl, and
>> * source tarball at https://dl.google.com/go
>> are compressed twice with gzip but is named as tar.gz instead of tar.gz.gz
>>
>> Therefore, the checksums are incorrect, and the downloaded
>> file cannot be uncompressed with a single tar xzf command.
>>
>> Uncompressing the tarballs once with gzip makes them match
>> the expected checksum and can be extracted with tar xvf.
>>
>> Adding downloadfilename=<basename>.tar.gz.gz makes it download
>> and extract ONCE, so the result is the <basename>.tar.gz tarball file
>> instead of the extracted sources or prebuilt stuff.


