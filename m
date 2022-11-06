Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 539FFC4332F
	for <webhook@archiver.kernel.org>; Sun,  6 Nov 2022 15:36:32 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web08.17312.1667748986316442589
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Nov 2022 07:36:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kg2lEw3C;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6C6F4E0002;
	Sun,  6 Nov 2022 15:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667748983;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tgQxsUPQLwwzeLT0gFQl/UknmZpYE1Vue8P9z1zhaFE=;
	b=kg2lEw3C7wKX8j1ByMT6YOkUzl/uEeCKIqWf3ENt9+g3I7Bb+y0sCVh3EDEjJqcy7rf+VK
	cB6a0QmuRZNjpyxS1mAPYA1RB/ypYN8zd6WvJVDBEyZ1DmK8HUVNV2j7FFGXMvm5lcfWZm
	j+OB6ke1fC3lrGYRwrNLBoILMlV4zI1Kk4rqpSU9ML1iBuroll9tVPt6bQ+y/3HzsxB/EG
	gXphxbnqVnvbPo4tMDOa3TRXq/gX2AJtURL+zkKH8yTrfpKcHzWd5Pl1oyAuIyuf7vzyaU
	AU2KFFAKjy2NuuKMbZyq9sAYVgmP0LFEOLr8a51Y+lhUQ6u4T3+PGy2mccHloQ==
Date: Sun, 6 Nov 2022 16:36:23 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Luca Bocassi <luca.boccassi@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] systemd: bump to v252
Message-ID: <Y2fUd0wqwdSpy48Z@mail.local>
References: <20221103104255.1120494-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103104255.1120494-1-luca.boccassi@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Nov 2022 15:36:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172803

Hello,

This makes oe-selftest fail:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/4353/steps/14/logs/stdio

[    1.465610] Run /init as init process
[    1.532366] input: QEMU QEMU USB Tablet as /devices/pci0000:00/0000:00:1d.7/usb1/1-1/1-1:1.0/0003:0627:0001.0001/input/input1
[    1.534612] hid-generic 0003:0627:0001.0001: input: USB HID v0.01 Mouse [QEMU QEMU USB Tablet] on usb-0000:00:1d.7-1/input0
/init: eval: line 103: syntax error: EOF in backquote substitution
[    1.547297] Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000200
[    1.548501] CPU: 3 PID: 1 Comm: init Not tainted 5.19.14-yocto-standard #1
[    1.549486] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 0.0.0 02/06/2015
[    1.550642] Call Trace:
[    1.551021]  <TASK>
[    1.551352]  dump_stack_lvl+0x3a/0x50
[    1.551904]  dump_stack+0x10/0x16
[    1.552402]  panic+0x113/0x283
[    1.552869]  do_exit.cold+0x15/0x15
[    1.553472]  do_group_exit+0x35/0xa0
[    1.554023]  __x64_sys_exit_group+0x18/0x20
[    1.554639]  do_syscall_64+0x42/0x90
[    1.555256]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[    1.555978] RIP: 0033:0x7f9167c032a1
[    1.556524] Code: 85 ab 0f 00 be e7 00 00 00 ba 3c 00 00 00 eb 16 66 0f 1f 84 00 00 00 00 00 89 d0 0f 05 48 3d 00 f0 ff ff 77 1c f4 89 f0 0f 05 <48> 3d 00 f0 ff ff 76 e7 f7 d8 64 41 89 00 eb df 0f 1f 80 00 00 00
[    1.559187] RSP: 002b:00007ffe711bd6f8 EFLAGS: 00000202 ORIG_RAX: 00000000000000e7
[    1.560270] RAX: ffffffffffffffda RBX: 0000555b23dce2a0 RCX: 00007f9167c032a1
[    1.561277] RDX: 000000000000003c RSI: 00000000000000e7 RDI: 0000000000000002
[    1.562323] RBP: 0000000000000004 R08: ffffffffffffff80 R09: 00007ffe711befd1
[    1.563355] R10: f3889f2b46bb7395 R11: 0000000000000202 R12: 0000000000000001
[    1.564365] R13: 00007ffe711bdae8 R14: 0000000000000000 R15: 00007f9167e20000
[    1.565376]  </TASK>
[    1.566302] Kernel Offset: 0x25200000 from 0xffffffff81000000 (relocation range: 0xffffffff80000000-0xffffffffbfffffff)
[    1.567852] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000200 ]---

