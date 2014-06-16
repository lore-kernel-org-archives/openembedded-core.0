Return-Path: <andrea.adami@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id 84CFF6FEBB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 11:31:19 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id z11so481703lbi.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jun 2014 04:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fnTr3+rjl/3lLfJmB7SNotOCIfHi+E+1rEqP31izeJA=;
	b=eZnCQIg9xhHdv4+ZR4LmBtbFg4HeQuakjXbPaCl5rXtr49l5AorgaAr/KMGqXeK6dy
	wpR3keaLSOYx8guygo/GcmqvHp4uuHdKKDij5796sCwGM/V2Ej163wpHb41da0ubNJbd
	JwIbAYST4p49+CNl+7GzJjcpYVEtrEJpFt4EGj8nHiK4dMNZF3UTp7QMojV8FqROOS/Y
	qXYewwAMgum+516xztuAT1EEc3iTNEySuQyY9NOT4ai8VDUHSFB0ZqoTH/EUnfZIBKvs
	rtWRnl9D2gO+jIx2SPFX6YpOnnA5NFMsx1vTXpVhNcQn8g2m23UA42qdUlHJxW2jwTrE
	CxDw==
MIME-Version: 1.0
X-Received: by 10.112.198.102 with SMTP id jb6mr12801566lbc.18.1402918278824; 
	Mon, 16 Jun 2014 04:31:18 -0700 (PDT)
Received: by 10.112.16.227 with HTTP; Mon, 16 Jun 2014 04:31:18 -0700 (PDT)
In-Reply-To: <1402888827-4210-1-git-send-email-Chong.Lu@windriver.com>
References: <1402888827-4210-1-git-send-email-Chong.Lu@windriver.com>
Date: Mon, 16 Jun 2014 13:31:18 +0200
Message-ID: <CAAQYJAszfURs-yhB2jj74o0Rt3RwAz=S84QgG2xX6=AwKt7mYw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kexec-tools: fix warning about patch could not be found
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
X-List-Received-Date: Mon, 16 Jun 2014 11:31:25 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 16, 2014 at 5:20 AM, Chong Lu <Chong.Lu@windriver.com> wrote:
> kexec-tools-klibc required kexec-tools.inc file. Put the patch of
> kexec-tools into bb file in order to fixing QA warning about files path.
> The patch only needed by kexec-tools.
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>  meta/recipes-kernel/kexec/kexec-tools.inc      |    3 +--
>  meta/recipes-kernel/kexec/kexec-tools_2.0.6.bb |    2 ++
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/kexec/kexec-tools.inc b/meta/recipes-kernel/kexec/kexec-tools.inc
> index 6a690c6..50b448c 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools.inc
> +++ b/meta/recipes-kernel/kexec/kexec-tools.inc
> @@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
>                      file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09"
>  DEPENDS = "zlib xz"
>
> -SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz \
> -           file://kexec-tools-Refine-kdump-device_tree-sort.patch"
> +SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/kexec/kexec-tools-${PV}.tar.gz"
>
>  inherit autotools-brokensep
>
> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.6.bb b/meta/recipes-kernel/kexec/kexec-tools_2.0.6.bb
> index 38a8947..5321dd4 100644
> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.6.bb
> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.6.bb
> @@ -2,6 +2,8 @@ require kexec-tools.inc
>  export LDFLAGS = "-L${STAGING_LIBDIR}"
>  EXTRA_OECONF = " --with-zlib=yes"
>
> +SRC_URI += "file://kexec-tools-Refine-kdump-device_tree-sort.patch"
> +
>  SRC_URI[md5sum] = "c39ea40a7598e49b6dc961ee7de38f57"
>  SRC_URI[sha256sum] = "a9c6cd9adc8c1c37b3272782f581cb8b4b4070d0e3e921a558a9083f68dcf29a"
>
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

I've noticed the kexec-tools-klibcd warning only saturday and while
I'm planning to update the klibc recipe soon (hard work and not many
users apparently...) I appreciate your quick fix in the main recipe.
Unfortunately this specific recipe cannot be easilly BBCLASSEXTEND'ed
to klibc like others...

Thanks

Acked-by: Andrea Adami <andrea.adami@gmail.com>

