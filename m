Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF543D0BB63
	for <webhook@archiver.kernel.org>; Thu, 24 Oct 2024 06:19:35 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.8286.1729750772677957462
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 23:19:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=o40DyYbD;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f76a6f0dso480376e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 23:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729750771; x=1730355571; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zMRXucSiFftmejg+8qfQsdtsqQeT435cW7pC/RyhVE8=;
        b=o40DyYbDKliyPPQ4PfdoIiaiepmGFrAkrexadw4msyGdkSsN+QnP3htEWFK3QSMPk/
         7v6Y+J847VQz+X9tAxxsW4yKW5evxiiJdaSHE/H+Ig7J29M7ZrDmseQT9ESQTX2xPwt2
         ypjGQoOuCZnnb49mVne+58L0oyPoSoGxQSIDNwa2tKQpMb1n8K0BhfPbQc9osLwY39WD
         GLj9YMEt3oNRt4VXL7Rac8iy1YUGejOBqncuINJN6ZknXOxsSmYuFyWPJ4YVPPnMx1z3
         5kYoFpOA3/5SfhmI3T0kK+r2j6ItfzhQ76o2kx/SYpmu+FqVtzu6yd5zuB5VSe+uxyG0
         z/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729750771; x=1730355571;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zMRXucSiFftmejg+8qfQsdtsqQeT435cW7pC/RyhVE8=;
        b=iCpRQs0YAezOESI3bCyTw7YoQLV3fJFRjjH7TDQ0lBl5EaELhQHvleK7YnUDbAWFbV
         AAN9U0bEk+6MRghGZ9WekD0isZs8W021lCyRN9XfQ1BHgnusffqlHVOEePbZFvBKEpzG
         6aLWxg0ukIlt87T2S4ev2gD9iDds7loaM4ZUXZmMDvxCD7aMX2F7FNl36BbQTGPf9Rdu
         WuIrqlNawBNhIC19/ti6i7Ee4+yXebhcru3FqtvjrgMMYM092VsdWTtYqrGS2T1j0lVU
         Eb82Wnr7f8IFtU2SyCgzO7Ly8aFz9ACD7FeVJXeRr6/XHkUWcl3nSI3OD+Oq0kWch4aE
         eEiA==
X-Gm-Message-State: AOJu0YzXavK7jcFzku0b3UPVX9p/ADpBPe9ny5/5POa2e88YkT0FHumS
	gbzlGVOZfOy9VYgJGIGKkbK1Vm+/8fWWfIfy5kYCcOWFwDtsxnHQzrbnasNcR9w=
X-Google-Smtp-Source: AGHT+IHUo/wVJqCv18xAgLg5nZQ4UMv0cW9hwz39mprj3W9EUSI10Cf0PEMRbq6+ui3kfOtdJ5cgIw==
X-Received: by 2002:a05:6512:3a82:b0:539:964c:16b4 with SMTP id 2adb3069b0e04-53b1a3a672emr2556653e87.58.1729750770273;
        Wed, 23 Oct 2024 23:19:30 -0700 (PDT)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a2243ed9bsm1266960e87.255.2024.10.23.23.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 23:19:28 -0700 (PDT)
Date: Thu, 24 Oct 2024 09:19:25 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v10 0/9] systemd uki support
Message-ID: <Zxnm7SbFIO-4mvbL@nuoska>
References: <20241023120839.437771-1-mikko.rapeli@linaro.org>
 <180122B0064457FF.13420@lists.openembedded.org>
 <180123793D1D4B45.13420@lists.openembedded.org>
 <b999ba968f3c9dea9d3a1ba03d73a1d5ae8d56a3.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b999ba968f3c9dea9d3a1ba03d73a1d5ae8d56a3.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Oct 2024 06:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206276

Hi,

