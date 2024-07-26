Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76F4C3DA49
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 15:55:59 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.64790.1722009354832427122
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jul 2024 08:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MdcaR/yz;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4266dc7591fso16609345e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 08:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722009353; x=1722614153; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YRAv0UYaZBRHzMmMc6/UHOuXTKPl+bZfkWewdqL2VRQ=;
        b=MdcaR/yzetEA8hF0WGkYY/tjZSDKPL8mDDYD40hQClsWdNaP8oX0OqkRDq/x3F6N9F
         dbzSXJ8ox3ZuQnFsTnwfxTkmuv1mYtuoTyN6nTAE6fz7J2xUP8ivRIbArDtIr16rm9Gw
         Gqo4t/PEnQA7BtOBvyEzOTJXDUAN4rmJvlcfwdN5EKVnR8AwmsUZQiqBPHtiJsJDXUSC
         chLNZT+g/gWj73n81Bk0WEiJ9EFJwQhxg1G67WSmWGta6S4coGaOuAnCHc4Nr9pj533S
         //Dtsg1JMg06lrOoGOm94gfQ1nV4n4M1+oAmfw+29RW7T3WH/vLzm7tt4YTSFXT4wYsE
         Rbdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722009353; x=1722614153;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YRAv0UYaZBRHzMmMc6/UHOuXTKPl+bZfkWewdqL2VRQ=;
        b=dRCd146jHRfPFKUuABhJy+Bv6GqxeibsJ8Jd0ufTdnd5NLyPSw/v38KkuHu5bP5t69
         ldLvQswx9KcJtpL8TNDptZ/4ml6d9yKYn8aSeCpqQ3OrwYOpw0aMEkmH3zsAfUMdKSt8
         enIWpBjinLnxS77ya25axBYC0OROtG3YMwJuGsjdlkokfnSaHPUebOaAxJwgl0OFZSol
         rMt0031b5zw75SgNLT4ThK5J7oPxZi9Ae14dD8q9Y/PXPskHf5sxXOCVAcdsE9y3yx6P
         7rBSRyb7Fi8s6Un+Dma7V45iqeI/llCEzErzdhtXTwW2qlyIsrKqrltE47oEI/cJZQh6
         V0kw==
X-Gm-Message-State: AOJu0YwuLAizoWj8dVtb110MTlO/6xxt6HdSo3jnlf6l0XxURMqQAbfB
	X/56uBy/QcJK06Sey5FfF3r5WDeejyL51CPEpntz6CInfWNAApB6
X-Google-Smtp-Source: AGHT+IF/zZ+4AxHP8HXgkXmnO8q+aLAdzq7zagVjKUrzTzUyU83W7cZO/IPQgwEGgndfwmI2pr/qVQ==
X-Received: by 2002:a05:600c:a07:b0:426:6a5e:73c5 with SMTP id 5b1f17b1804b1-42811e0b9e0mr65395e9.37.1722009352388;
        Fri, 26 Jul 2024 08:55:52 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f92c7cb3sm125734195e9.0.2024.07.26.08.55.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 08:55:52 -0700 (PDT)
Message-ID: <ae5b577e-005c-49e3-bfe7-aec330b072a7@gmail.com>
Date: Fri, 26 Jul 2024 17:55:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpcbind: Fix boot time start failure
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Steve Sakoman <steve@sakoman.com>
References: <20240726112431.698884-1-zboszor@gmail.com>
 <CAJdd5GYtvYx8szx6W2hMgKh=UHkAX7+FJ4gmaVJ4eyNj4F7teA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <CAJdd5GYtvYx8szx6W2hMgKh=UHkAX7+FJ4gmaVJ4eyNj4F7teA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jul 2024 15:55:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202544

