Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F57CCD193
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 17:59:48 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.2831.1760464782273187088
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 10:59:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hV/7M5yK;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-421851bca51so3741888f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 10:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760464781; x=1761069581; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eiSUuFmnr1EFHnkrlqgn4OvaIl1JdIsmxyOTqCxhOHM=;
        b=hV/7M5yKicEb6Jfh5LJh1gvkOFCxex9Q9Q5LE+FTtQHVgM4EzcyBr7vWYJ+L21b9YG
         DJrPBpihlHmYvtYMRsz8WOVbPQ5rFLkVJq3crDcsuuZDYMVwxIzDE2KH12qwCvPZmxd8
         ZZC2DTPa6pngVSeIiIzj2Ly9HsYtW1HiGP/Z4YQ753lwj0frmkXDPiyCf9OTaoaItkkc
         6jcVAnQfod/JZMq9ANZ9wKyjQC7sJSfLH4j1H4min/R7XT9rRov7U+nXAbnfnUcxM2jo
         lbPg4cVF5AVcZwT9qIZoVwNQmiFV737Pza1tJ8ufeHG2CLUITxXq6+ZvvKFjZwpJ/cjW
         QtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760464781; x=1761069581;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eiSUuFmnr1EFHnkrlqgn4OvaIl1JdIsmxyOTqCxhOHM=;
        b=k2cJFjAO8D0v/VklhBjPoL9am4EF5iFBsWfgDJvTAMnaw6ZLc4QZJTt7eNgpkMZ4Nd
         NerrabD8+z56MHLEMUUWBoenX6WIN9u6gvJck1qaeril4iF9zUpUVSLBcGQZNSjjxx9G
         OVoT8HB0mBKtDzF8qbSD1dgiPOpCdikgMmwb0+lZHQGBHzdOH6YmlVk8nUNbBjvpoLKP
         Ch5YDo0ki35BZH3spVt3MiLk+qqO4FYnCJAyf0pLnGl00fHZmQXdBMMo4oI+zLXGmTVf
         H+dfg59xmHEBHvdUGDXLBedviRGR62pD0BOTp0mJqpPu2oFIEH7AzU4pKFoAs6GxuxWK
         kT9A==
X-Gm-Message-State: AOJu0YxL9TvNbETkTk2R6oYpyyiVk0o8NQH/QmvmcjKxzHgys0SL9Hcv
	w8Jrl0r8qTbsZ2Kf33653e4pfobJVuO8gQEe3o6BsNFYbhYkAwTtECGT
X-Gm-Gg: ASbGncs9FkxoYC7dI3KhIrqhmNK3WeWkBd8SZ81d+INvZxpx9NgqMgBRat9TmBOe7te
	1hp3ureaAB3OwxXgU8d8Owkwuc2T9q8DHfIsB93M32XQn6EFpVdv4rfEZ6EN47J8B63pq/WV0c4
	XbNRsVsOWoc0a9bW+oAtHDrXNgAr17HY/vYxNfqd68wliYm44v9NZ9KgMX7e16ddRv6cgC8Yj9a
	RFpVvi8pv34YBhPY0HDi1H8iJUiXKGpohKuOO7cz0/VqxEsTJfbchFH7enJnpNHiqWINrfsVMzz
	laLjGyXbaTId9RatzgMYfN8yYkJe7RadxW8kWQpa+FwDiwEugVrUn7nhEJsNkRKptgk0jO/pnKl
	EU2tPSHI4NFUmyGv7v5N/GvQeSUUdHG7SjdegS+itMIo81pfAG3PvGAY8Psy5
X-Google-Smtp-Source: AGHT+IFIsPcLbMpF7RAHN22n5p3CiKr8cXkZTv11wEDEOQ//mr0CjemQHyBZ8RysOdyuASc3rivS3g==
X-Received: by 2002:a05:6000:40c8:b0:3eb:df84:62e with SMTP id ffacd0b85a97d-42666ab96efmr16413339f8f.3.1760464780386;
        Tue, 14 Oct 2025 10:59:40 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce583335sm24225176f8f.18.2025.10.14.10.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 10:59:39 -0700 (PDT)
Message-ID: <9d9e3c72-a3bf-481e-b9ce-fb16a93dc229@gmail.com>
Date: Tue, 14 Oct 2025 19:59:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] [scarthgap] musl: backport fix for
 CVE-2025-26519 to LTS branches
To: raj.khem@gmail.com, phanirajkiran.a@gmail.com
Cc: openembedded-core@lists.openembedded.org,
 Gunda Swetha <swetha12g@gmail.com>
References: <20251014135247.6178-1-phanirajkiran.a@gmail.com>
 <CAMKF1sqipBZjYpmFA-sEmcoLL4MNbtxSrgs_itNHYaeB-2ztzQ@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1sqipBZjYpmFA-sEmcoLL4MNbtxSrgs_itNHYaeB-2ztzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 17:59:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224845

