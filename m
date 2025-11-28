Return-Path: <michael.opdenacker@rootcommit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4807ECFD376
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 13:40:40 +0000 (UTC)
Received: from bumble.maple.relay.mailchannels.net (bumble.maple.relay.mailchannels.net [23.83.214.25])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16131.1764337234238627895
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Nov 2025 05:40:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@rootcommit.com header.s=hostingermail-a header.b=rgtbr1bR;
 spf=pass (domain: rootcommit.com, ip: 23.83.214.25, mailfrom: michael.opdenacker@rootcommit.com)
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 895B86C197D;
	Fri, 28 Nov 2025 13:40:33 +0000 (UTC)
Received: from fr-int-smtpout15.hostinger.io (trex-green-2.trex.outbound.svc.cluster.local [100.99.170.120])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 5B0996C07D3;
	Fri, 28 Nov 2025 13:40:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1764337233;
	b=tkcURVa2IKfhn+2/ljou+BCi6a2zQ8TXXFPrX9vDA2yZVyIL3UxooY8INt7AwuE9Xe2Mpn
	zYwYAhm7N56J+DdzcQZnjQ9XC5Bu5HH2b9b5Z9G5Y4xgsgYMsqPoz9NirU7+omyR16sQ/b
	rMwVPn1iYrQ9dddmMrFfxS8ch1EDNR23kXNXs+HJCqvdHLtENBPKzMBKLYdlnwjRnNOaDb
	Yt/m9Ei3YuXq1wjs/l5tchG6Fo4OxaH58CjVB77Y5TSY541tQdRY7iiDnnejoJP77JmQXk
	2Xxy6M8fdaviZ3ZEA9nUDTVFrIThdbc5JIV92qFo8IUJqDz/zsrZ4YUhJN4j0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1764337233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=wsXXkGuDpP878u/A+EpryC6Vvr19Q7xYnGRWUafppdI=;
	b=5tF9xp9hJYziM2BLJg5oXlt9pVqmM3qm+wwQoERz/zaR7WhNAh2JQ4BhsJj3znFPChCXO/
	eDJGZTZgf5DnixL/HjpY+nEEp2q1sCb/YXJznPTQ6+scdsJZhO8vM+xTGSu2/v5I5jAlBj
	F77CrChZEdxAvHlJYtkQ6FxlYDFangtaq4SV8zdJNWcUmT7RZXvkGaTwMZQ8t7AKuvq602
	fWiacZ1lt3l1pFvALQ1JDpJR6PqIAU5HpOrYGKXehMqjFeyRy9T2MzTutkJ4A2I5+9ge2X
	Rq6NezjOABuAGCjeFAnt2g6+R9sz8fmOP38YF7Bdwz1qi2tQR0+K8Hb3vrM9FA==
ARC-Authentication-Results: i=1;
	rspamd-74f6bfdf88-wxv9c;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: 
 hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Cure-Versed: 1584007b2cd21dd2_1764337233335_2095407685