2024. 07. 26. 17:21 keltezéssel, Joshua Watt írta:
> On Fri, Jul 26, 2024 at 5:24 AM Zoltán Böszörményi <zboszor@gmail.com> wrote:
>> With commits 90bc1810 ("bitbake.conf: Add runtimedir") and
>> 561e853e ("rpcbind: Specify state directory under /run") rpcbind
>> still can fail during startup.
>>
>> It has two problems:
>> * The lockfile is still hardcoded as "/var/run/rpcbind.lock".
>>    It needs to use the same internal define for RPCBIND_STATEDIR
>>    as the paths for rpcbind.xdr and portmap.xdr.
>> * Using --with-statedir=/run/rpcbind doesn't guarantee that this
>>    directory exists when rpcbind.service starts. Add this guarantee
>>    by running rpcbind.service with After=systemd-tmpfiles-setup.service
>>    and add the tmpfiles.d entry for /run/rpcbind.
> The original patches have been working for me on nanbield (and
> kirkstone), so I'm a little confused as to why this is not working for
> you; I'd like to avoid patching the source code if at all possible as
> carrying patches like this is a burden

The error I got is:

rpcbind[455]: rpcbind: /var/run/rpcbind.lock: Read-only file system

So, while /var/run is a symlink to /run, the latter is not writable yet.
Indeed, rpcbind.service was starting very early. These changes
delay it enough to avoid the problem.

The inconsistency between using /run via --with-statedir=/run
directly for some the xdr files but not for the lockfile is not nice.
That must have been an oversight in the source code.

These changes fix the issue for me in nanbield. I can reproduce
the above problem in scarthgap without these changes.

