Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T9hgf-0003vk-JR
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 21:24:25 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Sep 2012 12:12:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,380,1344236400"; d="scan'208";a="218718900"
Received: from unknown (HELO [10.255.13.76]) ([10.255.13.76])
	by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2012 12:11:59 -0700
Message-ID: <5048F57F.10002@linux.intel.com>
Date: Thu, 06 Sep 2012 12:11:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Martin Ertsaas <mertsas@cisco.com>
References: <1346920164-29192-1-git-send-email-mertsas@cisco.com>
In-Reply-To: <1346920164-29192-1-git-send-email-mertsas@cisco.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perl: Remove the changes of bin, lib etc. as the defaults will give sane values.
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
X-List-Received-Date: Thu, 06 Sep 2012 19:24:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/06/2012 01:29 AM, Martin Ertsaas wrote:
> The old config put stuff in ${perldir}/image/usr/local/oecore-x86_64/sysroot/x86_64-unknownsdk-linux/usr/local/oecore-x86_64/sysroots/x86_64-unknownsdk-linux/usr
> instead of in ${perldir}/image/usr/local/oecore-x86_64/sysroot/x86_64-nimbussdk-linux/usr as it should.

I am not sure we want to remove that sed code, since allows for 
different ${libdir} than /usr/lib, such as a flattened /lib, same with 
the ${exec_prefix}.

Sau!


> ---
>   meta/recipes-devtools/perl/perl_5.14.2.bb |   19 ++++++++-----------
>   1 files changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
> index 3c1360f..04e2597 100644
> --- a/meta/recipes-devtools/perl/perl_5.14.2.bb
> +++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://Copying;md5=2b4c6ffbcfcbdee469f02565f253d81a \
>   # We need gnugrep (for -I)
>   DEPENDS = "virtual/db grep-native"
>   DEPENDS += "gdbm zlib"
> -PR = "r9"
> +PR = "r10"
>
>   # 5.10.1 has Module::Build built-in
>   PROVIDES += "libmodule-build-perl"
> @@ -145,16 +145,13 @@ do_configure() {
>
>   	${@base_contains('DISTRO_FEATURES', 'largefile', '', 'do_nolargefile', d)}
>
> -        # Update some paths in the configuration
> -        sed -i -e 's,@DESTDIR@,${prefix},g' \
> -               -e 's,@ARCH@-thread-multi,,g' \
> -               -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
> -               -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
> -               -e "s%\([ \"^\',=]\+\)/usr/include%\1${STAGING_INCDIR}%g" \
> -	       -e "s%\([ \"^\',=]\+\)/usr/lib/%\1${libdir}/%g" \
> -	       -e "s%\([ \"^\',=]\+\)/usr/%\1${exec_prefix}/%g" \
> -	       -e "s%/perl5%/perl%g" \
> -            config.sh-${TARGET_ARCH}-${TARGET_OS}
> +    # Update some paths in the configuration
> +    sed -i -e 's,@DESTDIR@,${prefix},g' \
> +           -e 's,@ARCH@-thread-multi,,g' \
> +           -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
> +           -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
> +           -e "s%/perl5%/perl%g" \
> +          config.sh-${TARGET_ARCH}-${TARGET_OS}
>
>   	case "${TARGET_ARCH}" in
>   		x86_64 | powerpc | s390)
>