On 03/11/2022 10:42:55+0000, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
> NOTE: I do not use musl, so I have not touched those patches
> 
>  .../{systemd-boot_251.4.bb => systemd-boot_252.bb}       | 0
>  meta/recipes-core/systemd/systemd.inc                    | 4 ++--
>  ...t-Don-t-install-dependency-links-at-install-tim.patch | 4 ++--
>  .../systemd/{systemd_251.4.bb => systemd_252.bb}         | 9 +++++++++
>  4 files changed, 13 insertions(+), 4 deletions(-)
>  rename meta/recipes-core/systemd/{systemd-boot_251.4.bb => systemd-boot_252.bb} (100%)
>  rename meta/recipes-core/systemd/{systemd_251.4.bb => systemd_252.bb} (98%)
> 
> diff --git a/meta/recipes-core/systemd/systemd-boot_251.4.bb b/meta/recipes-core/systemd/systemd-boot_252.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-boot_251.4.bb
> rename to meta/recipes-core/systemd/systemd-boot_252.bb
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
> index 71eb93f23a2..fbaef910af7 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -14,8 +14,8 @@ LICENSE = "GPL-2.0-only & LGPL-2.1-only"
>  LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
>                      file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
>  
> -SRCREV = "2a674b4b66af1a050a0362b646d2fca90c90112e"
> -SRCBRANCH = "v251-stable"
> +SRCREV = "e8dc52766e1fdb4f8c09c3ab654d1270e1090c8d"
> +SRCBRANCH = "v252-stable"
>  SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=https;branch=${SRCBRANCH} \
>  "
>  
> diff --git a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> index a19a0255591..2a033b134e1 100644
> --- a/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> +++ b/meta/recipes-core/systemd/systemd/0001-binfmt-Don-t-install-dependency-links-at-install-tim.patch
> @@ -29,7 +29,7 @@ diff --git a/units/meson.build b/units/meson.build
>  index a9bf28f6d9..11d3644168 100644
>  --- a/units/meson.build
>  +++ b/units/meson.build
> -@@ -63,8 +63,7 @@ units = [
> +@@ -62,8 +62,7 @@ units = [
>           ['poweroff.target',                     '',
>            (with_runlevels ? 'runlevel0.target' : '')],
>           ['printer.target',                      ''],
> @@ -64,7 +64,7 @@ diff --git a/units/systemd-binfmt.service.in b/units/systemd-binfmt.service.in
>  index 96f595ad72..7c010bb224 100644
>  --- a/units/systemd-binfmt.service.in
>  +++ b/units/systemd-binfmt.service.in
> -@@ -14,6 +14,7 @@ Documentation=https://www.kernel.org/doc/html/latest/admin-guide/binfmt-misc.htm
> +@@ -14,6 +14,7 @@ Documentation=https://docs.kernel.org/admin-guide/binfmt-misc.html
>   Documentation=https://www.freedesktop.org/wiki/Software/systemd/APIFileSystems
>   DefaultDependencies=no
>   Conflicts=shutdown.target
> diff --git a/meta/recipes-core/systemd/systemd_251.4.bb b/meta/recipes-core/systemd/systemd_252.bb
> similarity index 98%
> rename from meta/recipes-core/systemd/systemd_251.4.bb
> rename to meta/recipes-core/systemd/systemd_252.bb
> index 87668cadc75..7c929c22e0f 100644
> --- a/meta/recipes-core/systemd/systemd_251.4.bb
> +++ b/meta/recipes-core/systemd/systemd_252.bb
> @@ -526,12 +526,15 @@ FILES:${PN}-extra-utils = "\
>                          ${bindir}/systemd-stdio-bridge \
>                          ${base_bindir}/systemd-ask-password \
>                          ${base_bindir}/systemd-tty-ask-password-agent \
> +                        ${systemd_system_unitdir}/initrd.target.wants/systemd-pcrphase-initrd.path \
>                          ${systemd_system_unitdir}/systemd-ask-password-console.path \
>                          ${systemd_system_unitdir}/systemd-ask-password-console.service \
>                          ${systemd_system_unitdir}/systemd-ask-password-wall.path \
>                          ${systemd_system_unitdir}/systemd-ask-password-wall.service \
>                          ${systemd_system_unitdir}/sysinit.target.wants/systemd-ask-password-console.path \
>                          ${systemd_system_unitdir}/sysinit.target.wants/systemd-ask-password-wall.path \
> +                        ${systemd_system_unitdir}/sysinit.target.wants/systemd-pcrphase.path \
> +                        ${systemd_system_unitdir}/sysinit.target.wants/systemd-pcrphase-sysinit.path \
>                          ${systemd_system_unitdir}/multi-user.target.wants/systemd-ask-password-wall.path \
>                          ${rootlibexecdir}/systemd/systemd-resolve-host \
>                          ${rootlibexecdir}/systemd/systemd-ac-power \
> @@ -539,12 +542,17 @@ FILES:${PN}-extra-utils = "\
>                          ${rootlibexecdir}/systemd/systemd-bus-proxyd \
>                          ${systemd_system_unitdir}/systemd-bus-proxyd.service \
>                          ${systemd_system_unitdir}/systemd-bus-proxyd.socket \
> +                        ${rootlibexecdir}/systemd/systemd-measure \
> +                        ${rootlibexecdir}/systemd/systemd-pcrphase \
>                          ${rootlibexecdir}/systemd/systemd-socket-proxyd \
>                          ${rootlibexecdir}/systemd/systemd-reply-password \
>                          ${rootlibexecdir}/systemd/systemd-sleep \
>                          ${rootlibexecdir}/systemd/system-sleep \
>                          ${systemd_system_unitdir}/systemd-hibernate.service \
>                          ${systemd_system_unitdir}/systemd-hybrid-sleep.service \
> +                        ${systemd_system_unitdir}/systemd-pcrphase-initrd.service \
> +                        ${systemd_system_unitdir}/systemd-pcrphase.service \
> +                        ${systemd_system_unitdir}/systemd-pcrphase-sysinit.service \
>                          ${systemd_system_unitdir}/systemd-suspend.service \
>                          ${systemd_system_unitdir}/sleep.target \
>                          ${rootlibexecdir}/systemd/systemd-initctl \
> @@ -614,6 +622,7 @@ FILES:${PN} = " ${base_bindir}/* \
>                  ${bindir}/timedatectl \
>                  ${bindir}/bootctl \
>                  ${bindir}/oomctl \
> +                ${bindir}/userdbctl \
>                  ${exec_prefix}/lib/tmpfiles.d/*.conf \
>                  ${exec_prefix}/lib/systemd \
>                  ${exec_prefix}/lib/modules-load.d \
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172622): https://lists.openembedded.org/g/openembedded-core/message/172622
> Mute This Topic: https://lists.openembedded.org/mt/94753667/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

