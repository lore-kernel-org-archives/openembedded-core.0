Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QHdi8-0007cD-LT
	for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 17:09:56 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 10B6E1660101; Wed,  4 May 2011 09:07:18 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 49E8616600BB;
	Wed,  4 May 2011 09:07:17 -0600 (MDT)
Message-ID: <4DC16BA5.1090508@mlbassoc.com>
Date: Wed, 04 May 2011 09:07:17 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1304520272.git.paul.eggleton@linux.intel.com>
	<a6ff3eaba2e8868cf24775725be334f3479d905c.1304520272.git.paul.eggleton@linux.intel.com>
In-Reply-To: <a6ff3eaba2e8868cf24775725be334f3479d905c.1304520272.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>, poky@yoctoproject.org
Subject: Re: [PATCH 1/3] Remove machine-specific metadata for machines no longer in oe-core
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
X-List-Received-Date: Wed, 04 May 2011 15:09:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2011 08:51 AM, Paul Eggleton wrote:
   ...
> diff --git a/meta/recipes-core/netbase/netbase_4.45.bb b/meta/recipes-core/netbase/netbase_4.45.bb
> index 319afa7..85daa16 100644
> --- a/meta/recipes-core/netbase/netbase_4.45.bb
> +++ b/meta/recipes-core/netbase/netbase_4.45.bb
> @@ -40,7 +40,7 @@ do_install () {
>
>   	# Disable network manager on machines that commonly do NFS booting
>   	case "${MACHINE}" in
> -		"omap-3430sdp" | "omap-3430ldp" | "omap-2430sdp" | "qemuarm" | "qemux86" | "qemux86-64" )
> +		"qemuarm" | "qemux86" | "qemux86-64" | "qemumips" | "qemuppc" )
>   			touch ${D}${sysconfdir}/network/nm-disabled-eth0
>   			;;
>   		*)
> @@ -50,9 +50,6 @@ do_install () {
>
>   CONFFILES_${PN} = "${sysconfdir}/hosts ${sysconfdir}/network/interfaces"
>
> -PACKAGE_ARCH_omap-3430sdp = "${MACHINE_ARCH}"
> -PACKAGE_ARCH_omap-3430ldp = "${MACHINE_ARCH}"
> -PACKAGE_ARCH_omap-2430sdp = "${MACHINE_ARCH}"
>   PACKAGE_ARCH_qemuarm = "${MACHINE_ARCH}"
>   PACKAGE_ARCH_qemux86 = "${MACHINE_ARCH}"
>   PACKAGE_ARCH_qemux86-64 = "${MACHINE_ARCH}"

Perhaps it makes sense to always package netbase in ${MACHINE_ARCH} since it almost
always will have machine specific data?

Also, what about these overrides?  (There may be others, I just noticed these)
./meta/recipes-core/base-passwd/base-passwd_3.5.22.bb:do_install_append_openmn() {
./meta/recipes-core/netbase/netbase_4.45.bb:INITSCRIPT_PARAMS_openmn = "start 85 1 2 3 4 5 . stop 85 0 6 1 ."
./meta/recipes-core/busybox/busybox.inc:INITSCRIPT_PARAMS_${PN}-syslog_slugos = "start 20 ."
./meta/recipes-core/netbase/netbase_4.45.bb:INITSCRIPT_PARAMS_slugos = "start 42 S 0 6 ."
./meta/recipes-core/base-files/base-files_3.0.14.bb:hostname_slugos = "nslu2"
./meta/recipes-core/base-files/base-files_3.0.14.bb:do_install_append_slugos() {
./meta/recipes-core/base-files/base-files_3.0.14.bb:CONFFILES_${PN}_slugos = "${sysconfdir}/resolv.conf ${sysconfdir}/fstab ${sysconfdir}/hostname"
./meta/recipes-devtools/dpkg/dpkg.inc:DPKG_INIT_POSITION_slugos = "41"

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


