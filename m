Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TOwfI-0005na-IZ
	for openembedded-core@lists.openembedded.org;
	Thu, 18 Oct 2012 22:26:00 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 18 Oct 2012 13:12:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,609,1344236400"; d="scan'208";a="157820282"
Received: from unknown (HELO [10.255.13.210]) ([10.255.13.210])
	by AZSMGA002.ch.intel.com with ESMTP; 18 Oct 2012 13:12:39 -0700
Message-ID: <508062B7.6000508@linux.intel.com>
Date: Thu, 18 Oct 2012 13:12:39 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Joe Slater <jslater@windriver.com>
References: <1349907403-11447-1-git-send-email-jslater@windriver.com>
In-Reply-To: <1349907403-11447-1-git-send-email-jslater@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] chkconfig: pass CFLAGS to Makefile
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
X-List-Received-Date: Thu, 18 Oct 2012 20:26:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/2012 03:16 PM, Joe Slater wrote:
> The environment CFLAGS is not used by the chkconfig
> Makefile, so debug and optimization options are ignored.
> So, we use RPM_OPT_FLAGS to pass CFLAGS into Makefile.
>
> Upstream-Status:  Inappropriate [configuration]
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>   .../recipes-extended/chkconfig/chkconfig_1.3.58.bb |    7 +++++--
>   1 files changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
> index 17987a6..a27a4ba 100644
> --- a/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
> +++ b/meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
>
>   DEPENDS = "libnewt popt"
>
> -PR = "r1"
> +PR = "r2"
>
>   SRC_URI = "http://fedorahosted.org/releases/c/h/chkconfig/${BPN}-${PV}.tar.bz2"
>
> @@ -21,7 +21,10 @@ SRC_URI[sha256sum] = "18b497d25b2cada955c72810e45fcad8280d105f17cf45e2970f182712
>
>   inherit autotools gettext
>
> -EXTRA_OEMAKE += 'MANDIR="${mandir}" BINDIR="${base_sbindir}" SBINDIR="${sbindir}"'
> +# Makefile uses RPM_OPT_fLAGS to construct CFLAGS
> +#
> +EXTRA_OEMAKE += 'RPM_OPT_FLAGS="${CFLAGS}" MANDIR="${mandir}" \
> +                 BINDIR="${base_sbindir}" SBINDIR="${sbindir}"'
>
>   do_install_append() {
>       mkdir -p ${D}/etc/chkconfig.d
>
Merged into OE-Core

Thanks
	Sau!



