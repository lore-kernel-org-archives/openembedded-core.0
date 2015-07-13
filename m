Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 9B250739BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 18:43:39 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t6DIhdVH030014 for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 13:43:39 -0500
Received: from weregild.amer.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015071313433944-1106532 ;
	Mon, 13 Jul 2015 13:43:39 -0500 
From: Richard Tollerton <rich.tollerton@ni.com>
To: Ben Shelton <ben.shelton@ni.com>, openembedded-core@lists.openembedded.org
In-Reply-To: <1407178549-8464-1-git-send-email-ben.shelton@ni.com>
References: <1407178549-8464-1-git-send-email-ben.shelton@ni.com>
User-Agent: Notmuch/0.20.1 (http://notmuchmail.org) Emacs/24.5.2
	(x86_64-unknown-linux-gnu)
Date: Mon, 13 Jul 2015 13:43:39 -0500
Message-ID: <871tgbyk2s.fsf@weregild.amer.corp.natinst.com>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 07/13/2015 01:43:39 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 07/13/2015 01:43:39 PM,
	Serialize complete at 07/13/2015 01:43:39 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-07-13_10:, , signatures=0
Subject: Re: [PATCH] create-pull-request: Fix error on 2.0 versions of git
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
X-List-Received-Date: Mon, 13 Jul 2015 18:43:41 -0000
Content-Type: text/plain

Ben Shelton <ben.shelton@ni.com> writes:

> On 2.0 versions of git, the create-pull-request script exits with the
> warning "No match for commit... Are you sure you pushed 'HEAD' there?".
>
> This is due to a change in behavior where git used to guess the branch
> you meant, but no longer does.  See the thread at
> http://www.spinics.net/lists/git/msg233050.html for more information.
>
> To accommodate the new behavior, if the COMMIT_ID is set to the default
> of "HEAD", make it point explicitly to $BRANCH instead.
>
> Signed-off-by: Ben Shelton <ben.shelton@ni.com>

I still need to apply this patch in order to use create-pull-request.
Bump?

> ---
>  scripts/create-pull-request | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/scripts/create-pull-request b/scripts/create-pull-request
> index 503248b..2bf5eb5 100755
> --- a/scripts/create-pull-request
> +++ b/scripts/create-pull-request
> @@ -125,6 +125,10 @@ if [ -z "$BRANCH" ]; then
>  	echo "NOTE: Assuming remote branch '$BRANCH', use -b to override."
>  fi
>  
> +if [ "$COMMIT_ID" == "HEAD" ]; then
> +	COMMIT_ID="$BRANCH"
> +fi
> +
>  if [ -z "$REMOTE_URL" ]; then
>  	echo "ERROR: Missing parameter -u, no git remote!"
>  	usage
> -- 
> 2.0.4
>
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

