Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UK8iN-0000bp-TL for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 15:49:41 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2PEgJtl011660; Mon, 25 Mar 2013 14:42:20 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QtcFH66zqwCi; Mon, 25 Mar 2013 14:42:19 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2PEgDa3011625
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 25 Mar 2013 14:42:17 GMT
Message-ID: <1364221942.3097.52.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kang Kai <kai.kang@windriver.com>
Date: Mon, 25 Mar 2013 14:32:22 +0000
In-Reply-To: <47ae8648840c30e4a9f5dab2b9cb09db905747be.1364196012.git.kai.kang@windriver.com>
References: <cover.1364196012.git.kai.kang@windriver.com>
	<47ae8648840c30e4a9f5dab2b9cb09db905747be.1364196012.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] opkg: create run-scripts file conditionally
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
X-List-Received-Date: Mon, 25 Mar 2013 14:49:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-03-25 at 15:22 +0800, Kang Kai wrote:
> When build sato sdk image, opkg will be installed to image even the
> image package type is set to RPM. This causes the script file
> run-postinsts installed by rpm will be overwrited by opkg.
> 
> Judge the image package type and don't create run-scripts file when
> package type is not ipk.
> 
> [YOCTO #3223]
> 
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>  meta/recipes-devtools/opkg/opkg.inc |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
> index f9c1202..bc80cb0 100644
> --- a/meta/recipes-devtools/opkg/opkg.inc
> +++ b/meta/recipes-devtools/opkg/opkg.inc
> @@ -59,10 +59,16 @@ do_install_append_class-native() {
>  
>  POSTLOG ?= "/var/log/postinstall.log"
>  REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', '>${POSTLOG} 2>&1', '', d)}"
> +PKGTYPE = "${@d.getVar('IMAGE_PKGTYPE', True)}"
>  
>  pkg_postinst_${PN} () {
>  #!/bin/sh
>  if [ "x$D" != "x" ]; then
> +	# if installed to a rpm/deb based image, don't create run-postinsts file
> +	if [ "x${PKGTYPE}" != "xipk" ]; then
> +		exit 0
> +	fi
> +
>  	install -d $D${sysconfdir}/rcS.d
>  	# this happens at S98 where our good 'ole packages script used to run
>  	echo "#!/bin/sh

Why are you trying to install opkg into an non-opkg rootfs in the first
place? This looks like it will create subtle package differences
depending on configuration and I'm wary of this...

Cheers,

Richard





