Return-Path: <rep.dot.nop@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 71DDA60053
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 13:25:54 +0000 (UTC)
Received: by igxx6 with SMTP id x6so13894510igx.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 06:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vdPCwgLCvMfy5snR07+2m41amWsya6xrljQBTP4nzy8=;
	b=OJ+OPyfom1bUxjcUxtI7OjvnImBPRfE1fNOSHzkU8UyRDw9tLZ0P3r/1HFK6c+TRl1
	50P/TzlczuiF3MZhPkZv2TFzXjdM6nLq8EdHUWlNn6t7/FJmXbEXY42hISI8rbDSLP/K
	guGY1KVZA2Mb1csXB81SNp/0UvgH0dPSh7hy9Uh7R6iNcMx5r7nj52S+0e0X/f4bV1ck
	bvvwwwKtfZqNu8mULeQOWvY7zs9u/8cOvZdcSmCAfEfG6DEw2Od+y2ot6u1o0PZu/8Q3
	uX7SA6x0/O8zAzW6Cii5AOqoPjsK2jw0XjDMy9zvmzq3IWfiaPoi7aqyc3aru7T+0vXi
	VORw==
MIME-Version: 1.0
X-Received: by 10.50.73.41 with SMTP id i9mr52191491igv.14.1441805154924; Wed,
	09 Sep 2015 06:25:54 -0700 (PDT)
Received: by 10.36.101.147 with HTTP; Wed, 9 Sep 2015 06:25:54 -0700 (PDT)
In-Reply-To: <4f42995bde754f4fe83329c59f487810d2324854.1441299182.git.raj.khem@gmail.com>
References: <cover.1441299182.git.raj.khem@gmail.com>
	<4f42995bde754f4fe83329c59f487810d2324854.1441299182.git.raj.khem@gmail.com>
Date: Wed, 9 Sep 2015 15:25:54 +0200
Message-ID: <CAC1BbcRjQbd_py7Tv+TPDG2fcsbh9zO6328HX50wXS9KrxHYng@mail.gmail.com>
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] busybox: Use UTMPX instead of legacy UTMP
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
X-List-Received-Date: Wed, 09 Sep 2015 13:25:59 -0000
Content-Type: text/plain; charset=UTF-8

On 3 September 2015 at 18:54, Khem Raj <raj.khem@gmail.com> wrote:
> This makes busybox honor UTMPX feature if available in a libc
>
> [YOCTO #8243]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../busybox/0001-Switch-to-POSIX-utmpx-API.patch   | 388 +++++++++++++++++++++
>  meta/recipes-core/busybox/busybox_1.23.2.bb        |   1 +
>  2 files changed, 389 insertions(+)
>  create mode 100644 meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch
>
> diff --git a/meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch b/meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch
> new file mode 100644
> index 0000000..1d299ee
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/0001-Switch-to-POSIX-utmpx-API.patch
> @@ -0,0 +1,388 @@
> +From 86a7f18f211af1abda5c855d2674b0fcb53de524 Mon Sep 17 00:00:00 2001
> +From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
> +Date: Thu, 2 Apr 2015 23:03:46 +0200
> +Subject: [PATCH] *: Switch to POSIX utmpx API
> +
> +UTMP is SVID legacy, UTMPX is mandated by POSIX.
> +
> +Glibc and uClibc have identical layout of UTMP and UTMPX, both of these
> +libc treat _PATH_UTMPX as _PATH_UTMP so from a user-perspective nothing
> +changes except the names of the API entrypoints.


Ontop of this you might also need
http://git.busybox.net/busybox/commit/?id=7d86384b246434e72533332f7f409a7aa9efeacb
unless you can guarantee a uClibc rebuild with utmpx support enabled
at the same time.

Thanks and cheers,

