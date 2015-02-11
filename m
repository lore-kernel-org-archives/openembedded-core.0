Return-Path: <Paul.Gortmaker@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5A1507066B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 00:55:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1B0tJOd008950
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 16:55:19 -0800 (PST)
Received: from yow-pgortmak-d1 (128.224.56.57) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 10 Feb 2015 16:55:19 -0800
Received: by yow-pgortmak-d1 (Postfix, from userid 1000)	id EB716E1D48B; Tue,
	10 Feb 2015 19:55:30 -0500 (EST)
Date: Tue, 10 Feb 2015 19:55:30 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20150211005530.GA3150@windriver.com>
References: <1421864706-26101-1-git-send-email-paul.gortmaker@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1421864706-26101-1-git-send-email-paul.gortmaker@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] base-files/profile: change EDITOR to not be busybox specific
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
X-List-Received-Date: Wed, 11 Feb 2015 00:55:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

[[PATCH] base-files/profile: change EDITOR to not be busybox specific] On 21/01/2015 (Wed 13:25) Paul Gortmaker wrote:

> Setting "EDITOR=/bin/vi" breaks on non-busybox systems, as
> vim will populate /usr/bin/vi instead, and you get stuff like:
> 
>   op3:~/poky/meta-builder$ git commit -s
>   error: cannot run /bin/vi: No such file or directory
>   error: unable to start editor '/bin/vi'

Ping - this seems like the right thing to do, even if we decide to make
busybox LSB compliant at a later date; there is no need to do a full
pathspec for vi.

P.
--

>   Please supply the message using either -m or -F option.
>   op3:~/poky/meta-builder$ which vi
>   /usr/bin/vi
>   op3:~/poky/meta-builder$
> 
> Since we've already specified a proper path above in the profile,
> we've no need to call out where in the path vi lives, and hence
> this will work with busybox and a full vim install w/o busybox.
> 
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  meta/recipes-core/base-files/base-files/profile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes-core/base-files/base-files/profile
> index 88ab8d877b0d..53c2680409dd 100644
> --- a/meta/recipes-core/base-files/base-files/profile
> +++ b/meta/recipes-core/base-files/base-files/profile
> @@ -2,7 +2,7 @@
>  # and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).
>  
>  PATH="/usr/local/bin:/usr/bin:/bin"
> -EDITOR="/bin/vi"			# needed for packages like cron
> +EDITOR="vi"			# needed for packages like cron, git-commit
>  test -z "$TERM" && TERM="vt100"	# Basic terminal capab. For screen etc.
>  
>  if [ ! -e /etc/localtime -a ! -e /etc/TZ ]; then
> -- 
> 2.2.1
> 

