Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ucstb-0007P6-8F
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 09:46:40 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 16 May 2013 00:28:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,681,1363158000"; d="scan'208";a="242326869"
Received: from unknown (HELO [10.255.12.48]) ([10.255.12.48])
	by AZSMGA002.ch.intel.com with ESMTP; 16 May 2013 00:28:21 -0700
Message-ID: <51948A93.8060705@linux.intel.com>
Date: Thu, 16 May 2013 10:28:19 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Joe Slater <jslater@windriver.com>
References: <1368652657-3841-1-git-send-email-jslater@windriver.com>
In-Reply-To: <1368652657-3841-1-git-send-email-jslater@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH [v1] 1/1] zlib: put shared libraries in base_libdir
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
X-List-Received-Date: Thu, 16 May 2013 07:46:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2013 12:17 AM, Joe Slater wrote:
> We put the shared libraries in base_libdir because at least
> one library under base_libdir, pam_cracklib.so, needs them
> and will cause a qa warning when it is built.

missing a Signed-off-by: and the [v1] seems to cause the subject to
get parsed wrong.

Sau!

> ---
>   meta/recipes-core/zlib/zlib_1.2.7.bb |   15 +++++++++++++++
>   1 files changed, 15 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-core/zlib/zlib_1.2.7.bb b/meta/recipes-core/zlib/zlib_1.2.7.bb
> index 803fec3..dfdf5fe 100644
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
> @@ -24,4 +26,17 @@ do_install() {
>   	oe_runmake DESTDIR=${D} install
>   }
>
> +# We move zlib shared libraries for target builds to avoid
> +# qa warnings.
> +#
> +do_install_append_class-target() {
> +	if [ ${base_libdir} != ${libdir} ]
> +	then
> +		mkdir -p ${D}/${base_libdir}
> +		mv ${D}/${libdir}/libz.so.* ${D}/${base_libdir}
> +		tmp=`readlink ${D}/${libdir}/libz.so`
> +		ln -sf ../../${base_libdir}/$tmp ${D}/${libdir}/libz.so
> +	fi
> +}
> +
>   BBCLASSEXTEND = "native nativesdk"
>


