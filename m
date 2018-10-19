Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 13D7E79CFE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 16:53:14 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42cBn70MkSz1rQjq;
	Fri, 19 Oct 2018 18:53:14 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42cBn66JXnz1qvlf;
	Fri, 19 Oct 2018 18:53:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id 3fDYNWPJJ4Bw; Fri, 19 Oct 2018 18:53:12 +0200 (CEST)
X-Auth-Info: vVAHK6MiiGLrY0CJBcVNSVadlNERLrMbCsWSu8xQ68g=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 19 Oct 2018 18:53:12 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <20181019152214.1600-1-o.mandel@menlosystems.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <8d31e8cc-f8ad-b752-0240-b0d0976e3851@denx.de>
Date: Fri, 19 Oct 2018 18:53:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20181019152214.1600-1-o.mandel@menlosystems.com>
Cc: Joshua Lock <joshua.g.lock@intel.com>,
	Anders Darander <anders@chargestorm.se>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Olaf Mandel <o.mandel@menlosystems.com>
Subject: Re: [PATCH] npm: change install directory to upstream default
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
X-List-Received-Date: Fri, 19 Oct 2018 16:53:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/19/2018 05:22 PM, Olaf Mandel wrote:
> The node binary searches for packages in a number of locations, the last
> of which is $PREFIX/lib/node (here: /usr/lib/node) from the list of
> GLOBAL_FOLDERS [1]. Change the installation directory for all packages
> depending on npm.bbclass to that location. This removes the need to
> define the NODE_PATH variable to the non-standard /usr/lib/node_modules
> value.
> 
> While the Tips for Package Managers [2] discusses installing packages to
> /usr/lib/node_modules/<name>/<version>, this has several drawbacks:
> 
>  * it does not work for the REPL as mentioned in the documentation
>  * it also does not work for any code _not_ installed as a global
>    package under /usr/lib/node_modules (e.g. /usr/share/foo.js will not
>    find any packages below /usr/lib)
>  * using the non-default location and then having to set NODE_PATH
>    barely saves any time: there are only two file-system lookups (to the
>    legacy $HOME/.node_modules and $HOME/.node_libraries) directories
>    before the library would be found
> 
> And the suggestion was made in the context of deduping the node_modules
> tree by installing all packages in a flat hierarchy and using symlinks
> to the correct version of each dependency. This is not what OpenEmbedded
> does, so none of those benefits (deduping, cleaner packages) are being
> had by shifting the installation directory to /usr/lib/node_modules.
> 
> [1]: https://nodejs.org/api/modules.html#modules_loading_from_the_global_folders
> [2]: https://nodejs.org/api/modules.html#modules_addenda_package_manager_tips
> 
> Signed-off-by: Olaf Mandel <o.mandel@menlosystems.com>
> ---
>  meta/classes/npm.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
> index c351ff0866..d5ff0c6d57 100644
> --- a/meta/classes/npm.bbclass
> +++ b/meta/classes/npm.bbclass
> @@ -10,7 +10,7 @@ def node_pkgname(d):
>  
>  NPMPN ?= "${@node_pkgname(d)}"
>  
> -NPM_INSTALLDIR = "${D}${libdir}/node_modules/${NPMPN}"
> +NPM_INSTALLDIR = "${D}${libdir}/node/${NPMPN}"
>  
>  # function maps arch names to npm arch names
>  def npm_oe_arch_map(target_arch, d):
> 

Expanding the CC a bit ...

-- 
Best regards,
Marek Vasut

