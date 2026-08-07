Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D36C5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 04:24:30 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35768.1786076660345802597
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 21:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DHf2NYlr;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: zboszor@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c1f758014b8so277621166b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 21:24:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786076658; cv=none;
        d=google.com; s=arc-20260327;
        b=aJ3D491TmaN10eM0ZER1O9GID+9lTIXDSaqoeADwZh1qTsLIWS1nqZX77Lp+svO0yb
         qXfXgPhcCO5aIK1oLb/eSHnja1tww4l8T06A1AMqa2U+iRNBRd/m2xFEf+JWLqfWlFwV
         gurSLGTV0Ic77kEtnZqfj3YtQRTYeenqp27tzx36jtijllD/SW7B/qq0t28KEwMxTaRy
         KgIDY0fxkvXeQMoZfp/zWCbQtR7yP5nLtu5e0sx4yfcaM9W7j8PNuqnTx+9dH54qRV6+
         2OmRbGzz5idU3KdRY0isyfxLXGCMnnMhsnFmFsNHjxKtmOV1AZI0mBvU7jT/DFYdvbXV
         31yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gqwVkR7zrJu+4kVFnXxqZ+TaYV49T8ti8AKgISM7cy4=;
        fh=vBncs6M9KCthJ+20r2AsFsh1xLkCEAsLlBYr02jEkvg=;
        b=YijA/1BYPRXxO3iXRankX4BafX3QyxUfo3rMKMg1dI/vmQ9L5Eh74y9MZuhHk/C6qE
         A8jIXJGPVRj545wTD8lOfy24zx/dhWr/KDIW4M4KokGnGQFfBA4MLjD7NeybpdzQHPtW
         Zs5kIcLs70WbxcOiZil9wN5L2FaPVYUsoOVkBrOZXFcQhdsxtszPt6QOcBEh/zjt+2va
         3PTHivfthZlcI9bFYlsfxuk2jiQB5K16lzknjodUCjzUpRzYc1PvRuQ/y6A+uNDksJK1
         VgI5xnfV3oBfyrdEvpW/Vp/xwYdVpxaKmqnrB535aDT7qxa5Aqua447VGcRsjpiOUsL8
         2gUg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786076658; x=1786681458; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gqwVkR7zrJu+4kVFnXxqZ+TaYV49T8ti8AKgISM7cy4=;
        b=DHf2NYlrqoVrxjrypbmEII89ItVGz9Ob0KlIQHXyvbecXhvjXIcTzxYBmYWnbZybms
         UsqzD+GsG2HZ/LK6+4mlYox4bhk3d7d7GLY6QQYva1dGRw9/PCoGSyf1oE/4IoBR4zIZ
         OlRRMIu259fp8pIKHoQejVCco++3GjsHJ73N89mBf/lFso8vwilfxDhiTrspG07eWEjw
         8XfixEdQ8mLiMnB2Eu6UsZWQieRuLSohcjcHvh0jgvX6GNhfXAo5szg3gtadh+vu9hN9
         5g0THnw7W7w83IjtpHk9nNykvuSebvmgc2CxycQ1dLZtZwQ6tLbg2JGbA8D0n5U5JAvt
         crMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786076658; x=1786681458;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gqwVkR7zrJu+4kVFnXxqZ+TaYV49T8ti8AKgISM7cy4=;
        b=m645Fm3efQCHVUxe4hPBSOfbyc0U2Tu/IHCoY9v9NXN2ixnz8puTX/nW+rsJuzW6Nm
         kH/ATa1Rd9vxNvcg2+05392NoKkb0eRo7/7ow9VNxuoP8WdKdQKU9Sl3F4P7A2z4rHJd
         IkZ2G6cW/uLnMf9Ez0VZIo0rY1boQJiy5UB+pnkcQpQKPUDRkbA9R/h4z5vkMhCa7de/
         S1zWttjuP5cviy79be+u5vNPhGOL9xIPaVDVtqTieNQKxReRgoOI0L3Nfp/qm7x35x3+
         l10PH8YU3F3+7d1bopinpi8LwohWigxfuxK2NtI90P6MXjMtA/Hh30YVoxUdvxZR31LR
         4ePA==
X-Gm-Message-State: AOJu0YynHuXFC+Ys6vWuGpHBb2Y2dsare0iG1ngv55Zk/z3es3+3LGlt
	QAZOvQielsfQQYrOsRf3JCOLM9T0oxN1jT3UepTJxzrShbiTsLu9UO5nb6Rvzd2cv0QCHpm2+L7
	QQzicMQKxiGdw9hT5gvnGJT9VxfUktpk=
X-Gm-Gg: AR+sD11RnXsDCHWiixgNUWL0Cdp/NfykrbVVz6AenDC9+cXUvvHCmWUo9MZMSWgsKUp
	kETaA76zWQwSo+1qFYB2jO0EbMS0+dMYskzdpqwD5dxrbkoUUqz13DYg0ziSfQte2PJRSGZfdhB
	MWfnhhT1jHKzZ2wsldsj5KFiDBZFIS+3pj4eGBu5HEVApZXzVfOAMHwUBqZkG5sCN7InVw/si4+
	ahwwgMLWSj3PReM/ByfrBhWIrHM5MLJ6TYxS6FCgkSblDYlVqeZ7sPz1gKKOailHkwUcK06HtL9
	DlvU+05aUxovYBVX03V4qJ05Ou6B4NMpw/ZNt22hzP0D7p9j2W1blq2F1PNhZpMjo6wykKLKY16
	s
