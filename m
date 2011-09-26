Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8KqG-0001eR-EP
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 01:44:08 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Sep 2011 16:38:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,447,1312182000"; d="scan'208";a="55942664"
Received: from unknown (HELO [10.255.14.215]) ([10.255.14.215])
	by azsmga001.ch.intel.com with ESMTP; 26 Sep 2011 16:38:42 -0700
Message-ID: <4E810D02.6080101@linux.intel.com>
Date: Mon, 26 Sep 2011 16:38:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US;
	rv:1.9.2.22) Gecko/20110902 Thunderbird/3.1.14
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1316955346-12756-1-git-send-email-julian.pidancet@gmail.com>
In-Reply-To: <1316955346-12756-1-git-send-email-julian.pidancet@gmail.com>
Cc: Julian Pidancet <julian.pidancet@gmail.com>
Subject: Re: [PATCH] Use useradd and update-rc.d classes in the OpenSSH recipe
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
X-List-Received-Date: Mon, 26 Sep 2011 23:44:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/25/2011 05:55 AM, Julian Pidancet wrote:
> The current sshd postinst and postrm scripts in the OpenSSH make the
> package dependant of the adduser/addgroup scripts which may not be
> available on all systems.
>
> This patch replaces the sshd postinst and postrm scripts with proper
> usage of the useradd and update-rc.d classes.
>
> Signed-off-by: Julian Pidancet<julian.pidancet@gmail.com>
> ---
>   meta/recipes-connectivity/openssh/openssh_5.8p2.bb |   29 +++++--------------
>   1 files changed, 8 insertions(+), 21 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
> index 030a83b..c94ec84 100644
> --- a/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_5.8p2.bb
> @@ -29,6 +29,14 @@ PAM_SRC_URI = "file://sshd"
>   SRC_URI[md5sum] = "0541579adf9d55abb15ef927048d372e"
>   SRC_URI[sha256sum] = "5c35ec7c966ce05cc4497ac59c0b54a556e55ae7368165cc8c4129694654f314"
>
> +inherit useradd update-rc.d
> +
> +USERADD_PACKAGES = "${PN}-sshd"
> +USERADD_PARAM_${PN}-sshd = "-r -M -d /var/run/sshd -s /bin/false -U sshd"
Is there a reason you did not include the group and --disable-password here?

I think it would be good to leave thelong name options in also.

Sau!

> +INITSCRIPT_PACKAGES = "${PN}-sshd"
> +INITSCRIPT_NAME_${PN}-sshd = "sshd"
> +INITSCRIPT_PARAMS_${PN}-sshd = "defaults 9"
> +
>   inherit autotools
>
>   # LFS support:
> @@ -91,16 +99,6 @@ RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
>   DEPENDS_${PN}-sshd += "update-rc.d"
>   RDEPENDS_${PN}-sshd += "update-rc.d ${PN}-keygen"
>
> -pkg_postinst_${PN}-sshd () {
> -	if [ "x$D" != "x" ]; then
> -		exit 1
> -	else
> -		addgroup sshd
> -		adduser --system --home /var/run/sshd --no-create-home --disabled-password --ingroup sshd -s /bin/false sshd
> -		update-rc.d sshd defaults 9
> -	fi
> -}
> -
>   pkg_postinst_${PN}-scp () {
>   	update-alternatives --install ${bindir}/scp scp scp.${PN} 90
>   }
> @@ -117,16 +115,5 @@ pkg_postrm_${PN}-scp () {
>   	update-alternatives --remove ${bindir}/scp scp.${PN}
>   }
>
> -pkg_postrm_${PN}-sshd () {
> -	if [ "x$D" != "x" ]; then
> -		exit 1
> -	else
> -		${sysconfdir}/init.d/sshd stop
> -		deluser sshd
> -		delgroup sshd
> -		update-rc.d -f sshd remove
> -	fi
> -}
> -
>   CONFFILES_${PN}-sshd = "${sysconfdir}/ssh/sshd_config"
>   CONFFILES_${PN}-ssh = "${sysconfdir}/ssh/ssh_config"


