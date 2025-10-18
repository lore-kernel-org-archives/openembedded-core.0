Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB79BCCD193
	for <webhook@archiver.kernel.org>; Sat, 18 Oct 2025 13:50:07 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.6254.1760795402022876059
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Oct 2025 06:50:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=xI3nv0U7;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AE85EC09A1A
	for <openembedded-core@lists.openembedded.org>; Sat, 18 Oct 2025 13:49:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EDC656069D;
	Sat, 18 Oct 2025 13:49:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D4F5D102F2368;
	Sat, 18 Oct 2025 15:49:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760795395; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3Bw5ZcxhQHbspBYMsIQYxVXSvpHOtUoA8cPyB4C9fWE=;
	b=xI3nv0U7rOkkoLJJvLtpP5igRMkUPJzibeTLcFm9xbEzI3yJMbK0x2u5VQprW8ywjzw9dh
	bEHRA/zCYQ+UxLoKrW6dde0p8+HSE91pKoFSsre1zN0o49C+BqaNAW6T0FD9j5Rcmc4DO+
	EhGd5llh4OHGPhWxajTzVPMqzeoq462vB4K9xoVqPQQs5BQP9ihExxCpYATOsynHAr2qsX
	hTzEXN/PkVtPmRNqli8e1ShDaZW5Lm/skorM3eCwCrAX4LNYdL+NVZV/NTWM6kbWlbnc8/
	QhejDAFeH4mVYUBSwW1JS6h/LUJ0giE0VGt8isJVK1m998nCGNG18IU4cMQfkg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Oct 2025 15:49:45 +0200
Message-Id: <DDLHVDCXIV53.3EI69FW87CCB8@bootlin.com>
Subject: Re: [OE-core][PATCH V3 2/2] systemd: upgrade from 257.8 to 258
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251016084700.1537381-1-Qi.Chen@windriver.com>
 <20251016084700.1537381-2-Qi.Chen@windriver.com>
 <DDKQEKP5R8RA.185ZCAGQ6EA07@bootlin.com>
In-Reply-To: <DDKQEKP5R8RA.185ZCAGQ6EA07@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Oct 2025 13:50:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225075

