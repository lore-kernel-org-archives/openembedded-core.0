Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0E4FF606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 10:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t39ANHVq032333; Thu, 9 Apr 2015 11:23:17 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id V6p098vAnKgN; Thu,  9 Apr 2015 11:23:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t39AN1Mg032315
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 9 Apr 2015 11:23:12 +0100
Message-ID: <1428574981.6976.7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 09 Apr 2015 11:23:01 +0100
In-Reply-To: <fe627d2aeef3ed39caa98f73942c0f23ff2bf825.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
	<fe627d2aeef3ed39caa98f73942c0f23ff2bf825.1428341478.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/24] mtd-utils: update to latest and fix static inlining
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
X-List-Received-Date: Thu, 09 Apr 2015 10:23:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-04-06 at 17:36 +0000, Khem Raj wrote:
> use static storage class instead of extern for inline functions
> and remove duplicate definitions as a result

This says what this does but not why. Upstream-Status is also missing.

Cheers,

Richard

> Change-Id: I72e8c5f19dff656c18f719d1e9e2ca697c9a856f
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...emove-duplicate-hashtable_iterator_value-.patch | 56 ++++++++++++++++++++++
>  meta/recipes-devtools/mtd/mtd-utils_git.bb         |  1 +
>  2 files changed, 57 insertions(+)
>  create mode 100644 meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch
> 
> diff --git a/meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch b/meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch
> new file mode 100644
> index 0000000..695f020
> --- /dev/null
> +++ b/meta/recipes-devtools/mtd/mtd-utils/0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch
> @@ -0,0 +1,56 @@
> +From b856ff35c20124ceae40bbc4d32584df47618c96 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Wed, 25 Feb 2015 09:28:26 +0000
> +Subject: [PATCH] hashtable: Remove duplicate
> + hashtable_iterator_value/hashtable_iterator_key
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + mkfs.ubifs/hashtable/hashtable_itr.c | 12 ------------
> + 1 file changed, 12 deletions(-)
> +
> +Index: git/mkfs.ubifs/hashtable/hashtable_itr.h
> +===================================================================
> +--- git.orig/mkfs.ubifs/hashtable/hashtable_itr.h
> ++++ git/mkfs.ubifs/hashtable/hashtable_itr.h
> +@@ -28,7 +28,7 @@ hashtable_iterator(struct hashtable *h);
> + /* hashtable_iterator_key
> +  * - return the value of the (key,value) pair at the current position */
> + 
> +-extern inline void *
> ++static inline void *
> + hashtable_iterator_key(struct hashtable_itr *i)
> + {
> +     return i->e->k;
> +@@ -37,7 +37,7 @@ hashtable_iterator_key(struct hashtable_
> + /*****************************************************************************/
> + /* value - return the value of the (key,value) pair at the current position */
> + 
> +-extern inline void *
> ++static inline void *
> + hashtable_iterator_value(struct hashtable_itr *i)
> + {
> +     return i->e->v;
> +Index: git/mkfs.ubifs/hashtable/hashtable_itr.c
> +===================================================================
> +--- git.orig/mkfs.ubifs/hashtable/hashtable_itr.c
> ++++ git/mkfs.ubifs/hashtable/hashtable_itr.c
> +@@ -35,18 +35,6 @@ hashtable_iterator(struct hashtable *h)
> + }
> + 
> + /*****************************************************************************/
> +-/* key      - return the key of the (key,value) pair at the current position */
> +-/* value    - return the value of the (key,value) pair at the current position */
> +-
> +-void *
> +-hashtable_iterator_key(struct hashtable_itr *i)
> +-{ return i->e->k; }
> +-
> +-void *
> +-hashtable_iterator_value(struct hashtable_itr *i)
> +-{ return i->e->v; }
> +-
> +-/*****************************************************************************/
> + /* advance - advance the iterator to the next element
> +  *           returns zero if advanced to end of table */
> + 
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> index 12daffe..f991ea1 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> @@ -13,6 +13,7 @@ SRCREV = "9f107132a6a073cce37434ca9cda6917dd8d866b"
>  SRC_URI = "git://git.infradead.org/mtd-utils.git \
>             file://add-exclusion-to-mkfs-jffs2-git-2.patch \
>             file://fix-armv7-neon-alignment.patch \
> +           file://0001-hashtable-Remove-duplicate-hashtable_iterator_value-.patch \
>  "
>  
>  S = "${WORKDIR}/git/"
> -- 
> 2.1.4
> 



