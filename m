Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8FF0E6748D
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 08:29:49 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76520.1766392182371246416
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 00:29:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mtAJfiQQ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B198D1A236B
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 08:29:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 873C7606C1;
	Mon, 22 Dec 2025 08:29:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D5DE81037114B;
	Mon, 22 Dec 2025 09:29:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766392176; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ryyW6H1rSwDIvVb9ayCKrTG1xrgYjvdmBudzwfNEHXw=;
	b=mtAJfiQQBEoy0nrS+IjPxIc0WUyUHvpvI5gE1N+3keKuWezUx3RDd7CFF/Eqpd9+9OqtLE
	hr7Kh0efnYJc4L/WFHK76shDQXieSwqcnr9mArXONJ5uuz8LXsYO5N2m8WHktFKlosVczM
	BJUyrnCNARGgbHXyw9QNtbwl1NKCpUQ4K83SQtRA8qbfCbqnYwQ/sXDMirWMEhMHNu4EVn
	vZjbwD4De/3SOpNZGZy2C8JRQcdSWjK/9M/JoFptA9ljYTPYhdaYFnnXBvbIFfaK0m1J7o
	K7wDbF8c6wmA6xvQhVn1umNLg46Sh+awrz4Y1rsJpwqFYZ873bPuwm2SyAtFMQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Dec 2025 09:29:32 +0100
Message-Id: <DF4LRLF3UQLQ.1OMN0OZ0WE0YH@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <bruce.ashfield@gmail.com>
Subject: Re: [OE-core] [PATCH 0/21] linux-yocto: combined and consolidated
 pull request
Cc: <richard.purdie@linuxfoundation.org>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <188268ECAC642171.1614991@lists.openembedded.org>
 <CADkTA4MZ6rrU1RxW8zmsAWCMC-zBgdvhWnWBpaXVSpst7njSCg@mail.gmail.com>
In-Reply-To: <CADkTA4MZ6rrU1RxW8zmsAWCMC-zBgdvhWnWBpaXVSpst7njSCg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 08:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228287

On Thu Dec 18, 2025 at 9:56 PM CET, Bruce Ashfield via lists.openembedded.o=
rg wrote:
> On Thu, Dec 18, 2025 at 3:22=E2=80=AFPM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>
>> Hi all,
>>
>> As discussed in the weekly engineering call, I'm sending this as
>> single series even though it crossed boundaries of the repositories.
>>
>> I don't have access to meta-yocto-contrib yet, so I haven't pushed
>> the component parts to contrib branches yet, but will do that for
>> future pull requests.
>>
>> I'm using this as a first run through some things I've cooked up
>> to coordinate the patches across the repos. The formatting is my
>> own, so apologies if it isn't clear .. and we'll see if it all
>>
>> Now to the series for OE-core:
>>
>>  - We have stable updates to 6.12
>>  - A kern-tools fix
>>  - Updates to 6.17
>>  - Removal of 6.17
>>  - Introduction of 6.18
>>  - Bump to libc-headers to 6.18
>>
>> I've built and booted what I can locally, and I know that the
>> major architectures work, and are functional with respect to
>> core features.
>>
>> I have more libc-headers testing running against meta-oe and
>> muslc, so there may be some breakage there and I'll help deal
>> with that if it happens.
>>
>> The update and then removal of 6.17 is on purpose. In case any
>> one was using it, they should get the latest tested before it
>> starts to be removed.
>>
>> For meta-yocto:
>>
>>   - removal of any remaining 6.17 references
>>   - introduction of 6.18
>>
>> The meta-yocto default changes are obviously REALLY RFC/RFT
>> there will be issues, but I've provided them anyway to make it
>> clear that we are going to 6.18 as the new default for all the
>> variants.
>>
>> Once we get 6.18 fully green and the h/w references udpated,
>> I'll remove 6.12 and 6.16 from master. That isn't in this series
>> by design.
>
>
> FYI: my extended testing shows a warning in the virtualization
> fragments. It isn't serious, but will be fixed in incremental patches
> on the end of this queue.
>
> Bruce
>

Hi Bruce,

Sorry, I was a bit late in testing this.

On my side I also get some issues in building strace, are you aware of
this?

ERROR: strace-6.17-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker=
/genericx86-64/build/build/tmp/work/core2-64-poky-linux/strace/6.17/temp/ru=
n.do_compile.3198325' failed with exit code 1
...
| ../../sources/strace-6.17/src/listmount.c: In function 'print_mnt_id_req'=
:
| ../../sources/strace-6.17/src/listmount.c:39:16: error: 'struct mnt_id_re=
q' has no member named 'spare'
|    39 |         if (req.spare) {
|       |                ^
| In file included from ../../sources/strace-6.17/src/listmount.c:9:
| ../../sources/strace-6.17/src/print_fields.h:384:37: error: 'struct mnt_i=
d_req' has no member named 'spare'
|   384 |                 PRINT_VAL_X((where_).field_);                    =
       \
|       |                                     ^
| ../../sources/strace-6.17/src/defs.h:1910:17: note: in definition of macr=
o 'zero_extend_signed_to_ull'
|  1910 |         (sizeof(v) =3D=3D sizeof(char) ? (unsigned long long) (un=
signed char) (v) : \
|       |                 ^
| ../../sources/strace-6.17/src/print_fields.h:384:17: note: in expansion o=
f macro 'PRINT_VAL_X'
|   384 |                 PRINT_VAL_X((where_).field_);                    =
       \
|       |                 ^~~~~~~~~~~
| ../../sources/strace-6.17/src/listmount.c:41:17: note: in expansion of ma=
cro 'PRINT_FIELD_X'
|    41 |                 PRINT_FIELD_X(req, spare);
|       |                 ^~~~~~~~~~~~~
| ../../sources/strace-6.17/src/print_fields.h:384:37: error: 'struct mnt_i=
d_req' has no member named 'spare'
|   384 |                 PRINT_VAL_X((where_).field_);                    =
       \
|       |                                     ^
...

https://autobuilder.yoctoproject.org/valkyrie/#/builders/4/builds/2904
https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/2895
https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/2922
https://autobuilder.yoctoproject.org/valkyrie/#/builders/60/builds/2891

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


