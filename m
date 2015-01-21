Return-Path: <danismostlikely@gmail.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id E7BC971144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 19:29:22 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id x12so34348627qac.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Jan 2015 11:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=j92YhFHsfx9UyYr6fl+5XPsYg8EzlvFBDh/Wj21EdwY=;
	b=xboGjxTU6Ov/7aaCC7tcmW3DhamKDxHvpyZu8JWaTNYIvDgbE4AQ766pInSYYBNdrC
	W5dGRidBC4dhDq2FokErN4dxv8/9+XgkCq80iByoiSCDDWnENoqtGc3aMPT9McQsemLp
	1xp+3hRzHFykr1BeNUqa62WLT7crbiF9YlKlQegHilyJ0m9CWtEDXG1y3yRDDjszPKNg
	yc5jA18Qx3o0HOHkJG3mADlEXPBOxMLEVwJphwzC/JevoBeJnSPAY2rEFUzEmSnWlb6y
	n++VI28wlwmEupNi0B/1CQmR6BwkH62QrxEdm1DVdY0MFGfSor360kYj4WIvuQcMr243
	NQaw==
MIME-Version: 1.0
X-Received: by 10.140.96.225 with SMTP id k88mr45123053qge.104.1421868563131; 
	Wed, 21 Jan 2015 11:29:23 -0800 (PST)
Received: by 10.96.30.35 with HTTP; Wed, 21 Jan 2015 11:29:23 -0800 (PST)
In-Reply-To: <1421864706-26101-1-git-send-email-paul.gortmaker@windriver.com>
References: <1421864706-26101-1-git-send-email-paul.gortmaker@windriver.com>
Date: Wed, 21 Jan 2015 13:29:23 -0600
Message-ID: <CACS+7ZSzfPxwYc1ksmzLk-f5dOuk_Ng4WC8BWy03ofnAx1UUmA@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files/profile: change EDITOR to not be busybox specific
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
X-List-Received-Date: Wed, 21 Jan 2015 19:29:25 -0000
Content-Type: text/plain; charset=UTF-8

On 21 January 2015 at 12:25, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> Setting "EDITOR=/bin/vi" breaks on non-busybox systems, as
> vim will populate /usr/bin/vi instead, and you get stuff like:
>
>   op3:~/poky/meta-builder$ git commit -s
>   error: cannot run /bin/vi: No such file or directory
>   error: unable to start editor '/bin/vi'
>   Please supply the message using either -m or -F option.
>   op3:~/poky/meta-builder$ which vi
>   /usr/bin/vi
>   op3:~/poky/meta-builder$
>
> Since we've already specified a proper path above in the profile,
> we've no need to call out where in the path vi lives, and hence
> this will work with busybox and a full vim install w/o busybox.
>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  meta/recipes-core/base-files/base-files/profile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
> index 88ab8d877b0d..53c2680409dd 100644
> --- a/meta/recipes-core/base-files/base-files/profile
> +++ b/meta/recipes-core/base-files/base-files/profile
> @@ -2,7 +2,7 @@
>  # and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).
>
>  PATH="/usr/local/bin:/usr/bin:/bin"
> -EDITOR="/bin/vi"                       # needed for packages like cron
> +EDITOR="vi"                    # needed for packages like cron, git-commit
>  test -z "$TERM" && TERM="vt100"        # Basic terminal capab. For screen etc.
>
>  if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then

While I agree with this change, arguably busybox should also be
changed. Everywhere I look "vi" lives in /usr/bin. FreeBSD, NetBSD,
Ubuntu, and Slackware all seem to put vi in /usr/bin.

The same is true of getopt.

What are other people's thoughs?

