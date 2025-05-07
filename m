Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3794DC369DC
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 06:14:31 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web11.1889.1746598469202666065
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 23:14:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bpBIZLBS;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-605f7d3215cso3067097eaf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 23:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746598468; x=1747203268; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uVLsi1jjfMBNEkgFfM4kkBtvgretH64Ea1u9fJZydm0=;
        b=bpBIZLBSSHsLWFIHYLNVaBIL2ho/cbt6b1cPR3gUMjWnFptAzki+TlgVkRYGq85SkC
         yd3MatwhMwmnFwv/2njiwxRnES8oNA53HffGL43sPLe12vGaUXZebWRTr0n5HuvufMl+
         WHwf0k6a3p+3wGzLvOK4EOnYiKC7KncbNSwLyUY+FgZtMLyKQtFJC4Uw9l8T41ToJKy9
         k6zHzcoZt/eueRiU0Xu+ooOU/5eNK8zK6uM7fEDLhspzVhW+wljAVN/RI6RpxcCM+loD
         4Nz9p/Onaj0v8JqrT/TXXNo+hrU2ULYGBLLH5yRyHqQ3gy9rdLwSzH+oi6E0tuTLObwn
         dC0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746598468; x=1747203268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uVLsi1jjfMBNEkgFfM4kkBtvgretH64Ea1u9fJZydm0=;
        b=Bsm8Smqo9BU5urUjFaZ59MuVE6qVFfIyXb/vioH/c0JLjzLKF6iczUxbdNG5/8qbNc
         MCTD7KZiM2XNqMfbkM8nPAfLsH2Shj6RGMzyepdMco1bdvf7YbKI/GyLFKbzttNY3LdK
         d7FoWhAp7qdyYzn8Inwq6ncsWVt2alPzoYb69usLvDg4ObPL4Cyg2vCOC0EMLeJQh571
         KrljAbLyVotjxdSLbs2FeNM4dFDaEchkhHZjM/206vELLWwdDQZhDXcArRK9/67gI9A8
         S4PfRKk7jOpEvmA1JgJQt70R2nZEbyE+Bf+YcPPLx727o+q77nfaHtnsUVfgFMWBdoTL
         JGSg==
X-Gm-Message-State: AOJu0YzDDf0bEmAWaVOGWTvOqkhM67FCtFNsLJ8Z521n+Y9coWLsH4jh
	Yjp4uoX12kNajOnim6eQnLLyazTIRH8R8yYEoyF0kbglLFh+iiErpYzEF2qQRidZK0Di7m+QhBq
	/R5cD4sho2l4hbwl12ilSM1Bu5KM=
X-Gm-Gg: ASbGncsF5NAn6bE4eh8BfdymuJPIgTfrVM6MCMQsXZCWmTy7tm4DgT078xycByD8Cp9
	9ZOEPJHKV24a4+0wcR3WKjAv6CiCeStB+IsFlNe1/OFvBBxhYGW1WqBzkvB+bLTYcL1+LcsWUN5
	GIj7+jT3lMDlrV9ndCMX+jDA==
X-Google-Smtp-Source: AGHT+IFG5AuU/M/+ipuNXcclRWe+l0dI1n1uzALy/B4W8LeIvGCSENXJ/hX/0C5ntoBxy38fLmk0nSFdZSmFtGkt03k=
X-Received: by 2002:a4a:ee0f:0:b0:604:ae66:1e9b with SMTP id
 006d021491bc7-60828d4fdb8mr1284074eaf.8.1746598468288; Tue, 06 May 2025
 23:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <0a4bac6d-292f-4278-ac5b-348a160a319c@windriver.com>
 <23053.1746531517602060473@lists.openembedded.org> <CAMKF1spM6xrsWf1CvUsHr+1BF5Eo+X+ZKSN=DOiXq0Y4DrGYMQ@mail.gmail.com>
 <CAHebdzR4rGAq0e4FLuThxqE57UuT+LLqLXQd425--A6OAUPXZg@mail.gmail.com>
 <CAMKF1sqkw3xZpLqKw9aaOvike+6RPBsRsfoq+dXzeQf6Zpn1pg@mail.gmail.com> <CAHebdzTV7rRKkAJGzL79sngS3BDCEx2nNu8+jO1t5STM31bGeA@mail.gmail.com>
In-Reply-To: <CAHebdzTV7rRKkAJGzL79sngS3BDCEx2nNu8+jO1t5STM31bGeA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 May 2025 23:14:02 -0700
X-Gm-Features: ATxdqUEUYCw1CMaheWk67IrCh2DIdD16alW8bkFMSZeOqlgIEHvRPLyGEc262BE
Message-ID: <CAMKF1spEREKO0RL7d=RE9i-g0GDqWqPGcbR_Cr8pr=ET03AcFg@mail.gmail.com>
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64: gcs required
To: Sathishkumar Duraisamy <sathishkumar.d.cbe@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 06:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216091

