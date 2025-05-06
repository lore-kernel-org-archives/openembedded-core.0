Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB675C3ABBE
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 22:59:33 +0000 (UTC)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
 by mx.groups.io with SMTP id smtpd.web11.959.1746572372298607375
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 15:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fhPAjn5X;
 spf=pass (domain: gmail.com, ip: 209.85.161.43, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6060a70ba80so3225387eaf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 15:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746572371; x=1747177171; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hvKOKoAtUUmY+ROuBZS32JzsD1nQ4bDkxB7rj0bvYUA=;
        b=fhPAjn5XE/n8yDASAAl98SLeB7NG3RNhQajftKMwBqI9xTfGYucl9lmqi3hlFp/99x
         XbQCvxQJv8rxOgbfW7tlACei69lSMCGA4TELddscc/yBJtnHE9an0PMoHAnm0Qi3DUVv
         kBfiqJghnnlfHHDlwfmJ0uaW9ggqEUgCZr56pcFEsHegkot8vJLWqk47Jn15GeOg9d5K
         M1FjjGVblj58y2iqduJLqs+d8XebXwCsTb+9kAee80lZbiEC5amSOZfZM/mvIkAyeZJ4
         WDirqFeU5iAOjEIKWqx2rVJEI16vHjLaN5xYeraui/V22O6eXKVyI7PntSb0bB2zUNDR
         YsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746572371; x=1747177171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hvKOKoAtUUmY+ROuBZS32JzsD1nQ4bDkxB7rj0bvYUA=;
        b=ray+y3AICnI3P2GfnPyKMmiJ7NdgwGSfrDFRl/uOpv3PfJVMCi1DTLvLg2qSiekd9F
         SrV8PinMvaC3L+Stxbro02UJ8WtGP/Kx7NuAMBbGulJKFsnb8HbDWIpwIsA7y8++MC1Z
         JNzJt8bUeZ3kfUmVqjaSbTICk7O+b0jTUMQjORPAcqXNNFMlaZpz1cbD7pLjTDrQ931V
         6RHeUsNNQH11t60QJ/ofdywsr3DO/EhQWUbIdexCWUKNqPlTUvaQY/UZ0wempFo0Muwo
         qOnkAbzrI085Us1SxZuYrwWTLVxGudmnQTeLYaqmmiMIGaQIQAFcRpaGg8CEj/frmkjL
         lg0w==
X-Gm-Message-State: AOJu0YxvdJt1z+NyAT8clFHdnyCLOK2X2rIqLoQ6pwFM/+G4tNay3x7i
	7fUUVRSLMZhK1V3xEHx4EKrzZFH2Zn64LUya3lnJd6DEp/hqWHW7JzIJR7/Hbq29H7WRNiKgrHf
	JyUEFJFUQ+RXQaxjplDKL9Py4DE8=
X-Gm-Gg: ASbGncvkaecQAaJ4/l5vv06hqHGzkXyxLutuX1rQozBagCvJ2N2HuXYf6SWoh0BqLtH
	x6ai5MF1WlTn6rcLTYP+ItSnV0Abz+CpSx3Im8G8c5DUbD0RPO9Q318bnDZbs/m01ud3xSf2K2/
	XpXMJjcr6EMvU70NbfPBoq
X-Google-Smtp-Source: AGHT+IHk558pHyun8gQJbmwtSq7AnZ7nSFevyqDKIFSi1+xlFrJHroRjxtHmK8XdTPcijyaIfctPaMJZYSZi8AmJnuM=
X-Received: by 2002:a4a:ee04:0:b0:607:8929:44ff with SMTP id
 006d021491bc7-60828c9ac1fmr944749eaf.1.1746572371454; Tue, 06 May 2025
 15:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <0a4bac6d-292f-4278-ac5b-348a160a319c@windriver.com>
 <23053.1746531517602060473@lists.openembedded.org> <CAMKF1spM6xrsWf1CvUsHr+1BF5Eo+X+ZKSN=DOiXq0Y4DrGYMQ@mail.gmail.com>
 <CAHebdzR4rGAq0e4FLuThxqE57UuT+LLqLXQd425--A6OAUPXZg@mail.gmail.com>
In-Reply-To: <CAHebdzR4rGAq0e4FLuThxqE57UuT+LLqLXQd425--A6OAUPXZg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 May 2025 15:59:05 -0700
X-Gm-Features: ATxdqUFSQVdgnpkH5ABtAomKzg8a0KmKH1o0jWh-ERdcUk8unjIFrAmRV7uDZxk
Message-ID: <CAMKF1sqkw3xZpLqKw9aaOvike+6RPBsRsfoq+dXzeQf6Zpn1pg@mail.gmail.com>
Subject: Re: [OE-core] systemd build failure with gcc 15 / tpm2 / aarch64: gcs required
To: Sathishkumar Duraisamy <sathishkumar.d.cbe@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 22:59:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216084

On Tue, May 6, 2025 at 6:28=E2=80=AFAM Sathishkumar Duraisamy
<sathishkumar.d.cbe@gmail.com> wrote:
>
> Hi
>
> On Tue, May 6, 2025 at 6:43=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>>
>> On Tue, May 6, 2025 at 4:38=E2=80=AFAM Sathishkumar D via
>> lists.openembedded.org
>> <sathishkumar.d.cbe=3Dgmail.com@lists.openembedded.org> wrote:
>> >
>> > Hi all,
>> >
>> > I am also facing the same build issue. I tried to understand the issue=
. From build system for both openssl and systemd, -mbranch-protection=3Dsta=
ndard   enabled. In fact the support this flag added long back, https://git=
hub.com/openembedded/openembedded-core/commit/8905639d1cdc5ce809cc5ecd9672f=
5e86bf8a579 and tpm2 introduces additional dependencies for systemd as in c=
ommit https://git.yoctoproject.org/meta-security/commit/meta-tpm/recipes-co=
re/systemd/systemd_%25.bbappend?id=3D6eb3098e57881895e62fc811f714c2aa4ecfcf=
8f.
>> >
>>
>> is this flag passed to linker as well ?
>>
> Openssl:
> =3D=3D=3D=3D=3D=3D=3D
>
> export CC=3D"aarch64-tdx-linux-gcc  -march=3Darmv8-a+crypto -mbranch-prot=
ection=3Dstandard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wfor=
mat -Wformat-security -Werror=3Dformat-security --sysroot=3D/home/sathishku=
mar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/re=
cipe-sysroot"
>
> export CFLAGS=3D" -O2 -g  -ffile-prefix-map=3D/home/sathishkumar/yoctospa=
ce/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/openssl-3.5.0=
=3D/usr/src/debug/openssl/3.5.0  -ffile-prefix-map=3D/home/sathishkumar/yoc=
tospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/build=3D/=
usr/src/debug/openssl/3.5.0  -ffile-prefix-map=3D/home/sathishkumar/yoctosp=
ace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroo=
t=3D  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/t=
mp/work/armv8a-tdx-linux/openssl/3.5.0/recipe-sysroot-native=3D  -pipe -Wl,=
-z,gcs-compliant=3Dall "
>
> export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed  -ffile-=
prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8=
a-tdx-linux/openssl/3.5.0/openssl-3.5.0=3D/usr/src/debug/openssl/3.5.0  -ff=
ile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/a=
rmv8a-tdx-linux/openssl/3.5.0/build=3D/usr/src/debug/openssl/3.5.0  -ffile-=
prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8=
a-tdx-linux/openssl/3.5.0/recipe-sysroot=3D  -ffile-prefix-map=3D/home/sath=
ishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/openssl/3.5=
.0/recipe-sysroot-native=3D  -Wl,-z,relro,-z,now"
>
> systemd
> =3D=3D=3D=3D=3D=3D
>
> export CC=3D"aarch64-tdx-linux-gcc  -march=3Darmv8-a+crypto -mbranch-prot=
ection=3Dstandard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wfor=
mat -Wformat-security -Werror=3Dformat-security --sysroot=3D/home/sathishku=
mar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/re=
cipe-sysroot"
>
> export CFLAGS=3D" -O2 -g  -ffile-prefix-map=3D/home/sathishkumar/yoctospa=
ce/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/git=3D/usr/src=
/debug/systemd/257.5  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/ver=
din-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/build=3D/usr/src/deb=
ug/systemd/257.5  -ffile-prefix-map=3D/home/sathishkumar/yoctospace/verdin-=
next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-sysroot=3D  -ffil=
e-prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/arm=
v8a-tdx-linux/systemd/257.5/recipe-sysroot-native=3D  -pipe --sysroot=3D/ho=
me/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linux/syst=
emd/257.5/recipe-sysroot"
>
> export LDFLAGS=3D"-Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed  -ffile-=
prefix-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8=
a-tdx-linux/systemd/257.5/git=3D/usr/src/debug/systemd/257.5  -ffile-prefix=
-map=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-=
linux/systemd/257.5/build=3D/usr/src/debug/systemd/257.5  -ffile-prefix-map=
=3D/home/sathishkumar/yoctospace/verdin-next/build/tmp/work/armv8a-tdx-linu=
x/systemd/257.5/recipe-sysroot=3D  -ffile-prefix-map=3D/home/sathishkumar/y=
octospace/verdin-next/build/tmp/work/armv8a-tdx-linux/systemd/257.5/recipe-=
sysroot-native=3D  -Wl,-z,relro,-z,now"
>
>

Please try adding -Wl,-z,gcs-compliant=3Dall to systemd LDFLAGS not
CFLAGS or to openssl flags.

>
>>
>> > So something issue with gcc-15? or what makes openssl to loose gcs?
>> >
>> > Regards,
>> > Sathishkumar D
>> >
>> >
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> > Links: You receive all messages sent to this group.
>> > View/Reply Online (#216040): https://lists.openembedded.org/g/openembe=
dded-core/message/216040
>> > Mute This Topic: https://lists.openembedded.org/mt/112627480/1997914
>> > Group Owner: openembedded-core+owner@lists.openembedded.org
>> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[raj.khem@gmail.com]
>> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> >

