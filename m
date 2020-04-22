Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6029.1587573423352587365
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Apr 2020 09:37:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 67C9040BFD;
	Wed, 22 Apr 2020 16:37:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8fSBiqC6ig0K; Wed, 22 Apr 2020 16:37:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6D7BB40AD5;
	Wed, 22 Apr 2020 16:36:54 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A26C51725A9; Wed, 22 Apr 2020 12:36:53 -0400 (EDT)
Date: Wed, 22 Apr 2020 12:36:53 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core] [zeus][PATCH] qemu: Replace stime() API with clock_settime
Message-ID: <20200422163653.GJ11927@denix.org>
References: <20200422143824.2634423-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200422143824.2634423-1-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Why? glibc on zeus doesn't need it.


On Wed, Apr 22, 2020 at 04:38:24PM +0200, Martin Jansa wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |  1 +
>  ...linux-user-remove-host-stime-syscall.patch | 61 +++++++++++++++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
> 
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
> index f451017f6d..ad4ff52892 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -27,6 +27,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
>             file://0008-linux-user-Fix-webkitgtk-hangs-on-32-bit-x86-target.patch \
>             file://0009-Fix-webkitgtk-builds.patch \
>             file://0010-configure-Add-pkg-config-handling-for-libgcrypt.patch \
> +           file://0011-linux-user-remove-host-stime-syscall.patch \
>             file://CVE-2019-15890.patch \
>             file://CVE-2019-12068.patch \
>             file://CVE-2020-1711.patch \
> diff --git a/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch b/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
> new file mode 100644
> index 0000000000..659e6be45d
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/0011-linux-user-remove-host-stime-syscall.patch
> @@ -0,0 +1,61 @@
> +From 0f1f2d4596aee037d3ccbcf10592466daa54107f Mon Sep 17 00:00:00 2001
> +From: Laurent Vivier <laurent@vivier.eu>
> +Date: Tue, 12 Nov 2019 15:25:56 +0100
> +Subject: [PATCH] linux-user: remove host stime() syscall
> +
> +stime() has been withdrawn from glibc
> +(12cbde1dae6f "Use clock_settime to implement stime; withdraw stime.")
> +
> +Implement the target stime() syscall using host
> +clock_settime(CLOCK_REALTIME, ...) as it is done internally in glibc.
> +
> +Tested qemu-ppc/x86_64 with:
> +
> +	#include <time.h>
> +	#include <stdio.h>
> +
> +	int main(void)
> +	{
> +		time_t t;
> +		int ret;
> +
> +		/* date -u -d"2019-11-12T15:11:00" "+%s" */
> +		t = 1573571460;
> +		ret = stime(&t);
> +		printf("ret %d\n", ret);
> +		return 0;
> +	}
> +
> +        # date; ./stime; date
> +        Tue Nov 12 14:18:32 UTC 2019
> +        ret 0
> +        Tue Nov 12 15:11:00 UTC 2019
> +
> +Upstream-Status: Backport [https://git.qemu.org/?p=qemu.git;a=commit;h=0f1f2d4596aee037d3ccbcf10592466daa54107f]
> +Buglink: https://bugs.launchpad.net/qemu/+bug/1852115
> +Reported-by: Cole Robinson <crobinso@redhat.com>
> +Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> +Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> +Message-Id: <20191112142556.6335-1-laurent@vivier.eu>
> +---
> + linux-user/syscall.c | 8 +++++---
> + 1 file changed, 5 insertions(+), 3 deletions(-)
> +
> +--- a/linux-user/syscall.c
> ++++ b/linux-user/syscall.c
> +@@ -7651,10 +7651,12 @@ static abi_long do_syscall1(void *cpu_en
> + #ifdef TARGET_NR_stime /* not on alpha */
> +     case TARGET_NR_stime:
> +         {
> +-            time_t host_time;
> +-            if (get_user_sal(host_time, arg1))
> ++            struct timespec ts;
> ++            ts.tv_nsec = 0;
> ++            if (get_user_sal(ts.tv_sec, arg1)) {
> +                 return -TARGET_EFAULT;
> +-            return get_errno(stime(&host_time));
> ++            }
> ++            return get_errno(clock_settime(CLOCK_REALTIME, &ts));
> +         }
> + #endif
> + #ifdef TARGET_NR_alarm /* not on alpha */
> -- 
> 2.25.1
> 

> 

