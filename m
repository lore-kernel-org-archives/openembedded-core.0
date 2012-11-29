Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TdvCn-0005ST-JD
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 04:54:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Nov 2012 19:40:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,182,1355126400"; d="scan'208";a="224041307"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.127])
	by azsmga001.ch.intel.com with ESMTP; 28 Nov 2012 19:40:12 -0800
Message-ID: <50B6D91C.2080106@linux.intel.com>
Date: Wed, 28 Nov 2012 19:40:12 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <8a0cdf9a8789439bc86ca4a8b3cbb77408659ac6.1354116375.git.raj.khem@gmail.com>
	<8ec33689eaab4c3fa5099a8c461bd2b648e29481.1354116375.git.raj.khem@gmail.com>
In-Reply-To: <8ec33689eaab4c3fa5099a8c461bd2b648e29481.1354116375.git.raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] oprofile: Define PACKAGE and PACKAGE_VERSION
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
X-List-Received-Date: Thu, 29 Nov 2012 03:54:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/28/2012 07:29 AM, Khem Raj wrote:
> oprofile uses bfd.h from binutils which expects
> that the package which is using it is also compiled
> using autotools and therefore tries to include
> config.h to get above defines. We specify them
> on commandline instead.
>

Khem,

This patch seems to be causing issues when I build it with 
stage/master_under_test.

I am seeing a configure failure on the Autobuilder.
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86-64/builds/735/steps/shell_28/logs/stdio

A number of failures like the above can be seen..

Thanks
	Sau!


> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-kernel/oprofile/oprofile.inc |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/oprofile/oprofile.inc b/meta/recipes-kernel/oprofile/oprofile.inc
> index ac8ce10..3c1c3cd 100644
> --- a/meta/recipes-kernel/oprofile/oprofile.inc
> +++ b/meta/recipes-kernel/oprofile/oprofile.inc
> @@ -19,7 +19,7 @@ FILES_${PN} = "${bindir} ${libdir}/${BPN}/lib*${SOLIBS} ${datadir}/${BPN}"
>   FILES_${PN}-dev += "${libdir}/${BPN}/lib*${SOLIBSDEV} ${libdir}/${BPN}/lib*.la"
>   FILES_${PN}-staticdev += "${libdir}/${BPN}/lib*.a"
>
> -INC_PR = "r1"
> +INC_PR = "r2"
>
>   SRC_URI = "file://opstart.patch \
>              file://oprofile-no-query-modules.patch \
> @@ -29,7 +29,7 @@ SRC_URI = "file://opstart.patch \
>   inherit autotools
>
>   EXTRA_OECONF = "--with-kernel-support --without-x"
> -
> +CFLAGS += '-DPACKAGE="${BPN}" -DPACKAGE_VERSION=${PV}'
>   do_configure () {
>   	cp ${WORKDIR}/acinclude.m4 ${S}/
>   	autotools_do_configure
>


