Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46038C47074
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 09:50:01 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.50623.1704361795177175064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 01:49:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nF3jI4S4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E14E71C0009;
	Thu,  4 Jan 2024 09:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1704361793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=02pubr/w98r3OImqvFs8InB0GxX2C5rUavXKL1Q1FSc=;
	b=nF3jI4S4u+6dce33IVgyQavJTNJct6hsVV06kRw8okrx3lsQv5yOT1Gq1bx4xl6FDa8P1K
	boZSw36xVM1TdwWBO6rl+lVkLYm2bn4pVn0TGdbH/CO6+AY8jvSSkFw0R8PzXgWBM5RsjV
	qEDcld2Sc1zqrr/LO3iujm2N87d2wnLREot3TMrRjcvQQa9xm6TPEYODnDEz845TlFcSNR
	9mdbySZIPDcs2FMPXpW7Z8QGc9+BkcvNhJAtUQXPUYxRh6LoWJ8X3ndCdPCojFuM443pRs
	onwDd+7lz8gOy/NtQfFsELq2XQ+pmIcVDJu/8KHhnWRkGkpdbq7QLt6rjfPQpA==
Date: Thu, 4 Jan 2024 10:49:52 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] grub: fs/fat: Don't error when mtime is 0
Message-ID: <20240104094952d0f43a9f@mail.local>
References: <20240103123052.711083-1-liu.ming50@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240103123052.711083-1-liu.ming50@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 09:50:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193310

Hello,

Your patch has a declared charset of 'y' which is not a thing and git am
fails with:

error: cannot convert from y to UTF-8
fatal: could not parse patch

You got the following prompt:

The following files are 8bit, but do not declare a Content-Transfer-Encoding.
something.patch
Which 8bit encoding should I declare [UTF-8]?

At that point, you pressed y but you should simply press enter. Please
resend.


On 03/01/2024 13:30:52+0100, Ming Liu wrote:
> From: Ming Liu <liu.ming50@gmail.com>
> 
> A issue was found when I run "runqemu genericx86-64 ovmf", grub failed
> to boot, it's a known issue has been fixed in grub upstream, backport
> the fix.
> 
> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> ---
>  ...1-fs-fat-Don-t-error-when-mtime-is-0.patch | 70 +++++++++++++++++++
>  meta/recipes-bsp/grub/grub2.inc               |  1 +
>  2 files changed, 71 insertions(+)
>  create mode 100644 meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtime-is-0.patch
> 
> diff --git a/meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtime-is-0.patch b/meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtime-is-0.patch
> new file mode 100644
> index 0000000000..a5fbd58f46
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/0001-fs-fat-Don-t-error-when-mtime-is-0.patch
> @@ -0,0 +1,70 @@
> +From e43f3d93b28cce852c110c7a8e40d8311bcd8bb1 Mon Sep 17 00:00:00 2001
> +From: Robbie Harwood <rharwood@redhat.com>
> +Date: Fri, 15 Jul 2022 16:13:02 -0400
> +Subject: [PATCH] fs/fat: Don't error when mtime is 0
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +In the wild, we occasionally see valid ESPs where some file modification
> +times are 0. For instance:
> +
> +    ├── [Dec 31  1979]  EFI
> +    │   ├── [Dec 31  1979]  BOOT
> +    │   │   ├── [Dec 31  1979]  BOOTX64.EFI
> +    │   │   └── [Dec 31  1979]  fbx64.efi
> +    │   └── [Jun 27 02:41]  fedora
> +    │       ├── [Dec 31  1979]  BOOTX64.CSV
> +    │       ├── [Dec 31  1979]  fonts
> +    │       ├── [Mar 14 03:35]  fw
> +    │       │   ├── [Mar 14 03:35]  fwupd-359c1169-abd6-4a0d-8bce-e4d4713335c1.cap
> +    │       │   ├── [Mar 14 03:34]  fwupd-9d255c4b-2d88-4861-860d-7ee52ade9463.cap
> +    │       │   └── [Mar 14 03:34]  fwupd-b36438d8-9128-49d2-b280-487be02d948b.cap
> +    │       ├── [Dec 31  1979]  fwupdx64.efi
> +    │       ├── [May 10 10:47]  grub.cfg
> +    │       ├── [Jun  3 12:38]  grub.cfg.new.new
> +    │       ├── [May 10 10:41]  grub.cfg.old
> +    │       ├── [Jun 27 02:41]  grubenv
> +    │       ├── [Dec 31  1979]  grubx64.efi
> +    │       ├── [Dec 31  1979]  mmx64.efi
> +    │       ├── [Dec 31  1979]  shim.efi
> +    │       ├── [Dec 31  1979]  shimx64.efi
> +    │       └── [Dec 31  1979]  shimx64-fedora.efi
> +    └── [Dec 31  1979]  FSCK0000.REC
> +
> +    5 directories, 17 files
> +
> +This causes grub-probe failure, which in turn causes grub-mkconfig
> +failure. They are valid filesystems that appear intact, and the Linux
> +FAT stack is able to mount and manipulate them without complaint.
> +
> +The check for mtime of 0 has been present since
> +20def1a3c3952982395cd7c3ea7e78638527962b (fat: support file
> +modification times).
> +
> +Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/grub.git/commit/?id=e43f3d93b28cce852c110c7a8e40d8311bcd8bb1]
> +
> +Signed-off-by: Robbie Harwood <rharwood@redhat.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Signed-off-by: Ming Liu <liu.ming50@gmail.com>
> +---
> + grub-core/fs/fat.c | 3 ---
> + 1 file changed, 3 deletions(-)
> +
> +diff --git a/grub-core/fs/fat.c b/grub-core/fs/fat.c
> +index 0951b2e63..c5efed724 100644
> +--- a/grub-core/fs/fat.c
> ++++ b/grub-core/fs/fat.c
> +@@ -1027,9 +1027,6 @@ grub_fat_dir (grub_device_t device, const char *path, grub_fs_dir_hook_t hook,
> + 					  grub_le_to_cpu16 (ctxt.dir.w_date),
> + 					  &info.mtime);
> + #endif
> +-      if (info.mtimeset == 0)
> +-	grub_error (GRUB_ERR_OUT_OF_RANGE,
> +-		    "invalid modification timestamp for %s", path);
> + 
> +       if (hook (ctxt.filename, &info, hook_data))
> + 	break;
> +-- 
> +2.34.1
> +
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
> index f594e7d3a4..1215b24668 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -44,6 +44,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
>             file://0001-fs-ext2-Ignore-checksum-seed-incompat-feature.patch \
>             file://CVE-2023-4692.patch \
>             file://CVE-2023-4693.patch \
> +           file://0001-fs-fat-Don-t-error-when-mtime-is-0.patch \
>  "
>  
>  SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193286): https://lists.openembedded.org/g/openembedded-core/message/193286
> Mute This Topic: https://lists.openembedded.org/mt/103500707/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

