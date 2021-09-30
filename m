Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F05EC433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Sep 2021 06:46:28 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web12.9048.1632984386613698595
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 23:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 0BF74240005;
	Thu, 30 Sep 2021 06:46:22 +0000 (UTC)
Date: Thu, 30 Sep 2021 08:46:22 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Persian Prince <persianpros@yahoo.com>
Subject: Re: [OE-core] [PATCH] strace_5.13 -> strace 5.14
Message-ID: <YVVdPktXwMNwIVNu@piout.net>
References: <20210929205711.193186-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210929205711.193186-1-raj.khem@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Sep 2021 06:46:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156482

Hello,

On 29/09/2021 13:57:10-0700, Khem Raj wrote:
> From: Persian Prince <persianpros@yahoo.com>
> 
> Strace 5.13 won't compile with 5.14 headers:
> 
> | ../../strace-5.13/src/fs_x_ioctl.c: In function 'fs_x_ioctl':
> | ../../strace-5.13/src/fs_x_ioctl.c:64:14: error: invalid application of 'sizeof' to incomplete type 'struct fsxattr'
> |    64 |         case FS_IOC_FSGETXATTR:
> |       |              ^~~~~~~~~~~~~~~~~
> | ../../strace-5.13/src/fs_x_ioctl.c:71:14: error: invalid application of 'sizeof' to incomplete type 'struct fsxattr'
> |    71 |         case FS_IOC_FSSETXATTR:
> |       |              ^~~~~~~~~~~~~~~~~
> | make[3]: *** [Makefile:5011: libstrace_a-fs_x_ioctl.o] Error 1
> | make[3]: *** Waiting for unfinished jobs....
> 
> According to https://strace.io/files/5.14/:
> 
> * Improvements
>   * Implemented decoding of memfd_secret and quotactl_fd syscalls,
>     introduced in Linux 5.14.
>   * Enhanced prctl syscall decoding.
>   * Enhanced decoding of IFLA_* netlink attributes.
>   * Enhanced decoding of MDBA_ROUTER_PATTR_* mdb router port netlink attributes.
>   * Updated lists of BPF_*, IORING_*, MADV_*, MOUNT_ATTR_*, SCTP_*,
>     and UFFD_* constants.
>   * Updated lists of ioctl commands from Linux 5.14.
> 
> Persian Prince <persianpros@yahoo.com>

I guess this should have been an SoB.

However, this is not applicable as we already carry a similar patch in
kirkstone-next.

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/strace/{strace_5.13.bb => strace_5.14.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/strace/{strace_5.13.bb => strace_5.14.bb} (96%)
> 
> diff --git a/meta/recipes-devtools/strace/strace_5.13.bb b/meta/recipes-devtools/strace/strace_5.14.bb
> similarity index 96%
> rename from meta/recipes-devtools/strace/strace_5.13.bb
> rename to meta/recipes-devtools/strace/strace_5.14.bb
> index 7d93f2da98..02a4843edf 100644
> --- a/meta/recipes-devtools/strace/strace_5.13.bb
> +++ b/meta/recipes-devtools/strace/strace_5.14.bb
> @@ -15,7 +15,7 @@ SRC_URI = "https://strace.io/files/${PV}/strace-${PV}.tar.xz \
>             file://uintptr_t.patch \
>             file://0001-strace-fix-reproducibilty-issues.patch \
>             "
> -SRC_URI[sha256sum] = "5acc34888b9d510ad6ac915d4a8df08f51cf1ae920ea24649f6a4bb984d0b656"
> +SRC_URI[sha256sum] = "901bee6db5e17debad4530dd9ffb4dc9a96c4a656edbe1c3141b7cb307b11e73"
>  
>  inherit autotools ptest
>  
> -- 
> 2.33.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156475): https://lists.openembedded.org/g/openembedded-core/message/156475
> Mute This Topic: https://lists.openembedded.org/mt/85959484/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

