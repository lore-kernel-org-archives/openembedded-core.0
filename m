Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F71FCC06D
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 20:05:19 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3573.1772827517099404504
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Mar 2026 12:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T/iGt03/;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a12cd0bcd8so3212526e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 12:05:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772827515; cv=none;
        d=google.com; s=arc-20240605;
        b=ZxEIfhHGvr6/zb1TnGg4es7Xf5pl2vUK6Z2eqyTbnOfleuMy+WxVS+AajHyM3Tpj3C
         DgeDNLjyREsLAqsDA3nEehxB4/9kJFbrGFCOEKzACh57WPBIzgl4PZe56PSpQ7uWg2RR
         tSGzrVUJUGkIaEu1d+o2TNPq+naSJ2PDPG0pMNZ/G0RBm+S2IYB1spkMkTJOVO/HlqUC
         nZW2x0KtZEPvx2qKR9WCdPDvcdrHUU7n9wh4vbawbjLnh9Qm/aRGjitprK3OGWzNvesR
         SDzfAKYXvsTZU3CDubMKTHDeZJTRlMkJrT2SiFESsCnbfhl2Xg9LgHSIxC9lDHas2E45
         xitA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V89Ng7bzxEc5CtJdEknMfOpVnbnnzIEktcktPiozhos=;
        fh=VWGttQceh93+KB5gSE9Mz+H/QvpTOTkqSX1Dcy+a/SI=;
        b=jag3VQxPyWv6CUOWno8dM/KJIV/DhuX/PCBZi6oP1uPBqRTkB46UExlOrhxo/gl9A7
         BRlSXQfazbbH7gUWfCgjnU3Mgmzk3J2hMMR5FKyk6jhhZIYS+qKWAAIDsUX+Qt+87I3b
         WSQjaWOuJ6co2WBWasop3Aa91m7yn7X/dGD5qW6KeLYGXdjbSWkBCBHGjzkqbOSO8Ecp
         e1DM5O8JZjjp6JYcTM3Qk+BJEp4908KXMxJM0iZ+kzJ0n5LO7oMyqMZNhWhse4Rymml5
         44X43k74vLhmttz9SflFh7B9M89Wexaj925rtQadnWFdWCx+fnaWoUjHKjDTceJcOACU
         yj4Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827515; x=1773432315; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V89Ng7bzxEc5CtJdEknMfOpVnbnnzIEktcktPiozhos=;
        b=T/iGt03/UV4aDJTGBbc4LTG8DvBCaSGtQiPCn2VnNe6k2I1dl7maGLQs5GamDkmZuV
         wU1MZkPGfpah7XcadsJcHCWJXLRor9VMnlpmaegaAbUlIq6w0paJqDhYbYORGcup2Q+A
         T4DMD6jMungePC2xLS+GfeUWYwjlvemI/cIQXH2OcDz7s6lMsWFSIQUNXUtPm1VzZ7Og
         VY2orocRvQ+AjsSZnDweJ5IpKA8YqSMX90azVYNwdWurnUFQFugYglw20hBJ5zfclDls
         IlAfajdL13hiPy5g8PbedgFhgjcRGrqvQchoNQajAGGRFijhVq/Y1OJ5p+G5mM9+x/zv
         1WOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827515; x=1773432315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V89Ng7bzxEc5CtJdEknMfOpVnbnnzIEktcktPiozhos=;
        b=UjDNj7Gp06lTR2xhc5TpWD9FXTo69J0NGeE8DQlAowgmYqQ6+27T0IkN68tcrdreyH
         woIOdQMuM93ak8JcNu0rYR+6lXepEwUW5q/1zwTajPB3wIKD9pD5Z/BpQpnxL4rYZoXK
         dwPzK8dMLvwFplWI9mStzBh9GF5f+epIhwwuFjP74t+MzCnd7JEypnDG4+SBI5XtPBgv
         A28EjxJVv3IPgEEVFrSpywsL0/xA23D0FZPNjG7NHYv6mKmumdMn1F7uyFadn71KGtqj
         Sf+tXvcfe1+kzvsghXUSmGtFTmhl+3PpvOYxTbe1S00oJ8/N/o+Z7fVuz4U3VAo8oe0b
         l8vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAwKYYYsv0UxtW/SfwCoPyraJtciFG+v9FElNKeyGsvdWwSdWXPtw6U5vrVl52l5KwMi5oe3npim8wPCBAskQUAw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yxup61ryAU7cKMi8kzulQnEezWPShaYYbWKAPeXxjDeHdKEN99b
	2gGsVoV+SKPtzDufnai8bR71uhHyrb4KBt5Mi15ppZ3ORG5OA6IWKb4XX+nn3RlFzlU4VOpavLk
	rNMifquJuD/RflHWIKdciqxB8v6TFBoY=
