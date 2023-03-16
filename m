Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD33C74A5B
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 21:46:34 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.5176.1679003185734326462
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 14:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nnLkGo1/;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 39207E0004;
	Thu, 16 Mar 2023 21:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1679003183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JuKgORhDhDYhI4c+XVVCTk7imGKkVhGHaDwqLLK/1oE=;
	b=nnLkGo1/w+BA6HLQFsPQO/0dVvfchF2ztHYRN3JuAVIeZnTeu+h3xz1zHpn+yRyNgaZyfE
	ea8o9/sbNfgakTM0QBCYp9/LE2JZI4ZJp0uV8Dsos0QYJ/dLgO62VzWvtdOarR/vTj2orO
	cK07fp4eCRMTVCNaJWTs8rHtkEXIwSYTFF3HTbjeCLejVEBg5Cs9AwpGVVMfiifrIX00/v
	yJ3mdddyz7d6cAE2JoKW2wc/KuEqy42p2DL/PxNd3Z37fOWUIyDgHrZWlLc5InSbfeyeif
	B8Mtq/kW6YfkcogVccEYGtC4Dd/sO960iS8V1ljdLoq/1B58N/w7Xao06PXEnw==
Date: Thu, 16 Mar 2023 22:46:22 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] btrfs-tools: upgrade 6.1.3 -> 6.2.1
Message-ID: <20230316214622adcc63a5@mail.local>
References: <1678926524-24495-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1678926524-24495-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 21:46:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178735

Hello,

This fails on the AB for edgerouter-alt and meta-intel:

https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/4406/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/4205/steps/13/logs/stdio

| gcc  -isystem/home/pokybuild/yocto-worker/edgerouter-alt/build/build/tmp/work/x86_64-linux/btrfs-tools-native/6.2.1-r0/recipe-sysroot-native/usr/include -O2 -pipe -std=gnu11 -D_GNU_SOURCE -fPIC -fvisibility=hidden -I./libbtrfsutil    -o libbtrfsutil/stubs.o -c libbtrfsutil/stubs.c -o libbtrfsutil/stubs.o
| In file included from crypto/blake2b-round.h:140,
|                  from crypto/blake2b-sse2.c:33:
| crypto/blake2b-sse2.c: In function ‘blake2b_compress_sse2’:
| crypto/blake2b-load-sse41.h:21:25: error: incompatible type for argument 1 of ‘_mm_unpacklo_epi64’
|    21 | b0 = _mm_unpacklo_epi64(m0, m1); \
|       |                         ^~
|       |                         |
|       |                         uint64_t {aka long unsigned int}
| crypto/blake2b-round.h:146:3: note: in expansion of macro ‘LOAD_MSG_0_1’
|   146 |   LOAD_MSG_ ##r ##_1(b0, b1); \
|       |   ^~~~~~~~~
| crypto/blake2b-sse2.c:80:3: note: in expansion of macro ‘ROUND’
|    80 |   ROUND( 0 );
|       |   ^~~~~
| In file included from crypto/blake2b-sse2.c:25:
| /usr/lib/gcc/x86_64-redhat-linux/11/include/emmintrin.h:1046:29: note: expected ‘__m128i’ but argument is of type ‘uint64_t’ {aka ‘long unsigned int’}
|  1046 | _mm_unpacklo_epi64 (__m128i __A, __m128i __B)
|       |                     ~~~~~~~~^~~
| In file included from crypto/blake2b-round.h:140,
|                  from crypto/blake2b-sse2.c:33:

On 16/03/2023 08:28:44+0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
> =========
>  * fix build with crypto libraries
>  * CI images updated, build tests extended
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../btrfs-tools/{btrfs-tools_6.1.3.bb => btrfs-tools_6.2.1.bb}  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.1.3.bb => btrfs-tools_6.2.1.bb} (98%)
> 
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb
> similarity index 98%
> rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb
> rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb
> index b4dfc5b3f3..a6ff87a90c 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.1.3.bb
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.2.1.bb
> @@ -19,7 +19,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;b
>             file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
>             file://0001-Use-pread-pwrite-ftruncate-stat-instead-of-64bit-equ.patch \
>             "
> -SRCREV = "908b4b4450320e30fdef693f09b42f4eb93702c3"
> +SRCREV = "366cd079bc43241b27e0838be0c5369aa00716f8"
>  S = "${WORKDIR}/git"
>  
>  PACKAGECONFIG ??= " \
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178664): https://lists.openembedded.org/g/openembedded-core/message/178664
> Mute This Topic: https://lists.openembedded.org/mt/97641211/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

