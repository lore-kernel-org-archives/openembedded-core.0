Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3662E65CBD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jul 2015 04:45:53 +0000 (UTC)
Received: by igbpg9 with SMTP id pg9so29324668igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 21:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zYqoulrNQC4KuF0Ta77rE4xoqMFxQnsdLQjEmFrlWj4=;
	b=OIRq/q9QixbAvamdKVbGCrgh2LUMqepu7KSrNLS1llPA+y0HASRK5tDG+Rv0TlMDb7
	B0UuAoVtL2lBDMcIFdkcYNnIjNSTb0r4JzC+t/7Dhkp7gNN4EXvahsN3L6JvHaWnu9GC
	rusw9jjHjnCr0nCR+bUmct9wcwzds/XjL26rUQffSTvpSCMvQqkHdsTlwGW4/MPLoKJw
	IRDr7ya6SAeqiPm9t6R8nB+tr/3r9nKYYDeFAyf0wf0uCxiSpJyZQjIBwkAd65/PWiXd
	tk6Xb+7dF76VNJnGt1k6AsOVercKvb39aj1yzdk5m/X50YPRd7KBNSfn+M6dDKk+O+PS
	xVdw==
X-Received: by 10.107.4.6 with SMTP id 6mr15650127ioe.49.1437108354121; Thu,
	16 Jul 2015 21:45:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.20.83 with HTTP; Thu, 16 Jul 2015 21:45:24 -0700 (PDT)
In-Reply-To: <7c7e76c69064f59ae5b4c6ac44235bee4332d494.1436781736.git.liezhi.yang@windriver.com>
References: <cover.1436781736.git.liezhi.yang@windriver.com>
	<7c7e76c69064f59ae5b4c6ac44235bee4332d494.1436781736.git.liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Jul 2015 21:45:24 -0700
Message-ID: <CAMKF1sqVDngrV0zZEzZcCScM+HyV+LC++VzpFtVV9ZBW0M8jSQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] glibc: print PN when bbwarn
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
X-List-Received-Date: Fri, 17 Jul 2015 04:45:55 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 13, 2015 at 3:02 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> The current warning is:
> WARNING: glibc: unable to generate header for spray.x
>
> Which is easier to debug than:
> WARNING: unable to generate header for spray.x
>
> And remove the file before generate it again to fix the warning when
> recompile:
> file `bootparam_prot.h' already exists and may be overwritten
> WARNING: unable to generate header for bootparam_prot.x
> file `nlm_prot.h' already exists and may be overwritten
> WARNING: unable to generate header for nlm_prot.x
> [snip]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc_2.21.bb |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc_2.21.bb b/meta/recipes-core/glibc/glibc_2.21.bb
> index 8197c29..30f1937 100644
> --- a/meta/recipes-core/glibc/glibc_2.21.bb
> +++ b/meta/recipes-core/glibc/glibc_2.21.bb
> @@ -135,7 +135,8 @@ do_compile () {
>                 cd ${S}/sunrpc/rpcsvc
>                 for r in ${rpcsvc}; do
>                         h=`echo $r|sed -e's,\.x$,.h,'`
> -                       rpcgen -h $r -o $h || bbwarn "unable to generate header for $r"
> +                       rm -f $h

it quashes the warning but doesnt fix underlying problem. this doesnt
seem to be right thing to do in cross builds. We use cross-rpcgen to
generate these files so this whole rpcgen run should be removed
instead. Please test such a patch and correct it.

> +                       rpcgen -h $r -o $h || bbwarn "${PN}: unable to generate header for $r"
>                 done
>         )
>         echo "Adjust ldd script"
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

