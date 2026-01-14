Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C32D39009
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 18:37:47 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17578.1768415860572983521
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 10:37:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OBHi7QDR;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso1145885e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 10:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768415859; x=1769020659; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q6B+HMkTVPfeKieSle3De5j5lcYvPBUrk9mOPv5SW80=;
        b=OBHi7QDR7HtRJQosGTEfxpMBL4qSaetFw4RNqs7yRFvmMIoi6xgynVsm4wJEK69SQJ
         yAWaU80HtkDoqTcyLPCnfMcuOjGXCsbkHM4Dt4D5uJOCzguNTaccRvI8/sCJzZDsWf3e
         7Fbt9Za1S3Fj4dOC2svMYOqwuyU/yeffIVKae4k4VhR88hd3vk387cBEDVojNRWCxQ5Y
         1uP3fumh+WrlZk+c+f1XlUnVWnycRqHSRD60cIMyrkw/9YFKucZb6hWC1lb8xjPTlILi
         TjHN+clMUn7sCsImbBHPTxuAa9xiqGGonxZobPgRv0fFNROfdWf4A9pYuSoVJ8BtgbZ1
         RnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768415859; x=1769020659;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q6B+HMkTVPfeKieSle3De5j5lcYvPBUrk9mOPv5SW80=;
        b=IZ1Z2e1mkNR+iB+ZFWl+68xA05iCnO8CofCi7ROerpIUg0EtflimY7ehFNiNT+ksBl
         lDZwjJV19qeu7lQM1hEM69cHsPPOaPgF9UePwBr9jz885smsxCi9eNYD9zBEue+9j2dW
         XS5KRgzBdOKUU8KkkFI/Xm6NcsTF2RTsuuEqbvdP//HoqvEf5vqBlhNVG84BYbhp72At
         lO5m/7bzVuOtnXdcTN/I1g3jkWQsxN2unFJijbkSWw5ie0WYL7Dx2hDgL7CoQhhwOcis
         xqa55UgEQJwqr9hTAi03FmFf4E33Y2gl5BH0U+GpVv9XlfT5LmJH3yLHLSAxyA6NpzLU
         NqCA==
X-Forwarded-Encrypted: i=1; AJvYcCU8bS92n6u3wKv31cw/HypiuKGJlzoNHVyQYMBtgdgWCHxMctZdxfvncTGyXLju99laUmVL8887yEVwf8viag095g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxiRJtAIHKh2FcYTsjo7FI9CAueRqwH4xOHR4quJ3IATcFEFmOY
	wlUAAC9YRsnOKW+AMvqbpjiWYkev8tfgmuUV6+D4D5cV4XcSUys2exWW
X-Gm-Gg: AY/fxX6zn/MccgCO9KokRickFdnkmnvNabrvjNw4FKNwSTsYcljSCvuYb+aYuLepT6/
	6hekqTJXg3V2YtsaudX5JjzQmOCYe3POdoJcblq7sg50ldpwHZZAHJdQTVGXyUzbM3U7HeBFz2H
	yhzzwzzCYmXwrAj58Eo/+yZxTTQb1O5UAiC4Fry5aZpJ1fwGjY/GY2dnlM1s2YyNKzL0UIrIJiF
	pTXHZ6Cf6JXQ/DTRzasrE3i2Uu4LC74ejDJldyk3bmK3Hhjwn32rciQqVrKnEEKSU9Y4d1wzYCr
	0iSh/xUxGBKovIoHVUAF3R1tWGRmt4VJ4SoeelDgdO9qcYT0ZfLiKCgsC2HKl335hkmcAAZOZ7c
	cQngmSwnu1VPX60SmwZGawLfIS792+SW4JogiLvmkyR+xJu6CWVl4+wWiPmj2Djs3i2JcHPk3Eb
	be3W6NXsnTqFbLFEnTP3nDEwfJkv6V7i8m69tvig/7q/ZUn2MxJ12iGouMs3oo
X-Received: by 2002:a05:600c:3b9f:b0:477:bb0:751b with SMTP id 5b1f17b1804b1-47ee4827625mr39054075e9.27.1768415858681;
        Wed, 14 Jan 2026 10:37:38 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-434af6d909fsm738554f8f.31.2026.01.14.10.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 10:37:38 -0800 (PST)
Message-ID: <3fce84b4562ce40c8ee858f36640ca1cfca39b20.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v2 00/14] IDE SDK Improvements
From: adrian.freihofer@gmail.com
To: antonin.godard@bootlin.com, adrian.freihofer@siemens.com, 
	openembedded-core@lists.openembedded.org
