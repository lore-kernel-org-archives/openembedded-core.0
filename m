Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3293A77BC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 22:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2SMOfep013595; 
	Tue, 28 Mar 2017 23:26:26 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id T9L4QglRhJ7H; Tue, 28 Mar 2017 23:26:26 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2SMQOUq013701
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 28 Mar 2017 23:26:25 +0100
Message-ID: <1490739984.13980.294.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Serhii Popovych <spopovyc@cisco.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 28 Mar 2017 23:26:24 +0100
In-Reply-To: <4713eca3e627fb1bececc59af252a0768c955d11.1490727266.git.spopovyc@cisco.com>
References: <4713eca3e627fb1bececc59af252a0768c955d11.1490727266.git.spopovyc@cisco.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: XE-Linux <xe-linux-external@cisco.com>
Subject: Re: [PATCH] glibc: Support building with 2.6.32 kernels on x86 / x86_64
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
X-List-Received-Date: Tue, 28 Mar 2017 22:26:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-03-28 at 18:57 +0000, Serhii Popovych wrote:
> While glibc states that 2.6.32 kernels still supported
> for x86 / x86_64 builds are failing due to out of date
> LIBC_LINUX_VERSION macro checks for such architectures.
> 
> This macro statically defined to 3.2.0 with commit 5b4ecd3
> (Require Linux 3.2 except on x86 / x86_64, 3.2 headers everywhere.)
> and additionally checked before --enable-kernel.
> 
> Since both --enable-kernel and LIBC_LINUX_VERSION checks
> are the same and there is no users of last one we can
> safely get rid of it enabling glibc builds with 2.6.32
> kernel headers.
> 
> Also add --enable-kernel to glibc-initial build so that we
> build it correctly with old headers.
> 
> Cc: XE-Linux <xe-linux-external@cisco.com>
> Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
> ---
>  meta/recipes-core/glibc/glibc-initial.inc          |   1 +
>  .../glibc/0028-Kill-LIBC_LINUX_VERSION-macro.patch | 113
> +++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.25.bb              |   1 +
>  3 files changed, 115 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/0028-Kill-
> LIBC_LINUX_VERSION-macro.patch
> 
> diff --git a/meta/recipes-core/glibc/glibc-initial.inc
> b/meta/recipes-core/glibc/glibc-initial.inc
> index f94603c..60b25dd 100644
> --- a/meta/recipes-core/glibc/glibc-initial.inc
> +++ b/meta/recipes-core/glibc/glibc-initial.inc
> @@ -12,6 +12,7 @@ do_configure () {
>  	find ${S} -name "configure" | xargs touch
>  	cfgscript=`python3 -c "import os;
> print(os.path.relpath('${S}', '.'))"`/configure
>  	$cfgscript --host=${TARGET_SYS} --build=${BUILD_SYS} \
> +		--enable-kernel=${OLDEST_KERNEL} \
>  		--prefix=/usr \
>  		--without-cvs --disable-sanity-checks \
>  		--with-headers=${STAGING_DIR_TARGET}${includedir} \
> diff --git a/meta/recipes-core/glibc/glibc/0028-Kill-
> LIBC_LINUX_VERSION-macro.patch b/meta/recipes-core/glibc/glibc/0028-
> Kill-LIBC_LINUX_VERSION-macro.patch
> new file mode 100644
> index 0000000..f5eaf1c
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/0028-Kill-LIBC_LINUX_VERSION-
> macro.patch
> @@ -0,0 +1,113 @@
> +From 88f83e4b5a8929dac9095ed264700fcb62d5e4dd Mon Sep 17 00:00:00
> 2001
> +From: Serhii Popovych <spopovyc@cisco.com>
> +Date: Fri, 17 Mar 2017 15:48:34 +0000
> +Subject: Kill LIBC_LINUX_VERSION macro
> +
> +After commit 5b4ecd3 (Require Linux 3.2 except on x86 / x86_64,
> +3.2 headers everywhere.) minimal kernel version raised from
> +2.6.32 to 3.2.0 for all architectures except x86 and x86_64
> +unless newer already used for architecture.
> +
> +However LIBC_LINUX_VERSION macro still is in effect and fails
> +configure even with --enable-kernel=2.6.32.
> +
> +While it is present in configure.ac it does not affect anything
> +except LINUX_VERSION_CODE check which already performed by
> +--enable-kernel.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Serhii Popovych <spopovyc@cisco.com>
> +---
> + sysdeps/unix/sysv/linux/configure    | 39 -----------------------
> -------------
> + sysdeps/unix/sysv/linux/configure.ac | 21 -------------------
> + 2 files changed, 60 deletions(-)
> +
> +diff --git a/sysdeps/unix/sysv/linux/configure
> b/sysdeps/unix/sysv/linux/configure

This is presumably a generated file. We should only patch configure.ac
as otherwise the potential timestamp differences between these can
cause problems (we've been burnt before). The configure version will
get updated when we reautoconf.

Cheers,

Richard