On Tue, May 6, 2025 at 11:04=E2=80=AFPM Sathishkumar Duraisamy
<sathishkumar.d.cbe@gmail.com> wrote:
>
> On Wed, May 7, 2025 at 4:29=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
>>
>> On Tue, May 6, 2025 at 6:28=E2=80=AFAM Sathishkumar Duraisamy
>> <sathishkumar.d.cbe@gmail.com> wrote:
>> >
>> > Hi
>> >
>> > On Tue, May 6, 2025 at 6:43=E2=80=AFPM Khem Raj <raj.khem@gmail.com> w=
rote:
>> >>
>> >> On Tue, May 6, 2025 at 4:38=E2=80=AFAM Sathishkumar D via
>> >> lists.openembedded.org
>> >> <sathishkumar.d.cbe=3Dgmail.com@lists.openembedded.org> wrote:
>> >> >
>> >> > Hi all,
>> >> >
>> >> > I am also facing the same build issue. I tried to understand the is=
sue. From build system for both openssl and systemd, -mbranch-protection=3D=
standard   enabled. In fact the support this flag added long back, https://=
github.com/openembedded/openembedded-core/commit/8905639d1cdc5ce809cc5ecd96=
72f5e86bf8a579 and tpm2 introduces additional dependencies for systemd as i=
n commit https://git.yoctoproject.org/meta-security/commit/meta-tpm/recipes=
-core/systemd/systemd_%25.bbappend?id=3D6eb3098e57881895e62fc811f714c2aa4ec=
fcf8f.
>> >> >
>> >>
>> >> is this flag passed to linker as well ?
>> >>
>> > Openssl:
>> > =3D=3D=3D=3D=3D=3D=3D
>> >
>> > export CC=3D"aarch64-tdx-linux-gcc  -march=3Darmv8-a+crypto -mbranch-p=
rotection=3Dstandard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -W=
format -Wformat-security -Werror=3Dformat-security --sysroot=3D/home/sathis=
hkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0=
/recipe-sysroot"
>> >
>> > export CFLAGS=3D" -O2 -g  -ffile-prefix-map=3D/home/sathishkumar/yocto=
space/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5=
.0=3D/usr/src/debug/openssl/3.5.0  -ffile-prefix-map=3D/home/sathishkumar/y=
octospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/build=
=3D/usr/src/debug/openssl/3.5.0  -ffile-prefix-map=3D/home/sathishkumar/yoc=
tospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sy=
sroot=3D  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/bui=
ld/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=3D  -pipe =
-Wl,-z,gcs-compliant=3Dall "
>> >
>> > export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed  -ffi=
le-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/ar=
mv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=3D/usr/src/debug/openssl/3.5.0  =
-ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/wor=
k/armv8a-tdx-linux/openssl/3.5.0/build=3D/usr/src/debug/openssl/3.5.0  -ffi=
le-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/ar=
mv8a-tdx-linux/openssl/3.5.0/recipe-sysroot=3D  -ffile-prefix-map=3D/home/s=
athishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/=
3.5.0/recipe-sysroot-native=3D  -Wl,-z,relro,-z,now"
>> >
>> > systemd
>> > =3D=3D=3D=3D=3D=3D
>> >
>> > export CC=3D"aarch64-tdx-linux-gcc  -march=3Darmv8-a+crypto -mbranch-p=
rotection=3Dstandard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -W=
format -Wformat-security -Werror=3Dformat-security --sysroot=3D/home/sathis=
hkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5=
/recipe-sysroot"
>> >
>> > export CFLAGS=3D" -O2 -g  -ffile-prefix-map=3D/home/sathishkumar/yocto=
space/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/git=3D/usr/=
src/debug/systemd/257.5  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/=
verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/build=3D/usr/src/=
debug/systemd/257.5  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verd=
in-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=3D  -f=
file-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/=
armv8a-tdx-linux/systemd/257.5/recipe-sysroot-native=3D  -pipe --sysroot=3D=
/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/s=
ystemd/257.5/recipe-sysroot"
>> >
>> > export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed  -ffi=
le-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/ar=
mv8a-tdx-linux/systemd/257.5/git=3D/usr/src/debug/systemd/257.5  -ffile-pre=
fix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-t=
dx-linux/systemd/257.5/build=3D/usr/src/debug/systemd/257.5  -ffile-prefix-=
map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-l=
inux/systemd/257.5/recipe-sysroot=3D  -ffile-prefix-map=3D/home/sathishkuma=
r/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/reci=
pe-sysroot-native=3D  -Wl,-z,relro,-z,now"
>> >
>> >
>>
>> Please try adding -Wl,-z,gcs-compliant=3Dall to systemd LDFLAGS not
>> CFLAGS or to openssl flags.
>
>
> Shortly I will build with LDFLAGS and will post the update here.
>

also try adding try with -Wl,-z,gcs-report-dynamic=3Dnone to LDFLAGS in
systemd and see if that helps

> Yesterday, I added ' EXTRA_OECONF:append:aarch64 =3D " no-asm" '  as reco=
mmended by Max to the openssl bbappend file. And I see I am able to build s=
ystemd. I will re-build with LDFLAGS.
>
>
>>
>>
>> >
>> >>
>> >> > So something issue with gcc-15? or what makes openssl to loose gcs?
>> >> >
>> >> > Regards,
>> >> > Sathishkumar D
>> >> >
>> >> >
>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> > Links: You receive all messages sent to this group.
>> >> > View/Reply Online (#216040): https://lists.openembedded.org/g/opene=
mbedded-core/message/216040
>> >> > Mute This Topic: https://lists.openembedded.org/mt/112627480/199791=
4
>> >> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> >> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/uns=
ub [raj.khem@gmail.com]
>> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >> >

