Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EEA9C48260
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 12:36:57 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.16622.1707395810557719333
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Feb 2024 04:36:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K6FbzR1+;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cf206e4d56so22911881fa.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 04:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707395809; x=1708000609; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgmeYf2KqtM7mWH4wyyCztNAXgb5yfzDKeIO9GtB+FQ=;
        b=K6FbzR1+IXY/MhLCYUfiCqB3/GuTkWfjuAQ63W16oWhAR/4aw0Q+u3Hb/OQIxdhB9Q
         F9R6s7A9kR7dT6awbfL5zRDNVhBqw4AYfLe9/feZKGjkDBDXTtv+Q2txQq4M2LtlHiwM
         Jv1CZufO9aE7kd1WMFcrIG6xjK5uryLszh7wS+7VrAerqbmDLXXFyZBX2shkuCDW6br7
         VOmAcAkfWOQqBxkqoEtnqELFa4M2QyTiSc9Z+C8oFLj9v/u+Shulj+Ls8eANYrEW0P7w
         7vWmKLMOIkCorFOlW2cxYtxRB3wV31uq71WGvcKm84lcYbWNZWZiwI0whtJwIrdkepY0
         +oaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707395809; x=1708000609;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KgmeYf2KqtM7mWH4wyyCztNAXgb5yfzDKeIO9GtB+FQ=;
        b=r8IV7jrtaD4TYRRgvs6dUgEmuPbxIJa/XFtkX6fE+kLucyGyYpAkRURwB6wcVaFDAo
         6qArhsipGGIVCC9ndOhmIkPjW+PKa8inczpn10cyNgDBhMN6szwLxd4RBNeuGwc7ie/t
         89cSCOdL6IsCtKcAoMQnzLo03wjFaIDvxvA7SzDQCi/V5MLs2g1uOw33hhRqZH77Dtwz
         n+mY8xLDrTFq+o57VX5fcoPBH3/ffmJmiIqCimk//cAMpD3CNhf/CU9o7wDVHN8du8rx
         IiVaI3aLQN8X6XMCDYc3s1IhiaMsL9/5zpwGeGQbFH1zmPd/s29YDYx8B6msP21NfJRN
         dsvg==
X-Gm-Message-State: AOJu0YxHIgaLwsdf/zMCj7U1Yo9PXDyK/uQ0ssh9bVQq4s85Wzy+h/Iq
	X/djMRyzWXgLwcalyQ+rk7XjWPD3mA29zOtry5lr9u8jQDJ7zPQsdfPeYFq1PxCpgVIgaDV6w1P
	742ejhMKmhbVqnytrITvx5sTHoZ4=
X-Google-Smtp-Source: AGHT+IFm4WEi9aHn3JnML66DRILuNgIJn+RFbLGgev9sAX8p3OKSe8SGa5TmNdCT+j7QMp3RBNBxhZnDqMky5jC7Nmk=
X-Received: by 2002:a2e:8890:0:b0:2cd:3731:9c39 with SMTP id
 k16-20020a2e8890000000b002cd37319c39mr6210327lji.33.1707395808477; Thu, 08
 Feb 2024 04:36:48 -0800 (PST)
MIME-Version: 1.0
References: <20240208082821.430510-1-adrian.freihofer@siemens.com>
 <CANNYZj9_BtkgYOuu0YaemJK5fONV4CoERvCYquRtCL6=moc5Eg@mail.gmail.com> <bde1fbcb363b1bff4a8fc5be9dca6d7615cb7fcd.camel@gmail.com>
In-Reply-To: <bde1fbcb363b1bff4a8fc5be9dca6d7615cb7fcd.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 8 Feb 2024 13:36:36 +0100
Message-ID: <CANNYZj84P2zNzj=My0JHSF_B-uOhn3ANmQtUJXm-V9A8vfhozw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/7] python 3.12 related fixes
To: adrian.freihofer@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Feb 2024 12:36:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195148

"qemu... -device virtio-vga-gl -display gtk,gl=3Don,show-cursor=3Don "

"qemu-system-x86_64: OpenGL is not supported by the display"

I think it's something in your local environment, and most likely not
a general fedora 39 issue. You don't need to check further if you
don't rely on accelerated virtual graphics in qemu.

We'll deal with it if the official AB worker starts showing issues.

Alex

