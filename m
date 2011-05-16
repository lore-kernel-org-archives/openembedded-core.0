Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QM7O7-0000iT-TJ
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 01:39:48 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 May 2011 16:36:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,222,1304319600"; d="scan'208";a="748171204"
Received: from vorpal.jf.intel.com (HELO [10.7.199.57]) ([10.7.199.57])
	by orsmga001.jf.intel.com with ESMTP; 16 May 2011 16:36:51 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2011 16:40:24 -0700
In-Reply-To: <8ca2a8e517f83c09ba0f1a591d55b338f24c328a.1305584418.git.dvhart@linux.intel.com>
References: <eb4a98eeef982194542a33be0dd615a5c2bf3ed8.1305584418.git.dvhart@linux.intel.com>
	<8ca2a8e517f83c09ba0f1a591d55b338f24c328a.1305584418.git.dvhart@linux.intel.com>
X-Mailer: Evolution 3.0.1 (3.0.1-1.fc15) 
Message-ID: <1305589224.1771.20.camel@vorpal.jf.intel.com>
Mime-Version: 1.0
Subject: Re: [RFC PATCH v2 04/15] create-pull-request: rewrite known private URLs to public URLs
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
X-List-Received-Date: Mon, 16 May 2011 23:39:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-05-16 at 15:26 -0700, Darren Hart wrote:
> Rather than requiring users to have public remotes and private remotes when
> their development remotes are ssh based (and therefor unsuitable for a pull
> request URL), rewrite the ones we know about from ssh://git@ to git://.
> 
> As the remote url vary from remote to remote, do the REMOTE_REPO regex per
> remote.
> 
> With this infrastructure in place, future patches can augment the list of
> known remotes for things like Git Hub, Gitorious, kernel.org, etc.
> 
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Acked-by: Joshua Lock <josh@linux.intel.com>

> Cc: Tom Rini <tom_rini@mentor.com>
> Cc: Martin Jansa <martin.jansa@gmail.com>
> Cc: Otavio Salvador <otavio@ossystems.com.br>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  scripts/create-pull-request |   14 +++++++++++++-
>  1 files changed, 13 insertions(+), 1 deletions(-)
> 
> diff --git a/scripts/create-pull-request b/scripts/create-pull-request
> index 8f7f767..429421b 100755
> --- a/scripts/create-pull-request
> +++ b/scripts/create-pull-request
> @@ -65,7 +65,19 @@ while getopts "b:hi:m:o:p:r:s:u:" OPT; do
>  			echo "ERROR: git config failed to find a url for '$REMOTE'"
>  			exit 1
>  		fi
> -		REMOTE_REPO=$(echo $REMOTE_URL | sed "s#.*/\(.*\)#\1#")
> +
> +		# Rewrite known private URLs to public URLs
> +		# Determine the repository name for use in the WEB_URL later
> +		case "$REMOTE_URL" in
> +		ssh://git@git.pokylinux.org*)
> +			REMOTE_REPO=$(echo $REMOTE_URL | sed "s#.*/\(.*\)#\1#")
> +			REMOTE_URL=${REMOTE_URL/'ssh://git@'/'git://'}
> +			;;
> +		ssh://git@git.yoctoproject.org*)
> +			REMOTE_REPO=$(echo $REMOTE_URL | sed "s#.*/\(.*\)#\1#")
> +			REMOTE_URL=${REMOTE_URL/"ssh://git@"/"git://"}
> +			;;
> +		esac
>  		# The .git suffix is optional in the URL, drop in for the REPO
>  		REMOTE_REPO=${REMOTE_REPO%.git}
>  		;;

-- 
Joshua Lock
        Yocto Project Build Monkey
        Intel Open Source Technology Centre



