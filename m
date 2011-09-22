Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6anh-0004fP-3R for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 06:22:17 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8M4NCAk020775 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 05:23:12 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wQ2ejFtyQVfJ
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 05:23:12 +0100 (BST)
Received: from [10.251.10.153] ([192.102.205.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8M4N1jE020770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 05:23:07 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 22 Sep 2011 05:16:40 +0100
In-Reply-To: <8d17a7e67c22daca0d60fe77619283d9bdd31bb2.1316655855.git.mark.hatle@windriver.com>
References: <cover.1316655855.git.mark.hatle@windriver.com>
	<8d17a7e67c22daca0d60fe77619283d9bdd31bb2.1316655855.git.mark.hatle@windriver.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316665014.13622.8.camel@ted>
Mime-Version: 1.0
Subject: Re: [PATCH 3/6] foomatic-filters: Disable filter checking
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
X-List-Received-Date: Thu, 22 Sep 2011 04:22:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-21 at 20:47 -0500, Mark Hatle wrote:
> Disable a few checks, and hard code the values for a few other items
> to work around potential host contamination issues.  We also default
> to the cups configuration for items.
> 
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>  .../foomatic/foomatic-filters_4.0.7.bb             |   21 ++++++++++++++-----
>  1 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb b/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
> index 9627187..856f5ac 100644
> --- a/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
> +++ b/meta/recipes-extended/foomatic/foomatic-filters_4.0.7.bb
> @@ -10,7 +10,7 @@ format using a printer-specific, but spooler-independent PPD file. \
>  "
>  
>  DEPENDS += "cups perl libxml2"
> -PR = "r1"
> +PR = "r2"
>  
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://${WORKDIR}/foomatic-filters-${PV}/COPYING;md5=393a5ca445f6965873eca0259a17f833"
> @@ -20,11 +20,20 @@ SRC_URI = "http://www.openprinting.org/download/foomatic/foomatic-filters-${PV}.
>  SRC_URI[md5sum] = "20abd25c1c98b2dae68709062a132a7d"
>  SRC_URI[sha256sum] = "090313fae40b177f505d9c9b93d7a4d7188b6d5d18b6ae41ab24903ac983478d"
>  
> -do_install_append_linuxstdbase() {
> -    install -d ${D}${libdir}/cups/filter
> -    ln -sf ${bindir}/foomatic-rip ${D}${libdir}/cups/filter
> +inherit autotools
> +
> +EXTRA_OECONF += "--disable-file-converter-check --with-file-converter=texttops"
> +
> +do_configure_prepend() {
> +    export LIB_CUPS=/usr/lib/cups               # /usr/lib NOT libdir
> +    export CUPS_BACKENDS=/usr/lib/cups/backend  # /usr/lib NOT libdir
> +    export CUPS_FILTERS=/usr/lib/cups/filter    # /usr/lib NOT libdir
> +    export CUPS_PPDS=%{_datadir}/cups/model
>  }
>  
> -FILES_${PN}_append_linuxstdbase += "${libdir}/cups/filter/foomatic-rip"
> +do_install_append_linuxstdbase() {
> +    install -d ${D}/usr/lib/cups/filter
> +    ln -sf ${bindir}/foomatic-rip ${D}/usr/lib/cups/filter
> +}
>  
> -inherit autotools
> +FILES_${PN}_append_linuxstdbase += "/usr/lib/cups/filter/foomatic-rip"

This needs a little more explaintion. What happens for the micro (or
minimal, I forget which) distro where they don't have /usr/ ?

I suspect you mean to use ${exec_prefix}/lib above...

Cheers,

Richard




