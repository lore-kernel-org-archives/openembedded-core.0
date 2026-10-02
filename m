Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 582AFCA5FC4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 10:59:25 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8853.1790938755794290921
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 03:59:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tS3I3PeQ;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a024e16179so8035655e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 03:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790938754; x=1791543554; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=izKUJEWqhD2vKfqke4fGjMImDkcsWzWsv7qsftaWKG8=;
        b=tS3I3PeQG5iuy6rhJjJUeBuv7bL5vR2GIrKiFqbSMfAs+cFR2nO+e9zjc3vcPNqbXf
         NLGLfllAKLZ7GV2F0ToPAegd56osp449Bx5/So59j4omDXhbyc9Y6yKcBpJOkJFI2UWg
         hphT5ZwqQvBKlRH35ZB5oCh6XGiBMZw63qFFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790938754; x=1791543554;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=izKUJEWqhD2vKfqke4fGjMImDkcsWzWsv7qsftaWKG8=;
        b=HP/n4zcR14zk0lMx/PS8VWidSMHPuM7Nb70LcNuYryXnSsDL92GfmrxxgmKdibNO8g
         kIeMDYAzpm3zo1GvxTbtdDPlHFqc7MYE4HlWGMS9uAgZmCf5LXS2QZKeSMrAQ19gujdl
         3afm/rLuKiF7SRtN/FHE1h+rUPWRWU8+1MRMshAIivW6scOzDFNXdYfryTXT7xZqoR6z
         pfcIib9Q1YpAeZ3zLUf45IftU4CO0IALhP2/JFSk7ysfO6M7fSBOebRFY/0Y5VaqydIW
         CSyjW+IYCVyDy2NPi4Z/f/LN9bsq2eSBroJLQCCDZSPhOj+GWXc76bHSmRPDEodfpGeN
         R1CA==
X-Forwarded-Encrypted: i=1; AKwUvBw0zzc1tr5MUr+kpDgSmvfynw8NDGGqvqiHAlVzj18FsRK2bqOj8v4ryMJUlVPBNRWQpMmynfsfBcr/pbCBlULJag==@lists.openembedded.org
X-Gm-Message-State: AFuF++kQIhRQzgPT6fxs8oZi46czHmLuKYbaBdRa/cjC3DelG+JrHPRP
	VovTr+2oGzV/OezittOj6NkQZ9toGzlmT5njDT1wvy28LYAheqae0EbcxZhDU8StV6uYXodq7Ju
	eJaP3NnQ=
X-Gm-Gg: AYBFou2w5ns6gHKjrPdDXo/x4zf9fTveaQzzW5ugrOJV/Iyem6lys1Zn3sO+ja9BsRK
	gWZweTqXeKSITe4ECE25VPXagpFN/N1IGOvxpIPV4xhGCO+GlhcWEa1q0Cxlzbh3vJ/+/N1soHI
	59KHUeheGh6UOn0llAq96jVFCJ76IYrGLbU5h0odx9PdSipFO3VLePrjFtIgjvLfgyXz51hVF7H
	SvcEyxYZuexAyNivJYtJpgpdVharG2UAl7KhIGTsIEhEqJWPD7zlYFhh18yPCPaPWYE6z2Z3/rU
	q7VmZvf3ljVpGro6Y+cPRXNcdwXgLcchF4ln1UL0B5c18D4qRG7CgQlfB1LUKbnWmqFgm6fsDLZ
	1kQFU7It83yvryrhDZrnQKqIXyqk9ppOX+TF89dTkv7jvYpJCMBO21rLMfyNdRvTIybnIidfIQH
	W2nPGTBNsNa01I3Ij+A2bdTtRZ6nt6irtzpSS6n5MI5A/GaVX9UQsw30i++8YMRVghB/znP/Fld
	or3Rz7qI3LlOg8ijJK6xWnFiFsrTJwuCvqyDwPl2B1PE29JGKkvfNwg8OC7RQ==
X-Received: by 2002:a05:600c:1546:b0:4a0:1c43:3c04 with SMTP id 5b1f17b1804b1-4a02756e5edmr43058705e9.13.1790938754003;
        Fri, 02 Oct 2026 03:59:14 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm40134255e9.1.2026.10.02.03.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 03:59:13 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 12:59:13 +0200
