Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0mid-0003su-SX
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 05:25:20 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 Feb 2012 20:16:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="69785816"
Received: from unknown (HELO [10.255.15.58]) ([10.255.15.58])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Feb 2012 20:16:56 -0800
Message-ID: <4F470F38.7040502@linux.intel.com>
Date: Thu, 23 Feb 2012 20:16:56 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1329405215-9037-1-git-send-email-mac@mcrowe.com>
In-Reply-To: <1329405215-9037-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: Re: [PATCH] e2fsprogs: Cope with ${libdir} and ${base_libdir} being the same
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
X-List-Received-Date: Fri, 24 Feb 2012 04:25:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/16/2012 07:13 AM, Mike Crowe wrote:
> ${libdir} and ${base_libdir} may be the same. If they are don't try and
> move files onto themselves.
>
> Signed-off-by: Mike Crowe<mac@mcrowe.com>
> ---
>   meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb |   10 ++++++----
>   1 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
> index 2289211..9647e51 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb
> @@ -1,6 +1,6 @@
>   require e2fsprogs.inc
>
> -PR = "r2"
> +PR = "r3"
>
>   SRC_URI += "file://fallocate.patch \
>               file://acinclude.m4"
> @@ -32,9 +32,11 @@ do_install () {
>
>   do_install_append () {
>   	# e2initrd_helper and the pkgconfig files belong in libdir
> -	install -d ${D}${libdir}
> -	mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
> -	mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
> +	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
> +		install -d ${D}${libdir}
> +		mv ${D}${base_libdir}/e2initrd_helper ${D}${libdir}
> +		mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
> +	fi
>   }
>
>   # blkid used to be part of e2fsprogs but is useful outside, add it

Merged into OE-core

thanks
	Sau!


