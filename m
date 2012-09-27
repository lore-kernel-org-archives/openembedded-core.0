Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THGGs-0000Q0-Ny
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 17:45:03 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 27 Sep 2012 08:32:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,496,1344236400"; d="scan'208";a="149880761"
Received: from unknown (HELO [10.255.13.173]) ([10.255.13.173])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Sep 2012 08:32:08 -0700
Message-ID: <50647177.5090105@linux.intel.com>
Date: Thu, 27 Sep 2012 08:32:07 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Christian Glindkamp <christian.glindkamp@taskit.de>
References: <1348748457-7215-1-git-send-email-christian.glindkamp@taskit.de>
In-Reply-To: <1348748457-7215-1-git-send-email-christian.glindkamp@taskit.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perl: Fix nativesdk install path
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
X-List-Received-Date: Thu, 27 Sep 2012 15:45:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/27/2012 05:20 AM, Christian Glindkamp wrote:
> Commit 38234f2e276356b1d77a87ceabc486107e336d19 tried to fix the sed
> expressions by anchoring the left side of the search regexp to prevent
> $prefix$prefix type expression in the perl config. For nativesdk this is
> not enough. Adding anchors on both side fixes this.
>
> Signed-off-by: Christian Glindkamp <christian.glindkamp@taskit.de>
> ---
>
> This is currently only build tested, but buildhistory for perl did not change.
>
>   meta/recipes-devtools/perl/perl_5.14.2.bb |    8 ++++----
>   1 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
> index 3c1360f..0009855 100644
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
> @@ -150,9 +150,9 @@ do_configure() {
>                  -e 's,@ARCH@-thread-multi,,g' \
>                  -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g' \
>                  -e 's,@STAGINGDIR@,${STAGING_DIR_HOST},g' \
> -               -e "s%\([ \"^\',=]\+\)/usr/include%\1${STAGING_INCDIR}%g" \
> -	       -e "s%\([ \"^\',=]\+\)/usr/lib/%\1${libdir}/%g" \
> -	       -e "s%\([ \"^\',=]\+\)/usr/%\1${exec_prefix}/%g" \
> +               -e "s%\([ \"^\',=]\+\)/usr/include\([ \"^\',=]\+\)%\1${STAGING_INCDIR}\2%g" \
> +	       -e "s%\([ \"^\',=]\+\)/usr/lib/\([ \"^\',=]\+\)%\1${libdir}/\2%g" \
> +	       -e "s%\([ \"^\',=]\+\)/usr/\([ \"^\',=]\+\)%\1${exec_prefix}/\2%g" \
>   	       -e "s%/perl5%/perl%g" \
>               config.sh-${TARGET_ARCH}-${TARGET_OS}
>
>

Merged into OE-Core

Thanks	
	Sau!



