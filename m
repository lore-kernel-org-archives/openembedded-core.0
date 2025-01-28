Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FAE9C02193
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 15:10:38 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.19421.1738077037414327447
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Jan 2025 07:10:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OS2Tydzr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab68a4ab074so503005566b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 07:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738077036; x=1738681836; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZTftSvHqawZpSkex8ZUfmugflMx1ck9jlb35Jt54Ui4=;
        b=OS2TydzrgiwVigY+HLlavx35frk8JmVHE4oXb8KzMa+vdUApKmlVAwjoi+YPMbl0Or
         0cRN2sBYaoPOaadRWWkw6GLCNuEPuEO7Gx7ysmedkRkfDcsmN4jvLBnc8V5scHLRoZJ7
         0jf+m7qxN5/5Wc3doJeJz/61a38mxzJhOG7/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738077036; x=1738681836;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZTftSvHqawZpSkex8ZUfmugflMx1ck9jlb35Jt54Ui4=;
        b=Tm8KgCVtCXwZw2VMnhz1Kd9xp5NOwZ/xE3E50RfP4zJAXwpTVEoapfx1tcjM9pjq6H
         3cMbgJnH/jllKVoew6GPNuESGGhRP+qZ4l4PPf/DfDGbhpta47ziKeQp9akWJsLQhWvs
         df/lV74ftrGXKSUef6C6/1ylApClImVtbXekTEKFzJDzIotCkU+lz0+NbQs3i4sPmDvD
         RwLU9k3iWlaa6nSk9xKgTHD4e3w3IZjRRtPEIvpVjYH85uDFXtoR/aZD+oKHYTCZq5x6
         1rMKvEhR1FsnPW80ZXOLb3RnlRvmq8o2VkZeFqDVZ/tmegwKO3eB71Qex4jved3YHWUM
         zfYQ==
X-Gm-Message-State: AOJu0YwV6eMyQRJdcyLuenqB55w1gFwDvCj3ExzrXF6ig2/70rS1oT5i
	uZbpbgpCl9tmsMgdaBQjLF7yM12kZUM6pvCfmVFuJhxBs/2EQnE0llOrj9RYfFM=
X-Gm-Gg: ASbGnctWrJWcdHzcd8aeYRPE9KhllCW6RLxy0GRi98vMg0usiyvytRFKpNWP+UbF263
	3oLdkE7GQnQLMbwQRgmnHhXaVvhtDlto3g2LC4bvhilXPvY5S4Z7E167b2x+LlCcjlYo4ep0Mjx
	SJnJZ9Z50NVA6tzWB1dgbrnK5D737kvfi/9bYEHpYEeE2uOmC0GWEuspxtEjjEvc+gQWYfqJ1Cj
	GLlADA0jkkxnvRLPQ/ZNIndliDokB6yTJfg41P3F7hzY7Oh9Gz4f4E/59RADqVgHIV1HQ8U0dws
	hkI3uJrW6399TQ2w5/1A/nTmmMluSfU3PmOqlI+AVY8=
X-Google-Smtp-Source: AGHT+IGaAmA4f+Gz/PQRC12fOAd3lIPVWSMAyrhyQS7vuRy5OdChy+JyB1Cg+jDpY/v3guozdBOpzA==
X-Received: by 2002:a05:6402:5106:b0:5d0:ced8:d22d with SMTP id 4fb4d7f45d1cf-5db7db07334mr102867991a12.22.1738077035425;
        Tue, 28 Jan 2025 07:10:35 -0800 (PST)
