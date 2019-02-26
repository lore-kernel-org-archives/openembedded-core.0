Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id E32B57CAC5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 03:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7ECBD40B78;
	Tue, 26 Feb 2019 03:19:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id yIb6VQypJTHZ; Tue, 26 Feb 2019 03:19:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4F93640A35;
	Tue, 26 Feb 2019 03:19:52 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 889F316BA51; Mon, 25 Feb 2019 22:19:51 -0500 (EST)
Date: Mon, 25 Feb 2019 22:19:51 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190226031951.GT19169@denix.org>
References: <20190207062526.33944-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190207062526.33944-1-raj.khem@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl10: Fix mutliple include assumptions for bn.h in opensslconf.h
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
X-List-Received-Date: Tue, 26 Feb 2019 03:19:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Khem, Richard,

Sorry for belated reply. I haven't had time for master yet, but since this 
just got backported to thud, I'm seeing a similar breakage.

First of all, BN_LLONG not being defined does seem to be "fixed" by this 
patch, but I'm not entirely sure why it now checks for OPENSSL_SYS_UEFI - this 
seems to be a new define in OpenSSL 1.1, and doesn't even exist in OpenSSL 1.0
Is it a pure luck that it works now? Any hidden meaning I missded?

And it also breaks exactly the same for DES_LONG due to a similar construct:


#if (defined(HEADER_NEW_DES_H) || defined(HEADER_DES_H)) && !defined(DES_LONG)
/* If this is set to 'unsigned int' on a DEC Alpha, this gives about a
 * %20 speed up (longs are 8 bytes, int's are 4). */
#ifndef DES_LONG
#define DES_LONG unsigned int
#endif
#endif


I was going to fix it similarly as BN_LLONG, but since I don't understand how 
it was supposed to be fixed, I'm not sure how to fix DES_LONG not being 
defined. Any ideas?

Thanks.

-- 
Denys


On Wed, Feb 06, 2019 at 10:25:26PM -0800, Khem Raj wrote:
> After adding #pragma once to wrapper header ( opensslconf.h ) this
> latent issue got to bite us, where it expect bn.h to be including
> openssl.h to define BN_* defines, which is fragile. This patch removes
> the contraints for nested includes for bn.h
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../0001-Fix-BN_LLONG-breakage.patch          | 33 +++++++++++++++++++
>  .../openssl/openssl10_1.0.2q.bb               |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl10/0001-Fix-BN_LLONG-breakage.patch
> 
> diff --git a/meta/recipes-connectivity/openssl/openssl10/0001-Fix-BN_LLONG-breakage.patch b/meta/recipes-connectivity/openssl/openssl10/0001-Fix-BN_LLONG-breakage.patch
> new file mode 100644
> index 0000000000..13d39c918c
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl10/0001-Fix-BN_LLONG-breakage.patch
> @@ -0,0 +1,33 @@
> +From 247b3188cde5f3347091cd54271127386d3aece0 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 6 Feb 2019 22:10:33 -0800
> +Subject: [PATCH] Fix BN_LLONG breakage
> +
> +opensslconf.h is un-defining BN_LLONG only when included from bn.h which
> +is not robust at all, especially when include guards are used and
> +multiple inclusions of a given header is not allowed. so lets take out
> +the nesting constraint and add OPENSSL_SYS_UEFI constraint instead
> +
> +Upstream-Status: Inappropriate [ fixed differently with OpenSSL 1.1+ ]
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + crypto/opensslconf.h.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/crypto/opensslconf.h.in b/crypto/opensslconf.h.in
> +index 7a1c85d..a10c10f 100644
> +--- a/crypto/opensslconf.h.in
> ++++ b/crypto/opensslconf.h.in
> +@@ -56,7 +56,7 @@
> + #endif
> + #endif
> + 
> +-#if defined(HEADER_BN_H) && !defined(CONFIG_HEADER_BN_H)
> ++#if !defined(OPENSSL_SYS_UEFI) && !defined(CONFIG_HEADER_BN_H)
> + #define CONFIG_HEADER_BN_H
> + #undef BN_LLONG
> + 
> +-- 
> +2.20.1
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb b/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
> index 809634f6c0..88aefdea4f 100644
> --- a/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
> +++ b/meta/recipes-connectivity/openssl/openssl10_1.0.2q.bb
> @@ -40,6 +40,7 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>             file://0001-Fix-build-with-clang-using-external-assembler.patch \
>             file://0001-openssl-force-soft-link-to-avoid-rare-race.patch \
>             file://0001-allow-manpages-to-be-disabled.patch \
> +           file://0001-Fix-BN_LLONG-breakage.patch \
>             "
>  
>  SRC_URI_append_class-target = " \
> -- 
> 2.20.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

