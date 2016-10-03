Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 57B01719E9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 22:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u93MLqNr011206; Mon, 3 Oct 2016 23:21:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YDgpQaBWzFBQ; Mon,  3 Oct 2016 23:21:52 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u93MLkF4011203
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 3 Oct 2016 23:21:47 +0100
Message-ID: <1475533306.30475.341.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Stephano Cetola <stephano.cetola@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 03 Oct 2016 23:21:46 +0100
In-Reply-To: <20161003004307.824-2-stephano.cetola@linux.intel.com>
References: <20161003004307.824-1-stephano.cetola@linux.intel.com>
	<20161003004307.824-2-stephano.cetola@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: [PATCH V2] sanity: add function to check for git config user
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
X-List-Received-Date: Mon, 03 Oct 2016 22:21:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2016-10-02 at 17:43 -0700, Stephano Cetola wrote:
> If attempting to patch a git repo without a proper git config setup,
> an error will occur saying user.name/user.email are needed by git
> am/apply. After some code was removed from kernel-yocto, it was
> simple enough to reproduce this error by creating a kernel patch and
> using a container to build.
> 
> This patch abstracts out functionality that existed in buildhistory
> for use in other classes. It also adds a call to this functionality
> to the kernel-yocto class.
> 
> Fixes [YOCTO #10346]
> 
> introduced in
> OE-core revision 0f698dfd1c8bbc0d53ae7977e26685a7a3df52a3
> 
> Signed-off-by: Stephano Cetola <stephano.cetola@linux.intel.com>
> ---
>  meta/classes/buildhistory.bbclass | 13 ++++---------
>  meta/classes/kernel-yocto.bbclass |  2 ++
>  meta/classes/sanity.bbclass       | 15 +++++++++++++++
>  3 files changed, 21 insertions(+), 9 deletions(-)
> 
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass
> index 6e5de0e..ed79029 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -688,6 +688,7 @@ END
>  	rm $commitmsgfile
>  }
>  
> +inherit sanity
>  buildhistory_commit() {
>  	if [ ! -d ${BUILDHISTORY_DIR} ] ; then
>  		# Code above that creates this dir never executed,
> so there can't be anything to commit
> @@ -708,15 +709,9 @@ END
>  			git tag -f build-minus-2 build-minus-1 >
> /dev/null 2>&1 || true
>  			git tag -f build-minus-1 > /dev/null 2>&1 ||
> true
>  		fi
> -		# If the user hasn't set up their name/email, set
> some defaults
> -		# just for this repo (otherwise the commit will fail
> with older
> -		# versions of git)
> -		if ! git config user.email > /dev/null ; then
> -			git config --local user.email
> "buildhistory@${DISTRO}"
> -		fi
> -		if ! git config user.name > /dev/null ; then
> -			git config --local user.name "buildhistory"
> -		fi
> +
> +		check_git_config "buildhistory"
> +
>  		# Check if there are new/changed files to commit
> (other than metadata-revs)
>  		repostatus=`git status --porcelain | grep -v "
> metadata-revs$"`
>  		HOSTNAME=`hostname 2>/dev/null || echo unknown`
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-
> yocto.bbclass
> index 53659f2..035edeb 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -156,9 +156,11 @@ do_kernel_metadata() {
>  	fi
>  }
>  
> +inherit sanity
>  do_patch() {
>  	cd ${S}
>  
> +	check_git_config "kernel-yocto"
>  	meta_dir=$(kgit --meta)
>  	(cd ${meta_dir}; ln -sf patch.queue series)
>  	if [ -f "${meta_dir}/series" ]; then
> diff --git a/meta/classes/sanity.bbclass
> b/meta/classes/sanity.bbclass
> index 7682ffb..40033ab 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -1023,3 +1023,18 @@ python check_sanity_eventhandler() {
>  
>      return
>  }
> +
> +# If the user hasn't set up their name/email, set some defaults
> +check_git_config() {
> +	if [ -z "$1" ]; then
> +		name="OE"
> +	else
> +		name="$1"
> +	fi
> +	if ! git config user.email > /dev/null ; then
> +        	git config --local user.email "${name}@${DISTRO}"
> +	fi
> +	if ! git config user.name > /dev/null ; then
> +        	git config --local user.name "${name}"
> +	fi
> +}

I worry you're causing a load of the classes to end up cross linked
here which is bad from a usability standpoint. Nobody can easily
disable the sanity checks after this patch.

If we're keeping this as a shell function this function would probably
go to utils.bbclass. Adding something to lib/oe is probably ultimately
the way to go but I appreciate its harder to write the above in a
python lib, so perhaps utils.bbclass is good enough for now? We can
assume utils is inherited globally.

Cheers,

Richard



