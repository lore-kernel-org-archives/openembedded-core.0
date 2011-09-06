Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R0mqE-00061V-Pb
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 06:00:55 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Sep 2011 20:55:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,336,1312182000"; d="scan'208";a="45832667"
Received: from unknown (HELO [10.255.14.30]) ([10.255.14.30])
	by azsmga001.ch.intel.com with ESMTP; 05 Sep 2011 20:55:52 -0700
Message-ID: <4E6599C8.8020303@linux.intel.com>
Date: Mon, 05 Sep 2011 20:55:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110816 Thunderbird/6.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1315109841.git.sgw@linux.intel.com>
	<caa8600f67f2835bab295f08c0691c065f95dbf9.1315109841.git.sgw@linux.intel.com>
In-Reply-To: <caa8600f67f2835bab295f08c0691c065f95dbf9.1315109841.git.sgw@linux.intel.com>
Subject: Re: [PATCH 2/2] opensp: Fix sstate relocation issue
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
X-List-Received-Date: Tue, 06 Sep 2011 04:00:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/03/2011 09:19 PM, Saul Wold wrote:
> [YOCTO #1439]
>
> This fixes a problem where the native nsgmls has a path hard coded into
> it, therefor add a wrapper to set the environment with the correct
> paths for catalog files.
>
> Signed-off-by: Saul Wold<sgw@linux.intel.com>
> ---
>   meta/recipes-devtools/opensp/opensp_1.5.bb |    9 ++++++++-
>   1 files changed, 8 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/opensp/opensp_1.5.bb b/meta/recipes-devtools/opensp/opensp_1.5.bb
> index a402d11..0269c87 100644
> --- a/meta/recipes-devtools/opensp/opensp_1.5.bb
> +++ b/meta/recipes-devtools/opensp/opensp_1.5.bb
> @@ -5,7 +5,7 @@ SECTION = "libs"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=641ff1e4511f0a87044ad42f87cb1045"
>
> -PR = "r1"
> +PR = "r2"
>
>   # At -Os it encounters calls to some inline functions which are then
>   # not found in any other objects with gcc 4.5
> @@ -42,6 +42,13 @@ do_install_append() {
>   	ln -sf osx sgml2xml
>   }
>
> +do_install_append_virtclass-native() {
> +	for util in nsgmls sgmlnorm spam spcat spent sx; do
> +		create_wrapper ${D}/${bindir}/$util \
> +		    SGML_CATALOG_FILES=${sysconfdir}/sgml/catalog
> +	done
> +}
> +
>   FILES_${PN} += "${datadir}/OpenSP/"
>
>   BBCLASSEXTEND = "native"

I found an issue with this patch, as it stands right now the 
linuxdoc-tools-native failes to build with this patch.

If I change the pass the catalog directory via -D, then the iputils goes 
back to failing!  It seems that some more work might be needed and 
possibly a patch to the opensp catalog search mode.  What I saw 
happening is it seems to pick up the command line path for the index.db 
and incorporates it with the catalog search path.

More digging is needed.

Sau!



