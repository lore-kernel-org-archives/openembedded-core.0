Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1581BCCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 13:49:43 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web11.21598.1761227380157706373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 06:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=M3hPg6fk;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 78088C0C41F;
	Thu, 23 Oct 2025 13:49:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 538A86068C;
	Thu, 23 Oct 2025 13:49:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3D77D102F2464;
	Thu, 23 Oct 2025 15:49:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761227377; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pFFtlNgVPXo0fRi1vnDYOn4ypEnZU/9P7DLvsylJr9s=;
	b=M3hPg6fk8s0XiQFy3lZr1EhziHtXoOa67KDQZFDnpes1ulDKII6tWYBHdUXvKSB3TRxBBx
	vqKzHcAZ0tfJC8aMFKoAyKLEvvvXFGm0Lm0xoSEgjQ/vWPfCwc17JhEeNbm+72+TVTk2oX
	l1K6U7dRzZBHhkdAZuTETXPAtdper57zc5hxpzxZ/RnsLbaIZuZ4oqARx5o1/caTGI0NEs
	xmVRs29yc690OF9ias2Ei6KNtX0n/PdYcXsNGwK7LX8pVzjNm2chz0l9pH96t1TdFiAQA0
	cn85jkPN3SPgsustmfhm3sjhyXLxl0oWOxHHV23q/4M6fTevk6dvrL23tEy5dg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Oct 2025 15:49:31 +0200
Message-Id: <DDPQZWRSRHB7.112430EANEZH8@bootlin.com>
To: <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH V3 2/2] systemd: upgrade from 257.8 to 258
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251016084700.1537381-1-Qi.Chen@windriver.com>
 <20251016084700.1537381-2-Qi.Chen@windriver.com>
 <DDKQEKP5R8RA.185ZCAGQ6EA07@bootlin.com>
 <DDLHVDCXIV53.3EI69FW87CCB8@bootlin.com>
 <20c03386-14b5-46d6-b72b-24a1957ee15b@windriver.com>
In-Reply-To: <20c03386-14b5-46d6-b72b-24a1957ee15b@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 13:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225261

