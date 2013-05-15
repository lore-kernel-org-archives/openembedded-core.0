Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UcXgg-0004Me-Kk
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 11:07:57 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 15 May 2013 01:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,675,1363158000"; d="scan'208";a="334317779"
Received: from unknown (HELO [10.255.12.183]) ([10.255.12.183])
	by fmsmga001.fm.intel.com with ESMTP; 15 May 2013 01:48:01 -0700
Message-ID: <51934BBC.7010103@linux.intel.com>
Date: Wed, 15 May 2013 11:47:56 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Joe Slater <jslater@windriver.com>
References: <1368574528-28247-1-git-send-email-jslater@windriver.com>
	<1368574528-28247-2-git-send-email-jslater@windriver.com>
In-Reply-To: <1368574528-28247-2-git-send-email-jslater@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] zlib: put shared libraries in base_libdir
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
X-List-Received-Date: Wed, 15 May 2013 09:08:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/15/2013 02:35 AM, Joe Slater wrote:
> We put the shared libraries in base_libdir because at least
> one library under base_libdir, pam_cracklib.so, needs them
> and will cause a qa warning when it is built.
> ---
>   meta/recipes-core/zlib/zlib_1.2.7.bb |   14 ++++++++++++++
>   1 files changed, 14 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-core/zlib/zlib_1.2.7.bb b/meta/recipes-core/zlib/zlib_1.2.7.bb
> index 803fec3..f5deba1 100644
> --- a/meta/recipes-core/zlib/zlib_1.2.7.bb
> +++ b/meta/recipes-core/zlib/zlib_1.2.7.bb
> @@ -6,6 +6,8 @@ SECTION = "libs"
>   LICENSE = "Zlib"
>   LIC_FILES_CHKSUM = "file://zlib.h;beginline=4;endline=23;md5=94d1b5a40dadd127f3351471727e66a9"
>
> +PR = "r1"
> +
>   SRC_URI = "http://www.zlib.net/${BPN}-${PV}.tar.bz2 \
>              file://remove.ldconfig.call.patch \
>              "
> @@ -22,6 +24,18 @@ do_compile (){
>
>   do_install() {
>   	oe_runmake DESTDIR=${D} install
> +
> +	# move the shared libraries to avoid possible qa warnings
> +	#
> +	case ${PN} in
> +		zlib-native*)
> +			;;

This should really be handled by using the classing mechanism to extend 
the do_install specificaly for the "target" class. The following will 
append to the do_install for the target class.

do_install_append_class-target() {}

You should also protect against the case where base_libdir == libdir 
which some distro can set.

I am also still investigating if this is an appropriate move from it's 
default location, I guess I need to understand further why pam_cracklib 
is causing a QA Warning, can you provide the warning please.

Thanks
	Sau!

> +		*)
> +			mkdir -p ${D}/${base_libdir}
> +			mv ${D}/${libdir}/libz.so.* ${D}/${base_libdir}
> +			tmp=`readlink ${D}/${libdir}/libz.so`
> +			ln -sf ../../${base_libdir}/$tmp ${D}/${libdir}/libz.so
> +	esac
>   }
>
>   BBCLASSEXTEND = "native nativesdk"
>


