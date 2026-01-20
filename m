Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29568D2ECE9
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 15:01:47 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8290.1768921302713113234
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 07:01:43 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 60KF1clX2704232;
	Tue, 20 Jan 2026 09:01:38 -0600
Received: from [192.168.2.106] ([192.168.2.106])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 60KF1clA015911;
	Tue, 20 Jan 2026 09:01:38 -0600
Message-ID: <919b27a6-0223-4749-a77b-1580f3e7cdd6@kernel.crashing.org>
Date: Tue, 20 Jan 2026 09:01:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] pseudo: Update to 1.9.3 release
Content-Language: en-US
To: richard.purdie@linuxfoundation.org, Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
References: <20260120085227.3719998-1-richard.purdie@linuxfoundation.org>
 <CAMSfU+5Xyi8RZFaC4q4b9B9DGGB7=AjbKkvn2s+WtJKcsBVRKA@mail.gmail.com>
 <83cb39fb9474846d054baa83925e63cb4bdef32c.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <83cb39fb9474846d054baa83925e63cb4bdef32c.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 60KF1clX2704232
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 15:01:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229740

I do think we should take it, but it does require the dpkg change as RP m=
entions=20
below.

This should fix the known openat2 issue with RHEL9 and similar systems, a=
nd then=20
maybe deal with issues elsewhere as well.  (realpath, statx and other dif=
ferences)

--Mark

On 1/20/26 4:31 AM, Richard Purdie via lists.openembedded.org wrote:
> On Tue, 2026-01-20 at 09:59 +0100, Yoann Congal wrote:
>> Le=C2=A0mar. 20 janv. 2026 =C3=A0=C2=A009:52, Richard Purdie via
>> lists.openembedded.org
>> <richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> a =C3=A9=
crit=C2=A0:
>>> Pulls in the following changes:
>>>
>>>  =C2=A0 Makefile.in: Bump version to 1.9.3
>>>  =C2=A0 configure: Minor code quality changes
>>>  =C2=A0 pseudo: code quality scan - resolved various potential issues
>>>  =C2=A0 makewrappers: improve error handling and robustness
>>>  =C2=A0 Update COPYRIGHT files
>>>  =C2=A0 ports/linux/pseudo_wrappers.c: Call the wrappers where possib=
le
>>>  =C2=A0 ports/linux/pseudo_wrappers.c: Workaround compile error on De=
bian
>>> 11
>>>  =C2=A0 ports/linux/pseudo_wrappers.c: Reorder the syscall operations
>>>  =C2=A0 ports/unix/guts/realpath.c: Fix indents
>>>  =C2=A0 pseudo_util.c: Skip realpath like expansion for /proc on Linu=
x
>>>  =C2=A0 test/test-proc-pipe.sh: Add test case for proc pipes
>>>  =C2=A0 ports/unix/guts/realpath.c: realpath fails if the resolved pa=
th
>>> doesn't exist
>>>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>
>> Do you think I should take this for stable inclusion? (leaning toward
>> yes)
>=20
> Good question. Copying Mark.
>=20
> I suspect it will be easier all around if we did take it. There are a
> lot of fixes in here and it is hard to know which ones any given user
> might need or run into. There isn't any real feature work, just various
> fixes for new glibc calls or existing code. The failure modes for
> pseudo are problematic for end users who wouldn't understand many of
> them. The realpath/proc fixes are the most invasive piece.
>=20
> I would suggest we wait a little bit before taking it, just so we can
> test things with master and ensure there is are no regressions.
>=20
> You would need to take the dpkg ADMINDIR change as well as the pseudo
> changes won't work without that.
>=20
> I'm open to other thoughts either way...
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229656): https://lists.openembedded.org/g/openembed=
ded-core/message/229656
> Mute This Topic: https://lists.openembedded.org/mt/117360386/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
mark.hatle@kernel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

