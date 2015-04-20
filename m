Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 11E9B65CAC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 10:41:47 +0000 (UTC)
Received: by wgyo15 with SMTP id o15so174283947wgy.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 03:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=l6KiLttLW15WKXu9lBmPsO4do30oLgWtwqCGC7/H6Is=;
	b=aP8yMTInZInEaGxWKDBIdEKc7zDmIk91SztpDaqxbkRGkWBKdXU/uqMrQGO5BIspjH
	UBi7x2DLBXQDy1rxVEoK2Kwt72i6wLSNA4jjw2Mq1bwsw/2d3qUDtrsAWiP/j6ulTAgN
	ui0dbdKdZ2/IjTlRHaYrNPOPOUOHPZi/C4GMmHZXpi+Gu/0u3q+P5zsxAGDoK8YDkZcd
	3cK1plVDvFGuZZG57hwRa2m3kjf5WRmikucvjQ2iUiG2fDiWLoWtyAa6/yUqMVO0NcE7
	qlYmyOgB/6MMS5ZeyHeHfBTxd34mILjuSoj4oFwMfYvv7A0khyImUZtK0NqAegeJIU/z
	UA8g==
X-Received: by 10.194.78.12 with SMTP id x12mr28549867wjw.112.1429526508299;
	Mon, 20 Apr 2015 03:41:48 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	ew10sm14654653wic.22.2015.04.20.03.41.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Apr 2015 03:41:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 20 Apr 2015 12:41:52 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20150420104152.GC3686@jama>
References: <1428665669-16128-1-git-send-email-Martin.Jansa@gmail.com>
	<1428665669-16128-2-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1428665669-16128-2-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [dylan][PATCH 2/2] binutils: backport patch to fix build with gcc-4.9
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
X-List-Received-Date: Mon, 20 Apr 2015 10:41:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2015 at 01:34:29PM +0200, Martin Jansa wrote:
> * backported from 2.23.2, fixes:
> work/x86_64-linux/binutils-native/2.23.1-r3/binutils-2.23.1/gas/write.c:4=
09:24:
>   error: 'dummy.fr_type' may be used uninitialized in this function [-Wer=
ror=3Dmaybe-uninitialized]
>    gas_assert (prev_frag->fr_type !=3D 0);
>                         ^
> work/x86_64-linux/binutils-native/2.23.1-r3/binutils-2.23.1/gas/write.c:3=
92:9: note: 'dummy' was declared here
>    fragS dummy, *prev_frag =3D &dummy;
>          ^

Ping

1/2 patch was merged almost immediately, but it isn't any good without
this 2/2.

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.23.1.inc |  1 +
>  ...in_frchains_together_1-Reorder-assertion-.patch | 30 ++++++++++++++++=
++++++
>  2 files changed, 31 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0001-write.c-=
chain_frchains_together_1-Reorder-assertion-.patch
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils-2.23.1.inc b/meta/re=
cipes-devtools/binutils/binutils-2.23.1.inc
> index 7b3366a..6a6811b 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.23.1.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.23.1.inc
> @@ -31,6 +31,7 @@ SRC_URI =3D "\
>       file://binutils-fix-over-array-bounds-issue.patch \
>       file://replace_macros_with_static_inline.patch \
>       file://0001-Fix-MMIX-build-breakage-from-bfd_set_section_vma-cha.pa=
tch \
> +     file://0001-write.c-chain_frchains_together_1-Reorder-assertion-.pa=
tch \
>       "
> =20
>  BACKPORT =3D "\
> diff --git a/meta/recipes-devtools/binutils/binutils/0001-write.c-chain_f=
rchains_together_1-Reorder-assertion-.patch b/meta/recipes-devtools/binutil=
s/binutils/0001-write.c-chain_frchains_together_1-Reorder-assertion-.patch
> new file mode 100644
> index 0000000..ffe6852
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0001-write.c-chain_frchains=
_together_1-Reorder-assertion-.patch
> @@ -0,0 +1,30 @@
> +From c50d883cb61ff9917464cb695a0fd83fdb0f9c20 Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@bigpond.net.au>
> +Date: Mon, 21 Jan 2013 13:48:31 +0000
> +Subject: [PATCH] write.c (chain_frchains_together_1): Reorder assertion =
to
> + avoid uninit warning.
> +
> +Upstream-Status: Backport from 2.23.2
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + gas/write.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/gas/write.c b/gas/write.c
> +index a467147..56ebb6c 100644
> +--- a/gas/write.c
> ++++ b/gas/write.c
> +@@ -406,8 +406,8 @@ chain_frchains_together_1 (segT section, struct frch=
ain *frchp)
> + 	  prev_fix =3D frchp->fix_tail;
> + 	}
> +     }
> +-  gas_assert (prev_frag->fr_type !=3D 0);
> +-  gas_assert (prev_frag !=3D &dummy);
> ++  gas_assert (prev_frag !=3D &dummy
> ++	      && prev_frag->fr_type !=3D 0);
> +   prev_frag->fr_next =3D 0;
> +   return prev_frag;
> + }
> +--=20
> +2.3.5
> +
> --=20
> 2.3.5
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

