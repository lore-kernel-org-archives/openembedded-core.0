Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 933A36FE3B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 18:53:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7SIrKnl016544
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 11:53:21 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.226) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Thu, 28 Aug 2014 11:53:20 -0700
Message-ID: <53FF7A9F.8040108@windriver.com>
Date: Thu, 28 Aug 2014 13:53:19 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1409251282.git.nitin.a.kamble@intel.com>
	<e742f96dea187a45c9f9f3ca9383565f1d460566.1409251282.git.nitin.a.kamble@intel.com>
In-Reply-To: <e742f96dea187a45c9f9f3ca9383565f1d460566.1409251282.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 1/1] imageconfigurator: a new recipe for boottime image configuration
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Aug 2014 18:53:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/28/14, 1:47 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> This recipe adds ability to configure a BSP image for a specific
> machine or platform at the boot time. The machine configurations
> are not provided here, and are to be provided in the BSP layers.
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>   .../imageconfigurator/imageconfigurator_git.bb     | 50 ++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
>   create mode 100644 meta/recipes-bsp/imageconfigurator/imageconfigurator_git.bb
>
> diff --git a/meta/recipes-bsp/imageconfigurator/imageconfigurator_git.bb b/meta/recipes-bsp/imageconfigurator/imageconfigurator_git.bb
> new file mode 100644
> index 0000000..7208ad0
> --- /dev/null
> +++ b/meta/recipes-bsp/imageconfigurator/imageconfigurator_git.bb
> @@ -0,0 +1,50 @@
> +SUMMARY = "Daemon to configure an image for a specific machine at boot time."
> +SECTION = "base"
> +LICENSE = "GPLv3"

Any specific reason for GPLv3 vs GPLv2+?  I have a number of customers who are 
still locked on GPLv2 images for the time being, and they are interested in this 
kind of tool.

--Mark

> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +RDEPENDS_${PN} = "sysvinit sed"
> +
> +PE = "1"
> +PV = "0.1+git${SRCPV}"
> +
> +SRCREV = "90603bed54f7c033a7b2f92214c21d011459844b"
> +
> +SRC_URI = "git://git.yoctoproject.org/imageconfigurator.git"
> +
> +S = "${WORKDIR}/git"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +inherit autotools pkgconfig update-rc.d
> +
> +INITSCRIPT_NAME = "imageconfigurator"
> +INITSCRIPT_PARAMS = "start 00 S . stop 20 0 1 6 ."
> +
> +RRECOMMENDS_${PN} += "kernel-module-uinput"
> +
> +python __anonymous () {
> +    src_uri = d.getVar('SRC_URI', True)
> +    machine_config_files = (d.getVar('MACHINE_CONFIG_FILES', True) or "")
> +    for file in machine_config_files.split():
> +         src_uri += " file://" + file
> +    d.setVar('SRC_URI', src_uri)
> +}
> +
> +do_install_append() {
> +	{
> +	echo SUPPORTED_MACHINES=${SUPPORTED_MACHINES}
> +	echo DEFAULT_MACHINE_SELECTION=${DEFAULT_MACHINE_SELECTION}
> +	} > ${D}/${sysconfdir}/${BPN}/defaults
> +
> +	for file in ${MACHINE_CONFIG_FILES}
> +	do
> +		install -m 0644 ${S}/../${file} ${D}/${sysconfdir}/${BPN}/config/
> +	done
> +}
> +
> +# following variables are initialized to empty values now.
> +# These need to be populated with the desired machine configurations
> +# for each BSP in it's own layer.
> +MACHINE_CONFIG_FILES = ""
> +SUPPORTED_MACHINES = ""
> +DEFAULT_MACHINE_SELECTION = "none"
>


