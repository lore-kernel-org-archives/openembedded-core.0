Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QM7PD-0000lD-RV
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 01:40:58 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 May 2011 16:36:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,222,1304319600"; d="scan'208";a="643514606"
Received: from vorpal.jf.intel.com (HELO [10.7.199.57]) ([10.7.199.57])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2011 16:36:59 -0700
From: Joshua Lock <josh@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
Date: Mon, 16 May 2011 16:40:32 -0700
In-Reply-To: <442f31a687cb0362e9e0a3492eed6bb4ad5d8366.1305584418.git.dvhart@linux.intel.com>
References: <eb4a98eeef982194542a33be0dd615a5c2bf3ed8.1305584418.git.dvhart@linux.intel.com>
	<442f31a687cb0362e9e0a3492eed6bb4ad5d8366.1305584418.git.dvhart@linux.intel.com>
X-Mailer: Evolution 3.0.1 (3.0.1-1.fc15) 
Message-ID: <1305589232.1771.21.camel@vorpal.jf.intel.com>
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH v2 14/15] send-pull-request: streamline git-send-email usage
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
X-List-Received-Date: Mon, 16 May 2011 23:40:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-16 at 15:26 -0700, Darren Hart wrote:
> The script was sending one patch at a time, which defeats the internal
> confirmation mechanism of git-send-email (which would otherwise allow
> the user to send all patches or abort immediately).
> 
> Rework the sending logic to use no more than two commands. Use two
> commands when the cover letter is to be sent to all recipients with
> the -a argument. Otherwise, send all patches via the same command.
> 
> The script duplicates git's send confirmation, eliminate that.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Reported-by: Khem Raj <raj.khem@gmail.com>
Acked-by: Joshua Lock <josh@linux.intel.com>

> Cc: Khem Raj <raj.khem@gmail.com>
> Cc: Joshua Lock <josh@linux.intel.com>
> ---
>  scripts/send-pull-request |   68 +++++++++++++++++---------------------------
>  1 files changed, 26 insertions(+), 42 deletions(-)
> 
> diff --git a/scripts/send-pull-request b/scripts/send-pull-request
> index 21eb302..8d0bd34 100755
> --- a/scripts/send-pull-request
> +++ b/scripts/send-pull-request
> @@ -1,6 +1,7 @@
>  #!/bin/bash
>  AUTO=0
>  AUTO_CL=0
> +GITSOBCC=""
>  
>  # Prevent environment leakage to these vars.
>  unset TO
> @@ -59,10 +60,11 @@ while getopts "achp:t:" OPT; do
>  	case $OPT in
>  	a)
>  		AUTO_CL=1
> -		AUTO=1
> -		;;
> +		# Fall through to include -c
> +		;&
>  	c)
>  		AUTO=1
> +		GITSOBCC="--signed-off-by-cc"
>  		;;
>  	h)
>  		usage
> @@ -130,48 +132,30 @@ if [ -z "$TO" ] && [ -z "$AUTO_CC" ]; then
>  fi
>  
> 
> -# Generate report for the user and require confirmation before sending
> -cat <<EOM
> -The following patches:
> -$(for PATCH in $PDIR/*.patch; do echo "    $PATCH"; done)
> +# Convert the collected addresses into git-send-email argument strings
> +export IFS=$','
> +GIT_TO=$(for R in $TO; do echo -n "--to='$R' "; done)
> +GIT_CC=$(for R in $AUTO_CC; do echo -n "--cc='$R' "; done)
> +unset IFS
>  
> -will now be sent via the git send-email command. Git will prompt you before
> -sending any email.
>  
> -EOM
> -echo "Continue? [y/N] "
> -read cont
> -
> -if [ "$cont" == "y" ] || [ "$cont" == "Y" ]; then
> -	ERROR=0
> -	export IFS=$','
> -	GIT_TO=$(for R in $TO; do echo -n "--to='$R' "; done)
> -	GIT_CC=$(for R in $AUTO_CC; do echo -n "--cc='$R' "; done)
> -	unset IFS
> -	for PATCH in $PDIR/*patch; do
> -		if [ $AUTO -eq 1 ]; then
> -			if [ $PATCH == "$CL" ] && [ $AUTO_CL -eq 1 ]; then
> -				# Send the cover letter to every recipient, both
> -				# specified as well as harvested.
> -				eval "git send-email $GIT_TO $GIT_CC --confirm=always --no-chain-reply-to --suppress-cc=all $PATCH"
> -			else
> -				# Send the patch to the specified recipients and
> -				# those git finds in this specific patch.
> -				eval "git send-email $GIT_TO --confirm=always --no-chain-reply-to --signed-off-by-cc $PATCH"
> -			fi
> -		else
> -			# Only send to the explicitly specified recipients
> -			eval "git send-email $GIT_TO --confirm=always --no-chain-reply-to --suppress-cc=all $PATCH"
> -		fi
> -		if [ $? -eq 1 ]; then
> -			ERROR=1
> -		fi
> -	done
> -
> -	if [ $ERROR -eq 1 ]; then
> -		echo "ERROR: Failed to send one or more messages."
> +# Handoff to git-send-email. It will perform the send confirmation.
> +PATCHES=$(echo $PDIR/*.patch)
> +if [ $AUTO_CL -eq 1 ]; then
> +	# Send the cover letter to every recipient, both specified as well as
> +	# harvested. Then remove it from the patches list.
> +	eval "git send-email $GIT_TO $GIT_CC --confirm=always --no-chain-reply-to --suppress-cc=all $CL"
> +	if [ $? -eq 1 ]; then
> +		echo "ERROR: failed to send cover-letter with automatic recipients."
> +		exit 1
>  	fi
> -else
> -	echo "Send aborted."
> +	PATCHES=${PATCHES/"$CL"/}
>  fi
>  
> +# Send the patch to the specified recipients and, if -c was specified, those git
> +# finds in this specific patch.
> +eval "git send-email $GIT_TO --confirm=always --no-chain-reply-to $GITSOBCC $PATCHES"
> +if [ $? -eq 1 ]; then
> +	echo "ERROR: failed to send patches."
> +	exit 1
> +fi

-- 
Joshua Lock
        Yocto Project Build Monkey
        Intel Open Source Technology Centre