On Wed, Oct 23, 2024 at 07:39:51PM +0100, Richard Purdie wrote:
> On Wed, 2024-10-23 at 17:58 +0100, Richard Purdie via
> lists.openembedded.org wrote:
> > On Wed, 2024-10-23 at 17:44 +0100, Richard Purdie via
> > lists.openembedded.org wrote:
> > > On Wed, 2024-10-23 at 15:08 +0300, Mikko Rapeli via
> > > lists.openembedded.org wrote:
> > > > These changes enable building systemd uki images which combine
> > > > kernel, kernel command line, initrd and possibly signatures to
> > > > a single UEFI binary. This binary can be booted with UEFI
> > > > firmware
> > > > and systemd-boot. No grub is needed and UEFI firmware and/or
> > > > systemd-boot provide possibilities for boot menus.
> > > > The uki binary can also be signed for UEFI secure boot
> > > > so the secure boot extends from firmware to kernel and initrd.
> > > > Binding secure boot to full userspace is then easier since for
> > > > example
> > > > kernel command line and initrd contain the support needed to
> > > > mount
> > > > encrypted dm-verity etc partitions, and/or create partitions on
> > > > demand
> > > > with systemd-repart using device specific TPM devices for
> > > > encryption.
> > > >=20
> > > > Tested on qemuarm64-secureboot machine from meta-arm with changes
> > > > to
> > > > support secure boot. Slightly different configuration tested on
> > > > multiple arm64 System Ready boards with UEFI firmware, real and
> > > > firmware
> > > > based TPM devices. Tested with ovmf firmware on x86_64 with
> > > > selftests but
> > > > without secure boot which seems to be harder to setup in ovmf.
> > > >=20
> > > > Sadly I see two wic selftests, wic.Wic2.test_rawcopy_plugin_qemu
> > > > and
> > > > wic.Wic2.test_expand_mbr_image, failing when executing all wic
> > > > selftests
> > > > on a build machine with zfs filesystem. Will investigate this
> > > > further.
> > > > The issue seems to be in mkfs.ext4 producing broken filesystem,
> > > > and
> > > > partially
> > > > in the tests which don't run the correct rootfs file (.ext4 vs
> > > > .wic).
> > > > Will debug this further and it is IMO unrelated to these changes
> > > > since
> > > > they reproduce on pure master branch without this series.
> > > >=20
> > > > v10: disabled kvm support in new tests since it breaks qemu boot
> > > > on
> > > > aarch64
> > > > =A0=A0=A0=A0 build machine, removed "testimage" from IMAGE_CLASS as=
 well
> > > > since
> > > > =A0=A0=A0=A0 can end up testing qemu machine during build.
> > >=20
> > > I hate to say this but
> > > wic.Wic2.test_efi_plugin_plain_systemd_boot_qemu_aarch64 is still
> > > failing:
> > >=20
> >=20
> > https://valkyrie.yoctoproject.org/#/builders/23/builds/320/steps/14/log=
s/stdio
>=20
> and:
>=20
> https://valkyrie.yoctoproject.org/#/builders/23/builds/323/steps/14/logs/=
stdio
>=20
> which is clearer without the other failure.

There are severe issues[1] running aarch64 target image and firmware
via qemu on an aarch64 build machine. Specs of the machine would
be good to know.

The test works on x86_64 build machine for targets qemuarm64
and genericarm64, and qemux86_64 with a different test using edk2/ovmf.
All wic, uki and efibootpartition tests pass on x86_64 build host.
The failure is in u-boot and qemu on aarch64 and have nothing
to do with high level systemd and Unified Kernel Image support
which these patches setup.

Ross, why can't I mark the test for x86_64 build hosts for now?
v9 of the series has it and could be applied right now.

I'm in the process of setting up an aarch64 machine for yocto
builds so I can debug this issue and run tests. Right now
I simply can't reproduce, debug or fix the issue.

Cheers,

-Mikko

[1]
https://valkyrie.yoctoproject.org/#/builders/23/builds/323/steps/14/logs/st=
dio

