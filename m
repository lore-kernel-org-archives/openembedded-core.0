Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web09.485.1614280972561260136
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 11:22:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=fpKauJds;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: anbelski@linux.microsoft.com)
Received: from [192.168.178.23] (unknown [83.135.233.128])
	by linux.microsoft.com (Postfix) with ESMTPSA id AE3DA20B6C40;
	Thu, 25 Feb 2021 11:22:49 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AE3DA20B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1614280971;
	bh=ENRyr/lkZH7n0AusiEA7DCH50EXOUoWS0yPkjCXR6J0=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=fpKauJdsO37kDMeYHDN7Ws3fNDELfI7ekzj/ulMJ9lC7tN7Edjee3NxSPdX+AABcV
	 lft+kQObTwt3lUyFJNz6HzQD2pMm0sKkvjHgF58ghsuaPoIqK4To+gHIK/6oMBrMqu
	 odcPQI7J8PC3N2ZED/kAfCoj2+QFqNsttXenrZLQ=
Subject: Re: [OE-core] Current native SDK glibc compat
To: Randy MacLeod <randy.macleod@windriver.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: <4ec292a9-3723-34f2-51a5-01dd6652f651@linux.microsoft.com>
 <1a309c4181d7de1b38497b4db6f4e1d664f18398.camel@linuxfoundation.org>
 <9a8cb006-e161-b402-d496-72a1c983e90a@linux.microsoft.com>
 <e4561a7e8c89fe26dd593b0412e16be67665baff.camel@linuxfoundation.org>
 <ce2c3ea0-891b-8c7d-e89a-590fcd7ab12c@linux.microsoft.com>
 <2961052af2e2429d0a8e2a5a26f8a0c929033794.camel@linuxfoundation.org>
 <3534ea02-0674-6862-9d0b-673d5b941f71@windriver.com>
From: "Anatol Belski" <anbelski@linux.microsoft.com>
Message-ID: <bd1a2fa1-2284-13c5-5bcb-0d07e7a14306@linux.microsoft.com>
Date: Thu, 25 Feb 2021 20:22:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3534ea02-0674-6862-9d0b-673d5b941f71@windriver.com>
Content-Type: multipart/alternative;
 boundary="------------9CE71FD958F08FE204E473DD"
Content-Language: en-US

--------------9CE71FD958F08FE204E473DD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi,

On 2/25/2021 1:23 AM, Randy MacLeod wrote:
> On 2021-02-24 6:57 p.m., Richard Purdie wrote:
>> On Wed, 2021-02-24 at 21:16 +0100, Anatol Belski wrote:
>>> On 2/24/2021 5:49 PM, Richard Purdie wrote:
>>>> No, I mean the dynamic loader pointer.
>>>>
>>>> $ tmp/sysroots-uninative/x86_64-linux/usr/bin/patchelf-uninative=20
>>>> python3-native/python3.9 --print-interpreter
>>>> [...]tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
>>>>
>>>> Above I'm showing that a native binary in the build (python3-native)
>>>> has the interpreter (dynamic loader) set to our uninative ld.so.
>>>> The SDK is similar.
>>>>
>>>>> As the binary where the issue was sighted has this
>>>>>
>>>>> $ chrpath $(which cargo)
>>>>> /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/cargo:
>>>>> RUNPATH=3D$ORIGIN/../lib
>>>>>
>>>>>
>>>>> but then, the DSOs have no rpath set, eg.
>>>>>
>>>>> $ chrpath
>>>>> /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/../lib=
/libcrypto.so.1.1=20
>>>>>
>>>>> /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/../lib=
/libcrypto.so.1.1:=20
>>>>>
>>>>> no rpath or runpath tag found.
>>>>>
>>>>>
>>>>> so it might lead to the interferrence with the host. Does it perhaps
>>>>> need both $ORIGIN/../../lib and $ORIGIN/../lib if binaries are in=20
>>>>> /usr ?
>>>> Our dynamic loader knows how to use the specific sysroot and then
>>>> fall back to /usr and /lib.
>>>
>>> Thanks a lot for explaining this.
>>>
>>> Getting back to the initial case led to the question, i'm now able to
>>> check what is the correct dynamic loader:
>>>
>>> $ tmp/sysroots-uninative/x86_64-linux/usr/bin/patchelf-uninative
>>> /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/cargo
>>> --print-interpreter
>>> /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86=
-64.so.2=20
>>>
>>>
>>> and also could use --print-needed which would be similar to "readelf -=
d
>>> ", but it'd be still not possible to check things at the runtime? OFC
>>> knowing what i know now, it's possible to locate the DSO and check
>>> symbols like this:
>>>
>>> $ x86_64-poky-linux-objdump -T
>>> ./sysroots/x86_64-pokysdk-linux/lib/libc.so.6 | grep GLIBC_2.33
>>>
>>> just seems the catch points are quite subtle :) Perhaps there could=20
>>> be a
>>> recommendation on a good way validating the binaries in the SDK HOST=
=20
>>> part?
>>
>> If you what to know what a partiular command is doing for symbols at=20
>> runtime,
>> you can run it as:
>>
>> LD_DEBUG=3Dall <command>
>>
>> which will have the loader spew out a lot of information about how it i=
s
>> resolving the symbols.

