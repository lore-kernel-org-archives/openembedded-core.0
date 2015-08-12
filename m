Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6743F76769
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 09:35:47 +0000 (UTC)
Received: by pawu10 with SMTP id u10so11057214paw.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 02:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=aZEk19Yo6aQQDvX3dFddMu31zCfSx41DWHCS8GIq8U0=;
	b=ov30510KWQ/cY1lbaGRJH8Sc+R+ie6b9nfRvuaun5HUVOIF7sM2pkOgvTj1J3vxDK1
	hurkfX2fteLY5Nfg+s3RUSFDibfCojgKlrAuOt6IXjZm5lYWBNt187SgqwLuT+Fknzkd
	sLLfST2EXx+5GeY6uy8YoNoyE15T8IHNmnE9uakNP0O+C3dVZUwWXNtWqOIMRlph64CI
	Ryxkvo5Abn0lAAnYBBltRwl1Ee31DlYSLv6ZeUMLr178bqz1nPUwUId9o4RfsFtGMadt
	7lp7h55zAdrq1K7Dzv8zRsB0CC/V1ZApLGrOQ+ZzgujG6CmDzLz4Zu8ErAP390pg4XNM
	ts9w==
X-Received: by 10.68.142.200 with SMTP id ry8mr65098459pbb.136.1439372147646; 
	Wed, 12 Aug 2015 02:35:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.229.35 with HTTP; Wed, 12 Aug 2015 02:35:18 -0700 (PDT)
In-Reply-To: <1439372011-26268-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1439303596-18965-1-git-send-email-ed.bartosh@linux.intel.com>
	<1439372011-26268-1-git-send-email-ed.bartosh@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Aug 2015 02:35:18 -0700
Message-ID: <CAMKF1sqCGBoheFapgX=aDLA0CoTji+-M1LaW=CyYz66-G4UXmQ@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] create-pull-request: cleanup bashisms
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
X-List-Received-Date: Wed, 12 Aug 2015 09:35:51 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 12, 2015 at 2:33 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> Made create-pull-request POSIX compatible:
>    - Replaced /bin/bash -> /bin/sh in shebang.
>    - Replaced usage of pushd/popd with generic shell commands.
>    - Tested on zsh and dash.

thanks for doing this.

>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/create-pull-request | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/create-pull-request b/scripts/create-pull-request
> index be49379..19ba588 100755
> --- a/scripts/create-pull-request
> +++ b/scripts/create-pull-request
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/bin/sh
>  #
>  # Copyright (c) 2010-2013,  Intel Corporation.
>  # All Rights Reserved
> @@ -177,14 +177,15 @@ mkdir $ODIR
>
>  if [ -n "$RELDIR" ]; then
>         ODIR=$(realpath $ODIR)
> -       pushd $RELDIR > /dev/null
> +       pdir=$(pwd)
> +       cd $RELDIR
>         extraopts="--relative"
>  fi
>
>  # Generate the patches and cover letter
>  git format-patch $extraopts -M40 --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --cover-letter $RELATIVE_TO..$COMMIT_ID > /dev/null
>
> -[ -n "$RELDIR" ] && popd > /dev/null
> +[ -n "$RELDIR" ] && cd $pdir
>
>  # Customize the cover letter
>  CL="$ODIR/0000-cover-letter.patch"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

