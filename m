Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 54E0871634
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jan 2015 23:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0ENRlPf012244; Wed, 14 Jan 2015 23:27:47 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vnDP4HMOecP3; Wed, 14 Jan 2015 23:27:47 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t0ENRZUC012237
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 14 Jan 2015 23:27:47 GMT
Message-ID: <1421278055.31262.41.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 14 Jan 2015 23:27:35 +0000
In-Reply-To: <2d305cab23e64b83ce9a0e0922c24143c4305992.1420843293.git.sgw@linux.intel.com>
References: <cover.1420843293.git.sgw@linux.intel.com>
	<2d305cab23e64b83ce9a0e0922c24143c4305992.1420843293.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] glibc: Fix up minimal build with libc-libm
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
X-List-Received-Date: Wed, 14 Jan 2015 23:28:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-01-09 at 14:51 -0800, Saul Wold wrote:
> This addresses 2 issues discovered trying to build a minimal libc with
> libm option.  By default nscd was always being built and without inet
> enabled there were missing symbols.
> 
> The patch got updated changing initgroups to become part of the INET
> group. Newer version of quilt added function information.
> 
> [YOCTO #7108]
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../glibc/glibc/eglibc-use-option-groups.patch     | 1379 ++++++++++----------
>  meta/recipes-core/glibc/glibc_2.20.bb              |    3 +
>  2 files changed, 693 insertions(+), 689 deletions(-)
> 
> diff --git a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
> index 7136253..7be9b06 100644
> --- a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
> +++ b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
> @@ -4,8 +4,8 @@ Upstream-Status: Pending
>  
>  Index: git/argp/argp-fmtstream.c
>  ===================================================================
> ---- git.orig/argp/argp-fmtstream.c	2014-08-29 20:00:42.976070587 -0700
> -+++ git/argp/argp-fmtstream.c	2014-08-29 20:01:15.188070587 -0700
> +--- git.orig/argp/argp-fmtstream.c
> ++++ git/argp/argp-fmtstream.c
>  @@ -42,6 +42,7 @@
>   #ifdef _LIBC
>   # include <wchar.h>
> @@ -14,7 +14,7 @@ Index: git/argp/argp-fmtstream.c
>   # define __vsnprintf(s, l, f, a) _IO_vsnprintf (s, l, f, a)
>   #endif
>   
> -@@ -100,7 +101,11 @@
> +@@ -100,7 +101,11 @@ __argp_fmtstream_free (argp_fmtstream_t
>     __argp_fmtstream_update (fs);
>     if (fs->p > fs->buf)

Is there a way we could filter out the noise in the patch or move it
into a separate commit? Its rather horrid to review this and I don't
particularly want to backport the noise to dizzy either...

Cheers,

Richard