Thanks for this hint. Applied to the current dev artifacts i can now see=
=20
what is loaded:

$ LD_DEBUG=3Dall cargo 2>&1 | grep GLIBC_2.33
 =C2=A0=C2=A0=C2=A0=C2=A0 29463:=C2=A0=C2=A0=C2=A0=C2=A0 checking for vers=
ion `GLIBC_2.33' in file=20
/tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/lib/libc.so.6 [0]=20
required by file=20
/tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/../lib/libcr=
ypto.so.1.1=20
[0]
 =C2=A0=C2=A0=C2=A0=C2=A0 29463:=C2=A0=C2=A0=C2=A0=C2=A0 checking for vers=
ion `GLIBC_2.33' in file=20
/tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/lib/libc.so.6 [0]=20
required by file=20
/tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/../lib/libcu=
rl.so.4=20
[0]


>
> I had other things to do today but for 'fun', in the background, I took:
> =C2=A0 poky/master + meta-oe/master + meta-rust with Anatol's SDK commit=
s
> and bisected poky back to:
>
> =C2=A0 7b8df042d0 (HEAD, refs/bisect/bad) glibc: Upgrade to 2.33
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (From OE-Core rev: aa87638cf4f2bef6=
6df92f961c7814f6b482fd3d)
>
> This is when I expected problems with the SDK to start but
> I thought it was worth confirming mechanically.
>
> Note that the two last bisected commits after the uprev of glibc fail
> to even complete the populate_sdk due to the error:
>
> =C2=A0=C2=A0 ERROR: core-image-minimal-1.0-r0 do_populate_sdk:
> =C2=A0=C2=A0 The postinstall intercept hook 'update_gio_module_cache' fa=
iled,

I recall failures in post install scripts failing due to missing files,=20
where scripts under scripts/postinst-intercepts/ sometimes make wrong=20
assumptions. Unfortunately we never caught the causes. Anyway, this one=20
doesn't look related to glibc whatsoever.

> Once Richard is happy with the basic meta-rust merge, I can spend more
> time and actually look at the linking and debug what's going wrong
> if Anatol has not figure it out before that.
>
Yeah, i'll continue working on Rust SDK integration and in particular=20
checking through teh current patch. On the particular glbic issue -=20
while I built using master to pursue a reproduce, I also used ldd for=20
the checks. However, as we've just learned ldd would be the wrong way -=20
other than that, the binaries wasn't showing the warnings about missing=20
symbols at runtime. I'm also more focused on the Rust itself, but anyway=
=20
will keep eyes open to this.


Regards

Anatol


