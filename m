Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 422D2C5DF97
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 15:54:12 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16037.1787759643756357261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2026 08:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=slEP33kU;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [10.0.5.46] (unknown [70.37.26.63])
	by linux.microsoft.com (Postfix) with ESMTPSA id 669B120B7168;
	Wed, 26 Aug 2026 08:53:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 669B120B7168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1787759610;
	bh=XV4CweRdubt/tumzL7hxfBnyXDisoVQyo3R8KCMeaQ4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=slEP33kUv8BrO1BHbhjq+SnsxP/0Mbc2//GhyJqS0puabM80B/vXixMFOrkeIGjhT
	 Fg7BQGIo01XaCo9Yr6+c/eTAulg47u+wu+pIofWDILykMn/tKpNHtYNZ0YzQ0/JI42
	 e9CECwGyiXb3kml5g3BTuKNBd57TsUdQgoxfVAik=
Message-ID: <9dcbee9a-4434-4128-bb00-702480776e35@linux.microsoft.com>
Date: Wed, 26 Aug 2026 09:54:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] rust: Avoid passing host-specific
 information to crates Strict Version Hash
To: mathieu.dubois-briand@bootlin.com,
 openembedded-core@lists.openembedded.org
References: <20260824235606.4035992-1-alhe@linux.microsoft.com>
 <DKY8ZEFTEBOF.2QVJI76PJ4GKR@bootlin.com>
 <18CF258177A95B06.3360474@lists.openembedded.org>
Content-Language: en-US
From: Alejandro Hernandez <alhe@linux.microsoft.com>
In-Reply-To: <18CF258177A95B06.3360474@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 15:54:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244404


On 8/25/2026 2:13 PM, Alejandro Hernandez Samaniego via=20
lists.openembedded.org wrote:
>
> On 8/25/2026 12:48 PM, Mathieu Dubois-Briand via=20
> lists.openembedded.org wrote:
>> On Tue Aug 25, 2026 at 1:56 AM CEST, Alejandro Hernandez Samaniego=20
>> via lists.openembedded.org wrote:
>>> rustc computes each crate's Strict Version Hash (SVH) using inputs=20
>>> that include
>>> the *stage0/stage1 bootstrap compiler* fingerprint, which in turn=20
>>> depends on the
>>> build host arch.
>>>
>>> This eventually may cause sstate matches across architectures for=20
>>> artifacts that
>>> are actually different, causing autobuilder intermitent=20
>>> reproducibility issues.
>>>
>>> To avoid this, pass a fixed value instead of host-specific bits to=20
>>> the specified
>>> hash.
>>>
>>> [YOCTO #15554]
>>>
>>> Assisted-by: AI - OpenAI
>>> Signed-off-by: Alejandro Hernandez <alhe@linux.microsoft.com>
>> Hi Alejandro,
>>
>> This looks broken here:
>>
>> ERROR: rust-native-1.97.1-r0 do_install: Execution of=20
>> '/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64=
-linux/rust-native/1.97.1/temp/run.do_install.2682640'=20
>> failed with exit code 1
>> ...
>> ERROR: Logfile of failure stored in:=20
>> /srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work/x86_64-=
linux/rust-native/1.97.1/temp/log.do_install.2682640
>> ...
>> |=C2=A0=C2=A0=C2=A0=C2=A0 Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ] 275/348: object, sche=
mars,=20
>> tracing-s=E2=80=A6
>> |=C2=A0=C2=A0=C2=A0 Compiling rustc_span v0.0.0=20
>> (/srv/pokybuild/yocto-worker/genericx86-64/build/build/tmp/work-shared=
/rust-source-1.97.1-r0/sources/rustc-1.97.1-src/compiler/rustc_span)
>> |=C2=A0=C2=A0=C2=A0=C2=A0 Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ] 276/348: object, sche=
mars,=20
>> tracing-s=E2=80=A6
>> | error: expected `;`, found `StableCrateId`
>> |=C2=A0=C2=A0=C2=A0 -->=20
>> /rustc-dev/8bab26f4f68e0e26f0bb7960be334d5b520ea452/compiler/rustc_spa=
n/src/def_id.rs:200:59
>> |=C2=A0=C2=A0=C2=A0=C2=A0 |
>> | 200 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hasher.write(b=
"
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4510
>>
>> Can you have a look at the issue?
>
> I'll take a look
>
Looks like I made some mistakes when I rebased the patch onto the latest=20
rust update that was just merged, sending v3



>
>
>> Thanks,
>> Mathieu
>>
>>
>>
>>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#244272): https://lists.openembedded.org/g/openembed=
ded-core/message/244272
> Mute This Topic: https://lists.openembedded.org/mt/120913402/4354175
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alhe@linux.microsoft.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

