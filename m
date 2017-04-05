Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9BC4C77BC9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:08:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v35F8C1x013852; 
	Wed, 5 Apr 2017 16:08:16 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MZZ5rD106YxH; Wed,  5 Apr 2017 16:08:16 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v35Ei0IN012633
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 5 Apr 2017 15:44:01 +0100
Message-ID: <1491403440.17200.16.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 05 Apr 2017 15:44:00 +0100
In-Reply-To: <20170405134642.12572-3-pkj@axis.com>
References: <20170405134642.12572-1-pkj@axis.com>
	<20170405134642.12572-3-pkj@axis.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCHv2 3/3] base-files: profile: Simplify setting variables conditionally
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
X-List-Received-Date: Wed, 05 Apr 2017 15:08:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-04-05 at 15:46 +0200, Peter Kjellerstedt wrote:
> It is preferred to use `[ <condition> ] || ...` instead of
> `[ <negated condition> ] && ...` as the latter leaves $? set to 1.

Your patch and the description above don't match. There are changes
here which aren't <negated condition> and are stylistic changes instead
afaict. We're past feature freeze so whilst I'm interested in genuine
bugs, I do not really want code churn which just introduces risk.

Cheers,

Richard

> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  meta/recipes-core/base-files/base-files/profile | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/recipes-core/base-files/base-files/profile
> b/meta/recipes-core/base-files/base-files/profile
> index ceaf15f799..a062028226 100644
> --- a/meta/recipes-core/base-files/base-files/profile
> +++ b/meta/recipes-core/base-files/base-files/profile
> @@ -3,15 +3,13 @@
>  
>  PATH="/usr/local/bin:/usr/bin:/bin"
>  EDITOR="vi"			# needed for packages like cron,
> git-commit
> -test -z "$TERM" && TERM="vt100"	# Basic terminal capab. For
> screen etc.
> +[ "$TERM" ] || TERM="vt100"	# Basic terminal capab. For
> screen etc.
>  
> -if [ "$HOME" = "ROOTHOME" ]; then
> -	PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
> -fi
> -if [ "$PS1" ]; then
> -	# works for bash and ash (no other shells known to be in use
> here)
> -	PS1='\u@\h:\w\$ '
> -fi
> +# Add /sbin & co to $PATH for the root user
> +[ "$HOME" != "ROOTHOME" ] ||
> PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
> +
> +# Set the prompt for bash and ash (no other shells known to be in
> use here)
> +[ -z "$PS1" ] || PS1='\u@\h:\w\$ '
>  
>  if [ -d /etc/profile.d ]; then
>  	for i in /etc/profile.d/*.sh; do
> -- 
> 2.12.0
> 