> ../Randy
>
>
> $ git bisect log
>
> git bisect start
> # bad: [1fe4a25f2244fdf67d96109dcb4f49ed75c18b32]
> =C2=A0=C2=A0=C2=A0 diffoscope: Ensure rpm is configured correctly
>
> git bisect bad 1fe4a25f2244fdf67d96109dcb4f49ed75c18b32
> # bad: [1fe4a25f2244fdf67d96109dcb4f49ed75c18b32]
> =C2=A0=C2=A0=C2=A0 diffoscope: Ensure rpm is configured correctly
>
> git bisect bad 1fe4a25f2244fdf67d96109dcb4f49ed75c18b32
> # good: [77d9b5f02aec991540926fe144076e122c17f64d]
> =C2=A0=C2=A0=C2=A0 pseudo: Update to work with glibc 2.33
>
> git bisect good 77d9b5f02aec991540926fe144076e122c17f64d
> # bad: [b6018a1625c22393c1f94e9d23d84f7842b95f24]
> =C2=A0=C2=A0=C2=A0 acpica: Fix reproducibility issues
>
> git bisect bad b6018a1625c22393c1f94e9d23d84f7842b95f24
> # bad: [7283a0b3b6ca49d0d2e13593333a580ef10439a8]
> =C2=A0=C2=A0=C2=A0 bitbake: bblayers/action: When adding layers,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 catch BBHandledException
>
> git bisect bad 7283a0b3b6ca49d0d2e13593333a580ef10439a8
> # bad: [c5d80f154de30a6f59f28d4d9d05edcd78469765]
> =C2=A0=C2=A0=C2=A0 selftest/reproducible: remove spirv-tools-dev from ex=
clusion list
>
> git bisect bad c5d80f154de30a6f59f28d4d9d05edcd78469765
> # bad: [adcd9608a725d99e2e6ca74d4a31e6edb353af0c]
> =C2=A0=C2=A0=C2=A0 bitbake: hashserv: client: Fix handling of null respo=
nses
>
> git bisect bad adcd9608a725d99e2e6ca74d4a31e6edb353af0c
> # bad: [071f23ad79ac37743d97928f92ded0da61ba9e63]
> =C2=A0=C2=A0=C2=A0 bash: Disable bracketed input by default
>
> git bisect bad 071f23ad79ac37743d97928f92ded0da61ba9e63
> # bad: [8e3b42f44217c9f868d6b8bd52808d357b516a2b]
> =C2=A0=C2=A0=C2=A0 glibc: Require full ISA support for x86-64 level mark=
er
>
> git bisect bad 8e3b42f44217c9f868d6b8bd52808d357b516a2b
> # bad: [51cf44884971d6fc919f2a799fb08ee61acf7518]
> =C2=A0=C2=A0=C2=A0 glibc: Enable cet
>
> git bisect bad 51cf44884971d6fc919f2a799fb08ee61acf7518
> # bad: [7b8df042d0c175388d6230f008b1c83d5c5cd5da]
> =C2=A0=C2=A0=C2=A0 glibc: Upgrade to 2.33
>
> git bisect bad 7b8df042d0c175388d6230f008b1c83d5c5cd5da
> # first bad commit: [7b8df042d0c175388d6230f008b1c83d5c5cd5da] glibc:=20
> Upgrade to 2.33
>
>
> ---
>>
>> Cheers,
>>
>> Richard
>>
>
>
>
>=20
>

--------------9CE71FD958F08FE204E473DD
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-=
8">
  </head>
  <body>
    <p>Hi,<br>
    </p>
    <div class=3D"moz-cite-prefix">On 2/25/2021 1:23 AM, Randy MacLeod
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:3534ea02-0674-6862-9d0b-673d5b941f71@windriver.com">On
      2021-02-24 6:57 p.m., Richard Purdie wrote:
      <br>
      <blockquote type=3D"cite">On Wed, 2021-02-24 at 21:16 +0100, Anatol
        Belski wrote:
        <br>
        <blockquote type=3D"cite">On 2/24/2021 5:49 PM, Richard Purdie
          wrote:
          <br>
          <blockquote type=3D"cite">No, I mean the dynamic loader pointer.
            <br>
            <br>
            $
            tmp/sysroots-uninative/x86_64-linux/usr/bin/patchelf-uninative
            python3-native/python3.9 --print-interpreter
            <br>
[...]tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2
            <br>
            <br>
            Above I'm showing that a native binary in the build
            (python3-native)
            <br>
            has the interpreter (dynamic loader) set to our uninative
            ld.so.
            <br>
            The SDK is similar.
            <br>
            <br>
            <blockquote type=3D"cite">As the binary where the issue was
              sighted has this
              <br>
              <br>
              $ chrpath $(which cargo)
              <br>
/tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/cargo:
              <br>
              RUNPATH=3D$ORIGIN/../lib
              <br>
              <br>
              <br>
              but then, the DSOs have no rpath set, eg.
              <br>
              <br>
              $ chrpath
              <br>
/tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/../lib/libcr=
ypto.so.1.1
              <br>
/tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/../lib/libcr=
ypto.so.1.1:
              <br>
              no rpath or runpath tag found.
              <br>
              <br>
              <br>
              so it might lead to the interferrence with the host. Does
              it perhaps
              <br>
              need both $ORIGIN/../../lib and $ORIGIN/../lib if binaries
              are in /usr ?
              <br>
            </blockquote>
            Our dynamic loader knows how to use the specific sysroot and
            then
            <br>
            fall back to /usr and /lib.
            <br>
          </blockquote>
          <br>
          Thanks a lot for explaining this.
          <br>
          <br>
          Getting back to the initial case led to the question, i'm now
          able to
          <br>
          check what is the correct dynamic loader:
          <br>
          <br>
          $
          tmp/sysroots-uninative/x86_64-linux/usr/bin/patchelf-uninative
          <br>
/tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/cargo
          <br>
          --print-interpreter
          <br>
/tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.=
so.2
          <br>
          <br>
          and also could use --print-needed which would be similar to
          "readelf -d
          <br>
          ", but it'd be still not possible to check things at the
          runtime? OFC
          <br>
          knowing what i know now, it's possible to locate the DSO and
          check
          <br>
          symbols like this:
          <br>
          <br>
          $ x86_64-poky-linux-objdump -T
          <br>
          ./sysroots/x86_64-pokysdk-linux/lib/libc.so.6 | grep
          GLIBC_2.33
          <br>
          <br>
          just seems the catch points are quite subtle :) Perhaps there
          could be a
          <br>
          recommendation on a good way validating the binaries in the
          SDK HOST part?
          <br>
        </blockquote>
        <br>
        If you what to know what a partiular command is doing for
        symbols at runtime,
        <br>
        you can run it as:
        <br>
        <br>
        LD_DEBUG=3Dall &lt;command&gt;
        <br>
        <br>
        which will have the loader spew out a lot of information about
        how it is
        <br>
        resolving the symbols.
        <br>
      </blockquote>
    </blockquote>
    <p>Thanks for this hint. Applied to the current dev artifacts i can
      now see what is loaded:</p>
    <p>$ LD_DEBUG=3Dall cargo 2&gt;&amp;1 | grep GLIBC_2.33<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 29463:=C2=A0=C2=A0=C2=A0=C2=A0 checking for=
 version `GLIBC_2.33' in file
      /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/lib/libc.so.6
      [0] required by file
/tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/../lib/libcr=
ypto.so.1.1
      [0]<br>
      =C2=A0=C2=A0=C2=A0=C2=A0 29463:=C2=A0=C2=A0=C2=A0=C2=A0 checking for=
 version `GLIBC_2.33' in file
      /tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/lib/libc.so.6
      [0] required by file
/tmp/rust-sdk-deploy-18/sysroots/x86_64-pokysdk-linux/usr/bin/../lib/libcu=
rl.so.4
      [0]</p>
    <p><br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:3534ea02-0674-6862-9d0b-673d5b941f71@windriver.com">
      <br>
      I had other things to do today but for 'fun', in the background, I
      took:
      <br>
      =C2=A0 poky/master + meta-oe/master + meta-rust with Anatol's SDK
      commits
      <br>
      and bisected poky back to:
      <br>
      <br>
      =C2=A0 7b8df042d0 (HEAD, refs/bisect/bad) glibc: Upgrade to 2.33
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (From OE-Core rev:
      aa87638cf4f2bef66df92f961c7814f6b482fd3d)
      <br>
      <br>
      This is when I expected problems with the SDK to start but
      <br>
      I thought it was worth confirming mechanically.
      <br>
      <br>
      Note that the two last bisected commits after the uprev of glibc
      fail
      <br>
      to even complete the populate_sdk due to the error:
      <br>
      <br>
      =C2=A0=C2=A0 ERROR: core-image-minimal-1.0-r0 do_populate_sdk:
      <br>
      =C2=A0=C2=A0 The postinstall intercept hook 'update_gio_module_cache=
'
      failed,
      <br>
    </blockquote>
    <p>I recall failures in post install scripts failing due to missing
      files, where scripts under scripts/postinst-intercepts/ sometimes
      make wrong assumptions. Unfortunately we never caught the causes.
      Anyway, this one doesn't look related to glibc whatsoever.<br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:3534ea02-0674-6862-9d0b-673d5b941f71@windriver.com">Once
      Richard is happy with the basic meta-rust merge, I can spend more
      <br>
      time and actually look at the linking and debug what's going wrong
      <br>
      if Anatol has not figure it out before that.
      <br>
      <br>
    </blockquote>
    <p>Yeah, i'll continue working on Rust SDK integration and in
      particular checking through teh current patch. On the particular
      glbic issue - while I built using master to pursue a reproduce, I
      also used ldd for the checks. However, as we've just learned ldd
      would be the wrong way - other than that, the binaries wasn't
      showing the warnings about missing symbols at runtime. I'm also
      more focused on the Rust itself, but anyway will keep eyes open to
      this.<br>
    </p>
    <p><br>
    </p>
    <p>Regards</p>
    <p>Anatol<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite"
      cite=3D"mid:3534ea02-0674-6862-9d0b-673d5b941f71@windriver.com">../R=
