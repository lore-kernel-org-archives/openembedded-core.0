Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D2A4E7BDA9
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 12:04:22 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18199.1771243455817175913
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Feb 2026 04:04:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Bqk9WBK2;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 71E441A0FBD;
	Mon, 16 Feb 2026 12:04:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40293606CF;
	Mon, 16 Feb 2026 12:04:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6F6310369109;
	Mon, 16 Feb 2026 13:04:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771243452; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ogGd7bfDVfctdCBoFLgzPy8qQp+lY2TRqlyve0wQxCc=;
	b=Bqk9WBK2pOu9z3s1wzcAXuJFwzn1QFnh9Ql+jsTv9op546vDAruIYwAv14LouQvyKA+j9I
	WcNFaq0DphFDJCh6Ur1i5Y+Ow6v5JqtZ4sUqIBgB8BiW0kR6fw0lUSYehzci/WN046PnWx
	d0up/S3ZvN/Wi9e/muYMJFi9o0mewTPNE77yrBDXmyOT9bme2QXjxFm4p5aC1Qrs6lv0C8
	kaI56pOMkwC6LSSV9nTol1vi9SneqMN+HElEkxe/kcfTtOqJ5kclJdhJq5T0a6Vf7e9XTL
	rXGFuh9ppDmYrT4pxPe5sx/Ksp69hKm5qPO6zyDmNJ6iUkcx/lW4iDkdZqFKcw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Feb 2026 13:04:06 +0100
Message-Id: <DGGDEE91I28T.1ZWXHUSCP3GAP@bootlin.com>
To: <yi.zhao@eng.windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] grub: upgrade 2.12 -> 2.14
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260214075816.1935265-1-yi.zhao@windriver.com>
In-Reply-To: <20260214075816.1935265-1-yi.zhao@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Feb 2026 12:04:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231195

On Sat Feb 14, 2026 at 8:58 AM CET, Yi Zhao via lists.openembedded.org wrot=
e:
> ChangeLog:
> * libgcrypt 1.11.
> * LVM LV integrity and cachevol support.
> * EROFS support.
> * GRUB environment block inside the Btrfs header support.
> * NX support for EFI platforms.
> * shim loader protocol support.
> * BLS and UKI support.
> * Argon2 KDF support.
> * TPM2 key protector support.
> * Appended Signature Secure Boot Support for PowerPC.
> * New option to block command line interface.
> * Support dates outside of 1901..2038 range.
> * zstdio decompression support.
> * EFI code improvements and fixes.
> * TPM driver fixes.
> * Filesystems fixes.
> * CVE and Coverity fixes.
> * Tests improvements.
> * Documentation improvements.
>
> Drop backport patches.
> Refresh local patches.
> Split grub-bash-completion package by inheriting bash-completion.
>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---

Hi Yi,

Thanks for the upgrade.

It looks like this is breaking the wic.Wic.test_grub_install_pcbios
selftest:

2026-02-16 08:00:28,031 - oe-selftest - INFO - wic.Wic.test_grub_install_pc=
bios (subunit.RemotedTestCase)
2026-02-16 08:00:28,031 - oe-selftest - INFO -  ... FAIL
...
AssertionError: Command 'wic create /tmp/tmprjgt61lz.wks -e core-image-mini=
mal -o /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-284508=
2/wic-tmp' returned non-zero exit status 1:
...

ERROR: _exec_cmd: export PATH=3D/srv/pokybuild/yocto-worker/oe-selftest-fed=
ora/build/build-st-2845082/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/reci=
pe-sysroot-native/sbin:/srv/pokybuild/yocto-worker/oe-selftest-fedora/build=
/build-st-2845082/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroo=
t-native/usr/sbin:/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/buil=
d-st-2845082/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-nat=
ive/usr/bin:/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-2=
845082/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysroot-native/us=
r/bin/x86_64-poky-linux:/srv/pokybuild/yocto-worker/oe-selftest-fedora/buil=
d/build-st-2845082/tmp/work/x86-64-v3-poky-linux/wic-tools/1.0/recipe-sysro=
ot-native/bin:/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st=
-2845082/tmp/hosttools:$PATH;grub-mkimage         --prefix=3D/boot/grub    =
     --format=3Di386-pc         --config=3D/srv/pokybuild/yocto-worker/oe-s=
elftest-fedora/build/build-st-2845082/tmp/deploy/images/qemux86-64/embed.cf=
g         --directory=3D/srv/pokybuild/yocto-worker/oe-selftest-fedora/buil=
d/build-st-2845082/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0/re=
cipe-sysroot/usr/lib/grub/i386-pc         --output=3D/srv/pokybuild/yocto-w=
orker/oe-selftest-fedora/build/build-st-2845082/tmp/deploy/images/qemux86-6=
4/grub-bios-core.img boot linux ext2 fat serial part_msdos part_gpt        =
 normal multiboot probe biosdisk msdospart configfile search loadenv test r=
eturned '1' instead of 0
output: grub-mkimage: error: `/srv/pokybuild/yocto-worker/oe-selftest-fedor=
a/build/build-st-2845082/tmp/work/qemux86_64-poky-linux/core-image-minimal/=
1.0/recipe-sysroot/usr/lib/grub/i386-pc/kernel.img' is miscompiled: its sta=
rt address is 0x9074 instead of 0x9000: ld.gold bug?.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/3098
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3332

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