On Thu, 8 Feb 2024 at 13:29, <adrian.freihofer@gmail.com> wrote:
>
> Hi Alex
>
> Thank you.
>
> It looks like there is already a Fedora-39 runner in the AB. So maybe it'=
s easier for you to wait for the results from the official Yocto machine la=
ter on.
> But of course I can provide you some lines from my log files. (Unfortunat=
ely I already deleted the qemu-bootlog).
>
>
> 2024-02-08 02:41:24,247 - oe-selftest - INFO - runtime_test.TestImage.tes=
t_testimage_virgl_gtk_sdl (subunit.RemotedTestCase)
> 2024-02-08 02:41:24,250 - oe-selftest - INFO - ... FAIL
> 2024-02-08 02:41:24,364 - oe-selftest - INFO - 2: 109/130 376/576 (1454.5=
8s) (2 failed) (runtime_test.TestImage.test_testimage_virgl_gtk_sdl)
> 2024-02-08 02:41:24,364 - oe-selftest - INFO - testtools.testresult.real.=
_StringException: Traceback (most recent call last):
> File "/home/adrian/projets/oss/poky/meta/lib/oeqa/core/decorator/__init__=
.py", line 35, in wrapped_f
> return func(*args, **kwargs)
> ^^^^^^^^^^^^^^^^^^^^^
> File "/home/adrian/projets/oss/poky/meta/lib/oeqa/selftest/cases/runtime_=
test.py", line 264, in test_testimage_virgl_gtk_sdl
> bitbake('-c testimage core-image-minimal')
> File "/home/adrian/projets/oss/poky/meta/lib/oeqa/utils/commands.py", lin=
e 234, in bitbake
> return runCmd(cmd, ignore_status, timeout, output_log=3Doutput_log, **opt=
ions)
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> File "/home/adrian/projets/oss/poky/meta/lib/oeqa/utils/commands.py", lin=
e 212, in runCmd
> raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s"=
 % (command, result.status, exc_output))
> AssertionError: Command 'bitbake -c testimage core-image-minimal' returne=
d non-zero exit status 1:
> Loading cache...done.
> Loaded 1930 entries from dependency cache.
> NOTE: Resolving any missing task queue dependencies
>
> Build Configuration:
> BB_VERSION =3D "2.7.2"
> BUILD_SYS =3D "x86_64-linux"
> NATIVELSBSTRING =3D "universal"
> TARGET_SYS =3D "x86_64-poky-linux"
> MACHINE =3D "qemux86-64"
> DISTRO =3D "poky"
> DISTRO_VERSION =3D "4.3+snapshot-245f71953bc7fdfbda6aa69bc71221867c5d9764=
"
> TUNE_FEATURES =3D "m64 core2"
> TARGET_FPU =3D ""
> meta
> meta-poky
> meta-yocto-bsp =3D "adrianf/oe-selftest-fedora-39:245f71953bc7fdfbda6aa69=
bc71221867c5d9764"
> meta-selftest =3D "main:4d71a2f5c246deea74326929c1b4a50d4282b254"
>
> Initialising tasks...Sstate summary: Wanted 52 Local 52 Mirrors 0 Missed =
0 Current 452 (100% match, 100% complete)
> done.
> NOTE: Executing Tasks
> NOTE: Running task 1716 of 1716 (/home/adrian/projets/oss/poky/meta/recip=
es-core/images/core-image-minimal.bb:do_testimage)
> NOTE: recipe core-image-minimal-1.0-r0: task do_testimage: Started
> QMP Available for connection at /home/adrian/projets/oss/poky/build-st-27=
01801/tmp/.wzpw04s6
> ERROR: core-image-minimal-1.0-r0 do_testimage: Qemu pid didn't appear in =
300 seconds (02/08/24 02:41:20)
> ERROR: core-image-minimal-1.0-r0 do_testimage: Status information, poll s=
tatus: 0, pidfile exists: False, pidfile contents None, proc pid exists Fal=
se
> ERROR: core-image-minimal-1.0-r0 do_testimage: Output from runqemu:
> runqemu - INFO - Continuing with the following parameters:
> KERNEL: [/home/adrian/projets/oss/poky/build-st-2701801/tmp/deploy/images=
/qemux86-64/bzImage]
> MACHINE: [qemux86-64]
> FSTYPE: [ext4]
> ROOTFS: [/home/adrian/projets/oss/poky/build-st-2701801/tmp/deploy/images=
/qemux86-64/core-image-minimal-qemux86-64.rootfs.ext4]
> CONFFILE: [/home/adrian/projets/oss/poky/build-st-2701801/tmp/deploy/imag=
es/qemux86-64/core-image-minimal-qemux86-64.rootfs.qemuboot.conf]
>
> runqemu - INFO - Using preconfigured tap device tap0
> runqemu - INFO - If this is not intended, touch /tmp/qemu-tap-locks/tap0.=
skip to make runqemu skip tap0.
> runqemu - INFO - Network configuration: ip=3D192.168.7.2::192.168.7.1:255=
.255.255.0::eth0:off:8.8.8.8 net.ifnames=3D0
> runqemu - INFO - Running /home/adrian/projets/oss/poky/build-st-2701801/t=
mp/work/x86_64-linux/qemu-helper-native/1.0/recipe-sysroot-native/usr/bin/q=
emu-system-x86_64 -device virtio-net-pci,netdev=3Dnet0,mac=3D52:54:00:12:34=
:02 -netdev tap,id=3Dnet0,ifname=3Dtap0,script=3Dno,downscript=3Dno -object=
 rng-random,filename=3D/dev/urandom,id=3Drng0 -device virtio-rng-pci,rng=3D=
