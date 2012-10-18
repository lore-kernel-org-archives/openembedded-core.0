Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TOwWH-0005Nv-T2
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 22:16:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Oct 2012 13:03:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,608,1344236400"; d="scan'208";a="207810617"
Received: from unknown (HELO [10.255.13.210]) ([10.255.13.210])
	by orsmga001.jf.intel.com with ESMTP; 18 Oct 2012 13:03:20 -0700
Message-ID: <50806088.6080805@linux.intel.com>
Date: Thu, 18 Oct 2012 13:03:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <1348654710.31293.93.camel@phil-desktop>
In-Reply-To: <1348654710.31293.93.camel@phil-desktop>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] strace: Don't package strace-graph
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
X-List-Received-Date: Thu, 18 Oct 2012 20:16:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/26/2012 03:18 AM, Phil Blundell wrote:
> Commit 9c9ea24b115a9bb87df1323b5f185ce426262aec made strace depend on perl because the
> strace-graph script needs it.  However, this cost of the dependency is large (building
> all of perl) and the value of the script is marginal.  Let's just delete the script
> instead and remove the dependency again.
>
> If anybody wants strace-graph then it should be packaged in its own recipe and that one
> can be made to depend on perl without disrupting the main strace package.
>
> Signed-off-by: Phil Blundell <pb@pbcl.net>
> ---
>   meta/recipes-devtools/strace/strace_4.7.bb |   11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-devtools/strace/strace_4.7.bb b/meta/recipes-devtools/strace/strace_4.7.bb
> index 21dd47a..e1a5e82 100644
> --- a/meta/recipes-devtools/strace/strace_4.7.bb
> +++ b/meta/recipes-devtools/strace/strace_4.7.bb
> @@ -3,11 +3,7 @@ HOMEPAGE = "http://strace.sourceforge.net"
>   SECTION = "console/utils"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=124500c21e856f0912df29295ba104c7"
> -PR = "r1"
> -
> -PACKAGES =+ "${PN}-graph "
> -FILES_${PN}-graph = "${bindir}/strace-graph"
> -RDEPENDS_${PN}-graph = "perl"
> +PR = "r2"
>
>   SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.xz \
>              file://strace-eglibc-2.16.patch \
> @@ -20,4 +16,9 @@ inherit autotools
>
>   export INCLUDES = "-I. -I./linux"
>
> +do_install_append() {
> +	# We don't ship strace-graph here because it needs perl
> +	rm ${D}${bindir}/strace-graph
> +}
> +
>   BBCLASSEXTEND = "native"
>
Merged into OE-Core

Thanks
	Sau!



