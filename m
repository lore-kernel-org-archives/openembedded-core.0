Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBA0C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 21:01:26 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.30313.1671656483444055757
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 13:01:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iTg18exx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E4BE21BF208;
	Wed, 21 Dec 2022 21:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1671656481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EfPpJA38jHBt+VQq9lgg/lMlIlgcKJDX+L1btgjnXY8=;
	b=iTg18exxYzX6V29w3/iK6BYhmRf7Ptri86Kt7Vtx0sFZVKympb9Y7q2dMZOJp901CsCDqw
	+4Pqk0VksPu743DlMmxylkvlCZoOVZUWGLoYiD9Qc0qLZAk8Xjqg8zuk7DK1TXVENCXpnn
	ZHPDEAnyS2CkaIk091GbWu+/M8wB6M5QFingmCdqPMJA6LwysjLDuo1PZy/Ls5PrXJriKB
	SklbbQwa6nwJiAbH1nAbbmZInEjvINXce2jGNtAtgp56kW+rw+qsGqPZH9FHObTIu6Q8tm
	TbBuayMC01W4BYyLOX3ja6nRejwAgAmgg0jKW/kX2EnIHujbpR+Oz5ShhJFn/A==
Date: Wed, 21 Dec 2022 22:01:19 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Yash Shinde <yashinde145@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Yash.Shinde@windriver.com
Subject: Re: [OE-core] [PATCH v2] binutils : Fix CVE-2022-4285
Message-ID: <Y6N0HxEZizm6amUL@mail.local>
References: <20221221180009.255511-1-yashinde145@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221221180009.255511-1-yashinde145@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 21:01:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174939

This is already fixed upstream:

https://git.openembedded.org/openembedded-core/commit/?id=b6b750f8e41a392ff92d9118ef7530ada20d06fe

On 21/12/2022 23:30:09+0530, Yash Shinde wrote:
> From: Yash Shinde <Yash.Shinde@windriver.com>
> 
> Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]
> 
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
>  .../binutils/binutils-2.39.inc                |  1 +
>  .../binutils/0015-CVE-2022-4285.patch         | 36 +++++++++++++++++++
>  2 files changed, 37 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2022-4285.patch
> 
> diff --git a/meta/recipes-devtools/binutils/binutils-2.39.inc b/meta/recipes-devtools/binutils/binutils-2.39.inc
> index b040e57037..419571d56c 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.39.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.39.inc
> @@ -35,6 +35,7 @@ SRC_URI = "\
>       file://0014-CVE-2022-38128-1.patch \
>       file://0014-CVE-2022-38128-2.patch \
>       file://0014-CVE-2022-38128-3.patch \
> +     file://0015-CVE-2022-4285.patch \
>  "
>  S  = "${WORKDIR}/git"
>  # Already in 2.39 branch
> diff --git a/meta/recipes-devtools/binutils/binutils/0015-CVE-2022-4285.patch b/meta/recipes-devtools/binutils/binutils/0015-CVE-2022-4285.patch
> new file mode 100644
> index 0000000000..5ff5290334
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0015-CVE-2022-4285.patch
> @@ -0,0 +1,36 @@
> +From 5c831a3c7f3ca98d6aba1200353311e1a1f84c70 Mon Sep 17 00:00:00 2001
> +From: Nick Clifton <nickc@redhat.com>
> +Date: Wed, 19 Oct 2022 15:09:12 +0100
> +Subject: [PATCH] Fix an illegal memory access when parsing an ELF file
> + containing corrupt symbol version information.
> +
> +	PR 29699
> +	* elf.c (_bfd_elf_slurp_version_tables): Fail if the sh_info field
> +	of the section header is zero.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=5c831a3c7f3ca98d6aba1200353311e1a1f84c70]
> +CVE: CVE-2022-4285
> +
> +---
> + bfd/ChangeLog | 6 ++++++
> + bfd/elf.c     | 4 +++-
> + 2 files changed, 9 insertions(+), 1 deletion(-)
> +
> +diff --git a/bfd/elf.c b/bfd/elf.c
> +index fe00e0f9189..7cd7febcf95 100644
> +--- a/bfd/elf.c
> ++++ b/bfd/elf.c
> +@@ -8918,7 +8918,9 @@ _bfd_elf_slurp_version_tables (bfd *abfd, bool default_imported_symver)
> + 	  bfd_set_error (bfd_error_file_too_big);
> + 	  goto error_return_verref;
> + 	}
> +-      elf_tdata (abfd)->verref = (Elf_Internal_Verneed *) bfd_alloc (abfd, amt);
> ++      if (amt == 0)
> ++	goto error_return_verref;
> ++      elf_tdata (abfd)->verref = (Elf_Internal_Verneed *) bfd_zalloc (abfd, amt);
> +       if (elf_tdata (abfd)->verref == NULL)
> + 	goto error_return_verref;
> + 
> +-- 
> +2.31.1
> +
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174935): https://lists.openembedded.org/g/openembedded-core/message/174935
> Mute This Topic: https://lists.openembedded.org/mt/95811724/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

