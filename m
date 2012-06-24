Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Siqt1-0001Jw-ND
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Jun 2012 19:46:13 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 24 Jun 2012 10:35:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="115533799"
Received: from unknown (HELO [10.255.12.175]) ([10.255.12.175])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Jun 2012 10:35:20 -0700
Message-ID: <4FE74FD8.9000204@linux.intel.com>
Date: Sun, 24 Jun 2012 10:35:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1340319423-24865-1-git-send-email-andrea.adami@gmail.com>
In-Reply-To: <1340319423-24865-1-git-send-email-andrea.adami@gmail.com>
Subject: Re: [PATCH] mtd-utils: do not stage headers in sysroot
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
X-List-Received-Date: Sun, 24 Jun 2012 17:46:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/21/2012 03:57 PM, Andrea Adami wrote:
> * Headers are included in the package for compatibility
> * but have not yet been synched with linux 3.0
> * The actual issue was that ubi-user.h in sysroot
> * was overwritten by the older version.
> * Unfortunately one ioctl was renamed:
> * http://lists.infradead.org/pipermail/linux-mtd/
> * 2011-March/034419.html
> * Note: the recipe will still use its own older header,
> * following upstream.
>
> Signed-off-by: Andrea Adami<andrea.adami@gmail.com>
> ---
>   meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb |    6 +-----
>   1 files changed, 1 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
> index daa3554..1a9d4d3 100644
> --- a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
> +++ b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
> @@ -11,16 +11,12 @@ SRC_URI = "git://git.infradead.org/mtd-utils.git;protocol=git;tag=ca39eb1d98e736
>
>   S = "${WORKDIR}/git/"
>
> -PR = "r0"
> +PR = "r1"
>
>   EXTRA_OEMAKE = "'CC=${CC}' 'RANLIB=${RANLIB}' 'AR=${AR}' 'CFLAGS=${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=${S}'"
>
>   do_install () {
>   	oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} INCLUDEDIR=${includedir}
> -	install -d ${D}${includedir}/mtd/
> -	for f in ${S}/include/mtd/*.h; do
> -		install -m 0644 $f ${D}${includedir}/mtd/
> -	done
>   }
Just curious how this was tested?

I did a couple of different builds and on one clean rebuild, I found 
that udev failed because it could not find mtd/mtd-user.h

Thanks
	Sau!


>
>   PARALLEL_MAKE = ""


