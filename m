Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 371DDEE49A5
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 00:25:13 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.1209.1692750309516943799
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 17:25:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=GdjCA+oC;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6b9c9944da8so3872677a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 17:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692750309; x=1693355109;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OdcK1XMcd6oCAOz+Qd/V21Ffy3koPP+2x78NWepC83U=;
        b=GdjCA+oCWimaDnCcu4I/eTAODuaSMxEclirI81Wxnx6v4nWVp1fbLh4leXmXLkSSoG
         4aKiBGM+yNPu72ILwAH9NottT/TlhiiTsrc+DeDK1I1bJLa7JCmYKTsDAqETlq5eklI6
         5gf6uoIGFG7q1XEbRRxiJmz7erVQ7+UK3PPP7lK0+p3v48eCPUUMMrnIF1YEqVmg4G+m
         CleI66JCTrxqSqkMBQywl0/6e2Oj9ZexG7WE2T2p4iPZYec7g/oiHnS9aZziHbEfUZd+
         ZsEdMak4uk4DG1p1kexCbQPK1PhX6y2lXpDnESP3UnaMjFgGn5ZSI4+ZidHNpq35+ow9
         /e7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692750309; x=1693355109;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OdcK1XMcd6oCAOz+Qd/V21Ffy3koPP+2x78NWepC83U=;
        b=GMn5VRk+/cCNe3Z7ClsH4Gz2GIhjD/XvAeZCXy0R0dZEKttilQYOwnNqEIm4PmIS73
         nQCm08RhLcYJaep+krFfc6klbM4GLq/6HBLfLvyL5yGoiPwT5V4F9EcwzzDI4GVfOptn
         P2xIunyvg8tjweJKq+Gwbw1uaGuK/aP4y9ljII3x2DgHsDzsfm3BpGGqvNRP8lXGTlZ5
         yzadLb8OosRIJteeuY4O7IswF6RZNCWTbXfMEky4v7JulOMYRPh3MKNMrQwAe+5Aex9q
         tl3Q5q4INuR299fCk71hR9/OJg4adbLPDSU5OBMnlTuODJEOlxoHf49YpFxxYzLufCef
         CTJg==
X-Gm-Message-State: AOJu0YxRcLeAlmtKZutH4qCHu+hzAbxYGaIRILufFoAkxamqArREjtCQ
	PAyep16w37wcifWBnPNHOdY6oB/xi/vWMQ==
X-Google-Smtp-Source: AGHT+IFupPtYqHHrNsLQylPaAz5JAs0d7KIV8AX+UCSN9HQiugqzxavHEpNlT4Tehp2aAdBfg2xxTA==
X-Received: by 2002:a05:6830:10ce:b0:6bc:9c9b:e787 with SMTP id z14-20020a05683010ce00b006bc9c9be787mr11359589oto.8.1692750308548;
        Tue, 22 Aug 2023 17:25:08 -0700 (PDT)
Received: from ?IPV6:2601:646:9100:2cb0::9716? ([2601:646:9100:2cb0::9716])
        by smtp.gmail.com with ESMTPSA id d2-20020a639902000000b00564b313d526sm8447733pge.54.2023.08.22.17.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 17:25:08 -0700 (PDT)
Message-ID: <a218d04b-47bf-4c3e-a2cb-8dbe13ccb9fe@gmail.com>
Date: Tue, 22 Aug 2023 17:25:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH v13 2/8] package_ipk.bbclass: add support for
 ACLs and xattr
From: Khem Raj <raj.khem@gmail.com>
To: =?UTF-8?Q?Piotr_=C5=81obacz?= <p.lobacz@welotec.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230817124612.1043464-1-p.lobacz@welotec.com>
 <20230817124612.1043464-2-p.lobacz@welotec.com>
 <CAMKF1so7HY+kgEgg6oEU9j0thdPuv-7qtjk3RvOkDEHT07nHwA@mail.gmail.com>
 <CAMKF1sp0R3i5Tq_3AJ38BnBA8bij7BqTPxv1pDs2=cjOxpNzyg@mail.gmail.com>
Content-Language: en-US
Organization: HIMVIS LLC
In-Reply-To: <CAMKF1sp0R3i5Tq_3AJ38BnBA8bij7BqTPxv1pDs2=cjOxpNzyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 00:25:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186542

OK I have narrowed down the problem a bit more

It seems to trigger with poky master + this patch series on archlinux 
build host ( it has glibc 2.38 natively ) . It works ok with nodistro ( 
I guess its because nodistro does not use uninative but its just a guess )

Add following at the end of conf/local.conf

PACKAGE_CLASSES = "package_ipk"

then run

bitbake python3


On 8/22/23 10:03, Khem Raj wrote:
> On Tue, Aug 22, 2023 at 8:58 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Thu, Aug 17, 2023 at 5:47 AM Piotr Łobacz <p.lobacz@welotec.com> wrote:
>>>
>>> Extend OPKGBUILDCMD variable, with additional parameters, depending
>>> on target distro features, in order to support ACLs and xattr.
>>>
>>> With fix pushed to the opkg-devel:
>>> https://groups.google.com/g/opkg-devel/c/dYNHrLjDwg8
>>> opkg-build is able to create tar archives with ACLs and xattr.
>>>
>>> Signed-off-by: Piotr Łobacz <p.lobacz@welotec.com>
>>> ---
>>>   meta/classes-global/package_ipk.bbclass | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes-global/package_ipk.bbclass b/meta/classes-global/package_ipk.bbclass
>>> index b4b7bc9ac2..a0f106e4ad 100644
>>> --- a/meta/classes-global/package_ipk.bbclass
>>> +++ b/meta/classes-global/package_ipk.bbclass
>>> @@ -15,7 +15,7 @@ IPKGCONF_SDK_TARGET = "${WORKDIR}/opkg-sdk-target.conf"
>>>   PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
>>>
>>>   # Program to be used to build opkg packages
>>> -OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}"'
>>> +OPKGBUILDCMD ??= 'opkg-build -Z xz -a "${XZ_DEFAULTS}" ${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)} ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-X', '', d)}'
>>
>> I wonder if it should be an append instead, because these are
>> dependent on DISTRO_FEATURES anyway and it does not work if distro
>> features are
>> enabled and these options are removed from opkg-build cmdline. So
>> these are required if distro features are enabled. It will also help
>> the distros overriding OPKGBUILDCMD
>>
> 
> btw. I am encountering packaging failures in several packages using
> zstd compression instead of xz e.g.
> https://snips.sh/f/R42MbTZryH
> 
>   Here is my OPKGBUILDCMD
> 
> OPKGBUILDCMD = 'opkg-build -Z zstd -a "--threads=${ZSTD_THREADS}"
> ${@bb.utils.contains('DISTRO_FEATURES', 'acl', '-A', '', d)}
> ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', '-X', '', d)}'
> 
> 
>>>
>>>   OPKG_ARGS += "--force_postinstall --prefer-arch-to-version"
>>>   OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS") == "1"]}"
>>> --
>>> 2.34.1
>>>
>>>
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#186307): https://lists.openembedded.org/g/openembedded-core/message/186307
>>> Mute This Topic: https://lists.openembedded.org/mt/100799493/1997914
>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>