On Fri Oct 17, 2025 at 6:18 PM CEST, Mathieu Dubois-Briand wrote:
> On Thu Oct 16, 2025 at 10:47 AM CEST, Chen Qi via lists.openembedded.org =
wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> 258 Release Changes:
>> https://github.com/systemd/systemd/releases/tag/v258
>>
>> The 'runlevel', 'initctl', 'telinit' related contents are removed
>> because they are offically removed in v258.
>>
>> Disable tests explicitly. This is because we're not installing any
>> tests. There's no point building them out. And this puts extra burden
>> on making things compile for musl.
>>
>> gcrypt and gnutls PACKAGECONFIGs are removed as "OpenSSL is now the only
>> supported cryptography backend for systemd-resolved and systemd-importd.=
"
>>
>> musl changes:
>> 1. This version has big changes in musl patches. The goal is to
>>    help maintenance. I want patches to be more easily applied
>>    to new versions. The count of files modified by musl specific
>>    patches decreased from 113 (v257) to 34 (v258).
>> 2. All patches are re-evaluated.
>>    This version of systemd introduces big changes in header
>>    files and other places. So the previous musl patches are
>>    re-evaluated one by one. Those that are dropped are considered not
>>    needed. A few new ones are added. There are some notable ones.
>>    0012-do-not-disable-buffer-in-writing-files.patch is dropped because
>>    there is not runtime error.
>>    0016-Fix-the-segfault-for-glob-related-codes-and-define-d.patch is
>>    added because this version of systemd uses strv_free to free gl_pathv
>>    instead of relying on globfree provided by libc.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>
> Hi Chen,
>
> Thanks for the new version. Still, we get some errors with post install
> scripts:
>
> ERROR: core-image-sato-1.0-r0 do_rootfs: Postinstall scriptlets of ['blue=
z5', 'ofono', 'connman', 'xserver-nodm-init', 'avahi-daemon', 'rpcbind', 'r=
un-postinsts'] have failed. If the intention is to defer them to first boot=
,
> then please place them into pkg_postinst_ontarget:${PN} ().
> Deferring to first boot via 'exit 1' is no longer supported.
> Details of the failure are in /srv/pokybuild/yocto-worker/qa-extras2/buil=
d/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/temp/log.do_root=
fs.
> ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/qa-extra=
s2/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/temp/log.=
do_rootfs.2882514
> NOTE: recipe core-image-sato-1.0-r0: task do_rootfs: Failed
> ERROR: Task (/srv/pokybuild/yocto-worker/qa-extras2/build/layers/openembe=
dded-core/meta/recipes-sato/images/core-image-sato.bb:do_rootfs) failed wit=
h exit code '1'
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/2590
>
> Can you have a look at these, please?
>
> Thanks,
> Mathieu

Sorry, another issue that I've just identified, during image tests:

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemuarm-alt/build/layers/openembedded-c=
ore/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemuarm-alt/build/layers/openembedded-c=
ore/meta/lib/oeqa/runtime/cases/parselogs.py", line 185, in test_parselogs
    self.assertEqual(errcount, 0, msg=3Dself.msg)
AssertionError: 1 !=3D 0 : Log: /srv/pokybuild/yocto-worker/qemuarm-alt/bui=
ld/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato/1.0/target_log=
s/Xorg.0.log
-----------------------
Central error: [    27.402] failed to find screen to remove
***********************
[    26.897] (**) Option "Device" "/dev/input/event1"
[    26.955] (II) event1  - QEMU QEMU USB Keyboard: is tagged by udev as: K=
eyboard
[    26.956] (II) event1  - QEMU QEMU USB Keyboard: device is a keyboard
[    26.959] (II) event1  - QEMU QEMU USB Keyboard: device removed
[    26.991] (**) Option "config_info" "udev:/sys/devices/platform/3f000000=
.pcie/pci0000:00/0000:00:02.0/usb1/1-2/1-2:1.0/0003:0627:0001.0002/input/in=
put1/event1"
[    26.991] (II) XINPUT: Adding extended input device "QEMU QEMU USB Keybo=
ard" (type: KEYBOARD, id 7)
[    27.049] (II) event1  - QEMU QEMU USB Keyboard: is tagged by udev as: K=
eyboard
[    27.051] (II) event1  - QEMU QEMU USB Keyboard: device is a keyboard
[    27.401] (II) config/udev: removing GPU device /sys/devices/platform/3f=
000000.pcie/pci0000:00/0000:00:03.0/drm/card0 /dev/dri/card0
[    27.402] xf86: remove device 0 /sys/devices/platform/3f000000.pcie/pci0=
000:00/0000:00:03.0/drm/card0
[    27.402] failed to find screen to remove
[    27.428] (II) config/udev: removing device QEMU QEMU USB Keyboard
[    27.431] (II) event1  - QEMU QEMU USB Keyboard: device removed
[    27.472] (II) UnloadModule: "libinput"
[    27.508] (II) config/udev: Adding input device QEMU QEMU USB Keyboard (=
/dev/input/event1)
[    27.509] (**) QEMU QEMU USB Keyboard: Applying InputClass "libinput key=
board catchall"
[    27.509] (II) Using input driver 'libinput' for 'QEMU QEMU USB Keyboard=
'
[    27.509] (**) QEMU QEMU USB Keyboard: always reports core events
[    27.509] (**) Option "Device" "/dev/input/event1"
[    27.567] (II) event1  - QEMU QEMU USB Keyboard: is tagged by udev as: K=
eyboard
[    27.568] (II) event1  - QEMU QEMU USB Keyboard: device is a keyboard

***********************
1 errors found in logs.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/2588

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


