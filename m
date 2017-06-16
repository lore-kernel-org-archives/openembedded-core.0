Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 77E9978484
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0524720B7A;
	Fri, 16 Jun 2017 16:47:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id XbM5hOKYHkRV; Fri, 16 Jun 2017 16:47:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D68FE207A3;
	Fri, 16 Jun 2017 16:47:00 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 6230C162504; Fri, 16 Jun 2017 12:47:00 -0400 (EDT)
Date: Fri, 16 Jun 2017 12:47:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Leonel Gonzalez <lgonzalez@us.ibm.com>
Message-ID: <20170616164700.GK28053@denix.org>
References: <1497630997-13100-1-git-send-email-lgonzalez@us.ibm.com>
MIME-Version: 1.0
In-Reply-To: <1497630997-13100-1-git-send-email-lgonzalez@us.ibm.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] rngd: Add service file and systemd package config to rngd
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
X-List-Received-Date: Fri, 16 Jun 2017 16:47:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> rngd: Add service file and systemd package config to rngd

It should be instead:

rng-tools: Add service file and systemd package config to rngd


On Fri, Jun 16, 2017 at 11:36:37AM -0500, Leonel Gonzalez wrote:
> Signed-off-by: Leonel Gonzalez <lgonzalez@us.ibm.com>
> ---
>  meta/recipes-support/rng-tools/rng-tools/rngd.service |  8 ++++++++
>  meta/recipes-support/rng-tools/rng-tools_5.bb         | 17 +++++++++++++++--
>  2 files changed, 23 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-support/rng-tools/rng-tools/rngd.service
> 
> diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
> new file mode 100644
> index 0000000..7b0e9a7
> --- /dev/null
> +++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
> @@ -0,0 +1,8 @@
> +[Unit]
> +Description=Hardware RNG Entropy Gatherer Daemon
> +
> +[Service]
> +ExecStart=@SBINDIR@/rngd -f
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta/recipes-support/rng-tools/rng-tools_5.bb b/meta/recipes-support/rng-tools/rng-tools_5.bb
> index e2acaba..c6d08e6 100644
> --- a/meta/recipes-support/rng-tools/rng-tools_5.bb
> +++ b/meta/recipes-support/rng-tools/rng-tools_5.bb
> @@ -9,7 +9,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gkernel/${BP}.tar.gz \
>             file://uclibc-libuargp-configure.patch \
>             file://rng-tools-5-fix-textrels-on-PIC-x86.patch \
>             file://init \
> -           file://default"
> +           file://default \
> +           file://rngd.service"
>  
>  SRC_URI[md5sum] = "6726cdc6fae1f5122463f24ae980dd68"
>  SRC_URI[sha256sum] = "60a102b6603bbcce2da341470cad42eeaa9564a16b4490e7867026ca11a3078e"
> @@ -21,7 +22,7 @@ python () {
>          d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
>  }
>  
> -inherit autotools update-rc.d
> +inherit autotools update-rc.d systemd
>  
>  PACKAGECONFIG = "libgcrypt"
>  PACKAGECONFIG_libc-musl = "libargp"
> @@ -29,6 +30,7 @@ PACKAGECONFIG_libc-uclibc = "libuargp"
>  PACKAGECONFIG[libargp] = "--with-libargp,--without-libargp,argp-standalone,"
>  PACKAGECONFIG[libuargp] = "--enable-uclibc,,,"
>  PACKAGECONFIG[libgcrypt] = "--with-libgcrypt,--without-libgcrypt,libgcrypt,"
> +PACKAGECONFIG[systemd] = "--with-systemd=${systemd_unitdir}/system,--without-systemd,systemd"
>  
>  do_install_append() {
>      # Only install the init script when 'sysvinit' is in DISTRO_FEATURES.
> @@ -41,7 +43,18 @@ do_install_append() {
>          install -d "${D}${sysconfdir}/default"
>          install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-tools
>      fi
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 644 ${WORKDIR}/rngd.service ${D}${systemd_unitdir}/system
> +        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/rngd.service
> +    fi
>  }
>  
>  INITSCRIPT_NAME = "rng-tools"
>  INITSCRIPT_PARAMS = "start 30 2 3 4 5 . stop 30 0 6 1 ."
> +
> +RPROVIDES_${PN} += "${PN}-systemd"
> +RREPLACES_${PN} += "${PN}-systemd"
> +RCONFLICTS_${PN} += "${PN}-systemd"
> +SYSTEMD_SERVICE_${PN} = "rngd.service"
> -- 
> 1.8.3.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