Received: from [172.27.244.220] ([212.187.182.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760fbb2esm806246866b.140.2025.01.28.07.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 07:10:34 -0800 (PST)
Message-ID: <90b742af0089650af6d74410a1cae5b211a6b2d8.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/3] testimage.bbclass: capture RuntimeError
 too
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jan 2025 15:10:34 +0000
In-Reply-To: <Z5jrjpl4hLEeyq8t@nuoska>
References: <20241111131604.364308-1-mikko.rapeli@linaro.org>
	 <20241111131604.364308-3-mikko.rapeli@linaro.org>
	 <10810101792ffe49440847764ed2e4c620e67fe9.camel@linuxfoundation.org>
	 <Zzr0Df_92qav6fWq@nuoska> <181EDCF7C1A1686B.17613@lists.openembedded.org>
	 <ba9ffc9ade0e227bf9db0988e2877ddfef275207.camel@linuxfoundation.org>
	 <Z5jrjpl4hLEeyq8t@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Jan 2025 15:10:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210327

On Tue, 2025-01-28 at 16:37 +0200, Mikko Rapeli wrote:
> On Tue, Jan 28, 2025 at 01:49:00PM +0000, Richard Purdie wrote:
> > On Tue, 2025-01-28 at 13:04 +0000, Richard Purdie via
> > lists.openembedded.org wrote:
> > >=20
> > > Sorry for the delay in looking at this patch. I'm a bit worried about
> > > there being a leaked processes and wanted to understand if there was
> > > other cleanup we should be doing.
> > >=20
> > > Instead of this path, would it make sense to move the results.stop()
> > > inside the finally? I'm worried that other forms of exception would
> > > also leak processes.
> >=20
> > I've looked more at this and I don't understand how this patch works.
> >=20
> > By adding the exception to the exception clause, it will trigger a
> > bb.error() call. The results.stop() call won't happen as results isn't
> > set in this failure.
> >=20
> > The only significant difference would therefore be the results =3D
> > tc.results assignment. Does that really stop processes? If so, should
> > we always be doing that?
> >=20
> > I'd like to understand what we need to do to "fix" things so we can
> > handle other exceptions.
>=20
> If I remember correctly, I saw this when building meta-arm qemuarm64-secu=
reboot
> kas config which runs oeqa runtime tests with testimage.bbclass during bu=
ild.
>=20
> Without fix 4b3b37156cdf70230bc74c647784da8514c284cf in poky a single fai=
ling test
> leaked Cooker processes. Then a rebuild of core-image-base connected to t=
hat Cooker
> process and somehow failed to re-generate rootfs which became an empty di=
rectory
> inside .wic image. This resulted qemu boot hanging which again throws Run=
timeError
> from meta/lib/oeqa/core/target/qemu.py line 52.

Just to be clear, is memory resident bitbake set or not
(BB_SERVER_TIMEOUT) ?


> Example with poky from October 2024 (from old log files which I still had=
):
>=20
> NOTE: Reconnecting to bitbake server...
> ...
> NOTE: recipe core-image-base-1.0-r0: task do_create_image_spdx: Succeeded
> QMP Available for connection at /home/builder/src/base/meta-arm/build/tmp=
/.ndozl5yn
> QMP connected to QEMU at 10/31/24 13:55:56 and took 0.56 seconds
> QMP released QEMU at 10/31/24 13:55:56 and took 0.19 seconds from connect
> Bitbake still alive (no events for 600s). Active tasks:
> /home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/images/co=
re-image-base.bb:do_testimage
> WARNING: core-image-base-1.0-r0 do_testimage: Target didn't reach login b=
anner in 1000 seconds (10/31/24 14:12:36)
> WARNING: core-image-base-1.0-r0 do_testimage: Last 25 lines of login cons=
ole (22962):
> [=C2=A0=C2=A0=C2=A0 4.345255] Key type fscrypt-provisioning registered
> [=C2=A0=C2=A0=C2=A0 4.363120] Btrfs loaded, zoned=3Dno, fsverity=3Dno
> [=C2=A0=C2=A0=C2=A0 4.522255] input: QEMU QEMU USB Tablet as /devices/pla=
tform/4010000000.pcie/pci0000:00/0000:00:03.0/usb1/1-1/1-1:1.0/0003:0627:00=
01.0001/input
> /input0
> [=C2=A0=C2=A0=C2=A0 4.528765] hid-generic 0003:0627:0001.0001: input: USB=
 HID v0.01 Mouse [QEMU QEMU USB Tablet] on usb-0000:00:03.0-1/input0
> [=C2=A0=C2=A0=C2=A0 4.636796] Key type encrypted registered
> [=C2=A0=C2=A0=C2=A0 4.644819] printk: legacy console [netcon0] enabled
> [=C2=A0=C2=A0=C2=A0 4.645638] netconsole: network logging started
> [=C2=A0=C2=A0=C2=A0 4.651065] clk: Disabling unused clocks
> [=C2=A0=C2=A0=C2=A0 4.651780] PM: genpd: Disabling unused power domains
> [=C2=A0=C2=A0=C2=A0 4.669045] usb 1-2: new high-speed USB device number 3=
 using xhci_hcd
> [=C2=A0=C2=A0=C2=A0 4.794967] Freeing unused kernel memory: 1856K
> [=C2=A0=C2=A0=C2=A0 4.803684] Run /init as init process
> [=C2=A0=C2=A0=C2=A0 4.847358] input: QEMU QEMU USB Keyboard as /devices/p=
latform/4010000000.pcie/pci0000:00/0000:00:03.0/usb1/1-2/1-2:1.0/0003:0627:=
0001.0002/inp
> ut/input1
> [=C2=A0=C2=A0=C2=A0 4.919633] hid-generic 0003:0627:0001.0002: input: USB=
 HID v1.11 Keyboard [QEMU QEMU USB Keyboard] on usb-0000:00:03.0-2/input0
> Starting systemd-udevd version 256.6
>=20
> [=C2=A0=C2=A0=C2=A0 7.407191] virtio_net virtio0 enp0s1: renamed from eth=
0
> [=C2=A0=C2=A0 12.633172] ext3: Unknown parameter 'umask'
> [=C2=A0=C2=A0 12.634318] ext2: Unknown parameter 'umask'
> [=C2=A0=C2=A0 12.634924] ext4: Unknown parameter 'umask'
> [=C2=A0=C2=A0 12.676391] EXT4-fs (vda2): mounted filesystem 41dc66e6-d693=
-46b3-a5d6-a46998500609 r/w with ordered data mode. Quota mode: disabled.
> [=C2=A0=C2=A0 13.080423] /dev/disk/by-label/root: Can't open blockdev
> [=C2=A0=C2=A0 13.081201] /dev/disk/by-label/root: Can't open blockdev
> ERROR: There's no '/dev' on rootfs.
>=20
> WARNING: core-image-base-1.0-r0 do_testimage: Check full boot log: /home/=
builder/src/base/meta-arm/build/tmp/work/qemuarm64_secureboot-poky-l
> inux/core-image-base/1.0/testimage/qemu_boot_log.20241031135427
> Output from runqemu:
> runqemu - INFO - Received signal: 15
> runqemu - INFO - Cleaning up
> runqemu - INFO - Host uptime: 14098967.33
>=20
> tput: No value for $TERM and no -T specified
> WARNING: core-image-base-1.0-r0 do_testimage: Extra log data read:=20
>=20
> Output from runqemu:
> runqemu - INFO - Received signal: 15
> runqemu - INFO - Cleaning up
> runqemu - INFO - Host uptime: 14098967.33
>=20
> tput: No value for $TERM and no -T specified
>=20
> Output from runqemu:
> runqemu - INFO - Received signal: 15
> runqemu - INFO - Cleaning up
> runqemu - INFO - Host uptime: 14098967.33
>=20
> tput: No value for $TERM and no -T specified
>=20
> ERROR: core-image-base-1.0-r0 do_testimage: Error executing a python func=
tion in exec_func_python() autogenerated:
>=20
> The stack trace of python calls that resulted in this exception/failure w=
as:
> File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
> =C2=A0=C2=A0=C2=A0=C2=A0 0001:
> =C2=A0*** 0002:do_testimage(d)
> =C2=A0=C2=A0=C2=A0=C2=A0 0003:
> File: '/home/builder/src/base/meta-arm/build/../poky/meta/classes-recipe/=
testimage.bbclass', lineno: 122, function: do_testimage
> =C2=A0=C2=A0=C2=A0=C2=A0 0118:=C2=A0=C2=A0=C2=A0 dump-guest-memory {"pagi=
ng":false,"protocol":"file:%s.img"}
> =C2=A0=C2=A0=C2=A0=C2=A0 0119:}
> =C2=A0=C2=A0=C2=A0=C2=A0 0120:
> =C2=A0=C2=A0=C2=A0=C2=A0 0121:python do_testimage() {
> =C2=A0*** 0122:=C2=A0=C2=A0=C2=A0 testimage_main(d)
> =C2=A0=C2=A0=C2=A0=C2=A0 0123:}
> =C2=A0=C2=A0=C2=A0=C2=A0 0124:
> =C2=A0=C2=A0=C2=A0=C2=A0 0125:addtask testimage
> =C2=A0=C2=A0=C2=A0=C2=A0 0126:do_testimage[nostamp] =3D "1"
> File: '/home/builder/src/base/meta-arm/build/../poky/meta/classes-recipe/=
testimage.bbclass', lineno: 364, function: testimage_main
> =C2=A0=C2=A0=C2=A0=C2=A0 0360:=C2=A0=C2=A0=C2=A0 orig_sigterm_handler =3D=
 signal.signal(signal.SIGTERM, sigterm_exception)
> =C2=A0=C2=A0=C2=A0=C2=A0 0361:=C2=A0=C2=A0=C2=A0 try:
> =C2=A0=C2=A0=C2=A0=C2=A0 0362:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
# We need to check if runqemu ends unexpectedly
> =C2=A0=C2=A0=C2=A0=C2=A0 0363:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
# or if the worker send us a SIGTERM
> =C2=A0*** 0364:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tc.target.start=
(params=3Dd.getVar("TEST_QEMUPARAMS"), runqemuparams=3Dd.getVar("TEST_RUNQE=
MUPARAMS"))
> =C2=A0=C2=A0=C2=A0=C2=A0 0365:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
import threading
> =C2=A0=C2=A0=C2=A0=C2=A0 0366:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
try:
> =C2=A0=C2=A0=C2=A0=C2=A0 0367:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 threading.Timer(int(d.getVar("TEST_OVERALL_TIMEOUT=
")), handle_test_timeout, (int(d.getVar("TEST_OVERALL_TIMEOUT")),)).start(
> )
> =C2=A0=C2=A0=C2=A0=C2=A0 0368:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
except ValueError:
> File: '/home/builder/src/base/meta-arm/build/../poky/meta/lib/oeqa/core/t=
arget/qemu.py', lineno: 91, function: start
> =C2=A0=C2=A0=C2=A0=C2=A0 0087:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 except (subprocess.CalledProcessError, subprocess.=
TimeoutExpired, FileNotFoundError) as err:
> =C2=A0=C2=A0=C2=A0=C2=A0 0088:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg +=3D "Error running co=
mmand: %s\n%s\n" % (blcmd, err)
> =C2=A0=C2=A0=C2=A0=C2=A0 0089:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 msg +=3D "\n\n=3D=3D=3D=3D=3D end: snippet =3D=3D=
=3D=3D=3D\n"
> =C2=A0=C2=A0=C2=A0=C2=A0 0090:
> =C2=A0*** 0091:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 raise RuntimeError("FAILED to start qemu - check the task log and=
 the boot log %s" % (msg))
> =C2=A0=C2=A0=C2=A0=C2=A0 0092:
> =C2=A0=C2=A0=C2=A0=C2=A0 0093:=C2=A0=C2=A0=C2=A0 def stop(self):
> =C2=A0=C2=A0=C2=A0=C2=A0 0094:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
self.runner.stop()
> Exception: RuntimeError: FAILED to start qemu - check the task log and th=
e boot log=20
>=20
> =3D=3D=3D=3D=3D start: snippet =3D=3D=3D=3D=3D
>=20
>=20
>=20
> =3D=3D=3D=3D=3D end: snippet =3D=3D=3D=3D=3D
>=20
> =3D=3D=3D=3D=3D start: snippet =3D=3D=3D=3D=3D
>=20
> Error running command: ['tail', '-20', '/home/builder/src/base/meta-arm/b=
uild/tmp/work/qemuarm64_secureboot-poky-linux/core-image-base/1.0/te
> stimage/qemu_boot_log.20241031135427']
> Command '['tail', '-20', '/home/builder/src/base/meta-arm/build/tmp/work/=
qemuarm64_secureboot-poky-linux/core-image-base/1.0/testimage/qemu_b
> oot_log.20241031135427']' returned non-zero exit status 1.
>=20
> =3D=3D=3D=3D=3D end: snippet =3D=3D=3D=3D=3D
>=20
>=20
> ERROR: Logfile of failure stored in: /home/builder/src/base/meta-arm/buil=
d/tmp/work/qemuarm64_secureboot-poky-linux/core-image-base/1.0/temp/
> log.do_testimage.1578012
> NOTE: recipe core-image-base-1.0-r0: task do_testimage: Failed
> ERROR: Task (/home/builder/src/base/meta-arm/build/../poky/meta/recipes-c=
ore/images/core-image-base.bb:do_testimage) failed with exit code '1
> '
> NOTE: Tasks Summary: Attempted 7116 tasks of which 7081 didn't need to be=
 rerun and 1 failed.
>=20
> Summary: 1 task failed:
> =C2=A0 /home/builder/src/base/meta-arm/build/../poky/meta/recipes-core/im=
ages/core-image-base.bb:do_testimage
>=20
>=20
> Since this exit happens without catching RuntimeError, there is no cleanu=
p
> and Cooker, qemu-system-aarch64 etc processes get leaked again.

Can you point at the "no cleanup"? The code in question has a
try/except/finally clause and the finally should always run. I'm
therefore struggling to work out which cleanup code isn't running.

> If the RuntimeError is captured, then clean up is done and qemu-system-aa=
rch64
> and Cooker processes get killed. Together with
> 4b3b37156cdf70230bc74c647784da8514c284cf in poky
> the failing oeqa runtime test under qemu was handled correctly
> and rebuilds always ended up with same failure, specifically
> from parselogs which is a bit greedy when detecting errors.
>=20
> Does this help? If not, I can try to replicate the setup and failures
> again, and try different fixes.

I can't really sed which cleanup code we're missing and I'd like to
understand this before we take the patch as something isn't adding up.

Cheers,

Richard

