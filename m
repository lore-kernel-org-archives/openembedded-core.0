Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0DC6C6E442
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 17:02:27 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id s7so920146lbd.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Mar 2014 09:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=OHQeWYxmC5sR5whuh7uk/CF7ktAjqVs+t0KYC0a8hjc=;
	b=v6SI+flZkQutVJk+v6Uos4hwxAQq7tIFcqgE7/kFpRTNAPw3T/DFrOlF3KWGpCQxo3
	/JW5/j8DQjj49pyNKApzVwMuPMxZJh8a10+Qtnyh0gpsH1KomWEil5tTKgHmqzkD2vTA
	FqAkuOTQO+WOjTCgnwQq3sojV+zQDNB0Qw62OU2ZisST5L7E0T832GBwHU4dP1V+O2aj
	LkupP40MNdyH5uZwKnSONZfwyX//R0Fwai6Yypl//WU+zxpb3pTteDB+mUZ+bnFCx3fI
	tjh3xHMNR+TtUFfxB6jqMobaGob4t9U69wA+EbQZWft4avOl9NCJB1ORpfcBZM2KPCgz
	tbcg==
MIME-Version: 1.0
X-Received: by 10.112.125.225 with SMTP id mt1mr4034428lbb.35.1394038947675;
	Wed, 05 Mar 2014 09:02:27 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Wed, 5 Mar 2014 09:02:27 -0800 (PST)
In-Reply-To: <1394038191-26474-1-git-send-email-matt@console-pimps.org>
References: <1394038191-26474-1-git-send-email-matt@console-pimps.org>
Date: Wed, 5 Mar 2014 12:02:27 -0500
Message-ID: <CADkTA4M=JH7cv+kxY58sCA7vgT5O+h-u-SgAgvzqXS=qb6heqA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Matt Fleming <matt@console-pimps.org>
Cc: Matt Fleming <matt.fleming@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: Inspect remote branches with git ls-remote
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
X-List-Received-Date: Wed, 05 Mar 2014 17:02:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

Please cc' me directly on any kernel-yocto changes, I only noticed this
by chance.

On Wed, Mar 5, 2014 at 11:49 AM, Matt Fleming <matt@console-pimps.org> wrote:
> From: Matt Fleming <matt.fleming@intel.com>
>
> 'git branch' may use ANSI escape codes in its output (to provide colour)
> which doesn't play well with commands expecting pure plain text, e.g.
>
>     fatal: '^[[31mmaster^[[m' is not a valid branch name.

Nasty corner case, one I've never run into .. but that's why the --no-color
option exists. I'd prefer that it be used, and we reduce the footprint of
the change. See below.

>
> Furthermore, the output of 'git branch' is subject to change and trying
> to parse it could potentially lead to breakage in the future.

I've never had a problem with it in 7 years of the tools and their variants, so
the point is arguable and could be dropped from the commit log.

>
> Signed-off-by: Matt Fleming <matt.fleming@intel.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index fb8e04e..1115056 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -196,7 +196,7 @@ do_kernel_checkout() {
>                 # If KMETA is defined, the branch must exist, but a machine branch
>         # can be missing since it may be created later by the tools.
>         if [ -n "${KMETA}" ]; then
> -               git branch -a | grep -q ${KMETA}
> +               git ls-remote --heads 2>/dev/null | awk '{print $NF}' | grep -q ${KMETA}

cut is lighter weight than awk, and doesn't have any variants (like
awk does), so I'd
prefer cut in the pipeline versus awk. Sure that's a preference, but I
support the
class, so I get the pain when it breaks (and it has).

Good catch on the issue, like I said, I've never run into it .. but I
can definitely see
the need for the tweak.

Cheers,

Bruce

>                 if [ $? -ne 0 ]; then
>                         echo "ERROR. The branch '${KMETA}' is required and was not"
>                         echo "found. Ensure that the SRC_URI points to a valid linux-yocto"
> @@ -214,11 +214,11 @@ do_kernel_checkout() {
>         fi
>
>         # convert any remote branches to local tracking ones
> -       for i in `git branch -a | grep remotes | grep -v HEAD`; do
> -               b=`echo $i | cut -d' ' -f2 | sed 's%remotes/origin/%%'`;
> -               git show-ref --quiet --verify -- "refs/heads/$b"
> +       for i in `git ls-remote --heads 2>/dev/null | awk '{print $NF}'`; do
> +               b=`echo $i | sed 's%refs/heads/%%'`;
> +               git show-ref --quiet --verify -- "$i"
>                 if [ $? -ne 0 ]; then
> -                       git branch $b $i > /dev/null
> +                       git branch $b remotes/origin/$b > /dev/null
>                 fi
>         done
>
> --
> 1.8.5.3
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

