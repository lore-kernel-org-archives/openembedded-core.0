Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1R9L6B-0002L7-6j
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Sep 2011 20:12:43 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Sep 2011 11:07:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="58042357"
Received: from scimitar.jf.intel.com (HELO [10.7.199.86]) ([10.7.199.86])
	by orsmga002.jf.intel.com with ESMTP; 29 Sep 2011 11:07:14 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2011 11:07:13 -0700
In-Reply-To: <1317307935.12332.89.camel@ted>
References: <1317307935.12332.89.camel@ted>
X-Mailer: Evolution 3.0.3 (3.0.3-1.fc15) 
Message-ID: <1317319633.2134.1.camel@scimitar>
Mime-Version: 1.0
Subject: Re: autotools: Remove help2man dependency
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
X-List-Received-Date: Thu, 29 Sep 2011 18:12:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-29 at 15:52 +0100, Richard Purdie wrote:
> The help2man script is pretty useless to us. It requires to run the target
> binary to extract help information which is not possible for any of our
> cross compiled target binaries.
> 
> We're not interested in man pages for -cross/-native tools.
> 
> It therefore makes no sense to have this as a core build dependency.
> 
> This patch removes the dependeny and replaces it with a script
> returning false. This will trigger autotool's missing utility
> to use the copy of the man page included with the sources which
> is what would already happen when we tried to run cross compiled
> binaries anyway.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Joshua Lock <josh@linux.intel.com>

Great!

Joshua
> ---
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index f213c18..c05ab4b 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -7,7 +7,7 @@ def autotools_dep_prepend(d):
>  
>  	if pn in ['autoconf-native', 'automake-native', 'help2man-native']:
>  		return deps
> -	deps += 'autoconf-native automake-native help2man-native '
> +	deps += 'autoconf-native automake-native '
>  
>  	if not pn in ['libtool', 'libtool-native'] and not pn.endswith("libtool-cross"):
>  		deps += 'libtool-native '
> diff --git a/scripts/help2man b/scripts/help2man
> new file mode 100755
> index 0000000..2bb8d86
> --- a/dev/null
> +++ b/scripts/help2man
> @@ -0,0 +1,3 @@
> +#!/bin/sh
> +
> +exit 1
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



