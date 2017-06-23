Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 26775781F2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 17:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5CE18208FB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 17:33:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id PeMcjuOQwKaI
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 17:33:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 42B9D204E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jun 2017 17:33:59 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CD97E162513; Fri, 23 Jun 2017 13:33:58 -0400 (EDT)
Date: Fri, 23 Jun 2017 13:33:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170623173358.GX28053@denix.org>
References: <1497553789-126570-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1497553789-126570-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] toolchain-scripts: add check for LD_LIBRARY_PATH in the SDK env setup script
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
X-List-Received-Date: Fri, 23 Jun 2017 17:33:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Ping.

On Thu, Jun 15, 2017 at 03:09:49PM -0400, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Provide a descriptive error message and exit the environment-setup script,
> when LD_LIBRARY_PATH is set on the host system.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  meta/classes/toolchain-scripts.bbclass | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index 260ece9..ef7b26f 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -25,6 +25,21 @@ toolchain_create_sdk_env_script () {
>  	script=${1:-${SDK_OUTPUT}/${SDKPATH}/environment-setup-$multimach_target_sys}
>  	rm -f $script
>  	touch $script
> +
> +	echo '# Check for LD_LIBRARY_PATH being set, which can break SDK and generally is a bad practice' >> $script
> +	echo '# http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html#AEN80' >> $script
> +	echo '# http://xahlee.info/UnixResource_dir/_/ldpath.html' >> $script
> +	echo '# Only disable this check if you are absolutely know what you are doing!' >> $script
> +	echo 'if [ ! -z "$LD_LIBRARY_PATH" ]; then' >> $script
> +	echo "    echo \"Your environment is misconfigured, you probably need to 'unset LD_LIBRARY_PATH'\"" >> $script
> +	echo "    echo \"but please check why this was set in the first place and that it's safe to unset.\"" >> $script
> +	echo '    echo "The SDK will not operate correctly in most cases when LD_LIBRARY_PATH is set."' >> $script
> +	echo '    echo "For more references see:"' >> $script
> +	echo '    echo "  http://tldp.org/HOWTO/Program-Library-HOWTO/shared-libraries.html#AEN80"' >> $script
> +	echo '    echo "  http://xahlee.info/UnixResource_dir/_/ldpath.html"' >> $script
> +	echo '    return 1' >> $script
> +	echo 'fi' >> $script
> +
>  	echo 'export SDKTARGETSYSROOT='"$sysroot" >> $script
>  	EXTRAPATH=""
>  	for i in ${CANADIANEXTRAOS}; do
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

