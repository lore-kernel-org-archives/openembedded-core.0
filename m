Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F045CCAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 14:12:08 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.14818.1758723127406683117
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 07:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 58OEC2Yr743912;
	Wed, 24 Sep 2025 09:12:02 -0500
Received: from [192.168.2.99] ([192.168.2.99])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 58OEC1hV018420;
	Wed, 24 Sep 2025 09:12:02 -0500
Message-ID: <32e815b3-7f17-44d0-931b-fe4410dfbb1c@kernel.crashing.org>
Date: Wed, 24 Sep 2025 09:12:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] pseudo FTBFS on 32-bit arm{el,hf} on Debian
Content-Language: en-US
To: andrew.shadura@collabora.co.uk, openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
References: <a6ccd7f6-effb-4cc3-803e-faf6a9d52b2d@collabora.co.uk>
 <CAMKF1srKh7HDCNCuCwJ9BWgyHCtiZkmbLFsGy=_o45JkuiubVA@mail.gmail.com>
 <7127d1af-be55-427d-94ef-d93145f966fc@collabora.co.uk>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <7127d1af-be55-427d-94ef-d93145f966fc@collabora.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 58OEC2Yr743912
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 14:12:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223977



On 9/24/25 2:32 AM, Andrej Shadura via lists.openembedded.org wrote:
> Hello,
>=20
> On 23/09/2025 18:21, Khem Raj wrote:
>>> pseudo no longer buildable on armel and armhf in Debian, as well as o=
n
>>> other non-i386 32-bit architectures. The common thing they share is t=
hat
>>> they have all switched to 64 time recently.
>=20
>>> Unfortunately, I don=E2=80=99t know how to make pseudo compatible wit=
h such a
>>> setup. Any hints?
>>>
>>> Thanks in advance.
>>>
>>> P.S. You can find more logs at <https://bugs.debian.org/1069487>.
>=20
>> Would it be possible to generate a preprocessed file for pseudo_wrappe=
rs.c
>> and post it somewhere ?
>=20
> Sure. I=E2=80=99ve attached one.

At least in the case of open64 (only one I looked at so far), there is a=20
duplicate definition in the .i (see below).

For some reason "/usr/include/arm-linux-gnueabihf/bits/fcntl2.h" now defi=
nes=20
open64 inline.  This seems broken to me, since it means any user of open6=
4 will=20
have to carry their own copy of the function.

I'd definitely like to know more about what this is, and what it's purpos=
e is.=20
Since I suspect this behavior is what is causing everything to break.


Looking at the version of glibc I have, I see this inline value is only t=
here if=20
__USE_LARGEFILE64 is enabled.  So I would suggest start there, remove thi=
s=20
configuration.  As we try to emulate both 32-bit and 64-bit functions, we=
=20
shouldn't need this for the system to "work".  (I'm not sure where that=20
particular one is enabled, but I do suspect it's part of the issue here.)


# 212 "/usr/include/fcntl.h" 3 4

extern int open64 (const char *__file, int __oflag, ...) __attribute__=20
((__nonnull__ (1)));

# 82 "/usr/include/arm-linux-gnueabihf/bits/fcntl2.h" 3 4
extern __inline __attribute__ ((__always_inline__)) __attribute__=20
((__gnu_inline__)) __attribute__ ((__artificial__)) int
open64 (const char *__path, int __oflag, ...)
{
   if (__builtin_va_arg_pack_len () > 1)
     __open64_too_many_args ();

   if (__builtin_constant_p (__oflag))
     {
       if ((((__oflag) & 0100) !=3D 0 || ((__oflag) & (020000000 | 040000=
)) =3D=3D=20
(020000000 | 040000)) && __builtin_va_arg_pack_len () < 1)
  {
    __open64_missing_mode ();
    return __open64_2 (__path, __oflag);
  }
       return __open64_alias (__path, __oflag, __builtin_va_arg_pack ());
     }

   if (__builtin_va_arg_pack_len () < 1)
     return __open64_2 (__path, __oflag);

   return __open64_alias (__path, __oflag, __builtin_va_arg_pack ());
}

# 11082 "pseudo_wrapfuncs.c"
=20
    ;



int
open64(const char *path, int flags, ... ) {
  sigset_t saved;
  va_list ap;
  mode_t mode;

  int rc =3D -1;
  do {} while(0);



  if (!pseudo_check_wrappers() || !real_open64) {

   pseudo_enosys("open64");
   do {} while(0);
   return rc;
  }


>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223948): https://lists.openembedded.org/g/openembed=
ded-core/message/223948
> Mute This Topic: https://lists.openembedded.org/mt/115390427/3616948
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
mark.hatle@kernel.crashing.org]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