X-Received: by 2002:a17:907:c22:b0:c15:d422:3bde with SMTP id
 a640c23a62f3a-c2039d98ed7mr838011166b.32.1786076658314; Thu, 06 Aug 2026
 21:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260806051437.276400-1-zboszor@gmail.com> <20260806051437.276400-3-zboszor@gmail.com>
 <CADWMC-YSpVjazAaMwF7ztzZLTu3nmYWuusuA4QShpUGT1vC09w@mail.gmail.com>
In-Reply-To: <CADWMC-YSpVjazAaMwF7ztzZLTu3nmYWuusuA4QShpUGT1vC09w@mail.gmail.com>
From: Zoltan Boszormenyi <zboszor@gmail.com>
Date: Fri, 7 Aug 2026 06:24:05 +0200
X-Gm-Features: AUfX_mxiqCizxdJ_EG75xn1PrsfLZs20ckHD69z744L3freXUGn3-g9h7BKrUGQ
Message-ID: <CAPeTZW8iCmgrchUe-etQLzaOx_i64kUG-OP+KVuE2t4YpPor1g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 3/3] mesa, mesa-tools-native: Use mesa-libclc
To: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 04:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242974

On Thu, Aug 6, 2026 at 11:16=E2=80=AFAM Jose Quaresma
<jose.quaresma@oss.qualcomm.com> wrote:
>
>
>
> On Thu, Aug 6, 2026 at 6:15=E2=80=AFAM Zoltan Boszormenyi via lists.opene=
mbedded.org <zboszor=3Dgmail.com@lists.openembedded.org> wrote:
>>
>> According to the release notes at
>> https://lists.freedesktop.org/archives/mesa-dev/2026-August/226690.html
>>
>> | One important note for packagers is that there is now a Mesa community
>> | maintained libclc fork that is verified to pass the OpenCL CTS with
>> | Mesa/Rusticl, and will fix bugs after an upstream libclc major release
>> | branch goes EoL. The Mesa build system will pick it up when available,
>> | and fall back to upstream libclc if not. This libclc fork is not
>> | verified for any other usages or users of libclc outside of Mesa.
>>
>> Rusticl would complain if about not this libclc fork is used due to
>> OpenCL CTS compliance.
>>
>> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com=
>
>> ---
>>  meta/recipes-graphics/mesa/mesa-tools-native.bb | 2 +-
>>  meta/recipes-graphics/mesa/mesa.inc             | 4 ++--
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb b/meta/reci=
pes-graphics/mesa/mesa-tools-native.bb
>> index 20207450bf..c495d2e8a8 100644
>> --- a/meta/recipes-graphics/mesa/mesa-tools-native.bb
>> +++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
>> @@ -11,7 +11,7 @@ PACKAGECONFIG +=3D "gallium-llvm"
>>  # to PACKAGECONFIG like in mesa.inc
>>  PACKAGECONFIG +=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland'=
, d)}"
>>
>> -DEPENDS +=3D "libclc-native spirv-tools-native spirv-llvm-translator-na=
tive"
>> +DEPENDS +=3D "mesa-libclc-native spirv-tools-native spirv-llvm-translat=
or-native"
>>
>>  EXTRA_OEMESON +=3D " \
>>      -Dmesa-clc=3Denabled -Dinstall-mesa-clc=3Dtrue -Dmesa-clc-bundle-he=
aders=3Denabled \
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics=
/mesa/mesa.inc
>> index a50b900cf2..fa51d62bfc 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -109,7 +109,7 @@ PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=
=3Dfalse"
>>
>>  # "opencl" also requires libclc and gallium-llvm to be present in PACKA=
GECONFIG!
>>  # Be sure to enable them both for the target and for the native build.
>> -PACKAGECONFIG[opencl] =3D "-Dgallium-rusticl=3Dtrue -Dmesa-clc-bundle-h=
eaders=3Denabled, -Dgallium-rusticl=3Dfalse, bindgen-cli-native clang libcl=
c spirv-tools spirv-llvm-translator"
>> +PACKAGECONFIG[opencl] =3D "-Dgallium-rusticl=3Dtrue -Dmesa-clc-bundle-h=
eaders=3Denabled, -Dgallium-rusticl=3Dfalse, bindgen-cli-native clang mesa-=
libclc spirv-tools spirv-llvm-translator"
>>
>>  X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage li=
bxfixes xrandr xorgproto libxshmfence"
>>  # "x11" requires "opengl"
>> @@ -253,7 +253,7 @@ RPROVIDES:libopencl-mesa +=3D "virtual-opencl-icd"
>>  RPROVIDES:libgles2-mesa +=3D "libgles3-mesa"
>>  RPROVIDES:libgles2-mesa-dev +=3D "libgles3-mesa-dev"
>>
>> -RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'op=
encl', 'libclc', '', d)}"
>> +RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG', 'op=
encl', 'mesa-libclc', '', d)}"
>
>
> Is it possible to have both versions installed side-by-side on the target=
?

Yes. libclc and mesa-libclc can be installed side-by-side.
Only meta-libclc will be used by mesa, if built with that, though.

> I'm asking this because there might be a collision between the fork and t=
he original.

There is none.
The installation directory and the pkg-config file are renamed in the fork.

>
> Jose
>
>>
>>
>>  PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
>>               libgallium \
>> --
>> 2.55.0
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#242898): https://lists.openembedded.org/g/openembedd=
ed-core/message/242898
>> Mute This Topic: https://lists.openembedded.org/mt/120622539/10043485
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [j=
ose.quaresma@oss.qualcomm.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

