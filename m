Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5574BC982F1
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 08:01:28 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5103.1790064087106834858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 01:01:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=LsLKg2x8;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 88A571A0F9C
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 08:01:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D71160580
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 08:01:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF0E810328ED1
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 10:01:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790064080; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=lTDb9v4/1rMkGSgDZdzUNsrJbVRV00PWWw9FDr2IhcQ=;
	b=LsLKg2x8JQ7ZXcYhuupRMlHBNK4lFX2JU/AGZC/GMgW/z+++COrDfS9Iuv19UlVusTkAUz
	qZOl5jNozxZZQIyzErfxNTzvX5DMi9iGZXhR97LMOa5SMS++mypQzj8xsyVe15SsdwV+Mn
	3LwJeSw+VEMLrx2h2deJcqVXgnwHJ84k3ITbxXZVEMASBsxD4urA/1WXdrEuTQLnD47tVT
	2APv3DZa2zBbgOtNBYjSTMOoumyS+fLBBsoOHwus5MsY6cfIWbVSzBJZJ6x7lCGVsiPPls
	OgCKbYWy92NOwkhNsduKXA7xGP4BK9DC6M9QzORj/WDF4OOIiFXt4hcyNl7m2w==
Message-ID: <fd3722a7-d7aa-47cd-b20d-72762f9177f1@bootlin.com>
Date: Tue, 22 Sep 2026 10:01:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] ptest-packagelists.inc: disable gnutls for
 RISCV64
To: openembedded-core@lists.openembedded.org
References: <20260918090731.467954-1-joaomarcos.costa@bootlin.com>
 <DLL938ATXJZ6.KL4GU5AB1OH0@baylibre.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <DLL938ATXJZ6.KL4GU5AB1OH0@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 08:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246388

Hello, Trevor

On 9/21/26 9:44 PM, Trevor Gamblin wrote:
> On Fri Sep 18, 2026 at 5:07 AM EDT, Jo=C3=A3o Marcos Costa wrote:
>> Timeouts have been observed (very frequently in the past weeks)
>> in the autobuilder, and a bug [1] was filed at Bugzilla.
>>
>> For now, it's not quite clear what specific test case is causing the t=
imeout.
>>
>> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16162
>=20
> I think that this change is too aggressive given what we actually see i=
n the AB
> issue - most of the logs seem to show a timeout at the same part of the=
 ptest
> run, after the 'mini-record' test. I'm doing some investigation locally=
 to see
> what the heaviest tests in the suite are, so that we can more surgicall=
y disable
> only the problematic ones instead.

Well, it was agressive indeed, considering how frequent this one became=20
in the past few weeks, and I was not 100% happy to send this patch=20
either way.

So thanks a lot for narrowing it down. I can send a v2 later this week=20
to handle the worst offenders (as per your comment in bugzilla).

> Trevor
>>
>> Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
>> ---
>>   meta/conf/distro/include/ptest-packagelists.inc | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/co=
nf/distro/include/ptest-packagelists.inc
>> index 79e27f617b..9b264657bb 100644
>> --- a/meta/conf/distro/include/ptest-packagelists.inc
>> +++ b/meta/conf/distro/include/ptest-packagelists.inc
>> @@ -163,8 +163,8 @@ PTESTS_PROBLEMS:append:riscv32 =3D " lttng-tools s=
trace"
>>   PTESTS_SLOW:append:libc-musl =3D " libc-test"
>>  =20
>>   # These tests don't yet pass for riscv64
>> -PTESTS_SLOW:remove:riscv64 =3D "tcl tcl8 python3-cffi strace lttng-to=
ols python3-numpy perl glib-2.0 zstd"
>> -PTESTS_PROBLEMS:append:riscv64 =3D " tcl tcl8 python3-cffi strace ltt=
ng-tools python3-numpy perl glib-2.0 zstd"
>> +PTESTS_SLOW:remove:riscv64 =3D "tcl tcl8 python3-cffi strace lttng-to=
ols python3-numpy perl glib-2.0 zstd gnutls"
>> +PTESTS_PROBLEMS:append:riscv64 =3D " tcl tcl8 python3-cffi strace ltt=
ng-tools python3-numpy perl glib-2.0 zstd gnutls"
>>  =20
>>   # These tests don't yet pass for musl qemuarm64
>>   PTESTS_SLOW:remove:libc-musl:qemuarm64 =3D "strace perl gnutls glib-=
2.0"
>=20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#246347): https://lists.openembedded.org/g/openembed=
ded-core/message/246347
> Mute This Topic: https://lists.openembedded.org/mt/121311542/8026893
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
joaomarcos.costa@bootlin.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Best regards,
Jo=C3=A3o Marcos Costa