On 10/14/25 18:42, Khem Raj via lists.openembedded.org wrote:
> On Tue, Oct 14, 2025 at 9:13 AM Mallapuram Phani raj kiran via
> lists.openembedded.org
> <phanirajkiran.a=gmail.com@lists.openembedded.org> wrote:
>> From: Mallapuram Phanirajkiran <phanirajkiran.a@gmail.com>
>>
>> Fixes [YOCTO #15932]
>>
>> The musl libc code in LTS (Scarthgap) is missing
>> the fix addressing CVE-2025-26519.  This patch backports the upstream
>> changes (or applies the required fix) so that LTS builds include it.
>>
>> Reference:
>> https://nvd.nist.gov/vuln/detail/CVE-2025-26519
>>
>> (From OE-Core rev: 7af6b75221d5703ba5bf43c7cd9f1e7a2e0ed20b)
>>
>> Signed-off-by: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
>> Signed-off-by: Gunda Swetha <swetha12g@gmail.com>
>>
>> Reported-by: Cristian Morales Vega
>> ---
>>  ...x-for-CVE-2025-26519-to-LTS-branches.patch | 50 +++++++++++++++++++
>>  meta/recipes-core/musl/musl_git.bb            |  1 +
>>  2 files changed, 51 insertions(+)
>>  create mode 100644 meta/recipes-core/musl/musl/0001-musl-backport-fix-for-CVE-2025-26519-to-LTS-branches.patch
>>
>> diff --git a/meta/recipes-core/musl/musl/0001-musl-backport-fix-for-CVE-2025-26519-to-LTS-branches.patch b/meta/recipes-core/musl/musl/0001-musl-backport-fix-for-CVE-2025-26519-to-LTS-branches.patch
>> new file mode 100644
>> index 0000000000..3f0b14a5d0
>> --- /dev/null
>> +++ b/meta/recipes-core/musl/musl/0001-musl-backport-fix-for-CVE-2025-26519-to-LTS-branches.patch
>> @@ -0,0 +1,50 @@
>> +From 7ee0592397ea0e3d4b47018631642864864d443d Mon Sep 17 00:00:00 2001
>> +From: Mallapuram Phanirajkiran <phanirajkiran.a@gmail.com>
>> +Date: Tue, 14 Oct 2025 01:40:45 +0530
>> +Subject: [PATCH] musl: backport fix for CVE-2025-26519 to LTS branches
>> +
>> +Fixes [YOCTO #15932]
>> +
>> +The musl libc code in LTS (Scarthgap) is missing
>> +the fix addressing CVE-2025-26519.  This patch backports the upstream
>> +changes (or applies the required fix) so that LTS builds include it.
>> +
>> +Reference:
>> +https://nvd.nist.gov/vuln/detail/CVE-2025-26519
>> +(From OE-Core rev: 7af6b75221d5703ba5bf43c7cd9f1e7a2e0ed20b)
>> +
>> +Signed-off-by: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
>> +Signed-off-by: Gunda Swetha <swetha12g@gmail.com>
>> +
>> +Reported-by: Cristian Morales Vega
> Please add Upstream-Status tag to this musl patch

A CVE-tag also, so it will be picked up by the CVE-checker when the time
comes.

>
>> +---
>> + src/locale/iconv.c | 6 +++++-
>> + 1 file changed, 5 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/src/locale/iconv.c b/src/locale/iconv.c
>> +index 3047c27b..0729465e 100644
>> +--- a/src/locale/iconv.c
>> ++++ b/src/locale/iconv.c
>> +@@ -495,7 +495,7 @@ size_t iconv(iconv_t cd, char **restrict in, size_t *restrict inb, char **restri
>> +                       if (c >= 93 || d >= 94) {
>> +                               c += (0xa1-0x81);
>> +                               d += 0xa1;
>> +-                              if (c >= 93 || c>=0xc6-0x81 && d>0x52)
>> ++                              if (c > 0xc6-0x81 || c>=0xc6-0x81 && d>0x52)
>> +                                       goto ilseq;
>> +                               if (d-'A'<26) d = d-'A';
>> +                               else if (d-'a'<26) d = d-'a'+26;
>> +@@ -538,6 +538,10 @@ size_t iconv(iconv_t cd, char **restrict in, size_t *restrict inb, char **restri
>> +                               if (*outb < k) goto toobig;
>> +                               memcpy(*out, tmp, k);
>> +                       } else k = wctomb_utf8(*out, c);
>> ++                      /* This failure condition should be unreachable, but
>> ++                       * is included to prevent decoder bugs from translating
>> ++                       * into advancement outside the output buffer range. */
>> ++                      if (k>4) goto ilseq;
>> +                       *out += k;
>> +                       *outb -= k;
>> +                       break;
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
>> index 324269a968..db6f5ce2de 100644
>> --- a/meta/recipes-core/musl/musl_git.bb
>> +++ b/meta/recipes-core/musl/musl_git.bb
>> @@ -14,6 +14,7 @@ SRC_URI = "git://git.etalabs.net/git/musl;branch=master;protocol=https \
>>             file://0001-Make-dynamic-linker-a-relative-symlink-to-libc.patch \
>>             file://0002-ldso-Use-syslibdir-and-libdir-as-default-pathes-to-l.patch \
>>             file://0003-elf.h-add-typedefs-for-Elf64_Relr-and-Elf32_Relr.patch \
>> +           file://0001-musl-backport-fix-for-CVE-2025-26519-to-LTS-branches.patch \
>>            "
>>
>>  S = "${WORKDIR}/git"
>> --
>> 2.34.1
>>
>>
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#224843): https://lists.openembedded.org/g/openembedded-core/message/224843
>> Mute This Topic: https://lists.openembedded.org/mt/115755455/6084445
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


