Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Ruyx6-0005Vx-Bw
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 05:16:16 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 07 Feb 2012 20:08:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="64289861"
Received: from unknown (HELO [10.255.14.116]) ([10.255.14.116])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Feb 2012 20:08:12 -0800
Message-ID: <4F31F52C.7030501@linux.intel.com>
Date: Tue, 07 Feb 2012 20:08:12 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1328283997-1968-1-git-send-email-andrei@gherzan.ro>
In-Reply-To: <1328283997-1968-1-git-send-email-andrei@gherzan.ro>
Cc: contato@ossystems.com.br
Subject: Re: [PATCH] dhcp: move dhcp leases files handling to postinst/postrm
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
X-List-Received-Date: Wed, 08 Feb 2012 04:16:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/03/2012 07:46 AM, Andrei Gherzan wrote:
> Both server and client needs access to leases files so its creation
> and removal are now handled by postinst/postrm scripts.
>
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> Signed-off-by: Andrei Gherzan<andrei@gherzan.ro>
> ---
>   meta/recipes-connectivity/dhcp/dhcp.inc         |   19 ++++++++++++++++++-
>   meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb |    2 +-
>   2 files changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/dhcp/dhcp.inc b/meta/recipes-connectivity/dhcp/dhcp.inc
> index 051190f..53479a8 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp.inc
> +++ b/meta/recipes-connectivity/dhcp/dhcp.inc
> @@ -66,12 +66,29 @@ FILES_dhcp-server-config = "${sysconfdir}/default/dhcp-server ${sysconfdir}/dhcp
>
>   FILES_dhcp-relay = "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay ${sysconfdir}/default/dhcp-relay"
>
> -FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf ${localstatedir}/lib/dhcp/"
> +FILES_dhcp-client = "${base_sbindir}/dhclient ${base_sbindir}/dhclient-script ${sysconfdir}/dhcp/dhclient.conf"
>   RDEPENDS_dhcp-client = "bash"
>
>   FILES_dhcp-omshell = "${bindir}/omshell"
>
>   pkg_postinst_dhcp-server() {
> +    mkdir -p $D/${localstatedir}/lib/dhcp
>       touch $D/${localstatedir}/lib/dhcp/dhcpd.leases
>       touch $D/${localstatedir}/lib/dhcp/dhcpd6.leases
>   }
> +
> +pkg_postinst_dhcp-client() {
> +    mkdir -p $D/${localstatedir}/lib/dhcp
> +}
> +
> +pkg_postrm_dhcp-server() {
> +    rm -f $D/${localstatedir}/lib/dhcp/dhcpd.leases
> +    rm -f $D/${localstatedir}/lib/dhcp/dhcpd6.leases
> +    rmdir $D/${localstatedir}/lib/dhcp
> +}
> +
> +pkg_postrm_dhcp-client() {
> +    rm -f $D/${localstatedir}/lib/dhcp/dhclient.leases
> +    rm -f $D/${localstatedir}/lib/dhcp/dhclient6.leases
> +    rmdir $D/${localstatedir}/lib/dhcp
> +}
> \ No newline at end of file
> diff --git a/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb b/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
> index 24b50ba..67af3e2 100644
> --- a/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
> +++ b/meta/recipes-connectivity/dhcp/dhcp_4.2.3-P2.bb
> @@ -1,6 +1,6 @@
>   require dhcp.inc
>
> -PR = "r0"
> +PR = "r1"
>
>   SRC_URI += "file://fixincludes.patch \
>               file://dhcp-3.0.3-dhclient-dbus.patch;striplevel=0 \

I have merged Otavio's patch, so you will need to rebase your DHCP patch 
now I think.

Sau!