2024-10-23 20:28:56,148 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/utils/commands.py", line 375, in runqemu
    qemu.start(params=3Dqemuparams, ssh=3Dssh, runqemuparams=3Drunqemuparam=
s, launch_cmd=3Dlaunch_cmd, discard_writes=3Ddiscard_writes)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/targetcontrol.py", line 179, in start
    raise RuntimeError("%s - FAILED to start qemu - check the task log and =
the boot log" % self.pn)
RuntimeError: core-image-base - FAILED to start qemu - check the task log a=
nd the boot log
During handling of the above exception, another exception occurred:
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/selftest/cases/wic.py", line 1379, in test_efi_plugin_plain_systemd_boot_q=
emu_aarch64
    with runqemu('core-image-base', ssh=3DFalse,
  File "/usr/lib/python3.12/contextlib.py", line 137, in __enter__
    return next(self.gen)
           ^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/utils/commands.py", line 381, in runqemu
    raise Exception(msg)
Exception: core-image-base - FAILED to start qemu - check the task log and =
the boot log
Failed to start QEMU - see the logs in /srv/pokybuild/yocto-worker/oe-selft=
est-armhost/build/build-st-1891679/tmp/work/qemuarm64-poky-linux/core-image=
-base/1.0/testimageQemurunner log output from /srv/pokybuild/yocto-worker/o=
e-selftest-armhost/build/build-st-1891679/tmp/work/qemuarm64-poky-linux/cor=
e-image-base/1.0/testimage/qemurunner_log.20241023173919:
INFO: rootfs file: /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/bu=
ild-st-1891679/tmp/deploy/images/qemuarm64/core-image-base-qemuarm64.rootfs=
=2Ewic
INFO: Qemu log file: /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/=
build-st-1891679/tmp/work/qemuarm64-poky-linux/core-image-base/1.0/testimag=
e/qemu_boot_log.20241023173919
INFO: SSH log file: /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/b=
uild-st-1891679/tmp/work/qemuarm64-poky-linux/core-image-base/1.0/testimage=
/ssh_target_log.20241023173919
DEBUG: Using kvm for runqemu
INFO: QMP Available for connection at /srv/pokybuild/yocto-worker/oe-selfte=
st-armhost/build/build-st-1891679/tmp/.a8wewvdb
DEBUG: Created listening socket for qemu serial console on: 127.0.0.1:60105
DEBUG: Created listening socket for qemu serial console on: 127.0.0.1:37965
DEBUG: launchcmd=3Drunqemu snapshot kvm  nographic qemuarm64 /srv/pokybuild=
/yocto-worker/oe-selftest-armhost/build/build-st-1891679/tmp/deploy/images/=
qemuarm64/core-image-base-qemuarm64.rootfs.wic tcpserial=3D60105:37965 boot=
params=3D" printk.time=3D1" qemuparams=3D"-pidfile /srv/pokybuild/yocto-wor=
ker/oe-selftest-armhost/build/build-st-1891679/pidfile_1891679  -S -qmp uni=
x:./.358r3f9e,server,wait -qmp unix:./.a8wewvdb,server,nowait"
DEBUG: runqemu started, pid is 2886855
DEBUG: waiting at most 300 seconds for qemu pid (10/23/24 19:39:27)
DEBUG: QMP Initializing to /srv/pokybuild/yocto-worker/oe-selftest-armhost/=
build/build-st-1891679/tmp/.358r3f9e
DEBUG: QMP Connecting to /srv/pokybuild/yocto-worker/oe-selftest-armhost/bu=
ild/build-st-1891679/tmp/.358r3f9e
INFO: QMP connected to QEMU at 10/23/24 19:39:28 and took 0.56 seconds
INFO: QMP released QEMU at 10/23/24 19:39:28 and took 0.09 seconds from con=
nect
DEBUG: qemu started in 0.65 seconds - qemu procces pid is 2887295 (10/23/24=
 19:39:28)
DEBUG: Target IP: None
DEBUG: Server IP: None
DEBUG: Starting logging thread
DEBUG: Starting thread event loop
DEBUG: Connection request received
DEBUG: Setting connection established event
DEBUG: Output from runqemu:
runqemu - INFO - Continuing with the following parameters:
MACHINE: [qemuarm64]
FSTYPE: [wic]
ROOTFS: [/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-189=
1679/tmp/deploy/images/qemuarm64/core-image-base-qemuarm64.rootfs.wic]
CONFFILE: [/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1=
891679/tmp/deploy/images/qemuarm64/core-image-base-qemuarm64.rootfs.qemuboo=
t.conf]
runqemu - INFO - Acquiring lockfile /tmp/qemu-tap-locks/tap0.lock failed: [=
Errno 11] Resource temporarily unavailable
runqemu - INFO - Using preconfigured tap device tap1
runqemu - INFO - If this is not intended, touch /tmp/qemu-tap-locks/tap1.sk=
ip to make runqemu skip tap1.
runqemu - INFO - Network configuration: ip=3D192.168.7.4::192.168.7.3:255.2=
55.255.0::eth0:off:8.8.8.8 net.ifnames=3D0
runqemu - INFO - Copying rootfs to /home/pokybuild/tmp/core-image-base-qemu=
arm64.rootfs.wic.2886896
runqemu - INFO - Copy done in 0.17237091064453125 seconds
runqemu - INFO - Running /srv/pokybuild/yocto-worker/oe-selftest-armhost/bu=
ild/build-st-1891679/tmp/work/aarch64-linux/qemu-helper-native/1.0/recipe-s=
ysroot-native/usr/bin/qemu-system-aarch64 -device virtio-net-pci,netdev=3Dn=
et0,mac=3D52:54:00:12:34:04 -netdev tap,id=3Dnet0,ifname=3Dtap1,script=3Dno=
,downscript=3Dno -object rng-random,filename=3D/dev/urandom,id=3Drng0 -devi=
ce virtio-rng-pci,rng=3Drng0 -drive if=3Dvirtio,file=3D/home/pokybuild/tmp/=
core-image-base-qemuarm64.rootfs.wic.2886896,format=3Draw -device qemu-xhci=
 -device usb-tablet -device usb-kbd  -machine virt -cpu host -machine gic-v=
ersion=3D3 -smp 4 -enable-kvm -m 256 -device virtio-serial-pci -chardev soc=
ket,id=3Dvirtcon,port=3D60105,host=3D127.0.0.1,nodelay=3Don -device virtcon=
sole,chardev=3Dvirtcon -serial tcp:127.0.0.1:37965,nodelay=3Don  -pidfile /=
srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1891679/pidfi=
le_1891679  -S -qmp unix:./.358r3f9e,server,wait -qmp unix:./.a8wewvdb,serv=
er,nowait -serial null -serial mon:stdio -nographic -device virtio-gpu-pci =
-bios /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-189167=
9/tmp/deploy/images/qemuarm64/u-boot.bin=20
runqemu - INFO - Host uptime: 2757248.55
QEMU 9.1.0 monitor - type 'help' for more information
(qemu)=20
DEBUG: Waiting at most 1000 seconds for login banner (10/23/24 19:39:28)
DEBUG: Connection from 127.0.0.1:49726
WARNING: Target didn't reach login banner in 1000 seconds (10/23/24 19:56:0=
8)
WARNING: Last 25 lines of login console (2035481):
Flash: 64 MiB
Loading Environment from Flash... *** Warning - bad CRC, using default envi=
ronment
In:    serial,usbkbd
Out:   serial,vidconsole
Err:   serial,vidconsole
Bus xhci_pci: Register 8001040 NbrPorts 8
Starting the controller
"Synchronous Abort" handler, esr 0x96000010, far 0x10088040
elr: 0000000000057c7c lr : 0000000000057c60 (reloc)
elr: 000000004f71dc7c lr : 000000004f71dc60
x0 : 0000000010088040 x1 : 0000000000000001
x2 : 0000000000000000 x3 : 0000000000003e80
x4 : 0000000000000038 x5 : 000000004e585792
x6 : 0000000000000000 x7 : 0000000000000000
x8 : 000000004e585c20 x9 : 00000000ffffffd8
x10: 000000000000000d x11: 0000000000000006
x12: 000000004e585a78 x13: 000000004e585d90
x14: 0000000000000000 x15: 000000004e585792
x16: 000000004f710788 x17: 0000000000000000
x18: 000000004e685d90 x19: 000000004e68cc00
x20: 0000000000000000 x21: 0000000010088040
x22: 0000000010088000 x23: 000000004f7925a9
x24: 0000000000000000 x25: 0000000000000000
x26: 0000000000000000 x27: 0000000000000000
WARNING: Last 25 lines of all logging (2035481):
Flash: 64 MiB
Loading Environment from Flash... *** Warning - bad CRC, using default envi=
ronment
In:    serial,usbkbd
Out:   serial,vidconsole
Err:   serial,vidconsole
Bus xhci_pci: Register 8001040 NbrPorts 8
Starting the controller
"Synchronous Abort" handler, esr 0x96000010, far 0x10088040
elr: 0000000000057c7c lr : 0000000000057c60 (reloc)
elr: 000000004f71dc7c lr : 000000004f71dc60
x0 : 0000000010088040 x1 : 0000000000000001
x2 : 0000000000000000 x3 : 0000000000003e80
x4 : 0000000000000038 x5 : 000000004e585792
x6 : 0000000000000000 x7 : 0000000000000000
x8 : 000000004e585c20 x9 : 00000000ffffffd8
x10: 000000000000000d x11: 0000000000000006
x12: 000000004e585a78 x13: 000000004e585d90
x14: 0000000000000000 x15: 000000004e585792
x16: 000000004f710788 x17: 0000000000000000
x18: 000000004e685d90 x19: 000000004e68cc00
x20: 0000000000000000 x21: 0000000010088040
x22: 0000000010088000 x23: 000000004f7925a9
x24: 0000000000000000 x25: 0000000000000000
x26: 0000000000000000 x27: 0000000000000000
WARNING: Check full boot log: /srv/pokybuild/yocto-worker/oe-selftest-armho=
st/build/build-st-1891679/tmp/work/qemuarm64-poky-linux/core-image-base/1.0=
/testimage/qemu_boot_log.20241023173919
DEBUG: Stopping logging thread
DEBUG: Stop event received
DEBUG: Tearing down logging thread
DEBUG: Sending SIGTERM to runqemu
INFO: Output from runqemu:
runqemu - INFO - Received signal: 15
runqemu - INFO - Cleaning up
runqemu - INFO - Host uptime: 2758254.35
runqemu - INFO - Removing /home/pokybuild/tmp/core-image-base-qemuarm64.roo=
tfs.wic.2886896
tput: No value for $TERM and no -T specified
WARNING: Extra log data read:=20
x28: 0000000000000000 x29: 000000004e585c20
Code: d5033fbf aa1503e0 5287d003 52800002 (b8004401)=20
Resetting CPU ...
resetting ...
WARNING: Extra log data read:=20
DEBUG: Sending SIGTERM to runqemu
INFO: Output from runqemu:
runqemu - INFO - Received signal: 15
runqemu - INFO - Cleaning up
runqemu - INFO - Host uptime: 2758254.35
runqemu - INFO - Removing /home/pokybuild/tmp/core-image-base-qemuarm64.roo=
tfs.wic.2886896
tput: No value for $TERM and no -T specified
Stderr:
2024-10-23 18:55:56,461 - oe-selftest - INFO - Adding: "include selftest.in=
c" in /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-189167=
9/conf/local.conf
2024-10-23 18:55:56,462 - oe-selftest - INFO - Adding: "include bblayers.in=
c" in bblayers.conf
/usr/lib/python3.12/unittest/case.py:580: RuntimeWarning: TestResult has no=
 addDuration method
  warnings.warn("TestResult has no addDuration method",
/usr/lib/python3.12/unittest/case.py:580: RuntimeWarning: TestResult has no=
 addDuration method
  warnings.warn("TestResult has no addDuration method",
/usr/lib/python3.12/unittest/case.py:580: RuntimeWarning: TestResult has no=
 addDuration method
  warnings.warn("TestResult has no addDuration method",
/usr/lib/python3.12/unittest/case.py:580: RuntimeWarning: TestResult has no=
 addDuration method
  warnings.warn("TestResult has no addDuration method",
/usr/lib/python3.12/unittest/case.py:580: RuntimeWarning: TestResult has no=
 addDuration method
  warnings.warn("TestResult has no addDuration method",
/usr/lib/python3.12/unittest/case.py:580: RuntimeWarning: TestResult has no=
 addDuration method
  warnings.warn("TestResult has no addDuration method",
/usr/lib/python3.12/unittest/case.py:580: RuntimeWarning: TestResult has no=
 addDuration method
  warnings.warn("TestResult has no addDuration method",
/usr/lib/python3.12/unittest/case.py:580: RuntimeWarning: TestResult has no=
 addDuration method
  warnings.warn("TestResult has no addDuration method",
NOTE: Reconnecting to bitbake server...
WARNING: /usr/lib/python3.12/unittest/case.py:580: RuntimeWarning: TestResu=
lt has no addDuration method
  warnings.warn("TestResult has no addDuration method",
Loading cache...done.
Removing 1 recipes from the allarch sysroot...done.
Removing 2 recipes from the cortexa57 sysroot...done.
Removing 5 recipes from the qemuarm64 sysroot...done.
rootfs file: /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st=
-1891679/tmp/deploy/images/qemuarm64/core-image-base-qemuarm64.rootfs.wic
Qemu log file: /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-=
st-1891679/tmp/work/qemuarm64-poky-linux/core-image-base/1.0/testimage/qemu=
_boot_log.20241023173919
SSH log file: /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-s=
t-1891679/tmp/work/qemuarm64-poky-linux/core-image-base/1.0/testimage/ssh_t=
arget_log.20241023173919
Using kvm for runqemu
QMP Available for connection at /srv/pokybuild/yocto-worker/oe-selftest-arm=
host/build/build-st-1891679/tmp/.a8wewvdb
Created listening socket for qemu serial console on: 127.0.0.1:60105
Created listening socket for qemu serial console on: 127.0.0.1:37965
launchcmd=3Drunqemu snapshot kvm  nographic qemuarm64 /srv/pokybuild/yocto-=
worker/oe-selftest-armhost/build/build-st-1891679/tmp/deploy/images/qemuarm=
64/core-image-base-qemuarm64.rootfs.wic tcpserial=3D60105:37965 bootparams=
=3D" printk.time=3D1" qemuparams=3D"-pidfile /srv/pokybuild/yocto-worker/oe=
-selftest-armhost/build/build-st-1891679/pidfile_1891679  -S -qmp unix:./.3=
58r3f9e,server,wait -qmp unix:./.a8wewvdb,server,nowait"
runqemu started, pid is 2886855
waiting at most 300 seconds for qemu pid (10/23/24 19:39:27)
QMP Initializing to /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/b=
uild-st-1891679/tmp/.358r3f9e
QMP Connecting to /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/bui=
ld-st-1891679/tmp/.358r3f9e
QMP connected to QEMU at 10/23/24 19:39:28 and took 0.56 seconds
QMP released QEMU at 10/23/24 19:39:28 and took 0.09 seconds from connect
qemu started in 0.65 seconds - qemu procces pid is 2887295 (10/23/24 19:39:=
28)
Target IP: None
Server IP: None
Starting logging thread
Starting thread event loop
Connection request received
Setting connection established event
Output from runqemu:
runqemu - INFO - Continuing with the following parameters:
MACHINE: [qemuarm64]
FSTYPE: [wic]
ROOTFS: [/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-189=
1679/tmp/deploy/images/qemuarm64/core-image-base-qemuarm64.rootfs.wic]
CONFFILE: [/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1=
891679/tmp/deploy/images/qemuarm64/core-image-base-qemuarm64.rootfs.qemuboo=
t.conf]
runqemu - INFO - Acquiring lockfile /tmp/qemu-tap-locks/tap0.lock failed: [=
Errno 11] Resource temporarily unavailable
runqemu - INFO - Using preconfigured tap device tap1
runqemu - INFO - If this is not intended, touch /tmp/qemu-tap-locks/tap1.sk=
ip to make runqemu skip tap1.
runqemu - INFO - Network configuration: ip=3D192.168.7.4::192.168.7.3:255.2=
55.255.0::eth0:off:8.8.8.8 net.ifnames=3D0
runqemu - INFO - Copying rootfs to /home/pokybuild/tmp/core-image-base-qemu=
arm64.rootfs.wic.2886896
runqemu - INFO - Copy done in 0.17237091064453125 seconds
runqemu - INFO - Running /srv/pokybuild/yocto-worker/oe-selftest-armhost/bu=
ild/build-st-1891679/tmp/work/aarch64-linux/qemu-helper-native/1.0/recipe-s=
ysroot-native/usr/bin/qemu-system-aarch64 -device virtio-net-pci,netdev=3Dn=
et0,mac=3D52:54:00:12:34:04 -netdev tap,id=3Dnet0,ifname=3Dtap1,script=3Dno=
,downscript=3Dno -object rng-random,filename=3D/dev/urandom,id=3Drng0 -devi=
ce virtio-rng-pci,rng=3Drng0 -drive if=3Dvirtio,file=3D/home/pokybuild/tmp/=
core-image-base-qemuarm64.rootfs.wic.2886896,format=3Draw -device qemu-xhci=
 -device usb-tablet -device usb-kbd  -machine virt -cpu host -machine gic-v=
ersion=3D3 -smp 4 -enable-kvm -m 256 -device virtio-serial-pci -chardev soc=
ket,id=3Dvirtcon,port=3D60105,host=3D127.0.0.1,nodelay=3Don -device virtcon=
sole,chardev=3Dvirtcon -serial tcp:127.0.0.1:37965,nodelay=3Don  -pidfile /=
srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-1891679/pidfi=
le_1891679  -S -qmp unix:./.358r3f9e,server,wait -qmp unix:./.a8wewvdb,serv=
er,nowait -serial null -serial mon:stdio -nographic -device virtio-gpu-pci =
-bios /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/build-st-189167=
9/tmp/deploy/images/qemuarm64/u-boot.bin=20
runqemu - INFO - Host uptime: 2757248.55
QEMU 9.1.0 monitor - type 'help' for more information
(qemu)=20
Waiting at most 1000 seconds for login banner (10/23/24 19:39:28)
Connection from 127.0.0.1:49726
Target didn't reach login banner in 1000 seconds (10/23/24 19:56:08)
Last 25 lines of login console (2035481):
Flash: 64 MiB
Loading Environment from Flash... *** Warning - bad CRC, using default envi=
ronment
In:    serial,usbkbd
Out:   serial,vidconsole
Err:   serial,vidconsole
Bus xhci_pci: Register 8001040 NbrPorts 8
Starting the controller
"Synchronous Abort" handler, esr 0x96000010, far 0x10088040
elr: 0000000000057c7c lr : 0000000000057c60 (reloc)
elr: 000000004f71dc7c lr : 000000004f71dc60
x0 : 0000000010088040 x1 : 0000000000000001
x2 : 0000000000000000 x3 : 0000000000003e80
x4 : 0000000000000038 x5 : 000000004e585792
x6 : 0000000000000000 x7 : 0000000000000000
x8 : 000000004e585c20 x9 : 00000000ffffffd8
x10: 000000000000000d x11: 0000000000000006
x12: 000000004e585a78 x13: 000000004e585d90
x14: 0000000000000000 x15: 000000004e585792
x16: 000000004f710788 x17: 0000000000000000
x18: 000000004e685d90 x19: 000000004e68cc00
x20: 0000000000000000 x21: 0000000010088040
x22: 0000000010088000 x23: 000000004f7925a9
x24: 0000000000000000 x25: 0000000000000000
x26: 0000000000000000 x27: 0000000000000000
Last 25 lines of all logging (2035481):
Flash: 64 MiB
Loading Environment from Flash... *** Warning - bad CRC, using default envi=
ronment
In:    serial,usbkbd
Out:   serial,vidconsole
Err:   serial,vidconsole
Bus xhci_pci: Register 8001040 NbrPorts 8
Starting the controller
"Synchronous Abort" handler, esr 0x96000010, far 0x10088040
elr: 0000000000057c7c lr : 0000000000057c60 (reloc)
elr: 000000004f71dc7c lr : 000000004f71dc60
x0 : 0000000010088040 x1 : 0000000000000001
x2 : 0000000000000000 x3 : 0000000000003e80
x4 : 0000000000000038 x5 : 000000004e585792
x6 : 0000000000000000 x7 : 0000000000000000
x8 : 000000004e585c20 x9 : 00000000ffffffd8
x10: 000000000000000d x11: 0000000000000006
x12: 000000004e585a78 x13: 000000004e585d90
x14: 0000000000000000 x15: 000000004e585792
x16: 000000004f710788 x17: 0000000000000000
x18: 000000004e685d90 x19: 000000004e68cc00
x20: 0000000000000000 x21: 0000000010088040
x22: 0000000010088000 x23: 000000004f7925a9
x24: 0000000000000000 x25: 0000000000000000
x26: 0000000000000000 x27: 0000000000000000
Check full boot log: /srv/pokybuild/yocto-worker/oe-selftest-armhost/build/=
build-st-1891679/tmp/work/qemuarm64-poky-linux/core-image-base/1.0/testimag=
e/qemu_boot_log.20241023173919
Stopping logging thread
Stop event received
Tearing down logging thread
Sending SIGTERM to runqemu
Output from runqemu:
runqemu - INFO - Received signal: 15
runqemu - INFO - Cleaning up
runqemu - INFO - Host uptime: 2758254.35
runqemu - INFO - Removing /home/pokybuild/tmp/core-image-base-qemuarm64.roo=
tfs.wic.2886896
tput: No value for $TERM and no -T specified
Extra log data read:=20
x28: 0000000000000000 x29: 000000004e585c20
Code: d5033fbf aa1503e0 5287d003 52800002 (b8004401)=20
Resetting CPU ...
resetting ...
Extra log data read:=20
Sending SIGTERM to runqemu
Output from runqemu:
runqemu - INFO - Received signal: 15
runqemu - INFO - Cleaning up
runqemu - INFO - Host uptime: 2758254.35
runqemu - INFO - Removing /home/pokybuild/tmp/core-image-base-qemuarm64.roo=
tfs.wic.2886896
tput: No value for $TERM and no -T specified
----------------------------------------------------------------------
2024-10-23 20:28:56,148 - oe-selftest - INFO - Ran 609 tests in 5579.874s
2024-10-23 20:28:56,148 - oe-selftest - INFO - FAILED