On Wed Oct 22, 2025 at 5:28 AM CEST, Chen Qi via lists.openembedded.org wro=
te:
> On 10/18/25 21:49, Mathieu Dubois-Briand via lists.openembedded.org wrote=
:
>> On Fri Oct 17, 2025 at 6:18 PM CEST, Mathieu Dubois-Briand wrote:
>>> On Thu Oct 16, 2025 at 10:47 AM CEST, Chen Qi via lists.openembedded.or=
g wrote:
>>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>>
>>>> 258 Release Changes:
>>>> https://github.com/systemd/systemd/releases/tag/v258
>>>>
>>>> The 'runlevel', 'initctl', 'telinit' related contents are removed
>>>> because they are offically removed in v258.
>>>>
>>>> Disable tests explicitly. This is because we're not installing any
>>>> tests. There's no point building them out. And this puts extra burden
>>>> on making things compile for musl.
>>>>
>>>> gcrypt and gnutls PACKAGECONFIGs are removed as "OpenSSL is now the on=
ly
>>>> supported cryptography backend for systemd-resolved and systemd-import=
d."
>>>>
>>>> musl changes:
>>>> 1. This version has big changes in musl patches. The goal is to
>>>>     help maintenance. I want patches to be more easily applied
>>>>     to new versions. The count of files modified by musl specific
>>>>     patches decreased from 113 (v257) to 34 (v258).
>>>> 2. All patches are re-evaluated.
>>>>     This version of systemd introduces big changes in header
>>>>     files and other places. So the previous musl patches are
>>>>     re-evaluated one by one. Those that are dropped are considered not
>>>>     needed. A few new ones are added. There are some notable ones.
>>>>     0012-do-not-disable-buffer-in-writing-files.patch is dropped becau=
se
>>>>     there is not runtime error.
>>>>     0016-Fix-the-segfault-for-glob-related-codes-and-define-d.patch is
>>>>     added because this version of systemd uses strv_free to free gl_pa=
thv
>>>>     instead of relying on globfree provided by libc.
>>>>
>>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>>> ---
>>> Hi Chen,
>>>
>>> Thanks for the new version. Still, we get some errors with post install
>>> scripts:
>>>
>>> ERROR: core-image-sato-1.0-r0 do_rootfs: Postinstall scriptlets of ['bl=
uez5', 'ofono', 'connman', 'xserver-nodm-init', 'avahi-daemon', 'rpcbind', =
'run-postinsts'] have failed. If the intention is to defer them to first bo=
ot,
>>> then please place them into pkg_postinst_ontarget:${PN} ().
>>> Deferring to first boot via 'exit 1' is no longer supported.
>>> Details of the failure are in /srv/pokybuild/yocto-worker/qa-extras2/bu=
ild/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/temp/log.do_ro=
otfs.
>>> ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/qa-ext=
ras2/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0/temp/lo=
g.do_rootfs.2882514
>>> NOTE: recipe core-image-sato-1.0-r0: task do_rootfs: Failed
>>> ERROR: Task (/srv/pokybuild/yocto-worker/qa-extras2/build/layers/openem=
bedded-core/meta/recipes-sato/images/core-image-sato.bb:do_rootfs) failed w=
ith exit code '1'
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/26/builds/2590
>>>
>>> Can you have a look at these, please?
>>>
>>> Thanks,
>>> Mathieu
>> Sorry, another issue that I've just identified, during image tests:
>>
>> Traceback (most recent call last):
>>    File "/srv/pokybuild/yocto-worker/qemuarm-alt/build/layers/openembedd=
ed-core/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
>>      return func(*args, **kwargs)
>>             ^^^^^^^^^^^^^^^^^^^^^
>>    File "/srv/pokybuild/yocto-worker/qemuarm-alt/build/layers/openembedd=
ed-core/meta/lib/oeqa/runtime/cases/parselogs.py", line 185, in test_parsel=
ogs
>>      self.assertEqual(errcount, 0, msg=3Dself.msg)
>> AssertionError: 1 !=3D 0 : Log: /srv/pokybuild/yocto-worker/qemuarm-alt/=
build/build/tmp/work/qemuarm-poky-linux-gnueabi/core-image-sato/1.0/target_=
logs/Xorg.0.log
>> -----------------------
>> Central error: [    27.402] failed to find screen to remove
>> ***********************
>> [    26.897] (**) Option "Device" "/dev/input/event1"
>> [    26.955] (II) event1  - QEMU QEMU USB Keyboard: is tagged by udev as=
: Keyboard
>> [    26.956] (II) event1  - QEMU QEMU USB Keyboard: device is a keyboard
>> [    26.959] (II) event1  - QEMU QEMU USB Keyboard: device removed
>> [    26.991] (**) Option "config_info" "udev:/sys/devices/platform/3f000=
000.pcie/pci0000:00/0000:00:02.0/usb1/1-2/1-2:1.0/0003:0627:0001.0002/input=
/input1/event1"
>> [    26.991] (II) XINPUT: Adding extended input device "QEMU QEMU USB Ke=
yboard" (type: KEYBOARD, id 7)
>> [    27.049] (II) event1  - QEMU QEMU USB Keyboard: is tagged by udev as=
: Keyboard
>> [    27.051] (II) event1  - QEMU QEMU USB Keyboard: device is a keyboard
>> [    27.401] (II) config/udev: removing GPU device /sys/devices/platform=
/3f000000.pcie/pci0000:00/0000:00:03.0/drm/card0 /dev/dri/card0
>> [    27.402] xf86: remove device 0 /sys/devices/platform/3f000000.pcie/p=
ci0000:00/0000:00:03.0/drm/card0
>> [    27.402] failed to find screen to remove
>> [    27.428] (II) config/udev: removing device QEMU QEMU USB Keyboard
>> [    27.431] (II) event1  - QEMU QEMU USB Keyboard: device removed
>> [    27.472] (II) UnloadModule: "libinput"
>> [    27.508] (II) config/udev: Adding input device QEMU QEMU USB Keyboar=
d (/dev/input/event1)
>> [    27.509] (**) QEMU QEMU USB Keyboard: Applying InputClass "libinput =
keyboard catchall"
>> [    27.509] (II) Using input driver 'libinput' for 'QEMU QEMU USB Keybo=
ard'
>> [    27.509] (**) QEMU QEMU USB Keyboard: always reports core events
>> [    27.509] (**) Option "Device" "/dev/input/event1"
>> [    27.567] (II) event1  - QEMU QEMU USB Keyboard: is tagged by udev as=
: Keyboard
>> [    27.568] (II) event1  - QEMU QEMU USB Keyboard: device is a keyboard
>>
>> ***********************
>> 1 errors found in logs.
>>
>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/74/builds/2588
>>
>> Thanks,
>> Mathieu
>
> Hi Mathieu,
>
> I reproduced the postinstall error you mentioned in another email.
>
> But I cannot reproduce this one. I used 'poky-altfcfg + qemuarm' as in=20
> the above link. Is there any other config I need to use? I referred to=20
> the 'Write config' step.
>
> Regards,
> Qi
>
>>
>>=20
>>

Hi Qi,

I've been able to reproduce the test failure with this branch:
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dmathieu/sys=
temd-upgrade-tests

Following config in my local.conf:

---
SDKMACHINE =3D "x86_64"
OE_FRAGMENTS +=3D "machine/qemuarm distro/poky-altcfg"
EXTRA_IMAGE_FEATURES ?=3D 'allow-empty-password empty-root-password allow-r=
oot-login'
IMAGE_CLASSES +=3D "testimage"
---

And then just:
bitbake core-image-sato && bitbake core-image-sato:do_testimage

Hope this can help you!

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


