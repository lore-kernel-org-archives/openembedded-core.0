Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA6FC001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 22:47:12 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.67812.1697842022673351407
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 15:47:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OEeQotc6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2107B20007;
	Fri, 20 Oct 2023 22:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697842020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w0/W6irdfjrGsv3LGfENVojxDueqD7+XIiv255xZR48=;
	b=OEeQotc6aqWok8LNfOxOjnU8lpJiNP35q0eG/hEVjMSJjazNr33PVDtwazwe+MkgE7y1l8
	pclnsl9XwULX5iPTm9N65EcnSxdICudFO/JFtbGNltJu+vVuavfUoFwRFeSw99hFmbHjp6
	8D1OLxqwOy3pyqDdUnQreneQw+YemdrDzdd27EpCDbR+vBMbhb6buBZehWETaXJrQvzRm+
	2nrE5n7aL1PCHAfUwucJnW6sLL9PKTP2w+Qf9S7vrbr3vm2hTw/EP2WAYLMhrYlA+4qGLX
	zVd+1+jPzkPCf+C49b3MrVeRB7Lqgpc8iMBV2vV7bLH4aTWO1F2xCvzseTo4lA==
Date: Sat, 21 Oct 2023 00:46:59 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][master][mickledore][PATCH] grub2: fix CVE-2023-4692
Message-ID: <202310202246598ced9e5d@mail.local>
References: <20231020080914.1377762-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231020080914.1377762-1-xiangyu.chen@eng.windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 22:47:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189580

Hello,

This doesn't apply on master, can you rebase?

