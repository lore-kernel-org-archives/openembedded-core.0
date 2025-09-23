Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871FECAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 15:54:41 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.1259.1758642879081746326
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Sep 2025 08:54:39 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 58NFsXxc694021;
	Tue, 23 Sep 2025 10:54:34 -0500
Received: from [192.168.2.99] ([192.168.2.99])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 58NFsWos032736;
	Tue, 23 Sep 2025 10:54:33 -0500
Message-ID: <3b3bb487-cfa5-4476-ae64-f1bd1085381c@kernel.crashing.org>
Date: Tue, 23 Sep 2025 10:54:32 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] pseudo FTBFS on 32-bit arm{el,hf} on Debian
Content-Language: en-US
From: Mark Hatle <mark.hatle@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org, andrew.shadura@collabora.co.uk
References: <a6ccd7f6-effb-4cc3-803e-faf6a9d52b2d@collabora.co.uk>
 <1867F3313EC85EE7.16487@lists.openembedded.org>
In-Reply-To: <1867F3313EC85EE7.16487@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 58NFsXxc694021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Sep 2025 15:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223901

I misread the original report.  I thought it recently stopped working.  I=
t=20
appears if I'm reading it properly it was Debian itself that has changed =
recently.

On 9/23/25 10:32 AM, Mark Hatle wrote:
> What was the last version of pseudo (commit id) that worked, and what i=
s the
> version (commit id) that you tried that failed?
>=20
> I need to look at what has changed in the middle to understand if there=
 is
> anything we can do about this.
>=20
> On 9/23/25 2:23 AM, Andrej Shadura via lists.openembedded.org wrote:
>> Hello,
>>
>> pseudo no longer buildable on armel and armhf in Debian, as well as on
>> other non-i386 32-bit architectures. The common thing they share is th=
at
>> they have all switched to 64 time recently.

Each of the items below DOES need to be defined in this code, in some way=
.  So=20
somewhere, something is defining it in a conflicting way.

The items need to be defined in the wrapper so they can preload and overr=
ide the=20
stock libc versions.  What we need to understand is where they are alread=
y=20
defined, and in what way they are defined in pseudo that is conflicting.

I do not use any of these 32-bit debian systems, so it will require some =
help to=20
debug this.

The pseudo_wrapfuncs.c is PROBABLY where this is defined, and somewhere t=
his is=20
getting linked into the system causing the failure.

libpseudo.so needs to have the functions defined.  The linking of the=20
application code though should not.

One suggestion that might make this easier to 'see' what is happening, 'm=
ake -j=20
1', and figure out exactly what is linking that is triggering the fault.=20
Linking of pseudolog (the application) should not be including the wrappe=
rs=20
AFAIK, if it is.  Follow the .o's being linked and find me the one provid=
ing the=20
conflicting symbol(s).

Note: libpseudo.so is made up of pseudo_wrapper.o + other things.  The=20
pseudo_wrapper.o is where these conflicts should exist, and it should onl=
y be=20
used when linking libpseudo.so.

--Mark

>>>       pseudo_db.o pseudo_tables.o pseudo_util.o -Wl,-z,relro -lsqlite=
3 -lpthread -ldl -lpthread
>>> {standard input}: Assembler messages:
>>> {standard input}:26700: Error: symbol `open64' is already defined
>>> {standard input}:27909: Error: symbol `openat64' is already defined
>>> {standard input}:38225: Error: symbol `__openat64_2' is already defin=
ed
>>> {standard input}:49933: Error: symbol `creat64' is already defined
>>> {standard input}:59933: Error: symbol `__fcntl_time64' is already def=
ined
>>> {standard input}:63000: Error: symbol `fopen64' is already defined
>>> {standard input}:64806: Error: symbol `freopen64' is already defined
>>> {standard input}:66053: Error: symbol `__fstat64_time64' is already d=
efined
>>> {standard input}:67392: Error: symbol `__fstatat64_time64' is already=
 defined
>>> {standard input}:69921: Error: symbol `__ftw64_time64' is already def=
ined
>>> {standard input}:78178: Error: symbol `__glob64_time64' is already de=
fined
>>> {standard input}:85034: Error: symbol `__lstat64_time64' is already d=
efined
>>> {standard input}:93605: Error: symbol `mkostemp64' is already defined
>>> {standard input}:95360: Error: symbol `mkstemp64' is already defined
>>> {standard input}:98362: Error: symbol `__nftw64_time64' is already de=
fined
>>> {standard input}:104764: Error: symbol `scandir64' is already defined
>>> {standard input}:123344: Error: symbol `__stat64_time64' is already d=
efined
>>> {standard input}:130262: Error: symbol `truncate64' is already define=
d
>>> make[1]: *** [Makefile:157: pseudo_wrappers.o] Error 1
>>
>> Unfortunately, I don=E2=80=99t know how to make pseudo compatible with=
 such a
>> setup. Any hints?
>>
>> Thanks in advance.
>>
>> P.S. You can find more logs at <https://bugs.debian.org/1069487>.
>>
>>
>>
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#223895): https://lists.openembedded.org/g/openembe=
dded-core/message/223895
>> Mute This Topic: https://lists.openembedded.org/mt/115390427/3616948
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[mark.hatle@kernel.crashing.org]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

