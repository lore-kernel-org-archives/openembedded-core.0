Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2D1EB6B8D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 21:23:21 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id hu19so8907493vcb.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 14:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=vhL8llHmiUNQ3Zp2FJmXyTXezdBPPnehdVNxScWxihc=;
	b=ch9HdMHXC9kVahNYWtBerYQL4SDGsQZ/Si9lLQNOe4H6SNzYmm/aQgrn++uvDGRdQO
	jJSJQ3V7b4wTrRPXjttzDt58rvczafkHAFZghaK/JOLGW3FqpKji6AROaeJhJM2heTiW
	hsDM55J9PmEjfWwOu63PAb3bPQMuXxtq+u9uYHEN7EKqquX/n3IfXdA3dWcnr5fZ+Neg
	VlDlTdVO9DjY3F5Rlgr2A5urGT2ZICm615k6i7AYtlF2GrfC9m/GNUErPdOub7b+H0Au
	NHLNaD339yJiJw5fA8KCISbGsH1KOCNQd9mNQ/DgX6L9OFbZ2KCkZ68+xly9WH8KD1EM
	PyuA==
X-Received: by 10.59.7.228 with SMTP id df4mr25428307ved.11.1396301001624;
	Mon, 31 Mar 2014 14:23:21 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Mon, 31 Mar 2014 14:22:41 -0700 (PDT)
In-Reply-To: <7bb935ada71d07f3496a2ff8d2d73fe003e09a4f.1395816581.git.liezhi.yang@windriver.com>
References: <cover.1395816581.git.liezhi.yang@windriver.com>
	<7bb935ada71d07f3496a2ff8d2d73fe003e09a4f.1395816581.git.liezhi.yang@windriver.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Mon, 31 Mar 2014 22:22:41 +0100
X-Google-Sender-Auth: ub1TqTbvNxhJ--VwQhl-ArrAyk8
Message-ID: <CANyK_8dNLRkz68AzGTQhOCx_rX=rzJhAjiRfKbyzHjkA28=UQA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] util-linux-native: fix qsort_r for CentOS 5.10
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
X-List-Received-Date: Mon, 31 Mar 2014 21:23:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 26 March 2014 07:01, Robert Yang <liezhi.yang@windriver.com> wrote:
> The qsort_r() was added to glibc in version 2.8, so there is no qsort_r() on
> the host like CentOS 5.x, use qsort() to fix it since they are nearly
> identical.
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../util-linux/util-linux-native-qsort.patch       |   34 ++++++++++++++++++++
>  meta/recipes-core/util-linux/util-linux_2.24.1.bb  |    4 ++-
>  2 files changed, 37 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch
>
> diff --git a/meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch b/meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch
> new file mode 100644
> index 0000000..1707683
> --- /dev/null
> +++ b/meta/recipes-core/util-linux/util-linux/util-linux-native-qsort.patch
> @@ -0,0 +1,34 @@
> +From f220d809be1baa654503bf6ff52f3630b0d7015c Mon Sep 17 00:00:00 2001
> +From: Robert Yang <liezhi.yang@windriver.com>
> +Date: Wed, 26 Mar 2014 01:30:29 +0000
> +Subject: [PATCH] sun.c: use qsort() to instead of qsort_r()
> +
> +qsort_r() was added to glibc in version 2.8, so there is no qsort_r() on
> +the host like CentOS 5.x.
> +
> +Upstream-Status: Inappropriate [Other]
> +
> +Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> +---
> + libfdisk/src/sun.c | 5 ++---
> + 1 file changed, 2 insertions(+), 3 deletions(-)
> +
> +diff --git a/libfdisk/src/sun.c b/libfdisk/src/sun.c
> +index e73c701..f7899ec 100644
> +--- a/libfdisk/src/sun.c
> ++++ b/libfdisk/src/sun.c
> +@@ -427,9 +427,8 @@ static int sun_verify_disklabel(struct fdisk_context *cxt)
> +         else
> +             array[i] = -1;
> +     }
> +-    qsort_r(array,ARRAY_SIZE(array),sizeof(array[0]),
> +-        (int (*)(const void *,const void *,void *)) verify_sun_cmp,
> +-        verify_sun_starts);
> ++    qsort(array,ARRAY_SIZE(array),sizeof(array[0]),
> ++        (int (*)(const void *,const void *)) verify_sun_cmp);

I've just been looking at this for building util-linux on top of musl
(as musl-libc doesn't implement qsort_r)
and my solution was to import a qsort_r implementation from ccl
(https://ccl.googlecode.com/svn/trunk/qsort_r.c).

Are you sure this solution works? verify_sun_cmp takes 3 parameters
not 2 and it uses the 3rd parameter (data). From reading this I'd
imagine a segfault is likely to occur in verify_sun_cmp if qsort is
used instead of qsort_r.

> +
> +     if (array[0] == -1) {
> +       fdisk_info(cxt, _("No partitions defined."));
> +--
> +1.8.2.1
> +
> diff --git a/meta/recipes-core/util-linux/util-linux_2.24.1.bb b/meta/recipes-core/util-linux/util-linux_2.24.1.bb
> index aa98b65..ab80ab6 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.24.1.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.24.1.bb
> @@ -4,7 +4,9 @@ require util-linux.inc
>  # To support older hosts, we need to patch and/or revert
>  # some upstream changes.  Only do this for native packages.
>  OLDHOST = ""
> -OLDHOST_class-native = "file://util-linux-native.patch"
> +OLDHOST_class-native = "file://util-linux-native.patch \
> +                        file://util-linux-native-qsort.patch \
> +                       "
>
>  SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
>              file://util-linux-ng-2.16-mount_lock_path.patch \
> --
> 1.7.10.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

Thanks,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

