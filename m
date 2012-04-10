Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SHa94-0000Gh-5U for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 14:26:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3ACGikn025815
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 13:16:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23457-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 13:16:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3ACGbYs025805
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2012 13:16:38 +0100
Message-ID: <1334060197.6861.65.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Apr 2012 13:16:37 +0100
In-Reply-To: <d4d2c170055d8413d0cc0e597e714895b35f8b87.1334042473.git.sgw@linux.intel.com>
References: <cover.1334042473.git.sgw@linux.intel.com>
	<d4d2c170055d8413d0cc0e597e714895b35f8b87.1334042473.git.sgw@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL [v2] 10/14] opkg: Add the condition for the content of arch.conf when enable multilib
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
X-List-Received-Date: Tue, 10 Apr 2012 12:26:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-10 at 00:26 -0700, Saul Wold wrote:
> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> 
> After successfully installed some lib32 multilib packages into the
> x86-64 image, we just found that the file content of /var/lib/opkg/status in
> rootfs changed after the very 1st boot, many lib32 related packages information
> are missing in that file.
> 
> The missing arch "x86" in arch.conf cause the above problem. Adding the
> condition for the content of arch.conf when enable multilib. If build
> multilib image, "ALL_MULTILIB_PACKAGE_ARCHS" will be used instead of
> "PACKAGE_ARCHS".
> 
> [YOCTO #1522]
> 
> Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>  meta/recipes-devtools/opkg/opkg-config-base_1.0.bb |    7 ++++++-
>  1 files changed, 6 insertions(+), 1 deletions(-)
> 
> diff --git a/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb b/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb
> index 3a559cb..f37b2db 100644
> --- a/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb
> +++ b/meta/recipes-devtools/opkg/opkg-config-base_1.0.bb
> @@ -9,7 +9,12 @@ do_compile() {
>  	archconf=${S}/${sysconfdir}/opkg/arch.conf
>  
>  	rm -f $archconf
> -	ipkgarchs="${PACKAGE_ARCHS}"
> +	multilibs="${@d.getVar('MULTILIBS',True)}"
> +	if [ "X${multilibs}"  == "XNone" ]; then
> +		ipkgarchs="${PACKAGE_ARCHS}"
> +	else
> +		ipkgarchs="${ALL_MULTILIB_PACKAGE_ARCHS}"
> +	fi
>  	priority=1
>  	for arch in $ipkgarchs; do 
>  		echo "arch $arch $priority" >> $archconf

I've taken this but is there any reason we can't just use
${ALL_MULTILIB_PACKAGE_ARCHS} in all cases?

Cheers,

Richard



