Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1R9L5w-0002JM-HK
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 20:12:28 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Sep 2011 11:06:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="57275058"
Received: from scimitar.jf.intel.com (HELO [10.7.199.86]) ([10.7.199.86])
	by orsmga001.jf.intel.com with ESMTP; 29 Sep 2011 11:06:30 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2011 11:06:30 -0700
In-Reply-To: <1317308108.12332.92.camel@ted>
References: <1317308108.12332.92.camel@ted>
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1317319590.2134.0.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [RFC PATCH] bitbake.conf: Start using parallel make for do_install
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
X-List-Received-Date: Thu, 29 Sep 2011 18:12:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-29 at 15:55 +0100, Richard Purdie wrote:
> Most piece of software now support parallel make install. Enable
> this by default using the value of PARALLEL_MAKE. In a similar way
> to PARALLEL_MAKE we can disable this for broken recipes with:
> 
> PARALLEL_MAKEINST = ""
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Hurrah!
Signed-off-by: Joshua Lock <josh@linux.intel.com>

> ---
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index f18e35b..a1420cf 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -493,8 +493,11 @@ export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
>  # Which flags to leave by strip-flags() in bin/build/oebuild.sh ?
>  ALLOWED_FLAGS = "-O -mcpu -march -pipe"
>  
> -# Pass parallel make options to the compile task only
> +# Pass parallel make options to the compile task
>  EXTRA_OEMAKE_prepend_task-compile = "${PARALLEL_MAKE} "
> +PARALLEL_MAKEINST ??= "${PARALLEL_MAKE}"
> +# Pass parallel make options to the install task
> +EXTRA_OEMAKE_prepend_task-install = "${PARALLEL_MAKEINST} "
>  
>  ##################################################################
>  # Optimization flags.
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



