Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Shf85-0003UG-0y for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 13:00:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LAo4mv021514;
	Thu, 21 Jun 2012 11:50:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21414-01; Thu, 21 Jun 2012 11:50:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q5LAnqtm021499
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 21 Jun 2012 11:49:54 +0100
Message-ID: <1340275793.1640.88.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jun 2012 11:49:53 +0100
In-Reply-To: <43117c408ee5a090f94b1a9638f9056d87be9077.1340272953.git.liezhi.yang@windriver.com>
References: <cover.1340272953.git.liezhi.yang@windriver.com>
	<43117c408ee5a090f94b1a9638f9056d87be9077.1340272953.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] autogen-native 5.12: fix ccache issue
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
X-List-Received-Date: Thu, 21 Jun 2012 11:00:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-06-21 at 18:04 +0800, Robert Yang wrote:
> The autogen-native built error on FC17:
> 
> ccache: failed to create /dev/null/.ccache
> 
> This is because the gcc of FC17 is a symlink to ccache, so the ccache
> will always be used regardless to the user's setting, ccache uses
> $HOME/.ccache as the CCACHE_DIR if it has not been set, and autogen set
> HOME=/dev/null.
> 
> Assign CCACHE_DIR the default value to preven it uses $HOME/.ccache
> would fix the error.
> 
> [YOCTO #2554]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../autogen/autogen-native_5.12.bb                 |   20 ++++++++++++++++++++
>  1 files changed, 20 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-devtools/autogen/autogen-native_5.12.bb b/meta/recipes-devtools/autogen/autogen-native_5.12.bb
> index eb3721d..e80d555 100644
> --- a/meta/recipes-devtools/autogen/autogen-native_5.12.bb
> +++ b/meta/recipes-devtools/autogen/autogen-native_5.12.bb
> @@ -28,6 +28,26 @@ inherit autotools native
>  export GUILE_LOAD_PATH = "${STAGING_DATADIR_NATIVE}/guile/2.0"
>  export GUILE_LOAD_COMPILED_PATH = "${STAGING_LIBDIR_NATIVE}/guile/2.0/ccache"
>  
> +#
> +# The do_compile_prepend is used for fixing a build error on FC17, the
> +# gcc of FC17 is a symlink to ccache, if we don't set the CCACHE_DIR,
> +# there would be an error:
> +#
> +# ccache: failed to create /dev/null/.ccache
> +#
> +# This is because ccache uses $HOME/.ccache as the CCACHE_DIR if it has
> +# not been set, and autogen set HOME=/dev/null.
> +#
> +# Assign CCACHE_DIR the default value so that it would not use
> +# $HOME/.ccache would fix the error.
> +#
> +do_compile_prepend() {
> +	if [ "${CCACHE_DIR}" = "" ]; then
> +		export CCACHE_DISABLE=true
> +		export CCACHE_DIR=$HOME
> +	fi
> +}
> +
>  do_install_append () {
>  	create_wrapper ${D}/${bindir}/autogen \
>  		GUILE_LOAD_PATH=${STAGING_DATADIR_NATIVE}/guile/2.0 \

Could we just set CCACHE_DISABLE ?

In fact could we just set that globally?

I'm afraid I don't like fixing this on a per recipe basis...

Cheers,

Richard