Date: Wed, 14 Jan 2026 19:37:37 +0100
In-Reply-To: <DFNBA0VIZPB8.12G68QK151UGC@bootlin.com>
References: <20251231114718.4031606-1-adrian.freihofer@siemens.com>
	 <DFNBA0VIZPB8.12G68QK151UGC@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 18:37:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229366

Hi Antonin

My proposal for proceeding here is to drop one patch from my series:
  [OE-core] [PATCH v2 13/14]
  oe-selftest: devtool: add test for gdb pretty-printing

This one get killed by patches which are currently on master-next too.
This makes it almost impossible to fix at the moment.
When things will settle down, I will test and send this one again.

It is just one more test step which would be nice to have but not
essential.
It also fails only on a ARM host, which I cannot reproduce.

All in all just too many floating parts for getting this to final state
right now.

Could we please proceed with 13 out of 14 patches from my series as a
next step? Mathieu already hat such a branch for a while.

Thank you.
Adrian



On Tue, 2026-01-13 at 09:17 +0100, Antonin Godard via
lists.openembedded.org wrote:
> Hi Adrian,
>=20
> I think I hit a different error on the Autobuilder with your series:
>=20
> 2026-01-12 21:40:10,012 - oe-selftest - INFO - FAIL:
> devtool.DevtoolIdeSdkTests.test_devtool_ide_sdk_code_cmake
> (subunit.RemotedTestCase)
> 2026-01-12 21:40:10,012 - oe-selftest - INFO - ----------------------
> ------------------------------------------------
> 2026-01-12 21:40:10,012 - oe-selftest - INFO -
> testtools.testresult.real._StringException: Traceback (most recent
> call last):
> =C2=A0 File "/srv/pokybuild/yocto-worker/oe-selftest-
> armhost/build/layers/openembedded-
> core/meta/lib/oeqa/selftest/cases/devtool.py", line 3238, in
> test_devtool_ide_sdk_code_cmake
> =C2=A0=C2=A0=C2=A0 self._verify_launch_json_debugging(tempdir, qemu, reci=
pe_name,
> example_exe)
> =C2=A0 File "/srv/pokybuild/yocto-worker/oe-selftest-
> armhost/build/layers/openembedded-
> core/meta/lib/oeqa/selftest/cases/devtool.py", line 3107, in
> _verify_launch_json_debugging
> =C2=A0=C2=A0=C2=A0 self._verify_launch_config(tempdir, config, tasks, qem=
u,
> example_exe,
> =C2=A0 File "/srv/pokybuild/yocto-worker/oe-selftest-
> armhost/build/layers/openembedded-
> core/meta/lib/oeqa/selftest/cases/devtool.py", line 3204, in
> _verify_launch_config
> =C2=A0=C2=A0=C2=A0 r =3D runCmd(gdb_batch_cmd, output_log=3Dself._cmd_log=
ger)
> =C2=A0 File "/srv/pokybuild/yocto-worker/oe-selftest-
> armhost/build/layers/openembedded-
> core/meta/lib/oeqa/utils/commands.py", line 214, in runCmd
> =C2=A0=C2=A0=C2=A0 raise AssertionError("Command '%s' returned non-zero e=
xit status
> %d:\n%s" % (command, result.status, exc_output))
> AssertionError: Command '/srv/pokybuild/yocto-worker/oe-selftest-
> armhost/build/build-st-241514/tmp/work/aarch64-linux/gdb-cross-
> aarch64/16.3/recipe-sysroot-native/usr/bin/aarch64-poky-
> linux/aarch64-poky-linux-gdb --batch -ex 'set sysroot
> /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-
> 241514/tmp/work/cortexa57-poky-linux/cmake-example/1.0/image' -ex
> 'python import sys;sys.path.insert(0, '"'"'/srv/pokybuild/yocto-
> worker/oe-selftest-armhost/build/build-st-241514/tmp/work/cortexa57-
> poky-linux/cmake-example/1.0/recipe-sysroot/usr/share/gcc-
> 15.2.0/python'"'"');from libstdcxx.v6.printers import
> register_libstdcxx_printers;register_libstdcxx_printers(None)' -ex
> 'set substitute-path /usr/include /srv/pokybuild/yocto-worker/oe-
> selftest-armhost/build/build-st-241514/tmp/work/cortexa57-poky-
> linux/cmake-example/1.0/recipe-sysroot/usr/include' -ex 'set
> substitute-path /usr/src/debug/cmake-example/1.0
> /tmp/devtoolqa5x_myf_r' -ex 'set substitute-path /usr/src/debug
> /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-
> 241514/tmp/work/qemuarm64-poky-linux/oe-selftest-image/1.0/rootfs-
> dbg/usr/src/debug' -ex 'set solib-search-path /srv/pokybuild/yocto-
> worker/oe-selftest-armhost/build/build-st-241514/tmp/work/qemuarm64-
> poky-linux/oe-selftest-image/1.0/rootfs-
> dbg/lib/.debug:/srv/pokybuild/yocto-worker/oe-selftest-
> armhost/build/build-st-241514/tmp/work/qemuarm64-poky-linux/oe-
> selftest-image/1.0/rootfs-dbg/usr/lib/.debug:/srv/pokybuild/yocto-
> worker/oe-selftest-armhost/build/build-st-241514/tmp/work/qemuarm64-
> poky-linux/oe-selftest-image/1.0/rootfs-
> dbg/usr/lib/debug:/srv/pokybuild/yocto-worker/oe-selftest-
> armhost/build/build-st-241514/tmp/work/qemuarm64-poky-linux/oe-
> selftest-image/1.0/rootfs-dbg/lib:/srv/pokybuild/yocto-worker/oe-
> selftest-armhost/build/build-st-241514/tmp/work/qemuarm64-poky-
> linux/oe-selftest-image/1.0/rootfs-dbg/usr/lib:/srv/pokybuild/yocto-
> worker/oe-selftest-armhost/build/build-st-241514/tmp/work/qemuarm64-
> poky-linux/oe-selftest-image/1.0/rootfs/lib:/srv/pokybuild/yocto-
> worker/oe-selftest-armhost/build/build-st-241514/tmp/work/qemuarm64-
> poky-linux/oe-selftest-image/1.0/rootfs/usr/lib' -ex 'file
> /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-
> 241514/tmp/work/cortexa57-poky-linux/cmake-
> example/1.0/image/usr/bin/cmake-example' -ex 'target remote
> 192.168.7.2:1234' -ex 'break main' -ex 'continue' -ex 'break
> CppExample::print_json()' -ex 'continue' -ex 'print
> CppExample::test_string.compare("cpp-example-lib Magic: 123456789")'
> -ex 'print CppExample::test_string.compare("cpp-example-lib Magic:
> 123456789aaa")' -ex 'list cpp-example-lib.hpp:14,14' -ex 'list cpp-
> example.cpp:55,55' -ex 'break cpp-example.cpp:55' -ex 'continue' -ex
> 'print numbers' -ex 'continue'' returned non-zero exit status 1:
> _start () at ../sysdeps/aarch64/dl-start.S:23
> 23	ENTRY (_start)
> Breakpoint 1 at 0xaaaaaaaa1400: file /usr/src/debug/cmake-
> example/1.0/cpp-example.cpp, line 15.
>=20
> Breakpoint 1, main (argc=3D1, argv=3D0xfffffffffd08) at
> /usr/src/debug/cmake-example/1.0/cpp-example.cpp:15
> 15	{
> Breakpoint 2 at 0xfffff7f91d70: file /usr/src/debug/cmake-
> example/1.0/cpp-example-lib.cpp, line 28.
>=20
> Breakpoint 2, CppExample::print_json (this=3D0xfffffffffac8) at
> /usr/src/debug/cmake-example/1.0/cpp-example-lib.cpp:28
> 28	=C2=A0=C2=A0=C2=A0 jobj =3D json_object_new_object();
> $1 =3D 0
> $2 =3D -3
> 14	=C2=A0=C2=A0=C2=A0 inline static const std::string test_string =3D "cp=
p-
> example-lib Magic: 123456789";
> 55	=C2=A0=C2=A0=C2=A0 std::vector<int> numbers =3D {1, 2, 3};
> No compiled code for line 55 in file "cpp-example.cpp".
> Make breakpoint pending on future shared library load? (y or [n])
> [answered N; input not from terminal]
> [Inferior 1 (process 333) exited normally]
> A syntax error in expression, near the end of `numbers'.
> The program is not being run.
>=20
> It's also on an Arm host as Mathieu also noticed previously.
>=20
> Can you have a look?
>=20
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3145
> https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4913998/raw_inl=
ine
>=20
> Thanks,
> Antonin
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#229231):
> https://lists.openembedded.org/g/openembedded-core/message/229231
> Mute This Topic: https://lists.openembedded.org/mt/117010483/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

