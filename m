Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 89E2477BC9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 13:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491400357; x=1522936357;
	h=message-id:subject:from:to:cc:date:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=335T9yy/lDxRFLfs592sLL6PDG6QvTyK/TsvbP0614o=;
	b=sglRt0jStfE3EGHzGqS2T2ScUrizhavtj+dLroBuUkUXSUf0lRDsAzgb
	aBmc8BINGMsYlIslCOMrDB0qboI/NQ==;
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Apr 2017 06:52:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,278,1486454400"; d="scan'208";a="1131356127"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2017 06:52:35 -0700
Message-ID: <1491400856.5062.17.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Jose Lamego <jose.a.lamego@linux.intel.com>
Date: Wed, 05 Apr 2017 09:00:56 -0500
In-Reply-To: <1491342309-16373-1-git-send-email-jose.a.lamego@linux.intel.com>
References: <1491342309-16373-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] create-pull-request: add "-t in-reply-to" option
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
X-List-Received-Date: Wed, 05 Apr 2017 13:52:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-04-04 at 16:45 -0500, Jose Lamego wrote:
> The create-patch-request script creates patches as replies to a cover

you mean create-pull-request, I believe

> letter, in the form of an email thread. If further revisions are sent to
> the mailing list without referencing to the first revision, these new
> revisions are not identified at the mailing list as part of the original
> thread, but as a new thread instead.
> 
> This change adds the "[-t in_reply_to]" option, where "in_reply_to" is
> the original cover letter's Message-Id, so this reference is added
> to the new cover letter to ensure the thread continuity.
> 


BTW, is there an easy way to get the in-reply-to email besides using
git-pw or looking at the message source?

Some comments in patch:




> [YOCTO #11294]
> 
> Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
> ---
>  scripts/create-pull-request | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/create-pull-request b/scripts/create-pull-request
> index e82858b..46d6538 100755
> --- a/scripts/create-pull-request
> +++ b/scripts/create-pull-request
> @@ -34,7 +34,7 @@ RFC=0
>  usage() {
>  CMD=$(basename $0)
>  cat <<EOM
> -Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to] [-i commit_id] [-d relative_dir] -u remote [-b branch]
> +Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to] [-i commit_id] [-d relative_dir] -u remote [-b branch] [-t in_reply_to]
>    -b branch           Branch name in the specified remote (default: current branch)
>    -l local branch     Local branch name (default: HEAD)
>    -c                  Create an RFC (Request for Comment) patch series
> @@ -49,6 +49,7 @@ Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to
>    -s subject          The subject to be inserted into the summary email
>    -u remote           The git remote where the branch is located, or set CPR_CONTRIB_REMOTE in env
>    -d relative_dir     Generate patches relative to directory
> +  -t in_reply_to      Make mails appear as replies to the given Message-Id, to continue patch/series threads
>  
>   Examples:
>     $CMD -u contrib -b nitin/basic
> @@ -57,12 +58,13 @@ Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to
>     $CMD -u contrib -r master -i misc -b nitin/misc -o pull-misc
>     $CMD -u contrib -p "RFC PATCH" -b nitin/experimental
>     $CMD -u contrib -i misc -b nitin/misc -d ./bitbake
> +   $CMD -u contrib -p "OE-core][PATCH v2" -t "<cover.11146.git.john.doe@example.com>"
>  EOM
>  }
>  
>  REMOTE="$CPR_CONTRIB_REMOTE"
>  # Parse and validate arguments
> -while getopts "b:acd:hi:m:o:p:r:s:u:l:" OPT; do
> +while getopts "b:acd:hi:m:o:p:r:s:u:l:t:" OPT; do
>  	case $OPT in
>  	b)
>  		BRANCH="$OPTARG"
> @@ -108,6 +110,8 @@ while getopts "b:acd:hi:m:o:p:r:s:u:l:" OPT; do
>  	a)
>  		CPR_CONTRIB_AUTO_PUSH="1"
>  		;;
> +        t)
> +                IN_REPLY_TO="$OPTARG"

it would be nice to include also the double semi-colon, so future cases
just start after it.


>  	esac
>  done
>  
> @@ -205,7 +209,11 @@ if [ -n "$RELDIR" ]; then
>  fi
>  
>  # Generate the patches and cover letter
> -git format-patch $extraopts -M40 --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --cover-letter $RELATIVE_TO..$COMMIT_ID > /dev/null
> +if [ -z "$IN_REPLY_TO" ]; then

-n instead of -z?

> +    git format-patch $extraopts -M40 --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --in-reply-to="$IN_REPLY_TO" --cover-letter $RELATIVE_TO..$COMMIT_ID > /dev/null
> +else
> +    git format-patch $extraopts -M40 --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --cover-letter $RELATIVE_TO..$COMMIT_ID > /dev/null
> +fi
>  
>  if [ -z "$(ls -A $ODIR 2> /dev/null)" ]; then
>      echo "ERROR: $ODIR is empty, no cover letter and patches was generated!"
> -- 
> 2.7.4
> 



