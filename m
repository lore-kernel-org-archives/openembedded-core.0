Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE6B2C7EE23
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 03:05:59 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web11.5103.1685502356421494754
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 20:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from [192.168.2.37] ([70.99.78.137])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 34V35qMU031302;
	Tue, 30 May 2023 22:05:52 -0500
Message-ID: <6bce2f73-ae0b-56f9-799e-e4ba947f38bb@kernel.crashing.org>
Date: Tue, 30 May 2023 22:05:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [OE-core] [PATCH][pseudo] Move __*xstat* and __xmknod functions
 to new subport 'old__x'
Content-Language: en-US
To: mark.hatle@amd.com, openembedded-core@lists.openembedded.org,
        zhangjialing@loongson.cn
Cc: seebs@seebs.net
References: <20230531030126.5837-1-mark.hatle@amd.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <20230531030126.5837-1-mark.hatle@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 03:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181984

This code only switched the usage of the removed __ functions based on 
availability of _STAT_VER and _MKNOD_VER in the ports/linux/subport file.  If 
you change the conditional to 'if true ; then' the system will enable the older 
style code unconditionally.  I did verify that appears to be working for me.

If anyone has a good idea how to adjust the configure script to pass the data to 
the subport file, that would be ideal.  Default behavior of checking the system, 
optional behaving of an --enable-compat-xfunctions -- or something like that.

As for the loongarch64, this code should work there as it's now written.  I do 
not have a way to test this, so I'm hoping JiaLing Zhang will be able to build 
and test this.

All of my testing was accomplished using the 'make test' target.  More extensive 
testing will be needed before we can trust this for OE, but it's probably closer 
to something that does what we need.

(There is still more duplication then I would like.. hopefully reviewers will be 
able to suggest something.)

--Mark

On 5/30/23 10:01 PM, Mark Hatle via lists.openembedded.org wrote:
> Changes to eliminate __*.c function usage were based on the patch:
> 
>     From: JiaLing Zhang <zhangjialing@loongson.cn>
>     Subject: [OE-core] [PATCH v4] Fixes pseudo build in loongarch64
> 
>     Fixes [YOCTO #15110]
> 
>     Some functions used in the project have been removed from glibc. After the removal of these functions,
>     the architecture in glibc will not include the removed functions.
>     This patch resolves the usage and compilation issues on the loongarch64 architecture
> 
>     Signed-off-by: JiaLing Zhang <zhangjialing@loongson.cn>
> 
> This code is NOT loongarch64 specific, but implements support for newer
> glibc where the __*x*stat and __xmknod* functions are no longer present
> in headers as of roughly glibc 2.33.
> 
> The functions, on x86, x86_64 and aarch64 may still be present for
> compatibility but new software should no longer be using it.  Pseudo
> can likely change it's default behavior unless support for really old
> hosts is still desired.
> 
> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> ---
>   ports/linux/guts/fopen64.c                   |  4 +-
>   ports/linux/guts/freopen64.c                 |  4 +-
>   ports/linux/guts/fstat.c                     |  8 ++-
>   ports/linux/guts/fstat64.c                   | 14 +++-
>   ports/linux/guts/fstatat.c                   |  9 ++-
>   ports/linux/guts/fstatat64.c                 | 42 +++++++++++-
>   ports/linux/guts/lstat.c                     |  2 +-
>   ports/linux/guts/lstat64.c                   |  2 +-
>   ports/linux/guts/mknod.c                     |  2 +-
>   ports/linux/guts/mknodat.c                   | 71 +++++++++++++++++++-
>   ports/linux/guts/mkostemp64.c                |  2 +-
>   ports/linux/guts/openat.c                    | 18 ++---
>   ports/linux/guts/stat.c                      |  2 +-
>   ports/linux/guts/stat64.c                    |  2 +-
>   ports/linux/old__x/README                    | 28 ++++++++
>   ports/linux/{ => old__x}/guts/__fxstat.c     |  0
>   ports/linux/{ => old__x}/guts/__fxstat64.c   |  0
>   ports/linux/{ => old__x}/guts/__fxstatat.c   |  0
>   ports/linux/{ => old__x}/guts/__fxstatat64.c |  0
>   ports/linux/{ => old__x}/guts/__lxstat.c     |  0
>   ports/linux/{ => old__x}/guts/__lxstat64.c   |  0
>   ports/linux/{ => old__x}/guts/__xmknod.c     |  0
>   ports/linux/{ => old__x}/guts/__xmknodat.c   |  0
>   ports/linux/{ => old__x}/guts/__xstat.c      |  0
>   ports/linux/{ => old__x}/guts/__xstat64.c    |  0
>   ports/linux/old__x/guts/fstat.c              | 15 +++++
>   ports/linux/old__x/guts/fstat64.c            | 15 +++++
>   ports/linux/old__x/guts/fstatat.c            | 15 +++++
>   ports/linux/old__x/guts/fstatat64.c          | 15 +++++
>   ports/linux/old__x/guts/lstat.c              | 15 +++++
>   ports/linux/old__x/guts/lstat64.c            | 15 +++++
>   ports/linux/old__x/guts/mknod.c              | 15 +++++
>   ports/linux/old__x/guts/mknodat.c            | 15 +++++
>   ports/linux/old__x/guts/mkostemp64.c         | 53 +++++++++++++++
>   ports/linux/old__x/portdefs.h                | 40 +++++++++++
>   ports/linux/old__x/pseudo_wrappers.c         | 48 +++++++++++++
>   ports/linux/old__x/wrapfuncs.in              | 18 +++++
>   ports/linux/portdefs.h                       | 19 ------
>   ports/linux/pseudo_wrappers.c                | 43 ------------
>   ports/linux/subports                         | 15 +++++
>   ports/linux/wrapfuncs.in                     | 26 +++----
>   pseudo_client.h                              | 38 +++++++++--
>   42 files changed, 520 insertions(+), 110 deletions(-)
>   create mode 100644 ports/linux/old__x/README
>   rename ports/linux/{ => old__x}/guts/__fxstat.c (100%)
>   rename ports/linux/{ => old__x}/guts/__fxstat64.c (100%)
>   rename ports/linux/{ => old__x}/guts/__fxstatat.c (100%)
>   rename ports/linux/{ => old__x}/guts/__fxstatat64.c (100%)
>   rename ports/linux/{ => old__x}/guts/__lxstat.c (100%)
>   rename ports/linux/{ => old__x}/guts/__lxstat64.c (100%)
>   rename ports/linux/{ => old__x}/guts/__xmknod.c (100%)
>   rename ports/linux/{ => old__x}/guts/__xmknodat.c (100%)
>   rename ports/linux/{ => old__x}/guts/__xstat.c (100%)
>   rename ports/linux/{ => old__x}/guts/__xstat64.c (100%)
>   create mode 100644 ports/linux/old__x/guts/fstat.c
>   create mode 100644 ports/linux/old__x/guts/fstat64.c
>   create mode 100644 ports/linux/old__x/guts/fstatat.c
>   create mode 100644 ports/linux/old__x/guts/fstatat64.c
>   create mode 100644 ports/linux/old__x/guts/lstat.c
>   create mode 100644 ports/linux/old__x/guts/lstat64.c
>   create mode 100644 ports/linux/old__x/guts/mknod.c
>   create mode 100644 ports/linux/old__x/guts/mknodat.c
>   create mode 100644 ports/linux/old__x/guts/mkostemp64.c
>   create mode 100644 ports/linux/old__x/portdefs.h
>   create mode 100644 ports/linux/old__x/pseudo_wrappers.c
>   create mode 100644 ports/linux/old__x/wrapfuncs.in

