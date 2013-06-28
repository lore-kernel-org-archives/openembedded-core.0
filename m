Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id D75B160655
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 16:02:25 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 28 Jun 2013 09:01:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="323977611"
Received: from unknown (HELO [10.255.13.119]) ([10.255.13.119])
	by azsmga001.ch.intel.com with ESMTP; 28 Jun 2013 09:00:27 -0700
Message-ID: <51CDB31A.8050100@linux.intel.com>
Date: Fri, 28 Jun 2013 09:00:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Shakeel, Muhammad" <Muhammad_Shakeel@mentor.com>
References: <1371660580-4754-1-git-send-email-muhammad_shakeel@mentor.com>
	<A8A2F4C5E3D3D0468DDA3544476725F8AE1F5519@EU-MBX-04.mgc.mentorg.com>
In-Reply-To: <A8A2F4C5E3D3D0468DDA3544476725F8AE1F5519@EU-MBX-04.mgc.mentorg.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [dylan] lighttpd: Enabling with systemd
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
X-List-Received-Date: Fri, 28 Jun 2013 16:02:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/28/2013 06:01 AM, Shakeel, Muhammad wrote:
> Hi Saul,
>
> Can you please comment on the status of this patch? Can it be merged to master branch only?
>
I am sorry, I thought this was a dylan only patch, if it's bound for 
both, please don't tag it as a dylan patch.

I will review this today.

Sau!

> I guess Martin is also working to move systemd-layer related changes into oe-core for 1.5 release and he has already updated some recipes. Should I consult him regarding this kind of changes?
>
> Best Regards,
> Shakeel
> ________________________________________
> From: Shakeel, Muhammad
> Sent: Wednesday, June 19, 2013 9:49 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Shakeel, Muhammad
> Subject: [PATCH] [dylan] lighttpd: Enabling with systemd
>
> From: Muhammad Shakeel <muhammad_shakeel@mentor.com>
>
> - Remove dependency on systemd layer
> - Use lighttpd service type 'simple' rather than 'oneshot'
>
> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> ---
>   meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb |   11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
> index df6ce97..d73a76a 100644
> --- a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
> +++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
> @@ -5,7 +5,6 @@ BUGTRACKER = "http://redmine.lighttpd.net/projects/lighttpd/issues"
>   LICENSE = "BSD"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"
>
> -
>   SECTION = "net"
>   DEPENDS = "zlib libpcre"
>   RDEPENDS_${PN} += " \
> @@ -18,10 +17,15 @@ RDEPENDS_${PN} += " \
>
>   PR = "r0"
>
> +inherit systemd
> +
> +SYSTEMD_SERVICE_${PN} = "lighttpd.service"
> +
>   SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.tar.bz2 \
>           file://index.html.lighttpd \
>           file://lighttpd.conf \
>           file://lighttpd \
> +        file://lighttpd.service \
>           "
>
>   SRC_URI[md5sum] = "8e2d4ae8e918d4de1aeb9842584d170b"
> @@ -49,6 +53,11 @@ do_install_append() {
>       install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
>       install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
>       install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
> +
> +    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/lighttpd.service ${D}${systemd_unitdir}/system
> +    fi
>   }
>
>   FILES_${PN} += "${sysconfdir} /www"
> --
> 1.7.9.5
>

