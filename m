Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TG4ae-0006Vx-6C for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 11:04:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8O8pg5C026893;
	Mon, 24 Sep 2012 09:51:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24783-06; Mon, 24 Sep 2012 09:51:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8O8pXxZ026885
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 24 Sep 2012 09:51:34 +0100
Message-ID: <1348476693.10108.221.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Phil Blundell <philb@gnu.org>
Date: Mon, 24 Sep 2012 09:51:33 +0100
In-Reply-To: <1348467993.4444.252.camel@x121e.pbcl.net>
References: <1348467993.4444.252.camel@x121e.pbcl.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] staging: Avoid staging the same binaries again and again
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
X-List-Received-Date: Mon, 24 Sep 2012 09:04:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-09-24 at 07:26 +0100, Phil Blundell wrote:
> It is possible that some or all of ${bindir}, ${base_bindir},
> ${sbindir} and ${base_sbindir} might be the same directory.  In
> particular, for micro it is often the case that all four are
> the same.  There is clearly no point in staging the same directory
> four times, so let's keep track of which paths have already been
> staged and skip any later duplicates.
> 
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>  meta/classes/staging.bbclass |   24 ++++++++++++++++++++----
>  1 files changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> index 82624cb..bd97ed5 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -21,6 +21,21 @@ sysroot_stage_dir() {
>  	fi
>  }
>  
> +sysroot_stage_dir_once() {
> +	src="$1"
> +	dest="$2"
> +
> +	src_b64=`echo $src | base64 -w 0`
> +	for d in $staged_dirs; do
> +	    if [ $d = $src_b64 ]; then
> +	       echo "$src has been staged already"
> +	       return
> +	    fi
> +	done
> +	sysroot_stage_dir $src $dest
> +	staged_dirs="$staged_dirs $src_b64"
> +}

Wouldn't testing whether $dest already exists work just as well?

Cheers,

Richard

>  sysroot_stage_libdir() {
>  	src="$1"
>  	dest="$2"
> @@ -34,10 +49,11 @@ sysroot_stage_dirs() {
>  
>  	sysroot_stage_dir $from${includedir} $to${includedir}
>  	if [ "${BUILD_SYS}" = "${HOST_SYS}" ]; then
> -		sysroot_stage_dir $from${bindir} $to${bindir}
> -		sysroot_stage_dir $from${sbindir} $to${sbindir}
> -		sysroot_stage_dir $from${base_bindir} $to${base_bindir}
> -		sysroot_stage_dir $from${base_sbindir} $to${base_sbindir}
> +		staged_dirs=
> +		sysroot_stage_dir_once $from${bindir} $to${bindir}
> +		sysroot_stage_dir_once $from${sbindir} $to${sbindir}
> +		sysroot_stage_dir_once $from${base_bindir} $to${base_bindir}
> +		sysroot_stage_dir_once $from${base_sbindir} $to${base_sbindir}
>  		sysroot_stage_dir $from${libexecdir} $to${libexecdir}
>  		sysroot_stage_dir $from${sysconfdir} $to${sysconfdir}
>  		sysroot_stage_dir $from${localstatedir} $to${localstatedir}