Message-Id: <DLUASX6C83DB.2XDYJ9EUEAG19@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <sdoshi@mvista.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][PATCH 1/6] libxml2: Security Fix for
 CVE-2026-86137
X-Mailer: aerc 0.20.0
References: <20260910200329.842463-1-sdoshi@mvista.com>
 <DLL00OT9VKC9.JRZSZU4BMX6L@smile.fr> <DLL31B54TO1J.3LKIGPOKP14DW@smile.fr>
In-Reply-To: <DLL31B54TO1J.3LKIGPOKP14DW@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 10:59:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247105

On Mon Sep 21, 2026 at 5:00 PM CEST, Yoann Congal wrote:
> On Mon Sep 21, 2026 at 2:38 PM CEST, Yoann Congal wrote:
>> On Thu Sep 10, 2026 at 10:03 PM CEST, Siddharth Doshi via lists.openembe=
dded.org wrote:
>>> From: Siddharth Doshi <sdoshi@mvista.com>
>>>
>>> Picking patch as per [1], and same patch is mentioned in [2]
>>>
>>> References:
>>> [1] https://nvd.nist.gov/vuln/detail/CVE-2026-86137
>>> [2] https://security-tracker.debian.org/tracker/CVE-2026-86137
>>>
>>> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
>>> ---
>>>  .../libxml/libxml2/CVE-2026-86137.patch       | 48 +++++++++++++++++++
>>>  meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
>>>  2 files changed, 49 insertions(+)
>>>  create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86137.pat=
ch
>>
>> Hello,
>>
>> It looks like something in this series is breaking ptests:
>> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/73/builds/4604
>> https://valkyrie.yocto.io/pub/non-release/20260921-71/testresults/qemux8=
6-64-ptest/core-image-ptest-libxml2/log.do_testimage.364096.20260921110838
>> |  1314	Running runtest
>> |  1315	Validation for ./test/VCM/21.xml failed
>> |  1316	Validation for ./test/VCM/AttributeNmtokens.xml failed
>> |  1317	Validation for ./test/VCM/v10.xml failed
>> |  1318	Validation for ./test/VCM/v11.xml failed
>> |  1319	Validation for ./test/VCM/v12.xml failed
>> |  1320	Validation for ./test/VCM/v13.xml failed
>> |  1321	Validation for ./test/VCM/v14.xml failed
>> |  1322	Validation for ./test/VCM/v15.xml failed
>> |  1323	Validation for ./test/VCM/v16.xml failed
>> |  1324	Validation for ./test/VCM/v17.xml failed
>> |  1325	Validation for ./test/VCM/v18.xml failed
>> |  1326	Validation for ./test/VCM/v19.xml failed
>> |  1327	Validation for ./test/VCM/v20.xml failed
>> |  1328	Validation for ./test/VCM/v21.xml failed
>> |  1329	Validation for ./test/VCM/v22.xml failed
>> |  1330	Validation for ./test/VCM/v23.xml failed
>> |  1331	Validation for ./test/VCM/v24.xml failed
>> |  1332	Validation for ./test/VCM/v4.xml failed
>> |  1333	Validation for ./test/VCM/v5.xml failed
>> |  1334	Validation for ./test/VCM/v6.xml failed
>> |  1335	Validation for ./test/VCM/v7.xml failed
>> |  1336	Validation for ./test/VCM/v8.xml failed
>> |  1337	Validation for ./test/VCM/v9.xml failed
>> |  1338	file result/VC/ElementValid2 is 111 bytes, result is 227 bytes
>> |  1339	Error for ./test/VC/ElementValid2 failed
>>
>> Can you look into it?
>>
>> Thanks!
>
> This also fails on arm64:
> https://autobuilder.yoctoproject.org/valkyrie/?#/builders/61/builds/4577
>
> Regards,

Hello,

FYI, A similar series was sent that did not break ptests in my testing:
https://lore.kernel.org/all/20260929041836.2217090-1-hthakar@cisco.com/
So, I'll continue with Hetvi's for now.

Regards,
--=20
Yoann Congal
Smile ECS


