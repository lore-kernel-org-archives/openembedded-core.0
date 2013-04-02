Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UN8cW-0003sH-7s
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 23:19:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Apr 2013 14:02:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,394,1363158000"; d="scan'208";a="288414491"
Received: from unknown (HELO [10.255.14.19]) ([10.255.14.19])
	by orsmga001.jf.intel.com with ESMTP; 02 Apr 2013 14:02:44 -0700
Message-ID: <515B4774.6000200@linux.intel.com>
Date: Tue, 02 Apr 2013 14:02:44 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1364279968.git.kai.kang@windriver.com>
	<245c80ed5b2af21acfc2ee3cb910f26292db3909.1364279968.git.kai.kang@windriver.com>
In-Reply-To: <245c80ed5b2af21acfc2ee3cb910f26292db3909.1364279968.git.kai.kang@windriver.com>
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
X-List-Received-Date: Tue, 02 Apr 2013 21:19:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/25/2013 11:43 PM, Kang Kai wrote:
> This bug occurs on rpm-based sdk image.
>
> update-alternatives-cworth is default installed into sato image. And for
> sato-sdk image, it installs every related dev packages.
> update-alternatives-cworth is from opkg, so opkg-dev is installed and it
> requires opkg, then opkg is installed into sato-sdk image.
>
> This causes the script file run-postinsts installed by rpm will be
> overwrited by opkg on rpm-based sdk image.
>
> Judge the image package type and don't create run-scripts file when
> package type is not ipk.
>
> [YOCTO #3223]
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
>   meta/recipes-devtools/opkg/opkg.inc |    6 ++++++
>   1 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
> index f9c1202..bc80cb0 100644
> --- a/meta/recipes-devtools/opkg/opkg.inc
> +++ b/meta/recipes-devtools/opkg/opkg.inc
> @@ -59,10 +59,16 @@ do_install_append_class-native() {
>
>   POSTLOG ?= "/var/log/postinstall.log"
>   REDIRECT_CMD = "${@base_contains('IMAGE_FEATURES', 'debug-tweaks', '>${POSTLOG} 2>&1', '', d)}"
> +PKGTYPE = "${@d.getVar('IMAGE_PKGTYPE', True)}"
>
>   pkg_postinst_${PN} () {
>   #!/bin/sh
>   if [ "x$D" != "x" ]; then
> +	# if installed to a rpm/deb based image, don't create run-postinsts file
> +	if [ "x${PKGTYPE}" != "xipk" ]; then
> +		exit 0
> +	fi
> +
I understand what you are trying to do here, I think Richard was 
questioning if this is the right implementation of the change. I think 
if you look at how RPM does it and then make the *run-postinsts script 
an update-alternatives so each package system does it consistently, this 
will also require a change to dpkg.

Then there might have to be some setting of the PRIORITY for when each 
package system is installed.

Sau!

>   	install -d $D${sysconfdir}/rcS.d
>   	# this happens at S98 where our good 'ole packages script used to run
>   	echo "#!/bin/sh
>


