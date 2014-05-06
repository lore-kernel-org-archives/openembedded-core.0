Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3E66A65DDE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 17:43:36 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id rd18so10149988iec.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 May 2014 10:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6Z965uXXT9SobvmSAWCPlk5bika9miUOVmTNvsMRLDM=;
	b=dRJg/v5xALsQdTv2McHfA+Arjtu5L6NW5tDPRjEYgL9geF3xz6UBmUnp6SjZVI68AQ
	YqVueiCpqvLHkWf8bJXzWuTyJy6+YidJ3unqM7WXCpXtv9jHCMTP7T2HPDDa8hLs5PT+
	09xbrYzpn4oYw3b9Vb/ShXLFSLVw5zFtkEEXjmskCWUvuTLGHMjdwq56/gj/1hsPReOw
	sBtPnRrO863L9SUvwSyvVnOIQQxEw6eqjqlbLwC6B6izdg3lX5WSOinMih2enIxEqiEC
	zOFxKMCMSGPafDm88M9VLAO3BblMgeojnqOklQYc8YSg4bjUnPKiOK1oBk8yZkwT7s7Q
	3H4Q==
X-Received: by 10.50.78.201 with SMTP id d9mr34234614igx.17.1399398217418;
	Tue, 06 May 2014 10:43:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.74.228 with HTTP; Tue, 6 May 2014 10:43:07 -0700 (PDT)
In-Reply-To: <1399384154.12731.151.camel@ted>
References: <1399384154.12731.151.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 May 2014 10:43:07 -0700
Message-ID: <CAMKF1sqwy+Tj=0SrV+iWAiGEh_8aO7CGE0EQNRpd_DP_bUKsOA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] attr: Fix uclibc builds
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
X-List-Received-Date: Tue, 06 May 2014 17:43:37 -0000
Content-Type: text/plain; charset=UTF-8

Richard


On Tue, May 6, 2014 at 6:49 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> attr needs libintl headers and libs. Add in the missing dependency and
> the missing linker flag.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
> index 873c1ff..63964e75 100644
> --- a/meta/recipes-support/attr/attr.inc
> +++ b/meta/recipes-support/attr/attr.inc
> @@ -2,7 +2,7 @@ SUMMARY = "Utilities for manipulating filesystem extended attributes"
>  HOMEPAGE = "http://savannah.nongnu.org/projects/attr/"
>  SECTION = "libs"
>
> -DEPENDS = "ncurses"
> +DEPENDS = "ncurses virtual/libintl"
>

may be something like
http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/musl&id=6c67b40e4784e12ed6a71ab4696710b913e55455

is needed here.

Secondly we already have

LDFLAGS_append_libc-uclibc = "${@['', ' -lintl '][(d.getVar('PN',
True) == d.getVar('BPN', True)) and (d.getVar('USE_NLS', True) ==
'yes')]}"

in ea-acl.inc




>  LICENSE = "LGPLv2.1+ & GPLv2+"
>  LICENSE_${PN} = "GPLv2+"
> @@ -17,6 +17,8 @@ SRC_URI = "http://download.savannah.gnu.org/releases/attr/${BP}.src.tar.gz \
>
>  require ea-acl.inc
>
> +LDFLAGS_append_libc-uclibc = " -lintl"
> +
>  # libdir should point to .la
>  do_install_append() {
>         sed -i ${D}${libdir}/libattr.la -e \
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

