Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuToM-00005S-42
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:33:26 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Jul 2012 12:21:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173620359"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by azsmga001.ch.intel.com with ESMTP; 26 Jul 2012 12:21:53 -0700
Message-ID: <501198D1.8010303@linux.intel.com>
Date: Thu, 26 Jul 2012 12:21:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1343076976-4307-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1343076976-4307-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH V2] libcgroup_0.37.1.bb: Add recipe
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
X-List-Received-Date: Thu, 26 Jul 2012 19:33:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/23/2012 01:56 PM, Khem Raj wrote:
> This recipe is imported from meta-oe its a requirement for
> systemd to work. Now that systemd is living in a layer of
> its own. Lets have this recipe into core metadata
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/recipes-core/libcgroup/libcgroup_0.37.1.bb |   27 +++++++++++++++++++++++
>   1 files changed, 27 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
>
> diff --git a/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb b/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
> new file mode 100644
> index 0000000..a99d7ac
> --- /dev/null
> +++ b/meta/recipes-core/libcgroup/libcgroup_0.37.1.bb
> @@ -0,0 +1,27 @@
> +DESCRIPTION = "Libcgroup"
> +SECTION = "libs"
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
> +
> +PR = "r1"
> +
> +inherit autotools pkgconfig
> +
> +DEPENDS = "${@base_contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/project/libcg/${PN}/v${PV}/${PN}-${PV}.tar.bz2"
> +SRC_URI[md5sum] = "24a41b18de112e8d085bb1f7d9e82af7"
> +SRC_URI[sha256sum] = "0b08632de5d3641aa554b422d02a77d9367e57933328a8765204ad9588cd5c0d"
> +
> +EXTRA_OECONF = "${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam-module-dir=${base_libdir}/security --enable-pam=yes', '--enable-pam=no', d)}"
> +
> +# http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg21444.html
> +PARALLEL_MAKE = ""
> +
> +PACKAGES =+ "cgroups-pam-plugin"
> +FILES_cgroups-pam-plugin = "${base_libdir}/security/pam_cgroup.so*"
> +FILES_${PN}-dbg += "${base_libdir}/security/.debug"
> +FILES_${PN}-dev += "${base_libdir}/security/*.la"
> +
> +# We really need the symlink so :(
> +INSANE_SKIP_${PN} = "dev-so"
>

Merged into OE-Core

Thanks
	Sau!


