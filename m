Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7020FEFB806
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 06:51:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15096.1771915884378996627
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 22:51:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=FvIevcec;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 4E923C143DA
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:51:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CAA4D5FD5F;
	Tue, 24 Feb 2026 06:51:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4FE5010368057;
	Tue, 24 Feb 2026 07:51:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771915881; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TvV75DNUe2F4CBAG48CH92oJgzG3wcDhA1stLR5/18Q=;
	b=FvIevcecRn65Yj3C0UqIjhCYvn3G+0qGUPrafh7iMHur/JEs8Qe9jyjGg3CVrydzR0nLAa
	ZdKi/yjbQ0kfulbq+Zwz3D08cBoxg3eQDYOMicXo/wx4WIDwM2FTCfe3Y+9ci0T8iSTXyZ
	fD2t5OX3YdTyDwxr5shh99ZfA+QmJZ64NVYZqOvQQv9UgS3rrcA08Q+FtoaHLSvT71e/Ko
	lloCb2/jM8Sd3dNN+cI8K/DCMmRW5H5J9nrrWVMgnqj2NkUZLZ2vly0xn3EFVIEvXWj0ML
	PdOAkj2QXglwHAmmozXEMEC665e/9aLjJxhq8qxMFAAwMRE3MQeW/yvhRsQN5w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 07:51:19 +0100
Message-Id: <DGMZR9E83Q30.1THN2QXSLJ8P4@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <adam.duskett@amarulasolutions.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v5 7/8] dnf: Upgrade to 5.4.0.0
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260223153929.2641007-1-adam.duskett@amarulasolutions.com>
 <20260223153929.2641007-7-adam.duskett@amarulasolutions.com>
In-Reply-To: <20260223153929.2641007-7-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 06:51:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231744

On Mon Feb 23, 2026 at 4:39 PM CET, Adam Duskett via lists.openembedded.org=
 wrote:
> Completely rewritten in C++, there are several changes needed
> to facilitate moving from DNF4 to DNF5. Below are some significant
> items to note:
>
>     - The "-v/--verbose" cli option is removed. As such, remove the argum=
ent
>     everywhere it was called.[1]
>
>     - the rpmverbosity cli option is replaced with --setopt=3Drpmverbosit=
y
>
>     - Change gpgcheck to pkg_gpgcheck as this is what the documentation
>     recommends.[2]
>
>     - --nogpgcheck is now --no-gpgchecks
>
>     - --setopt=3Dprotect_running_kernel=3DFalse has to be set or else eve=
ry dnf
>     transaction complains that /boot/vmlinuz-${kernel_version} does not
>     exist in /var/log/dnf5.log. There is an open issue on github[3] to en=
able
>     the currently not-yet implemented `autocheck_running_kernel option`, =
but
>     it has been open for quite some time and the protect_running_kernel
>     option supresses the message.
>
>     - Move --skip-broken to after the install argument as the global
>       --skip-broken argument is removed.
>
>     - /var/cache/dnf is replaced with /var/cache/libdnf5
>
>     - Add `features +=3D 'PACKAGECONFIG:append:pn-rpm =3D " sequoia"\n'`
>           `features +=3D 'PACKAGECONFIG:append:pn-librepo =3D " sequoia"\=
n'`
>       to test_testimage_dnf as librepo currently does not work
>       with gpgme.
>
> While DNF5 has many config options, unfortunately, the majority
> of them depends on sdbus-c++, which is not included in OE-core.
> However, the package is included in meta-openembedded, so it's
> best to include the PACKAGECONFIG options in the recipe and
> leave them off by default.
>
> 1: https://github.com/rpm-software-management/dnf5/issues/464
> 2: https://dnf5.readthedocs.io/en/latest/dnf5.conf.5.html
> 3: https://github.com/rpm-software-management/dnf5/issues/1255
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---

Hi Adam,

Thanks for the new version.

We have a new warning on the autobuilder:

WARNING: core-image-minimal-1.0-r0 do_rootfs: [log_check] core-image-minima=
l: found 1 warning message in the logfile:
[log_check] Warning: skipped OpenPGP checks for 38 packages from repository=
: oe-repo

https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/3196
https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/3256

It appears with most tested configurations.

Also, we have an error that is probably related to this series:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/layers/openembedd=
ed-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/layers/openembedd=
ed-core/meta/lib/oeqa/runtime/cases/dnf.py", line 76, in test_dnf_makecache
    self.dnf_with_repo('makecache')
  File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/layers/openembedd=
ed-core/meta/lib/oeqa/runtime/cases/dnf.py", line 71, in dnf_with_repo
    output =3D self.dnf(" ".join(cmdlinerepoopts) + " --no-gpgchecks " + co=
mmand)
             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^
  File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/layers/openembedd=