X-MC-Loop-Signature: 1764337233335:916727619
X-MC-Ingress-Time: 1764337233335
Received: from fr-int-smtpout15.hostinger.io (fr-int-smtpout15.hostinger.io
 [148.222.54.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.170.120 (trex/7.1.3);
	Fri, 28 Nov 2025 13:40:33 +0000
Received: from [IPV6:2001:861:4450:d360:db39:e8df:3f13:f095] (unknown [IPv6:2001:861:4450:d360:db39:e8df:3f13:f095])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4dHvZ61zsqz1xnv;
	Fri, 28 Nov 2025 13:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1764337230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wsXXkGuDpP878u/A+EpryC6Vvr19Q7xYnGRWUafppdI=;
	b=rgtbr1bR9SJy43oL3Lpj7OxG2Yh0FZPnhoerqw92/VhDjIRWc+C3kvm8OkcUzEgblVDAym
	AdGd+JqBsklcs872prNMD0Qdi86zh1e6yZV45nzNG1DUFrEMG/ALElEYVjweo5v0U6DG6g
	K7ArJchEq31P3Rbp7H8EwmgWNpts0RX3D6cV3CUxgQj9uLoaP7M6KAv1TQODgvhDOGsZj5
	hqdmVGbm8QdA2nsS3Qlynex3HfVHihwKxDDwj6btIhEFGoqS7SLTeTXemUPub/pV5r8tX6
	RMqQ0BSQwShFjHoc4veDjt70n0k51+iLulTUvt8BFExThiO5t0xbYWtuxkQ6oQ==
Message-ID: <4cf47893-8d84-4a4f-8301-a8dcaf9eb510@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, Khem Raj <raj.khem@gmail.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] linux-yocto.inc: remove riscv-isa-clear.scc from
 KERNEL_FEATURES_RISCV?
To: Gyorgy Sarvari <skandigraun@gmail.com>
References: <3a1b9adc-9ac6-44b7-824f-10f5e08f6d37@rootcommit.com>
 <73131023-79db-445a-8341-0b455dd586f6@gmail.com>
 <7e4c03b7-8f5c-4e92-91b2-1535e5533f8d@rootcommit.com>
Content-Language: en-US, fr
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <7e4c03b7-8f5c-4e92-91b2-1535e5533f8d@rootcommit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Date: Fri, 28 Nov 2025 13:40:30 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=DJTd4DNb c=1 sm=1 tr=0 ts=6929a64e a=YQrE8P1zjIj1qofBaZg0ow==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=iGHA9ds3AAAA:8 a=d70CFdQeAAAA:8 a=Q4-j1AaZAAAA:8 a=Dg6HmOWyXyUJ4i4mhC4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=NcxpMcIZDGm-g932nG_k:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-CM-Envelope: MS4xfFjE+w+Mr6Qj16vWFX2JFYaZ2hkQJ79FvSGL+WVSNUFWZubDumkBHuvJLoMCP6W9coebdRrtoKIbrtebG+bUgzLm6oD6+JJTYnwevI6PduSpk/QtgfnM UKeUjT864DDq+xROv+kw1SnWG80vnHoBVgSD42pODSCndKwQswAzdpLt3OLiBxDoQZJqaw908cR5ONOGPtEzPbGal8wd0cm8Nhp9b/uVDOB2uhMIVWv/eHu+ 4ku4/mofDxYCDGexiRmCccKq/PmIlxDfU8NeW4Vo8MK0IMuQ+ahL+sHLb5In2jvoIvbgBdXeSaU3leTv5oTaofH7g0WbHFEhnw7ALqzc08n4lQIGw+VUpt+Z eRVMDyQNfPGShU9E5Cf6QSNIBirOzpdvO8fMi5fz3PR+NiEEQaUOJOBL+lSISaE6P0MGJSTs3fzJgYet6usWW5nWn9r8b7RRteEXvygSW6A0PppfmKA=
X-AuthUser: michael.opdenacker@rootcommit.com
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Nov 2025 13:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226911


On 11/27/25 12:03, Michael Opdenacker wrote:
> Hi=C2=A0Gyorgy
>
> On 11/27/25 11:46, Gyorgy Sarvari wrote:
>>
>> On 11/27/25 11:20, Michael Opdenacker via lists.openembedded.org wrote=
:
>>> Greetings,
>>>
>>> I'm getting the same issue trying a master build on several RISC-V=20
>>> boards:
>>>
>>> ERROR: linux-milkv-duo-dev-1.0-r0 do_kernel_metadata: Feature
>>> 'arch/riscv/tunes/riscv-isa-clear.scc' not found, this will cause
>>> configuration failures.
>>> ERROR: linux-milkv-duo-dev-1.0-r0 do_kernel_metadata: Check the SRC_U=
RI
>>> for meta-data repositories or directories that may be missing
>>> ERROR: linux-milkv-duo-dev-1.0-r0 do_kernel_metadata: Set
>>> KERNEL_DANGLING_FEATURES_WARN_ONLY to ignore this issue
>>>
>>> OK, I can set
>>> KERNEL_DANGLING_FEATURES_WARN_ONLY =3D "1"
>>> but is this a clean solution?
>>>
>>> Where are all the arch/riscv/tunes/riscv-isa-*.scc files supposed to=20
>>> be?
>>> I didn't manage to find them anywhere...
>> Do you have the yocto-kernel-cache[1] repo in your SRC_URI? The scc
>> files come from there
>>
>> [1]:=20
>> https://git.yoctoproject.org/yocto-kernel-cache/tree/arch/riscv/tunes
>
> Ho, thanks! That was exactly what I needed.
> I will add these to my kernel recipes.

Interestingly, the Linux 6.18-rc7 kernel on my OrangePi RV2 board hates=20
the change.

It's not completely crashing, but many devices get initialized with the=20
same kind of error:

"device non-coherent but no non-coherent operations supported"

0.111641] ------------[ cut here ]------------
[ 0.111652] spacemit,k1-ccu d4090000.clock-controller: device=20
non-coherent but no non-coherent operations supported
[ 0.111659] WARNING: CPU: 0 PID: 1 at=20
/usr/src/kernel/arch/riscv/mm/dma-noncoherent.c:139=20
arch_setup_dma_ops+0x96/0xfc
[ 0.111673] Modules linked in:
[ 0.111682] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G S 6.18.0-rc7=20
#1 NONE
[ 0.111690] Tainted: [S]=3DCPU_OUT_OF_SPEC
[ 0.111693] Hardware name: OrangePi RV2 (DT)
[ 0.111696] epc : arch_setup_dma_ops+0x96/0xfc
[ 0.111703] ra : arch_setup_dma_ops+0x96/0xfc
[ 0.111709] epc : ffffffff8001ea02 ra : ffffffff8001ea02 sp :=20
ffffffc600043b70
[ 0.111713] gp : ffffffff81a1ae08 tp : ffffffd700230000 t0 :=20
ffffffff81829520
[ 0.111717] t1 : ffffffff8181c228 t2 : 2d2d2d2d2d2d2d2d s0 :=20
ffffffc600043b90
[ 0.111720] s1 : ffffffd700b79c10 a0 : 0000000000000067 a1 :=20
00000000fffff264
[ 0.111724] a2 : 0000000000000000 a3 : 00000000fffff264 a4 :=20
0000000000000000
[ 0.111728] a5 : 0000000000000000 a6 : 0000000000000004 a7 :=20
0000000000000000
[ 0.111731] s2 : 0000000000000000 s3 : 0000000000000000 s4 :=20
0000000000000000
[ 0.111734] s5 : ffffffff80e30800 s6 : 0000000000000008 s7 :=20
0000000000000000
[ 0.111738] s8 : 0000000000000143 s9 : 0000000000000000 s10:=20
0000000000000000
[ 0.111742] s11: 0000000000000000 t3 : 0000000000000070 t4 :=20
00007fffffffffff
[ 0.111744] t5 : 00007fffffffffff t6 : ffffffff81a3de07
[ 0.111747] status: 0000000200000120 badaddr: 0000000000000000 cause:=20
0000000000000003
[ 0.111752] [<ffffffff8001ea02>] arch_setup_dma_ops+0x96/0xfc
[ 0.111761] [<ffffffff80918f30>] of_dma_configure_id+0x94/0x208
[ 0.111770] [<ffffffff80720050>] platform_dma_configure+0xa4/0xac
[ 0.111778] [<ffffffff8071d8cc>] really_probe+0x54/0x22c
[ 0.111785] [<ffffffff8071db00>] __driver_probe_device+0x5c/0xd4
[ 0.111791] [<ffffffff8071dc3e>] driver_probe_device+0x2e/0xf4
[ 0.111796] [<ffffffff8071de66>] __driver_attach+0x6e/0x14c
[ 0.111802] [<ffffffff8071bae0>] bus_for_each_dev+0x60/0xb0
[ 0.111807] [<ffffffff8071d432>] driver_attach+0x1a/0x24
[ 0.111813] [<ffffffff8071cc9a>] bus_add_driver+0xca/0x1d8
[ 0.111820] [<ffffffff8071ebea>] driver_register+0x3e/0xdc
[ 0.111827] [<ffffffff8071fde4>] __platform_driver_register+0x1c/0x24
[ 0.111834] [<ffffffff80c2ee0a>] k1_ccu_driver_init+0x1a/0x24
[ 0.111843] [<ffffffff8000f8aa>] do_one_initcall+0x4e/0x1b8
[ 0.111849] [<ffffffff80c012ac>] kernel_init_freeable+0x264/0x2e4
[ 0.111858] [<ffffffff80b761b8>] kernel_init+0x1c/0x144
[ 0.111862] [<ffffffff800111b6>] ret_from_fork_kernel+0xe/0x60
[ 0.111870] [<ffffffff80b8081e>] ret_from_fork_kernel_asm+0x16/0x18
[ 0.111877] ---[ end trace 0000000000000000 ]---

 =C2=A0Is this expected?
Cheers
Michael.

--=20
Michael Opdenacker
Root Commit
Yocto Project and OpenEmbedded Training course - Learn by doing:
https://rootcommit.com/training/yocto/