On 20/10/2023 16:09:14+0800, Xiangyu Chen wrote:
> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> Crafted file system images can cause heap-based buffer overflow and may
> allow arbitrary code execution and secure boot bypass
> 
> Reference:
> https://security-tracker.debian.org/tracker/CVE-2023-4692
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  .../grub/files/CVE-2023-4692.patch            | 98 +++++++++++++++++++
>  meta/recipes-bsp/grub/grub2.inc               |  1 +
>  2 files changed, 99 insertions(+)
>  create mode 100644 meta/recipes-bsp/grub/files/CVE-2023-4692.patch
> 
> diff --git a/meta/recipes-bsp/grub/files/CVE-2023-4692.patch b/meta/recipes-bsp/grub/files/CVE-2023-4692.patch
> new file mode 100644
> index 0000000000..305fcc93d8
> --- /dev/null
> +++ b/meta/recipes-bsp/grub/files/CVE-2023-4692.patch
> @@ -0,0 +1,98 @@
> +From 43651027d24e62a7a463254165e1e46e42aecdea Mon Sep 17 00:00:00 2001
> +From: Maxim Suhanov <dfirblog@gmail.com>
> +Date: Mon, 28 Aug 2023 16:31:57 +0300
> +Subject: [PATCH] fs/ntfs: Fix an OOB write when parsing the $ATTRIBUTE_LIST attribute
> + for the $MFT file
> +
> +When parsing an extremely fragmented $MFT file, i.e., the file described
> +using the $ATTRIBUTE_LIST attribute, current NTFS code will reuse a buffer
> +containing bytes read from the underlying drive to store sector numbers,
> +which are consumed later to read data from these sectors into another buffer.
> +
> +These sectors numbers, two 32-bit integers, are always stored at predefined
> +offsets, 0x10 and 0x14, relative to first byte of the selected entry within
> +the $ATTRIBUTE_LIST attribute. Usually, this won't cause any problem.
> +
> +However, when parsing a specially-crafted file system image, this may cause
> +the NTFS code to write these integers beyond the buffer boundary, likely
> +causing the GRUB memory allocator to misbehave or fail. These integers contain
> +values which are controlled by on-disk structures of the NTFS file system.
> +
> +Such modification and resulting misbehavior may touch a memory range not
> +assigned to the GRUB and owned by firmware or another EFI application/driver.
> +
> +This fix introduces checks to ensure that these sector numbers are never
> +written beyond the boundary.
> +
> +Fixes: CVE-2023-4692
> +
> +Upstream-Status: Backport from 
> +[https://git.savannah.gnu.org/cgit/grub.git/commit/?id=43651027d24e62a7a463254165e1e46e42aecdea]
> +CVE: CVE-2023-4692
> +
> +Reported-by: Maxim Suhanov <dfirblog@gmail.com>
> +Signed-off-by: Maxim Suhanov <dfirblog@gmail.com>
> +Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +---
> + grub-core/fs/ntfs.c | 18 +++++++++++++++++-
> + 1 file changed, 17 insertions(+), 1 deletion(-)
> +
> +diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
> +index bbdbe24..c3c4db1 100644
> +--- a/grub-core/fs/ntfs.c
> ++++ b/grub-core/fs/ntfs.c
> +@@ -184,7 +184,7 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
> +     }
> +   if (at->attr_end)
> +     {
> +-      grub_uint8_t *pa;
> ++      grub_uint8_t *pa, *pa_end;
> + 
> +       at->emft_buf = grub_malloc (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR);
> +       if (at->emft_buf == NULL)
> +@@ -209,11 +209,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
> + 	    }
> + 	  at->attr_nxt = at->edat_buf;
> + 	  at->attr_end = at->edat_buf + u32at (pa, 0x30);
> ++	  pa_end = at->edat_buf + n;
> + 	}
> +       else
> + 	{
> + 	  at->attr_nxt = at->attr_end + u16at (pa, 0x14);
> + 	  at->attr_end = at->attr_end + u32at (pa, 4);
> ++	  pa_end = at->mft->buf + (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR);
> + 	}
> +       at->flags |= GRUB_NTFS_AF_ALST;
> +       while (at->attr_nxt < at->attr_end)
> +@@ -230,6 +232,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
> + 	  at->flags |= GRUB_NTFS_AF_GPOS;
> + 	  at->attr_cur = at->attr_nxt;
> + 	  pa = at->attr_cur;
> ++
> ++	  if ((pa >= pa_end) || (pa_end - pa < 0x18))
> ++	    {
> ++	      grub_error (GRUB_ERR_BAD_FS, "can\'t parse attribute list");
> ++	      return NULL;
> ++	    }
> ++
> + 	  grub_set_unaligned32 ((char *) pa + 0x10,
> + 				grub_cpu_to_le32 (at->mft->data->mft_start));
> + 	  grub_set_unaligned32 ((char *) pa + 0x14,
> +@@ -240,6 +249,13 @@ find_attr (struct grub_ntfs_attr *at, grub_uint8_t attr)
> + 	    {
> + 	      if (*pa != attr)
> + 		break;
> ++
> ++              if ((pa >= pa_end) || (pa_end - pa < 0x18))
> ++                {
> ++	          grub_error (GRUB_ERR_BAD_FS, "can\'t parse attribute list");
> ++	          return NULL;
> ++	        }
> ++
> + 	      if (read_attr
> + 		  (at, pa + 0x10,
> + 		   u32at (pa, 0x10) * (at->mft->data->mft_size << GRUB_NTFS_BLK_SHR),
> +-- 
> +cgit v1.1
> +
> diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
> index 41839698dc..5ce8699363 100644
> --- a/meta/recipes-bsp/grub/grub2.inc
> +++ b/meta/recipes-bsp/grub/grub2.inc
> @@ -42,6 +42,7 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
>             file://CVE-2022-3775.patch \
>             file://0001-risc-v-Handle-R_RISCV_CALL_PLT-reloc.patch \
>             file://0001-fs-ext2-Ignore-checksum-seed-incompat-feature.patch \
> +           file://CVE-2023-4692.patch \
>  "
>  
>  SRC_URI[sha256sum] = "23b64b4c741569f9426ed2e3d0e6780796fca081bee4c99f62aa3f53ae803f5f"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189506): https://lists.openembedded.org/g/openembedded-core/message/189506
> Mute This Topic: https://lists.openembedded.org/mt/102077193/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