rng0 -drive file=3D/home/adrian/projets/oss/poky/build-st-2701801/tmp/deplo=
y/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.ext4,if=3Dvirtio,f=
ormat=3Draw -usb -device usb-tablet -usb -device usb-kbd -cpu IvyBridge -ma=
chine q35,i8042=3Doff -smp 4 -enable-kvm -m 256 -serial tcp:127.0.0.1:32917=
,nodelay=3Don -serial tcp:127.0.0.1:48415,nodelay=3Don -pidfile /home/adria=
n/projets/oss/poky/build-st-2701801/pidfile_3501104 -S -qmp unix:./.611zx6p=
l,server,wait -qmp unix:./.wzpw04s6,server,nowait -snapshot -device virtio-=
vga-gl -display gtk,gl=3Don,show-cursor=3Don -kernel /home/adrian/projets/o=
ss/poky/build-st-2701801/tmp/deploy/images/qemux86-64/bzImage -append 'root=
=3D/dev/vda rw ip=3D192.168.7.2::192.168.7.1:255.255.255.0::eth0:off:8.8.8.=
8 net.ifnames=3D0 console=3DttyS0 console=3DttyS1 oprofile.timer=3D1 tsc=3D=
reliable no_timer_check rcupdate.rcu_expedited=3D1 swiotlb=3D0 printk.time=
=3D1'
>
> runqemu - INFO - Host uptime: 842696.36
>
> runqemu - ERROR - Failed to run qemu: Authorization required, but no auth=
orization protocol specified
>
> qemu-system-x86_64: OpenGL is not supported by the display
>
> runqemu - INFO - Cleaning up
> runqemu - INFO - Host uptime: 842696.45
>
> tput: No value for $TERM and no -T specified
>
> ERROR: core-image-minimal-1.0-r0 do_testimage: Error executing a python f=
unction in exec_func_python() autogenerated:
>
> The stack trace of python calls that resulted in this exception/failure w=
as:
> File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
> 0001:
> *** 0002:do_testimage(d)
> 0003:
> File: '/home/adrian/projets/oss/poky/meta/classes-recipe/testimage.bbclas=
s', lineno: 119, function: do_testimage
> 0115: dump-guest-memory {"paging":false,"protocol":"file:%s.img"}
> 0116:}
> 0117:
> 0118:python do_testimage() {
> *** 0119: testimage_main(d)
> 0120:}
> 0121:
> 0122:addtask testimage
> 0123:do_testimage[nostamp] =3D "1"
> File: '/home/adrian/projets/oss/poky/meta/classes-recipe/testimage.bbclas=
s', lineno: 397, function: testimage_main
> 0393: orig_sigterm_handler =3D signal.signal(signal.SIGTERM, sigterm_exce=
ption)
> 0394: try:
> 0395: # We need to check if runqemu ends unexpectedly
> 0396: # or if the worker send us a SIGTERM
> *** 0397: tc.target.start(params=3Dd.getVar("TEST_QEMUPARAMS"), runqemupa=
rams=3Dd.getVar("TEST_RUNQEMUPARAMS"))
> 0398: import threading
> 0399: try:
> 0400: threading.Timer(int(d.getVar("TEST_OVERALL_TIMEOUT")), handle_test_=
timeout, (int(d.getVar("TEST_OVERALL_TIMEOUT")),)).start()
> 0401: except ValueError:
> File: '/home/adrian/projets/oss/poky/meta/lib/oeqa/core/target/qemu.py', =
lineno: 91, function: start
> 0087: except (subprocess.CalledProcessError, subprocess.TimeoutExpired, F=
ileNotFoundError) as err:
> 0088: msg +=3D "Error running command: %s\n%s\n" % (blcmd, err)
> 0089: msg +=3D "\n\n=3D=3D=3D=3D=3D end: snippet =3D=3D=3D=3D=3D\n"
> 0090:
> *** 0091: raise RuntimeError("FAILED to start qemu - check the task log a=
nd the boot log %s" % (msg))
> 0092:
> 0093: def stop(self):
> 0094: self.runner.stop()
> Exception: RuntimeError: FAILED to start qemu - check the task log and th=
e boot log
>
> =3D=3D=3D=3D=3D start: snippet =3D=3D=3D=3D=3D
>
>
>
> =3D=3D=3D=3D=3D end: snippet =3D=3D=3D=3D=3D
>
> =3D=3D=3D=3D=3D start: snippet =3D=3D=3D=3D=3D
>
> Error running command: ['tail', '-20', '/home/adrian/projets/oss/poky/bui=
ld-st-2701801/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/testima=
ge/qemu_boot_log.20240208013616']
> Command '['tail', '-20', '/home/adrian/projets/oss/poky/build-st-2701801/=
tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/testimage/qemu_boot_l=
og.20240208013616']' returned non-zero exit status 1.
>
>
> =3D=3D=3D=3D=3D end: snippet =3D=3D=3D=3D=3D
>
>
> ERROR: Logfile of failure stored in: /home/adrian/projets/oss/poky/build-=
st-2701801/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/temp/log.d=
o_testimage.3501104
> NOTE: recipe core-image-minimal-1.0-r0: task do_testimage: Failed
> ERROR: Task (/home/adrian/projets/oss/poky/meta/recipes-core/images/core-=
image-minimal.bb:do_testimage) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1716 tasks of which 1715 didn't need to be=
 rerun and 1 failed.
>
> Summary: 1 task failed:
> /home/adrian/projets/oss/poky/meta/recipes-core/images/core-image-minimal=
.bb:do_testimage
> Summary: There were 4 ERROR messages, returning a non-zero exit code.
>
>
> Stderr:
> 2024-02-07 22:42:37,482 - oe-selftest - INFO - Adding: "include selftest.=
inc" in /home/adrian/projets/oss/poky/build-st-2701801/conf/local.conf
> 2024-02-07 22:42:37,482 - oe-selftest - INFO - Adding: "include bblayers.=
inc" in bblayers.conf
> /usr/lib64/python3.12/unittest/case.py:580: RuntimeWarning: TestResult ha=
s no addDuration method
> warnings.warn("TestResult has no addDuration method",
>
> /usr/lib64/python3.12/unittest/case.py:580: RuntimeWarning: TestResult ha=
s no addDuration method
> warnings.warn("TestResult has no addDuration method",
>
> /usr/lib64/python3.12/unittest/case.py:580: RuntimeWarning: TestResult ha=
s no addDuration method
> warnings.warn("TestResult has no addDuration method",
>
> /usr/lib64/python3.12/unittest/case.py:580: RuntimeWarning: TestResult ha=
s no addDuration method
> warnings.warn("TestResult has no addDuration method",
>
> Regards,
> Adrian
>
>
>
> On Thu, 2024-02-08 at 10:15 +0100, Alexander Kanavin wrote:
>
> On Thu, 8 Feb 2024 at 09:28, Adrian Freihofer
> <adrian.freihofer@gmail.com> wrote:
>
> - runtime_test.TestImage.test_testimage_virgl_gtk_sdl: FAILED (1454.58s)
>   No idea why this fails.
>
>
> If you can show the error that happens here, I can take a look.
>
> Alex
>
>
>

