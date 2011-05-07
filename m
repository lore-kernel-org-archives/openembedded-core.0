Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QIkKe-0001vq-8R
	for openembedded-core@lists.openembedded.org;
	Sat, 07 May 2011 18:26:17 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 May 2011 09:23:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,331,1301900400"; d="scan'208";a="743751420"
Received: from unknown (HELO [10.255.12.39]) ([10.255.12.39])
	by orsmga001.jf.intel.com with ESMTP; 07 May 2011 09:23:32 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <0a674cfa8f7de53b7b75c0213a483aad0276986f.1304754527.git.raj.khem@gmail.com>
References: <cover.1304754527.git.raj.khem@gmail.com>
	<0a674cfa8f7de53b7b75c0213a483aad0276986f.1304754527.git.raj.khem@gmail.com>
Date: Sat, 07 May 2011 09:23:35 -0700
Message-ID: <1304785415.8085.6.camel@doubt>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 8/8] scripts/send-pull-request: Add CC selectively
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 07 May 2011 16:26:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-05-07 at 00:54 -0700, Khem Raj wrote:
> Currently a consolidated pull request adds all the participants
> to every patch, which in essence is good but might lose focus
> of developers who would be interested to know about the patch
> that developer contributed to. This patch fixes the script by
> extracting the to and cc information from each patch one by one
> and add it to patch mail header instead of doing a sweeping one
> pass over all patches to collect all email addresses. It should
> reduce some email traffic for developers.

This behavior was intentional. If you don't want the CC applied to the
entire series, you can just use git-send-email as this is its behavior.
In particular, it doesn't apply any of the addresses from the patches to
the cover letter, which was my primary objection.

If you would like to modify this patch to apply the entire CC list to
the cover letter, then I think you'll have addressed both of our
concerns and I'll add my Acked-by. As it is, please do not accept this
patch. I will nack it for poky and we don't want the two to diverge.

Please include the primary author/maintainer of sources/recipes/etc. on
CC.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel

> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  scripts/send-pull-request |   51 +++++++++++++++++++++++++-------------------
>  1 files changed, 29 insertions(+), 22 deletions(-)
> 
> diff --git a/scripts/send-pull-request b/scripts/send-pull-request
> index 3af2a9f..36a89f4 100755
> --- a/scripts/send-pull-request
> +++ b/scripts/send-pull-request
> @@ -29,24 +29,38 @@ EOM
>  # Collect To and CC addresses from the patch files if they exist
>  # $1: Which header to add the recipients to, "TO" or "CC"
>  # $2: The regex to match and strip from the line with email addresses
> +# $3: The patch which we are preparing to send
>  harvest_recipients()
>  {
>      TO_CC=$1
>      REGX=$2
> +    PATCH=$3
>      export IFS=$',\n'
> -    for PATCH in $PDIR/*.patch; do
> -        # Grab To addresses
> -        for EMAIL in $(sed '/^---$/q' $PATCH | grep -e "$REGX" | sed "s/$REGX//"); do
> -            if [ "$TO_CC" == "TO" ] && [ "${TO/$EMAIL/}" == "$TO" ] && [ -n "$EMAIL" ]; then
> -                if [ -z "$TO" ]; then TO=$EMAIL; else TO="$TO,$EMAIL"; fi
> -            elif [ "$TO_CC" == "CC" ] && [ "${CC/$EMAIL/}" == "$CC" ] && [ -n "$EMAIL" ]; then
> -                if [ -z "$CC" ]; then CC=$EMAIL; else CC="$CC,$EMAIL"; fi
> -            fi
> -        done
> +    # Grab To addresses
> +    for EMAIL in $(sed '/^---$/q' $PATCH | grep -e "$REGX" | sed "s/$REGX//"); do
> +        if [ "$TO_CC" == "TO" ] && [ "${TO/$EMAIL/}" == "$TO" ] && [ -n "$EMAIL" ]; then
> +           if [ -z "$TO" ]; then TO=$EMAIL; else TO="$TO,$EMAIL"; fi
> +        elif [ "$TO_CC" == "CC" ] && [ "${CC/$EMAIL/}" == "$CC" ] && [ -n "$EMAIL" ]; then
> +           if [ -z "$CC" ]; then CC=$EMAIL; else CC="$CC,$EMAIL"; fi
> +        fi
>      done
>      unset IFS
>  }
>  
> +# $1: The given patch
> +create_recipient_lists()
> +{
> +    THEPATCH=$1
> +    # Harvest emails from the generated patch and populate the TO and CC variables
> +    # In addition to To and CC headers/lines, the common Signed-off-by, Tested-by,
> +    # etc. (*-by) will be added to CC.
> +    if [ $AUTO -eq 1 ]; then
> +        harvest_recipients TO "^[Tt][Oo]: *" $THEPATCH
> +        harvest_recipients CC "^[Cc][Cc]: *" $THEPATCH
> +        harvest_recipients CC "^.*-[Bb][Yy]: *" $THEPATCH
> +    fi
> +}
> +
>  
>  # Parse and verify arguments
>  while getopts "af:ghp:t:" OPT; do
> @@ -100,15 +114,6 @@ for TOKEN in SUBJECT BLURB; do
>  done
>  
> 
> -# Harvest emails from the generated patches and populate the TO and CC variables
> -# In addition to To and CC headers/lines, the common Signed-off-by, Tested-by,
> -# etc. (*-by) will be added to CC.
> -if [ $AUTO -eq 1 ]; then
> -    harvest_recipients TO "^[Tt][Oo]: *"
> -    harvest_recipients CC "^[Cc][Cc]: *"
> -    harvest_recipients CC "^.*-[Bb][Yy]: *"
> -fi
> -
>  case "$PULL_MTA" in
>      git)
>          FROM="$(git config sendemail.from)"
> @@ -158,11 +163,12 @@ if [ "$cont" == "y" ] || [ "$cont" == "Y" ]; then
>      ERROR=0
>      case "$PULL_MTA" in
>          git)
> -            export IFS=$','
> -            GIT_TO=$(for R in $TO; do echo -n "--to='$R' "; done)
> -            GIT_CC=$(for R in $CC; do echo -n "--cc='$R' "; done)
> -            unset IFS
>              for PATCH in $PDIR/*patch; do
> +                create_recipient_lists $PATCH
> +                export IFS=$','
> +                GIT_TO=$(for R in $TO; do echo -n "--to='$R' "; done)
> +                GIT_CC=$(for R in $CC; do echo -n "--cc='$R' "; done)
> +                unset IFS
>                  # We harvest the emails manually, so force git not to.
>                  eval "git send-email $GIT_TO $GIT_CC --no-chain-reply-to --suppress-cc=all $PATCH"
>                  if [ $? -eq 1 ]; then
> @@ -172,6 +178,7 @@ if [ "$cont" == "y" ] || [ "$cont" == "Y" ]; then
>              ;;
>          sendmail)
>              for PATCH in $PDIR/*patch; do
> +                create_recipient_lists $PATCH
>                  # Insert To and CC headers via formail to keep them separate and
>                  # appending them to the sendmail command as -- $TO $CC has
>                  # proven to be an exercise in futility.

-- 
Darren Hart
Yocto Linux Kernel



