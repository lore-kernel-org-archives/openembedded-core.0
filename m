Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4054871C3D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 15:37:14 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 03 Apr 2017 08:37:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,270,1486454400"; d="scan'208";a="68572434"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by orsmga002.jf.intel.com with ESMTP; 03 Apr 2017 08:37:00 -0700
Message-ID: <1491234317.17259.82.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Date: Mon, 03 Apr 2017 10:45:17 -0500
In-Reply-To: <20170403124827.24735-3-pkj@axis.com>
References: <20170403124827.24735-1-pkj@axis.com>
	<20170403124827.24735-3-pkj@axis.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] base-files: profile: Simplify setting variables conditionally
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
X-List-Received-Date: Mon, 03 Apr 2017 15:37:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-04-03 at 14:48 +0200, Peter Kjellerstedt wrote:
> It is preferred to use `[ "$FOO" ] || ...` instead of
> `[ -z "$FOO" ] && ...` as the latter leaves $? set to 1.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-core/base-files/base-files/profile | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
> index ceaf15f799..a062028226 100644
> --- a/meta/recipes-core/base-files/base-files/profile
> +++ b/meta/recipes-core/base-files/base-files/profile
> @@ -3,15 +3,13 @@
>  
>  PATH="/usr/local/bin:/usr/bin:/bin"
>  EDITOR="vi"			# needed for packages like cron, git-commit
> -test -z "$TERM" && TERM="vt100"	# Basic terminal capab. For screen etc.
> +[ "$TERM" ] || TERM="vt100"	# Basic terminal capab. For screen etc.
>  
> -if [ "$HOME" = "ROOTHOME" ]; then
> -	PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
> -fi
> -if [ "$PS1" ]; then
> -	# works for bash and ash (no other shells known to be in use here)
> -	PS1='\u@\h:\w\$ '
> -fi
> +# Add /sbin & co to $PATH for the root user
> +[ "$HOME" != "ROOTHOME" ] || PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
> +
> +# Set the prompt for bash and ash (no other shells known to be in use here)
> +[ -z "$PS1" ] || PS1='\u@\h:\w\$ '

Here you are using [ -z ] instead of [ ], is this intended? I do not
think so based on your commit message.

>  
>  if [ -d /etc/profile.d ]; then
>  	for i in /etc/profile.d/*.sh; do
> -- 
> 2.12.0
> 



