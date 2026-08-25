Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A9A9C61DC2
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 20:13:37 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31435.1787688814900655820
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 13:13:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=kF2KaqQ3;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: alhe@linux.microsoft.com)
Received: from [10.0.5.46] (unknown [70.37.26.63])
	by linux.microsoft.com (Postfix) with ESMTPSA id 8EF9C20B7166;
	Tue, 25 Aug 2026 13:13:01 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 8EF9C20B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1787688781;
	bh=DhhJBhLsC4b6HMLJlBzSFZumUBoii495l+jPPexlXbo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=kF2KaqQ3rYqB1AqHm10mwrs+iIa4UOT9/KNouGtMyGgpPMXoqzDwborWBua8uPTV9
	 cbovgHbDpuf4gYMp9xhcGdMyc4SMCpF7FSiQw7tUWmrQVucTFQFUBcgS/uhr1fFlq9
	 zwy4Ka3SQiFKK4TAKiAA1Q8fq33GCu0pbaXwm4nc=
Message-ID: <74672213-eec7-4acb-9326-8d0225042815@linux.microsoft.com>
Date: Tue, 25 Aug 2026 14:13:28 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] rust: Avoid passing host-specific
 information to crates Strict Version Hash
To: mathieu.dubois-briand@bootlin.com,
 openembedded-core@lists.openembedded.org
References: <20260824235606.4035992-1-alhe@linux.microsoft.com>
 <DKY8ZEFTEBOF.2QVJI76PJ4GKR@bootlin.com>
Content-Language: en-US
From: Alejandro Hernandez <alhe@linux.microsoft.com>
In-Reply-To: <DKY8ZEFTEBOF.2QVJI76PJ4GKR@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 20:13:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244272


On 8/25/2026 12:48 PM, Mathieu Dubois-Briand via lists.openembedded.org=20
wrote:
> On Tue Aug 25, 2026 at 1:56 AM CEST, Alejandro Hernandez Samaniego via =
lists.openembedded.org wrote:
>> rustc computes each crate's Strict Version Hash (SVH) using inputs tha=
t include
>> the *stage0/stage1 bootstrap compiler* fingerprint, which in turn depe=
nds on the
>> build host arch.
>>
>> This eventually may cause sstate matches across architectures for arti=
facts that
>> are actually different, causing autobuilder intermitent reproducibilit=
y issues.
>>
>> To avoid this, pass a fixed value instead of host-specific bits to the=
 specified
>> hash.
>>
>> [YOCTO #15554]
>>
>> Assisted-by: AI - OpenAI
>> Signed-off-by: Alejandro Hernandez <alhe@linux.microsoft.com>
> Hi Alejandro,
>
> This looks broken here:
>
> ERROR: rust-native-1.97.1-r0 do_install: Execution of '/srv/pokybuild/y=
octo-worker/genericx86-64/build/build/tmp/work/x86_64-linux/rust-native/1=
.97.1/temp/run.do_install.2682640' failed with exit code 1
> ...
> ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/generi=
cx86-64/build/build/tmp/work/x86_64-linux/rust-native/1.97.1/temp/log.do_=
install.2682640
> ...
> |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>=
      ] 275/348: object, schemars, tracing-s=E2=80=A6
> |    Compiling rustc_span v0.0.0 (/srv/pokybuild/yocto-worker/genericx8=
6-64/build/build/tmp/work-shared/rust-source-1.97.1-r0/sources/rustc-1.97=
.1-src/compiler/rustc_span)
> |     Building [=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D>=
      ] 276/348: object, schemars, tracing-s=E2=80=A6
> | error: expected `;`, found `StableCrateId`
> |    --> /rustc-dev/8bab26f4f68e0e26f0bb7960be334d5b520ea452/compiler/r=
ustc_span/src/def_id.rs:200:59
> |     |
> | 200 |         hasher.write(b"
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/4510
>
> Can you have a look at the issue?

I'll take a look



> Thanks,
> Mathieu
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#244262): https://lists.openembedded.org/g/openembed=
ded-core/message/244262
> Mute This Topic: https://lists.openembedded.org/mt/120913402/4354175
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alhe@linux.microsoft.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