andy
      <br>
      <br>
      <br>
      $ git bisect log
      <br>
      <br>
      git bisect start
      <br>
      # bad: [1fe4a25f2244fdf67d96109dcb4f49ed75c18b32]
      <br>
      =C2=A0=C2=A0=C2=A0 diffoscope: Ensure rpm is configured correctly
      <br>
      <br>
      git bisect bad 1fe4a25f2244fdf67d96109dcb4f49ed75c18b32
      <br>
      # bad: [1fe4a25f2244fdf67d96109dcb4f49ed75c18b32]
      <br>
      =C2=A0=C2=A0=C2=A0 diffoscope: Ensure rpm is configured correctly
      <br>
      <br>
      git bisect bad 1fe4a25f2244fdf67d96109dcb4f49ed75c18b32
      <br>
      # good: [77d9b5f02aec991540926fe144076e122c17f64d]
      <br>
      =C2=A0=C2=A0=C2=A0 pseudo: Update to work with glibc 2.33
      <br>
      <br>
      git bisect good 77d9b5f02aec991540926fe144076e122c17f64d
      <br>
      # bad: [b6018a1625c22393c1f94e9d23d84f7842b95f24]
      <br>
      =C2=A0=C2=A0=C2=A0 acpica: Fix reproducibility issues
      <br>
      <br>
      git bisect bad b6018a1625c22393c1f94e9d23d84f7842b95f24
      <br>
      # bad: [7283a0b3b6ca49d0d2e13593333a580ef10439a8]
      <br>
      =C2=A0=C2=A0=C2=A0 bitbake: bblayers/action: When adding layers,
      <br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 catch BBHandledException
      <br>
      <br>
      git bisect bad 7283a0b3b6ca49d0d2e13593333a580ef10439a8
      <br>
      # bad: [c5d80f154de30a6f59f28d4d9d05edcd78469765]
      <br>
      =C2=A0=C2=A0=C2=A0 selftest/reproducible: remove spirv-tools-dev fro=
m exclusion
      list
      <br>
      <br>
      git bisect bad c5d80f154de30a6f59f28d4d9d05edcd78469765
      <br>
      # bad: [adcd9608a725d99e2e6ca74d4a31e6edb353af0c]
      <br>
      =C2=A0=C2=A0=C2=A0 bitbake: hashserv: client: Fix handling of null r=
esponses
      <br>
      <br>
      git bisect bad adcd9608a725d99e2e6ca74d4a31e6edb353af0c
      <br>
      # bad: [071f23ad79ac37743d97928f92ded0da61ba9e63]
      <br>
      =C2=A0=C2=A0=C2=A0 bash: Disable bracketed input by default
      <br>
      <br>
      git bisect bad 071f23ad79ac37743d97928f92ded0da61ba9e63
      <br>
      # bad: [8e3b42f44217c9f868d6b8bd52808d357b516a2b]
      <br>
      =C2=A0=C2=A0=C2=A0 glibc: Require full ISA support for x86-64 level =
marker
      <br>
      <br>
      git bisect bad 8e3b42f44217c9f868d6b8bd52808d357b516a2b
      <br>
      # bad: [51cf44884971d6fc919f2a799fb08ee61acf7518]
      <br>
      =C2=A0=C2=A0=C2=A0 glibc: Enable cet
      <br>
      <br>
      git bisect bad 51cf44884971d6fc919f2a799fb08ee61acf7518
      <br>
      # bad: [7b8df042d0c175388d6230f008b1c83d5c5cd5da]
      <br>
      =C2=A0=C2=A0=C2=A0 glibc: Upgrade to 2.33
      <br>
      <br>
      git bisect bad 7b8df042d0c175388d6230f008b1c83d5c5cd5da
      <br>
      # first bad commit: [7b8df042d0c175388d6230f008b1c83d5c5cd5da]
      glibc: Upgrade to 2.33
      <br>
      <br>
      <br>
      ---
      <br>
      <blockquote type=3D"cite">
        <br>
        Cheers,
        <br>
        <br>
        Richard
        <br>
        <br>
      </blockquote>
      <br>
      <br>
      <br>
      <fieldset class=3D"mimeAttachmentHeader"></fieldset>
      <pre class=3D"moz-quote-pre" wrap=3D"">


</pre>
    </blockquote>
  </body>
</html>

--------------9CE71FD958F08FE204E473DD--
