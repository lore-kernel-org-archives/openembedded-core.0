Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DE5046FCE0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Aug 2014 13:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7UDrhmQ008906; Sat, 30 Aug 2014 14:55:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id sGOFw7xxds_J; Sat, 30 Aug 2014 14:55:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7UDtdRc008915
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sat, 30 Aug 2014 14:55:41 +0100
Message-ID: <1409406941.29296.216.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Sat, 30 Aug 2014 14:55:41 +0100
In-Reply-To: <efcd26d4f457c8f5f658a1a3ab9e5c2aa03a6a65.1409345003.git.bruce.ashfield@windriver.com>
References: <cover.1409345003.git.bruce.ashfield@windriver.com>
	<efcd26d4f457c8f5f658a1a3ab9e5c2aa03a6a65.1409345003.git.bruce.ashfield@windriver.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 02/18] kernel-yocto: move SRCREV validation to patching phase
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
X-List-Received-Date: Sat, 30 Aug 2014 13:55:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-08-30 at 00:38 -0400, Bruce Ashfield wrote:
> Rather than attempting to condition the entire tree to machine SRCREV (since
> we don't know what branch will be built), we can instead wait until patching
> has completed and then confirm that we are indeed building a decendant of the
> specified SRCREV. The result is a much simpler check, and no mangling of the
> tree.
> 
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 39 +++++++++++++++++++++++----------------
>  1 file changed, 23 insertions(+), 16 deletions(-)

Looks like some versions of git on the AB cluster don't support this. Do
we need to bump the minimum git version and install buildtools-tarball
on the affected machines? Or can we use some other construct here?

https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/builds/24/steps/BuildImages/logs/stdio

Cheers,

Richard


> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 38c886b21b09..4938712c7cff 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -71,6 +71,7 @@ do_patch() {
>  	fi
>  
>  	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
> +	machine_srcrev="${SRCREV_machine}"
>  
>  	# if we have a defined/set meta branch we should not be generating
>  	# any meta data. The passed branch has what we need.
> @@ -122,6 +123,17 @@ do_patch() {
>  		exit 1
>  	fi
>  
> +	# see if the branch we are about to patch has been properly reset to the defined
> +	# SRCREV .. if not, we reset it.
> +	branch_head=`git rev-parse HEAD`
> +	if [ "${machine_srcrev}" != "AUTOINC" ]; then
> +	 	if [ "${machine_srcrev}" != "${branch_head}" ]; then
> +			current_branch=`git rev-parse --abbrev-ref HEAD`
> +			git branch "$current_branch-orig"
> +			git reset --hard ${machine_srcrev}
> +		fi
> +	fi
> +
>  	# executes and modifies the source tree as required
>  	patchme ${KMACHINE}
>  	if [ $? -ne 0 ]; then
> @@ -130,6 +142,17 @@ do_patch() {
>  		exit 1
>  	fi
>  
> +	# check to see if the specified SRCREV is reachable from the final branch.
> +	# if it wasn't something wrong has happened, and we should error.
> +	if [ "${machine_srcrev}" != "AUTOINC" ]; then
> +		git merge-base --is-ancestor ${machine_srcrev} HEAD
> +	 	if [ $? -ne 0 ]; then
> +			bbnote "ERROR: SRCREV ${machine_srcrev} was specified, but is not reachable"
> +			bbnote "       Check the BSP description for incorrect branch selection, or other errors."
> +			exit 1
> +		fi
> +	fi
> +
>  	# Perform a final check. If something other than the default kernel
>  	# branch was requested, and that's not where we ended up, then we 
>  	# should thrown an error, since we aren't building what was expected
> @@ -335,22 +358,6 @@ do_validate_branches() {
>  		exit 1
>  	fi
>  
> -	# force the SRCREV in each branch that contains the specified
> -	# SRCREV (if it isn't the current HEAD of that branch)
> -	git checkout -q master
> -	for b in $containing_branches; do
> -		branch_head=`git show-ref -s --heads ${b}`		
> -		if [ "$branch_head" != "$machine_srcrev" ]; then
> -			echo "[INFO] Setting branch $b to ${machine_srcrev}"
> -			if [ "$b" = "master" ]; then
> -				git reset --hard $machine_srcrev > /dev/null
> -			else
> -				git branch -D $b > /dev/null
> -				git branch $b $machine_srcrev > /dev/null
> -			fi
> -		fi
> -	done
> -
>  	## KMETA branch validation.
>  	## We do validation if the meta branch exists, and AUTOREV hasn't been set
>   	meta_head=`git show-ref -s --heads ${KMETA}`



