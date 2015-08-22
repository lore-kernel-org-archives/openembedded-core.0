Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id A24D4763F4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Aug 2015 00:44:23 +0000 (UTC)
Received: by obbwr7 with SMTP id wr7so71982922obb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 17:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=1Fi9ExVQHQoNq/dXw0IvUBHhs377xvbZehZT1n4rdN4=;
	b=NZkS6b+mzdnfwCFglzKVuNW3v/AuJKi3Vmsakm5oAZXN9m5WYmYnuGDxoFa2Ry5k4M
	GZK1Skb3ZCK+6zIV0FPuXq+u4mJsD98EUxvyGUrCeqK0wotw6iwcBlsYvHEMTbT9KQbq
	y9JHOpivl2fHm0sMn8KHjuf7bVWGBy1CvjsVT1NRgrme4Er76suciocrrBZ2Po1kv+wn
	o0z3BAeOe36TwhUW+PWUyWaKcC0OV0M7Z+DFwZe5AIR7SWw8BVaqEik4x3vVS789eejE
	wBsybvIB9rWGghAXNyHBuNQci4k3vQ6L3l7rZkar2f4RXD6qJXobWVPmiEyGCMYCCGyN
	w/dQ==
MIME-Version: 1.0
X-Received: by 10.182.39.194 with SMTP id r2mr10882189obk.20.1440204264096;
	Fri, 21 Aug 2015 17:44:24 -0700 (PDT)
Received: by 10.202.21.132 with HTTP; Fri, 21 Aug 2015 17:44:24 -0700 (PDT)
In-Reply-To: <1440199709-23502-1-git-send-email-andrea.adami@gmail.com>
References: <1440199709-23502-1-git-send-email-andrea.adami@gmail.com>
Date: Fri, 21 Aug 2015 17:44:24 -0700
Message-ID: <CAJ86T=XmEdEQWhpSR9nZsnqn+pZqBdZmNqtfnKfXDx52CGXaxw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtd-utils: add dependency on acl
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
X-List-Received-Date: Sat, 22 Aug 2015 00:44:26 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 21, 2015 at 4:28 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> After commit 24fde4d do_compile fails:
>
> | mkfs.jffs2.c:70:21: fatal error: sys/acl.h: No such file or directory
> |  #include <sys/acl.h>
>
> Adding acl to the list of dependencies fixes the build.

Unconditionally enabling xattr and acl support is OK for the native
build, but for the target both should probably be conditional on their
respective DISTRO_FEATURES.


> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  meta/recipes-devtools/mtd/mtd-utils_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> index 8d4892a..72ce9ed 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
> @@ -5,7 +5,7 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>                      file://include/common.h;beginline=1;endline=17;md5=ba05b07912a44ea2bf81ce409380049c"
>
> -DEPENDS = "zlib lzo e2fsprogs util-linux"
> +DEPENDS = "zlib lzo e2fsprogs util-linux acl"
>
>  PV = "1.5.1+git${SRCPV}"
>
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

