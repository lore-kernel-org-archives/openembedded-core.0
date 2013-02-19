Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1U7gxZ-0006Wo-Ud
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 07:45:50 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 18 Feb 2013 22:29:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,692,1355126400"; d="scan'208";a="258673291"
Received: from unknown (HELO [10.255.12.124]) ([10.255.12.124])
	by azsmga001.ch.intel.com with ESMTP; 18 Feb 2013 22:29:39 -0800
Message-ID: <51231BD3.9040100@linux.intel.com>
Date: Mon, 18 Feb 2013 22:29:39 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <1361189018-2079-1-git-send-email-constantinx.musca@intel.com>
In-Reply-To: <1361189018-2079-1-git-send-email-constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] groff: upgrade to 1.22.2
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
X-List-Received-Date: Tue, 19 Feb 2013 06:45:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/18/2013 04:03 AM, Constantin Musca wrote:
> - add code for generating the gnulib configure script
> - replace /usr/bin/perl with /usr/bin/env perl
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>   .../groff/{groff_1.20.1.bb => groff_1.22.2.bb}               | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>   rename meta/recipes-extended/groff/{groff_1.20.1.bb => groff_1.22.2.bb} (85%)
>
> diff --git a/meta/recipes-extended/groff/groff_1.20.1.bb b/meta/recipes-extended/groff/groff_1.22.2.bb
> similarity index 85%
> rename from meta/recipes-extended/groff/groff_1.20.1.bb
> rename to meta/recipes-extended/groff/groff_1.22.2.bb
> index 157365b..dc40784 100644
> --- a/meta/recipes-extended/groff/groff_1.20.1.bb
> +++ b/meta/recipes-extended/groff/groff_1.22.2.bb
> @@ -4,7 +4,7 @@ formatting commands and produces formatted output."
>   SECTION = "base"
>   HOMEPAGE = "ftp://ftp.gnu.org/gnu/groff/"
>   LICENSE = "GPLv2"
> -PR = "r2"
> +PR = "r0"
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>

I don't see any SRC_URI Checksum updates for this recipe.  It fails to 
fetch correctly.

Please update the Checksums.

Sau!

> @@ -34,10 +34,18 @@ do_configure_prepend() {
>   	fi
>   }
>
> +do_configure_append() {
> +    # generate gnulib configure script
> +    olddir=`pwd`
> +    cd ${S}/src/libs/gnulib/
> +    ACLOCAL="$ACLOCAL" autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths || bbfatal "autoreconf execution failed."
> +    cd ${olddir}
> +}
> +
>   do_install_append() {
>   	# Some distros have both /bin/perl and /usr/bin/perl, but we set perl location
>   	# for target as /usr/bin/perl, so fix it to /usr/bin/perl.
> -	for i in afmtodit mmroff; do
> +	for i in afmtodit mmroff gropdf pdfmom; do
>   		if [ -f ${D}${bindir}/$i ]; then
>   			sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/$i
>   		fi
>