ed-core/meta/lib/oeqa/runtime/cases/dnf.py", line 21, in dnf
    status, output =3D self.target.run(command, 1500)
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/layers/openembedd=
ed-core/meta/lib/oeqa/core/target/ssh.py", line 98, in run
    status, output =3D self._run(sshCmd, processTimeout, ignore_status, raw=
, ignore_ssh_fails)
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/musl-qemux86-64/build/layers/openembedd=
ed-core/meta/lib/oeqa/core/target/ssh.py", line 70, in _run
    raise AssertionError("ssh exited with status '255' for command "
AssertionError: ssh exited with status '255' for command '['ssh', '-l', 'ro=
ot', '-o', 'ServerAliveCountMax=3D2', '-o', 'ServerAliveInterval=3D30', '-o=
', 'UserKnownHostsFile=3D/dev/null', '-o', 'StrictHostKeyChecking=3Dno', '-=
o', 'LogLevel=3DERROR', '192.168.7.6', 'export PATH=3D/usr/sbin:/sbin:/usr/=
bin:/bin; dnf --setopt=3Dprotect_running_kernel=3DFalse --repofrompath=3Doe=
-testimage-repo-x86_64_v3,http://192.168.7.5:45047/x86_64_v3 --repofrompath=
=3Doe-testimage-repo-qemux86_64,http://192.168.7.5:45047/qemux86_64 --repof=
rompath=3Doe-testimage-repo-noarch,http://192.168.7.5:45047/noarch --no-gpg=
checks makecache']': this is likely an SSH failure
...
AssertionError: 2 !=3D 0 : Log: /srv/pokybuild/yocto-worker/musl-qemux86-64=
/build/build/tmp/work/qemux86_64-poky-linux-musl/core-image-full-cmdline/1.=
0/target_logs/dmesg_output.log
-----------------------
Central error: [   14.872213] dnf[505]: segfault at 7f8f1b8ce000 ip 00007f8=
f1da5d014 sp 00007f8f1b895348 error 6 in libc.so[7b014,7f8f1d9f4000+6a000] =
likely on CPU 0 (core 0, socket 0)
***********************
[    1.347803] Freeing unused kernel image (text/rodata gap) memory: 268K
[    1.349819] Freeing unused kernel image (rodata/data gap) memory: 1988K
[    1.351736] Run /sbin/init as init process
[    1.352864]   with arguments:
[    1.352865]     /sbin/init
[    1.352866]   with environment:
[    1.352867]     HOME=3D/
[    1.352867]     TERM=3Dlinux
[    1.357452] input: QEMU QEMU USB Tablet as /devices/pci0000:00/0000:00:1=
d.7/usb1/1-1/1-1:1.0/0003:0627:0001.0001/input/input1
[    1.360534] hid-generic 0003:0627:0001.0001: input: USB HID v0.01 Mouse =
[QEMU QEMU USB Tablet] on usb-0000:00:1d.7-1/input0
[    1.401965] udevd[146]: starting version 3.2.14
[    1.407271] udevd[147]: starting eudev-3.2.14
[    1.477478] usb 1-2: new high-speed USB device number 3 using ehci-pci
[    1.609892] input: QEMU QEMU USB Keyboard as /devices/pci0000:00/0000:00=
:1d.7/usb1/1-2/1-2:1.0/0003:0627:0001.0002/input/input2
[    1.663894] hid-generic 0003:0627:0001.0002: input: USB HID v1.11 Keyboa=
rd [QEMU QEMU USB Keyboard] on usb-0000:00:1d.7-2/input0
[    1.935163] EXT4-fs (vda): re-mounted af13441a-0b27-4d0e-b95b-cbcec53b24=
2b.
[    4.415509] NFSD: Unable to initialize client recovery tracking! (-110)
[    4.417630] NFSD: Is nfsdcld running? If not, enable CONFIG_NFSD_LEGACY_=
CLIENT_TRACKING.
[    4.420057] NFSD: starting 90-second grace period (net effffff9)
[   14.872213] dnf[505]: segfault at 7f8f1b8ce000 ip 00007f8f1da5d014 sp 00=
007f8f1b895348 error 6 in libc.so[7b014,7f8f1d9f4000+6a000] likely on CPU 0=
 (core 0, socket 0)
[   14.872224] Code: 48 89 44 17 c9 48 89 44 17 d1 48 89 44 17 d9 48 89 f8 =
c3 f7 c7 0f 00 00 00 49 89 f8 48 89 44 17 f8 48 89 d1 75 0b 48 c1 e9 03 <f3=
> 48 ab 4c 89 c0 c3 31 d2 29 fa 83 e2 0f 48 89 07 48 89 47 08 48
...
RESULTS - dnf.DnfRepoTest.test_dnf_makecache: FAILED (0.54s)
RESULTS - parselogs.ParseLogsTest.test_parselogs: FAILED (2.93s)

Maybe only when building with musl:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/3284
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3252

And finally we have this one:
ERROR: dnf-5.4.0.0-r0 do_package: Didn't find service unit 'dnf5-makecache.=
service', specified in SYSTEMD_SERVICE:dnf.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/3063

Can you have a look at these issues?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