X-Gm-Gg: ATEYQzzLh9NtyXdNdLbzyC9kuLwUbxEWPBtkwenseZluP7qPMjEKwEt3tzs+U75lOw2
	nm6M1AEocx+AGk9oQzH4ga5VDhSYdf8xlKgMDtGmReCgr/Dw5cHzUUxvixzHY5/Pt/aD6Dc5rH1
	bNNSQc7+pqax5vo3e/rqqbd4hkkj2IjDWWVTS0CJ41EGVeLbr25FK3cnN5WA7rLAdd0gg44qs0R
	pNhwl/IjZKSrmUnLtDlViqNKN+Z6gb8F2W13ui/Zbgm6pMvVdEdNBMkvsfg+6+fHM/RHIp8gtxW
	9x2mHqzHVQ==
X-Received: by 2002:a05:6512:2395:b0:5a1:34d2:b6db with SMTP id
 2adb3069b0e04-5a13cab84camr1389559e87.1.1772827514832; Fri, 06 Mar 2026
 12:05:14 -0800 (PST)
MIME-Version: 1.0
References: <20260127053941.792825-1-raj.khem@gmail.com> <DGM7WKPONTXD.ZOV8O0CMQHXR@bootlin.com>
 <25b7aea3-e05c-4378-95b7-ad269a4ee93d@windriver.com> <CAMKF1sr+-xaOSezgQ92xPUSX7qPH_ruG6_Zkfq+TAG1gGpWh5A@mail.gmail.com>
 <59a0aba3-8d3b-4bf1-9d5a-c1b2e7b16e8c@windriver.com>
In-Reply-To: <59a0aba3-8d3b-4bf1-9d5a-c1b2e7b16e8c@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 6 Mar 2026 21:05:00 +0100
X-Gm-Features: AaiRm530GSDIrV5pjVl5NR_JNcgUXuh8fkCjXAX32hTWwGS-SyQkbUjaJlfyVvc
Message-ID: <CA+chaQczQ+eYyG0bKhYBW26UN4Z7tQCWsoNd2g959THOKCe_BQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.43 release
To: Hemanth.KumarMD@windriver.com
Cc: raj.khem@gmail.com, Randy MacLeod <randy.macleod@windriver.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Mar 2026 20:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232590

I've sent fix for m4 and dtc in oe-core (pipewire, libwebsockets in
meta-oe) and have a possible fix for pseudo (waiting for reply from
maintainer).
gettext is fixed by the upgrade to 1.0 (was shared separately by Randy)

Cheers,

