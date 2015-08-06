Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8D97075794
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Aug 2015 03:34:17 +0000 (UTC)
Received: by igbpg9 with SMTP id pg9so3453851igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 20:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=s2lWjDEax+puZ7u/HNX9uwKvaweKqrpxHtSV/f99gCU=;
	b=hE5O+UeKNKhV2UyrLGPsC+XaV9eiEe2aHYg3kxWYlac9f0h/xdtTMzERcw8oKCH2JI
	FPxFRCJJyvDsdrU9zPRLa51Nto+A2pu2D9sEWPAEH+jJs0PhqbNLiBjjdVeF6gjegbWP
	/EI/L+dFMNRSnc6BzJSOg/WY8Q4iB7Cii+4nzZpXgLptCqpA+Lm9JcGQSc+kCssqIfw6
	UYpXKEXNVDiEKrvf6seIPuoVpSeYLg+V3NmdESkhtoMBL9e8dvXlPAJKoz0sWagjQbSb
	Uz5Dq9sVrtUVznoGUlhMiDarY+tVVm47B3fbvqehvyhEYjLxXIeiGw9OgARHPggcGehs
	XvAg==
X-Received: by 10.50.39.17 with SMTP id l17mr975720igk.75.1438832057503; Wed,
	05 Aug 2015 20:34:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Wed, 5 Aug 2015 20:33:48 -0700 (PDT)
In-Reply-To: <1438765311-13423-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1438765311-13423-1-git-send-email-ed.bartosh@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Aug 2015 20:33:48 -0700
Message-ID: <CAMKF1sra8sykgB4q5+qQd4hL2fPOxfuND7W-WivqS_YxYPfvWw@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] create-pull-request: cd to relative directory
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
X-List-Received-Date: Thu, 06 Aug 2015 03:34:19 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 5, 2015 at 2:01 AM, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> create-pull-request -d path creates empty patches if directory
> is specified as a path, i.e. ./bitbake or ./bitbake/ or full path.
> It behaves expected way only if script is run with -d bitbake, i.e.
> relative dir name doesn't contain '\'.
>
> Fixed this unwanted behaviour by changing directory and running
> git format-patch in it with --relative, without specifying
> relative path as a parameter.
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  scripts/create-pull-request | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/create-pull-request b/scripts/create-pull-request
> index 216edfd..7eac618 100755
> --- a/scripts/create-pull-request
> +++ b/scripts/create-pull-request
> @@ -177,12 +177,15 @@ mkdir $ODIR
>
>  if [ -n "$RELDIR" ]; then
>         ODIR=$(realpath $ODIR)
> -       extraopts="--relative=$RELDIR"
> +       pushd $RELDIR

can we avoid using pushd so it works with non bash shells too ?

> +       extraopts="--relative"
>  fi
>
>  # Generate the patches and cover letter
>  git format-patch $extraopts -M40 --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --cover-letter $RELATIVE_TO..$COMMIT_ID > /dev/null
>
> +[ -n "$RELDIR" ] && popd
> +
>  # Customize the cover letter
>  CL="$ODIR/0000-cover-letter.patch"
>  PM="$ODIR/pull-msg"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

