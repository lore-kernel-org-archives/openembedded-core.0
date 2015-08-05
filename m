Return-Path: <armccurdy@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3AFF260017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 19:42:19 +0000 (UTC)
Received: by wibxm9 with SMTP id xm9so81455196wib.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 12:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=4dTFoemcL0zmOD7N/nLXlsmK8jNbsuhzPsJSNOiCHgc=;
	b=cqVf3RJEfINn0/hUHCXcqISQUn3HiXAaxxQx1QYJy1ny4OvgUmyxU0yX7sqZZQTAam
	aVEhs1By7+dN/akJaM5/P/dabXz0YUzj0vkJiZ9RDQykZf5t0Exh9jMTWmQa+oRWNM6E
	9ZNRCU6fu6U7IwF6YCQG+I9krP0QSXJjrO0e7h/c5hlqh/nV950UNWNovPR+S3TbHmnR
	btuiWuCARTntPMHLo3qPrGhSkQ+qwC/jQijtsGz5cN0sl5bwrx6w1Mk89oeunJEs46dt
	x84HecdG6uSaKOZwx1jyMQrD0+e45G2W9IlFipWjax5TBdpp5BvSk0/or5twkVnG3cKQ
	gLnQ==
MIME-Version: 1.0
X-Received: by 10.180.83.135 with SMTP id q7mr1724515wiy.17.1438803739159;
	Wed, 05 Aug 2015 12:42:19 -0700 (PDT)
Received: by 10.194.236.166 with HTTP; Wed, 5 Aug 2015 12:42:19 -0700 (PDT)
In-Reply-To: <1436948199-11071-1-git-send-email-armccurdy@gmail.com>
References: <1436948199-11071-1-git-send-email-armccurdy@gmail.com>
Date: Wed, 5 Aug 2015 12:42:19 -0700
Message-ID: <CAJ86T=XcWibhbPwt5zk84iZYS0URyvSQ-AvPb4T5GyD9oPmRPA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bash_3.2.48: dont include target CFLAGS in host LDFLAGS
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
X-List-Received-Date: Wed, 05 Aug 2015 19:42:21 -0000
Content-Type: text/plain; charset=UTF-8

Ping.

On Wed, Jul 15, 2015 at 1:16 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> Building the host tool 'mkbuiltins' will fail if the target CFLAGS
> contains an option which isn't supported by the host's gcc. To prevent
> the issue, define LDFLAGS_FOR_BUILD based on CFLAGS_FOR_BUILD instead
> of CFLAGS.
>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>  ...ont-include-target-CFLAGS-in-host-LDFLAGS.patch | 33 ++++++++++++++++++++++
>  meta/recipes-extended/bash/bash_3.2.48.bb          |  1 +
>  2 files changed, 34 insertions(+)
>  create mode 100644 meta/recipes-extended/bash/bash-3.2.48/dont-include-target-CFLAGS-in-host-LDFLAGS.patch
>
> diff --git a/meta/recipes-extended/bash/bash-3.2.48/dont-include-target-CFLAGS-in-host-LDFLAGS.patch b/meta/recipes-extended/bash/bash-3.2.48/dont-include-target-CFLAGS-in-host-LDFLAGS.patch
> new file mode 100644
> index 0000000..ee756dc
> --- /dev/null
> +++ b/meta/recipes-extended/bash/bash-3.2.48/dont-include-target-CFLAGS-in-host-LDFLAGS.patch
> @@ -0,0 +1,33 @@
> +From 933bd886af49667e88e2385409449ab598813dab Mon Sep 17 00:00:00 2001
> +From: Andre McCurdy <armccurdy@gmail.com>
> +Date: Wed, 15 Jul 2015 00:54:33 -0700
> +Subject: [PATCH] dont include target CFLAGS in host LDFLAGS
> +
> +Building the host tool 'mkbuiltins' will fail if the target CFLAGS
> +contains an option which isn't supported by the host's gcc. To prevent
> +the issue, define LDFLAGS_FOR_BUILD based on CFLAGS_FOR_BUILD instead
> +of CFLAGS.
> +
> +Upstream-Status: Inappropriate [required for bash 3.2.57 (GPLv2) recipe only]
> +
> +Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> +---
> + builtins/Makefile.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/builtins/Makefile.in b/builtins/Makefile.in
> +index e027f7a..ebfddf3 100644
> +--- a/builtins/Makefile.in
> ++++ b/builtins/Makefile.in
> +@@ -63,7 +63,7 @@ LOCAL_DEFS = @LOCAL_DEFS@
> +
> + LIBS = @LIBS@
> + LDFLAGS = @LDFLAGS@ $(LOCAL_LDFLAGS) $(CFLAGS)
> +-LDFLAGS_FOR_BUILD = $(LDFLAGS)
> ++LDFLAGS_FOR_BUILD = @LDFLAGS_FOR_BUILD@ $(LOCAL_LDFLAGS) $(CFLAGS_FOR_BUILD)
> + LOCAL_LDFLAGS = @LOCAL_LDFLAGS@
> + #LIBS_FOR_BUILD = @LIBS_FOR_BUILD@
> + LIBS_FOR_BUILD = $(LIBS)
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-extended/bash/bash_3.2.48.bb b/meta/recipes-extended/bash/bash_3.2.48.bb
> index 34272d1..d42b292 100644
> --- a/meta/recipes-extended/bash/bash_3.2.48.bb
> +++ b/meta/recipes-extended/bash/bash_3.2.48.bb
> @@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/bash/bash-${PV}.tar.gz;name=tarball \
>             file://build-tests.patch \
>             file://test-output.patch \
>             file://run-ptest \
> +           file://dont-include-target-CFLAGS-in-host-LDFLAGS.patch \
>            "
>
>  SRC_URI[tarball.md5sum] = "338dcf975a93640bb3eaa843ca42e3f8"
> --
> 1.9.1
>

