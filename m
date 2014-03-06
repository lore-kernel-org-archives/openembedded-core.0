Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id B6AAD6F58A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 14:09:31 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id hr17so1783449lab.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Mar 2014 06:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=jIcjaprijrESBhK24ntgUlt7TPbXWBweCB2jnqm4/fY=;
	b=yX5iwBqL2OIAx/7rWuTSBHit2Q0pGvzwOVIUlxQ0D3ewi1reZkLXp/UYISUakD6b2T
	Jvth8vWL38gR2vDhZGA4jG9vI1PiGZPWj5EqwGMaBfAW4j0oO3cAmeyDZGF4wMiG0bBk
	wxOv6iwkb8DFxb8w3BchpBt31NsulLt4ju5u2wVBr6DFLR9fikfzaEBMQit23KJtF1xm
	cov0bBuqSaVrFJ2KOj684yA8Rn+G7+SD/y42ul6BzYe5x9lXr//mQLn0yvxse9syMO1A
	zaZFa2Ls8EGCroK78y8M3SINQlLMzNKU6ZVnRLskxLDfyAFYcKdbbqO0rZPamnUn3n1j
	DFWg==
MIME-Version: 1.0
X-Received: by 10.152.115.132 with SMTP id jo4mr24035lab.69.1394114971388;
	Thu, 06 Mar 2014 06:09:31 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Thu, 6 Mar 2014 06:09:31 -0800 (PST)
In-Reply-To: <1394103874-32687-1-git-send-email-matt@console-pimps.org>
References: <1394103874-32687-1-git-send-email-matt@console-pimps.org>
Date: Thu, 6 Mar 2014 09:09:31 -0500
Message-ID: <CADkTA4MfDZqM-8DUAR0VEyuBaR7sxVbjMaG0JguSt7zysHgxwg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Matt Fleming <matt@console-pimps.org>
Cc: Matt Fleming <matt.fleming@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel-yocto: Disable ANSI escape codes from git branch
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
X-List-Received-Date: Thu, 06 Mar 2014 14:09:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 6, 2014 at 6:04 AM, Matt Fleming <matt@console-pimps.org> wrote:
> From: Matt Fleming <matt.fleming@intel.com>
>
> 'git branch' may use ANSI escape codes in its output (to provide colour)
> which doesn't play well with commands expecting pure plain text, e.g.
>
>     fatal: '^[[31mmaster^[[m' is not a valid branch name.
>
> Use the --no-color option to ensure all branch names are plain text.

Thanks for the low footprint version.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Matt Fleming <matt.fleming@intel.com>
> ---
>
> v2: Make the minimum change necessary to disable the escape codes per
>     Bruce's suggestion.
>
>  meta/classes/kernel-yocto.bbclass | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index fb8e04e..7913dd8 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -196,7 +196,7 @@ do_kernel_checkout() {
>                 # If KMETA is defined, the branch must exist, but a machine branch
>         # can be missing since it may be created later by the tools.
>         if [ -n "${KMETA}" ]; then
> -               git branch -a | grep -q ${KMETA}
> +               git branch -a --no-color | grep -q ${KMETA}
>                 if [ $? -ne 0 ]; then
>                         echo "ERROR. The branch '${KMETA}' is required and was not"
>                         echo "found. Ensure that the SRC_URI points to a valid linux-yocto"
> @@ -214,7 +214,7 @@ do_kernel_checkout() {
>         fi
>
>         # convert any remote branches to local tracking ones
> -       for i in `git branch -a | grep remotes | grep -v HEAD`; do
> +       for i in `git branch -a --no-color | grep remotes | grep -v HEAD`; do
>                 b=`echo $i | cut -d' ' -f2 | sed 's%remotes/origin/%%'`;
>                 git show-ref --quiet --verify -- "refs/heads/$b"
>                 if [ $? -ne 0 ]; then
> --
> 1.8.5.3
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

