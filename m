Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T2i0S-0006co-KW for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 14:19:56 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7IC7sAO017303;
	Sat, 18 Aug 2012 13:07:55 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14272-06; Sat, 18 Aug 2012 13:07:51 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7IC7juU017297
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sat, 18 Aug 2012 13:07:46 +0100
Message-ID: <1345291665.27428.36.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Sat, 18 Aug 2012 13:07:45 +0100
In-Reply-To: <9adc11ebd961b769e39d0ac664998a2de014b058.1345059176.git.bruce.ashfield@windriver.com>
References: <cover.1345059176.git.bruce.ashfield@windriver.com>
	<9adc11ebd961b769e39d0ac664998a2de014b058.1345059176.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 1/4] linux-yocto: make KBRANCH the exception and not the rule
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Aug 2012 12:19:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-15 at 16:06 -0400, Bruce Ashfield wrote:
> The kernel branch is no longer required by the yocto-kern-tools
> to locate BSP feature descriptions (it is the MACHINE:KTYPE
> descriptor), so we no longer require that the BSP branch be
> explicitly set.
> 
> If a kernel branch is explicitly set, it is now used to trigger
> a checks to ensure that the branch really is being built.
> Otherwise the branch that the machine description creates will
> be built (just as it always was).
> 
> This further simplies the use and configuration of a linux-yocto
> based kernel recipe.

[...]

>  
> -	# We have SRCREVs and we have branches so validation can continue!
> -	current=`git branch |grep \*|sed 's/^\* //'`
> -	if [ -n "$target_branch_head" ] && [ "$branch_head" != "$target_branch_head" ] &&
> -           [ "$target_branch_head" != "AUTOINC" ]; then
> -		ref=`git show ${target_branch_head} 2>&1 | head -n1 || true`
> -		if [ "$ref" = "fatal: bad object ${target_meta_head}" ]; then
> -			echo "ERROR ${target_branch_head} is not a valid commit ID."
> -			echo "The kernel source tree may be out of sync"
> -			exit 1
> -		else
> -			echo "Forcing branch $current to ${target_branch_head}"
> -			git branch -m $current $current-orig
> -			git checkout -b $current ${target_branch_head}
> -		fi
> +	containing_branches=`git branch --contains $target_branch_head | sed 's/^..//'`
> +	if [ -z "$containing_branches" ]; then
> +		echo "ERROR: SRCREV was set to \"$target_branch_head\", but no branches"
> +		echo "       contain this commit"
> +		exit 1
> +	fi
> +	ref=`git show ${target_branch_head} 2>&1 | head -n1 || true`
> +	if [ "$ref" = "fatal: bad object ${target_meta_head}" ]; then
> +	    echo "ERROR ${target_branch_head} is not a valid commit ID."
> +	    echo "The kernel source tree may be out of sync"
> +	    exit 1
>  	fi

There is a bit of uncertainty flying around at the moment about why
these changes are failing on the autobuilder. For example:

http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/560/steps/shell_138/logs/stdio

Log data follows:
| DEBUG: Executing shell function do_validate_branches
| ERROR: SRCREV was set to "1c17c082b6ee565acc176cde5be835ac4269817b", but no branches
|        contain this commit
| ERROR: Function failed: do_validate_branches

It looks like:

http://git.yoctoproject.org/cgit.cgi/poky/commit/bitbake/lib/bb/fetch2/git.py?id=64662290d3e7deb0b6093b3959c3f3eddb873893

doesn't totally fix the problem. It allows the correct revisions to be
found and sets alternatives correctly but imports the wrong branch
config.

I don't really want to have to require a patched git binary so we may
end up having to rebuild the branch structure manually.

I guess the older code cared less about the branch name and more about
the revisions being present.

Cheers,

Richard







