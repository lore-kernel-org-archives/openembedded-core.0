Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1QM0ku-0002lP-AS
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 18:34:52 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 May 2011 09:31:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,375,1301900400"; d="scan'208";a="747943176"
Received: from scimitar.jf.intel.com (HELO [10.7.199.58]) ([10.7.199.58])
	by orsmga001.jf.intel.com with ESMTP; 16 May 2011 09:31:59 -0700
From: Joshua Lock <josh@linux.intel.com>
To: Darren Hart <dvhart@linux.intel.com>
Date: Mon, 16 May 2011 09:31:58 -0700
In-Reply-To: <4DCDF4BA.1000909@linux.intel.com>
References: <cover.1305329659.git.dvhart@linux.intel.com>
	<dda204962f3a3818351452fc0eae4c8364b685ae.1305329659.git.dvhart@linux.intel.com>
	<1305332074.2023.62.camel@scimitar> <4DCDF4BA.1000909@linux.intel.com>
X-Mailer: Evolution 3.0.1 (3.0.1-1.fc15) 
Message-ID: <1305563519.1972.1.camel@scimitar>
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 03/10] create-pull-request: use git request-pull and arbitrary remotes
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
X-List-Received-Date: Mon, 16 May 2011 16:34:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-13 at 20:19 -0700, Darren Hart wrote:
> >> +# Set WEB_URL from known remotes
> >> +case "$REMOTE_URL" in
> >> +	*git.yoctoproject.org*)
> >> +		WEB_URL="http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=$BRANCH"
> >> +		;;
> >> +	*git.pokylinux.org*)
> >> +		WEB_URL="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=$BRANCH"
> >> +		;;
> >> +esac
> > 
> > Nit: what about if this is a remote branch on that server but not for
> > that repo?
> 
> 
> I'll roll a fix into V2, how about this:
> 
> diff --git a/scripts/create-pull-request b/scripts/create-pull-request
> index 43a4b74..869e6e8 100755
> --- a/scripts/create-pull-request
> +++ b/scripts/create-pull-request
> @@ -70,6 +70,7 @@ while getopts "b:chi:m:o:p:r:s:u:" OPT; do
>                         echo "ERROR: git config failed to find a url for '$REMOTE'"
>                         exit 1
>                 fi
> +               REMOTE_REPO=$(echo $REMOTE_URL | sed "s#.*/\(.*\)\(.git\)#\1#")
>  
>                 # Rewrite known private URLs to public URLs
>                 case "$REMOTE_URL" in
> @@ -97,10 +98,10 @@ fi
>  # Set WEB_URL from known remotes
>  case "$REMOTE_URL" in
>         *git.yoctoproject.org*)
> -               WEB_URL="http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=$BRANCH"
> +               WEB_URL="http://git.yoctoproject.org/cgit.cgi/$REMOTE_REPO/log/?h=$BRANCH"
>                 ;;
>         *git.pokylinux.org*)
> -               WEB_URL="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=$BRANCH"
> +               WEB_URL="http://git.pokylinux.org/cgit.cgi/$REMOTE_REPO/log/?h=$BRANCH"
>                 ;;
>  esac
> 

Looks good to me.

Acked-by: Joshua Lock <josh@linux.intel.com>

Cheers,
Joshua
-- 
Joshua Lock
        Yocto Build System Monkey
        Intel Open Source Technology Centre



