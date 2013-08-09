Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 21BF76B4F7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 18:33:13 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Aug 2013 11:32:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,847,1367996400"; d="scan'208";a="383947660"
Received: from unknown (HELO [10.255.14.176]) ([10.255.14.176])
	by fmsmga002.fm.intel.com with ESMTP; 09 Aug 2013 11:32:51 -0700
Message-ID: <520535D3.8020900@linux.intel.com>
Date: Fri, 09 Aug 2013 11:32:51 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Joe Slater <jslater@windriver.com>
References: <1375816107-30963-1-git-send-email-jslater@windriver.com>
In-Reply-To: <1375816107-30963-1-git-send-email-jslater@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] openjade-native: do not create shared libraries
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
X-List-Received-Date: Fri, 09 Aug 2013 18:33:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/06/2013 12:08 PM, Joe Slater wrote:
> CQID: 429576
>
> openjade is the only one that uses the shared libraries
> and sometimes it cannot find them!
>
> [Yocto #2972]
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>   .../openjade/openjade-native_1.3.2.bb              |   29 ++++++++++++++-----
>   1 files changed, 21 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> index 8af0b52..ffdb3fc 100644
> --- a/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> +++ b/meta/recipes-devtools/openjade/openjade-native_1.3.2.bb
> @@ -7,7 +7,7 @@ SECTION = "base"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=641ff1e4511f0a87044ad42f87cb1045"
>
> -PR = "r5"
> +PR = "r6"
>
No need to add PR Bump here anymore.

>   DEPENDS = "opensp-native sgml-common-native"
>   RDEPENDS_${PN} = "sgml-common-native"
> @@ -24,8 +24,13 @@ SRC_URI[sha256sum] = "1d2d7996cc94f9b87d0c51cf0e028070ac177c4123ecbfd7ac1cb8d0b7
>
>   inherit autotools native
>
> +# Per bugzilla.yoctoproject.org/show_bug.cgi?id=2972 we do
> +# not create shared libraries.  Note that openjade still links
> +# to shared libraries from other packages.
> +#
>   EXTRA_OECONF = "--enable-spincludedir=${STAGING_INCDIR}/OpenSP \
> -                --enable-splibdir=${STAGING_LIBDIR}"
> +                --enable-splibdir=${STAGING_LIBDIR} \
> +                --disable-shared"
>
>   # We need to set datadir explicitly, but adding it to EXTRA_OECONF
>   # results in it being specified twice when configure is run.
> @@ -55,13 +60,21 @@ do_compile_prepend () {
>   do_install() {
>   	# Refer to http://www.linuxfromscratch.org/blfs/view/stable/pst/openjade.html
>   	# for details.
> -	install -d ${D}${bindir}	
> -	install -m 0755 ${S}/jade/.libs/openjade ${D}${bindir}/openjade
> -	ln -sf openjade ${D}${bindir}/jade
> +	install -d ${D}${bindir}
>
> -	oe_libinstall -a -so -C style libostyle ${D}${libdir}
> -	oe_libinstall -a -so -C spgrove libospgrove ${D}${libdir}
> -	oe_libinstall -a -so -C grove libogrove ${D}${libdir}
> +	# install shared library version if it exists
> +	#
> +	if [ -f ${S}/jade/.libs/openjade ]
> +	then
> +	 install -m 0755 ${S}/jade/.libs/openjade ${D}${bindir}/openjade
> +	 oe_libinstall -a -so -C style libostyle ${D}${libdir}
> +	 oe_libinstall -a -so -C spgrove libospgrove ${D}${libdir}
> +	 oe_libinstall -a -so -C grove libogrove ${D}${libdir}
> +	else
> +	 install -m 0755 ${S}/jade/openjade ${D}${bindir}/openjade
> +	fi
> +
> +	ln -sf openjade ${D}${bindir}/jade
>
Convention is to use tabs for indentation in oe-core Shell code and 
4-spaces for python code.

Thanks

     Sau!

>   	install -d ${D}${datadir}/sgml/openjade-${PV}
>   	install -m 644 dsssl/catalog ${D}${datadir}/sgml/openjade-${PV}
>

