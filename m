Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3F672605D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 13:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3FDTfne025209; Wed, 15 Apr 2015 14:29:41 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id TC-Zdv62ZWga; Wed, 15 Apr 2015 14:29:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t3FDTORK025196
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 15 Apr 2015 14:29:36 +0100
Message-ID: <1429104564.6976.115.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen.kooi@linaro.org>, Robert Yang <liezhi.yang@windriver.com>
Date: Wed, 15 Apr 2015 14:29:24 +0100
In-Reply-To: <1429101157-12319-1-git-send-email-koen.kooi@linaro.org>
References: <1429101157-12319-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] strace: fix build for aarch64
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Apr 2015 13:29:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-04-15 at 14:32 +0200, Koen Kooi wrote:
> Upstream added aarch64 support but forgot to update 'make dist' leading to missing files in the tarball.
> 
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  .../0001-Add-linux-aarch64-arch_regs.h.patch       | 25 ++++++++++++++++++++++
>  meta/recipes-devtools/strace/strace_4.10.bb        |  1 +
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch

I'm guessing this is a better fix than Robert's fix for strace?

Let me know if they're different issues...

Cheers,

Richard

> diff --git a/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch b/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch
> new file mode 100644
> index 0000000..f70766b
> --- /dev/null
> +++ b/meta/recipes-devtools/strace/strace/0001-Add-linux-aarch64-arch_regs.h.patch
> @@ -0,0 +1,25 @@
> +From f85854131c8265f2eb59c714dcea5c4b3dc09bed Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen.kooi@linaro.org>
> +Date: Wed, 15 Apr 2015 14:29:37 +0200
> +Subject: [PATCH] Add linux/aarch64/arch_regs.h
> +
> +It is missing from the tarball, but it is present in git for v4.10
> +
> +Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> +Upstream-status: Pending
> +---
> + linux/aarch64/arch_regs.h | 2 ++
> + 1 file changed, 2 insertions(+)
> + create mode 100644 linux/aarch64/arch_regs.h
> +
> +diff --git a/linux/aarch64/arch_regs.h b/linux/aarch64/arch_regs.h
> +new file mode 100644
> +index 0000000..9a5e33e
> +--- /dev/null
> ++++ b/linux/aarch64/arch_regs.h
> +@@ -0,0 +1,2 @@
> ++extern uint64_t *const aarch64_sp_ptr;
> ++extern uint32_t *const arm_sp_ptr;
> +-- 
> +1.9.3
> +
> diff --git a/meta/recipes-devtools/strace/strace_4.10.bb b/meta/recipes-devtools/strace/strace_4.10.bb
> index 416c387..707cb76 100644
> --- a/meta/recipes-devtools/strace/strace_4.10.bb
> +++ b/meta/recipes-devtools/strace/strace_4.10.bb
> @@ -5,6 +5,7 @@ LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=124500c21e856f0912df29295ba104c7"
>  
>  SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
> +           file://0001-Add-linux-aarch64-arch_regs.h.patch \
>             file://git-version-gen \
>             file://strace-add-configure-options.patch \
>             file://Makefile-ptest.patch \
> -- 
> 1.9.3
> 