On Fri, Mar 6, 2026 at 8:00=E2=80=AFPM Hemanth Kumar M D via
lists.openembedded.org
<Hemanth.KumarMD=3Dwindriver.com@lists.openembedded.org> wrote:
>
>
> On 06-03-2026 01:59 am, Khem Raj via lists.openembedded.org wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
> Please pick the latest from my branch I will be traveling for next 10 Day=
s
>
>
>
> We picked up Khem=E2=80=99s patch and have been working on resolving the =
autobuilder failure. The earlier autobuilder failure reported in this threa=
d has been addressed However, running a bitbake world build initially expos=
ed failures in the following modules:
>
> gettext-0.26-r0
>
> lib32-gettext-0.26-r0
>
> dtc-1.7.2-r0
>
> lib32-dtc-1.7.2-r0
>
> m4-1.4.20-r0
>
> lib32-m4-1.4.20-r0
>
> lib32-ltp-20260130-r0
>
> ltp-20260130-r0
>
> lib32-barebox-tools-2026.01.0-r0
>
> barebox-tools-2026.01.0-r0
>
> lib32-pseudo-1.9.3+git-r0
>
> pseudo-1.9.3+git-r0
>
> Several of these issues have been resolved by upgrading the affected comp=
onents or by backporting upstream fixes.
>
> The remaining failures are currently in:
>
> lib32-ltp-20260130-r0
>
> ltp-20260130-r0
>
> lib32-barebox-tools-2026.01.0-r0
>
> barebox-tools-2026.01.0-r0
>
> We are continuing to investigate these issues and will share the updates =
soon.
>
> On Thu, Mar 5, 2026, 8:23=E2=80=AFAM Randy MacLeod via lists.openembedded=
.org <randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>>
>> On 2026-02-23 4:01 a.m., Mathieu Dubois-Briand via lists.openembedded.or=
g wrote:
>>
>> On Tue Jan 27, 2026 at 6:39 AM CET, Khem Raj via lists.openembedded.org =
wrote:
>>
>> License-Update: Match to changes [1]
>>
>> Added free_sized, free_aligned_sized, memset_explicit, memalignment, and=
 new time bases (TIME_MONOTONIC, etc.).
>>
>> Support for the Linux mseal system call to protect memory mappings (seal=
ing).
>>
>> Added support for the openat2 system call, allowing more granular file o=
pening options.
>>
>> New, optimized, and correctly rounded functions from the CORE-MATH proje=
ct (acosh, asinh, atanh, erf, erfc, lgamma, tgamma).
>>
>> Significant 4x improvements for fused multiply-add (FMA) on AMD Zen 3 by=
 updating ldbl-96 implementation.
>>
>> Improved remainder, frexp, and frexpl.
>>
>> Experimental Clang Support: Added support for building with LLVM Clang (=
version 18+) on AArch64/x86_64 Linux.
>>
>> New CPU Detection: Enhanced detection for newer CPU architectures.
>>
>> 64-bit atomics for 32bit x86 patch is no longer required since upstrea h=
as dropped this logic in 2.43 release
>>
>> [1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dcommit;h=3Da0ce8b0779e=
290596e99ca6d96c301684a2d7cfe
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>
>> Hi Khem,
>>
>> I have some build issue with this patch. Yet I had some merge
>> conflicts, so maybe my resolutions were not correct.
>>
>> ERROR: nativesdk-gcc-runtime-15.2.0-r0 do_compile: Execution of '/srv/po=
kybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-nativesdk-po=
kysdk-linux/nativesdk-gcc-runtime/15.2.0/temp/run.do_compile.3275864' faile=
d with exit code 1
>> ...
>> | /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work-shared/=
gcc-15.2.0-r0/sources/gcc-15.2.0/libgomp/affinity-fmt.c:330:25: error: init=
ialization discards 'const' qualifier from pointer target type [-Werror=3Dd=
iscarded-qualifiers]
>> |   330 |               char *q =3D strchr (p + 1, '}');
>> |       |                         ^~~~~~
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/3240
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/3229
>>
>> The branch that was tested if you want to check: https://git.yoctoprojec=
t.org/poky-ci-archive/tag/?h=3Doecore/autobuilder.yoctoproject.org/valkyrie=
/a-full-3260
>>
>> Thanks,
>> Mathieu
>>
>>
>> Khem,
>>
>> Will you send a new version of this patch or should Deepesh do that ?
>> We need this ASAP.
>>
>> ../Randy
>>
>>
>>
>> --
>> # Randy MacLeod
>> # Wind River Linux
>>
>>
>>
>>
>
>
>
> --
> Regards,
> Hemanth Kumar M D
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#232589): https://lists.openembedded.org/g/openembedde=
d-core/message/232589
> Mute This Topic: https://lists.openembedded.org/mt/117484328/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ma=
rtin.jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

