Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UVTWG-0002EW-S1
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 23:16:09 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Apr 2013 13:58:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,553,1363158000"; d="scan'208";a="325591107"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by orsmga002.jf.intel.com with ESMTP; 25 Apr 2013 13:58:11 -0700
Message-ID: <517998E2.4040409@linux.intel.com>
Date: Thu, 25 Apr 2013 13:58:10 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <1366894048.14512.87.camel@phil-desktop.brightsign>
In-Reply-To: <1366894048.14512.87.camel@phil-desktop.brightsign>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] alsa-utils: Move alsaconf to its own recipe
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
X-List-Received-Date: Thu, 25 Apr 2013 21:16:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/25/2013 05:47 AM, Phil Blundell wrote:
> 18575b082a4042376fd1575465e69562dea04ddc added bash as a dependency of
> alsa-utils-alsaconf so that the script interpreter will be available at
> run time.  However, this has the undesirable side effect of making bash
> be a build dependency for alsa-utils and, for those folks who don't need
> alsaconf but do want some other part of alsa-utils, this cure is worse
> than the original disease.
>
> Fix this by moving alsaconf to a separate recipe so that the bash
> dependency only applies when alsaconf is specifically requested.
>
> Signed-off-by: Phil Blundell <philb@gnu.org>
> ---
>   .../alsa/alsa-utils-alsaconf_1.0.26.bb             |   22 ++++++++++++++++++++
>   meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb  |   12 +++++++----
>   2 files changed, 30 insertions(+), 4 deletions(-)
>   create mode 100644 meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.26.bb
>
> diff --git a/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.26.bb b/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.26.bb
> new file mode 100644
> index 0000000..71de085
> --- /dev/null
> +++ b/meta/recipes-multimedia/alsa/alsa-utils-alsaconf_1.0.26.bb
> @@ -0,0 +1,22 @@
> +require alsa-utils_${PV}.bb
> +
> +THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
> +FILESPATH =. "${@base_set_filespath(["${THISDIR}/alsa-utils"], d)}:"
> +
> +PACKAGES = "${PN}"
> +RDEPENDS_${PN} += "bash"
> +
> +DESCRIPTION_${PN}     = "a bash script that creates ALSA configuration files"
> +FILES_${PN} = "${sbindir}/alsaconf"
> +
> +S = "${WORKDIR}/alsa-utils-${PV}"
> +
Do you mean to point into the alsa-utils actual workdir where alsaconf 
has been created?  Then you could also avoid unpacking.

> +do_configure() {
> +	# Nothing to configure
> +	:

By doing nothing here, the alsaconf does not get created since there is 
only an alsaconf.in

Sau!

> +}
> +
> +do_install() {
> +	install -d ${D}${sbindir}
> +	install -m 0755 ${S}/alsaconf/alsaconf ${D}${sbindir}/
> +}
> diff --git a/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb b/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb
> index 7fe3bac..e0bf755 100644
> --- a/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-utils_1.0.26.bb
> @@ -39,7 +39,6 @@ ALSA_UTILS_PKGS = "\
>                alsa-utils-speakertest \
>                alsa-utils-aseqnet \
>                alsa-utils-aseqdump \
> -             alsa-utils-alsaconf \
>                alsa-utils-alsactl \
>                alsa-utils-alsaloop \
>                alsa-utils-alsaucm \
> @@ -47,7 +46,6 @@ ALSA_UTILS_PKGS = "\
>
>   PACKAGES += "${ALSA_UTILS_PKGS}"
>   RDEPENDS_${PN} += "${ALSA_UTILS_PKGS}"
> -RDEPENDS_alsa-utils-alsaconf += "bash"
>
>   FILES_${PN} = ""
>   FILES_alsa-utils-aplay       = "${bindir}/aplay ${bindir}/arecord"
> @@ -60,7 +58,6 @@ FILES_alsa-utils-aseqnet     = "${bindir}/aseqnet"
>   FILES_alsa-utils-iecset      = "${bindir}/iecset"
>   FILES_alsa-utils-alsactl     = "${sbindir}/alsactl */udev/rules.d ${systemd_unitdir} ${localstatedir}/lib/alsa ${datadir}/alsa/init/"
>   FILES_alsa-utils-aseqdump    = "${bindir}/aseqdump"
> -FILES_alsa-utils-alsaconf    = "${sbindir}/alsaconf"
>   FILES_alsa-utils-alsaloop    = "${bindir}/alsaloop"
>   FILES_alsa-utils-alsaucm     = "${bindir}/alsaucm"
>
> @@ -73,9 +70,16 @@ DESCRIPTION_alsa-utils-midi         = "miscalleanous MIDI utilities for ALSA"
>   DESCRIPTION_alsa-utils-aconnect     = "ALSA sequencer connection manager"
>   DESCRIPTION_alsa-utils-aseqnet      = "network client/server on ALSA sequencer"
>   DESCRIPTION_alsa-utils-alsactl      = "saves/restores ALSA-settings in /etc/asound.state"
> -DESCRIPTION_alsa-utils-alsaconf     = "a bash script that creates ALSA configuration files"
>   DESCRIPTION_alsa-utils-alsaucm      = "ALSA Use Case Manager"
>
>   RRECOMMENDS_alsa-utils-alsactl = "alsa-states"
>
>   ALLOW_EMPTY_alsa-utils = "1"
> +
> +do_install() {
> +	autotools_do_install
> +
> +	# We don't ship this here because it requires a dependency on bash.
> +	# See alsa-utils-alsaconf_${PV}.bb
> +	rm ${D}${sbindir}/alsaconf
> +}
>