FWIW, different machines can give very different testing results,
due to the differences in their number of CPU cores and speed.
Recently, I had to add a modified rngd.service from dracut
to rng-tools as an in-house change, because one particular
machine (slow by today's standards, based on AMD Kabini)
ended up with this service failing, due to the CPU not supporting
RDRAND and the JITTER random source driver starting particularly
slowly on it, so rngd couldn't pick it up when started only from
initramfs.

>> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> ---
>>   ...ke-the-lockfile-follow-with-statedir.patch | 31 ++++++++++++++++++
>>   ...ice-after-etc-tmpfiles.d-is-processe.patch | 32 +++++++++++++++++++
>>   .../rpcbind/rpcbind/rpcbind.tmpfiles          |  1 +
>>   .../recipes-extended/rpcbind/rpcbind_1.2.6.bb |  6 ++++
>>   4 files changed, 70 insertions(+)
>>   create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-Make-the-lockfile-follow-with-statedir.patch
>>   create mode 100644 meta/recipes-extended/rpcbind/rpcbind/0002-Run-rpcbind.service-after-etc-tmpfiles.d-is-processe.patch
>>   create mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles
>>
>> diff --git a/meta/recipes-extended/rpcbind/rpcbind/0001-Make-the-lockfile-follow-with-statedir.patch b/meta/recipes-extended/rpcbind/rpcbind/0001-Make-the-lockfile-follow-with-statedir.patch
>> new file mode 100644
>> index 0000000000..d487312d22
>> --- /dev/null
>> +++ b/meta/recipes-extended/rpcbind/rpcbind/0001-Make-the-lockfile-follow-with-statedir.patch
>> @@ -0,0 +1,31 @@
>> +From f10db88174e73c78c028561715f16ed38148ebde Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
>> + <zboszor@gmail.com>
>> +Date: Fri, 26 Jul 2024 12:36:06 +0200
>> +Subject: [PATCH 1/2] Make the lockfile follow --with-statedir=
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Upstream-Status: Inactive-Upstream [lastrelease: 2021-05-10]
>> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> +---
>> + src/rpcbind.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/src/rpcbind.c b/src/rpcbind.c
>> +index 36a95b9..948a284 100644
>> +--- a/src/rpcbind.c
>> ++++ b/src/rpcbind.c
>> +@@ -105,7 +105,7 @@ char *nss_modules = "files";
>> + /* who to suid to if -s is given */
>> + #define RUN_AS  "daemon"
>> +
>> +-#define RPCBINDDLOCK "/var/run/rpcbind.lock"
>> ++#define RPCBINDDLOCK RPCBIND_STATEDIR "/rpcbind.lock"
> /var/run should be a symlink to /run, so I really don't think this
> should be necessary (at least with the default value for $runtimedir)
>
>> +
>> + int runasdaemon = 0;
>> + int insecure = 0;
>> +--
>> +2.45.2
>> +
>> diff --git a/meta/recipes-extended/rpcbind/rpcbind/0002-Run-rpcbind.service-after-etc-tmpfiles.d-is-processe.patch b/meta/recipes-extended/rpcbind/rpcbind/0002-Run-rpcbind.service-after-etc-tmpfiles.d-is-processe.patch
>> new file mode 100644
>> index 0000000000..f454fdbb3b
>> --- /dev/null
>> +++ b/meta/recipes-extended/rpcbind/rpcbind/0002-Run-rpcbind.service-after-etc-tmpfiles.d-is-processe.patch
>> @@ -0,0 +1,32 @@
>> +From 408b18c77c254baaa9111b3e7031ebf12149db38 Mon Sep 17 00:00:00 2001
>> +From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
>> + <zboszor@gmail.com>
>> +Date: Fri, 26 Jul 2024 12:54:38 +0200
>> +Subject: [PATCH 2/2] Run rpcbind.service after /etc/tmpfiles.d is processed
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Upstream-Status: Inactive-Upstream [lastrelease: 2021-05-10]
>> +Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
>> +---
>> + systemd/rpcbind.service.in | 3 +++
>> + 1 file changed, 3 insertions(+)
>> +
>> +diff --git a/systemd/rpcbind.service.in b/systemd/rpcbind.service.in
>> +index f45ee1e..e9d94ce 100644
>> +--- a/systemd/rpcbind.service.in
>> ++++ b/systemd/rpcbind.service.in
>> +@@ -9,6 +9,9 @@ RequiresMountsFor=@statedir@
>> + Requires=rpcbind.socket
>> + Wants=rpcbind.target
>> +
>> ++# Make sure the runtime directory exists
>> ++After=systemd-tmpfiles-setup.service
> I'd rather have the recipe provide a drop file for this instead of
> patching the source
>
>> ++
>> + [Service]
>> + Type=notify
>> + EnvironmentFile=-@_sysconfdir@/rpcbind.conf
>> +--
>> +2.45.2
>> +
>> diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles
>> new file mode 100644
>> index 0000000000..fecee72c09
>> --- /dev/null
>> +++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.tmpfiles
>> @@ -0,0 +1 @@
>> +d /run/rpcbind 0755 root root -
>> diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
>> index e751eb631c..477092b37d 100644
>> --- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
>> +++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
>> @@ -13,8 +13,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b46486e4c4a416602693a711bb5bfa39 \
>>   SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
>>              file://init.d \
>>              file://rpcbind.conf \
>> +           file://rpcbind.tmpfiles \
>>              file://rpcbind_add_option_to_fix_port_number.patch \
>>              file://0001-systemd-use-EnvironmentFile.patch \
>> +           file://0001-Make-the-lockfile-follow-with-statedir.patch \
>> +           file://0002-Run-rpcbind.service-after-etc-tmpfiles.d-is-processe.patch \
>>             "
>>   SRC_URI[sha256sum] = "5613746489cae5ae23a443bb85c05a11741a5f12c8f55d2bb5e83b9defeee8de"
>>
>> @@ -49,6 +52,9 @@ do_install:append () {
>>                  ${UNPACKDIR}/init.d > ${D}${sysconfdir}/init.d/rpcbind
>>          chmod 0755 ${D}${sysconfdir}/init.d/rpcbind
>>          install -m 0644 ${UNPACKDIR}/rpcbind.conf ${D}${sysconfdir}/rpcbind.conf
>> +
>> +       install -d ${D}${sysconfdir}/tmpfiles.d
>> +       install -m 0644 ${UNPACKDIR}/rpcbind.tmpfiles ${D}${sysconfdir}/tmpfiles.d/rpcbind.conf
>>   }
>>
>>   ALTERNATIVE:${PN} = "rpcinfo"
>> --
>> 2.45.2
>>


