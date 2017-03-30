Return-Path: <ejo@pengutronix.de>
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id 1875571AC9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 06:27:15 +0000 (UTC)
Received: from mango.hi.pengutronix.de ([2001:67c:670:100:76d4:35ff:fee8:98b3])
	by metis.ext.pengutronix.de with esmtp (Exim 4.84_2)
	(envelope-from <ejo@pengutronix.de>)
	id 1ctTYB-0004DI-V3; Thu, 30 Mar 2017 08:27:15 +0200
To: openembedded-core@lists.openembedded.org
References: <20170329090733.32101-1-ejo@pengutronix.de>
From: Enrico Joerns <ejo@pengutronix.de>
Message-ID: <34c3db7c-9df2-104d-0083-b28226834042@pengutronix.de>
Date: Thu, 30 Mar 2017 08:27:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170329090733.32101-1-ejo@pengutronix.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:76d4:35ff:fee8:98b3
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: make vconsole a PACKAGECONFIG option
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
X-List-Received-Date: Thu, 30 Mar 2017 06:27:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 03/29/2017 11:07 AM, Enrico Jorns wrote:
> Allowing to remove the systemd-vconsole-setup package without specifying
> the --disable-vconsole configure option for systemd will make the system
> boot with the failure prompt
>
> | systemd-udevd[142]: failed to execute '/lib/systemd/systemd-vconsole-setup' '/lib/systemd/systemd-vconsole-setup': No such file or directory
> | systemd-udevd[96]: Process '/lib/systemd/systemd-vconsole-setup' failed with exit code 2.
>
> as the 90-vconsole.rules will still be installed with having a
> RUN+="/lib/systemd/systemd-vconsole-setup" in it that attempts to
> execute a non-existing binary.
>
> Signed-off-by: Enrico Jorns <ejo@pengutronix.de>
> ---
>  meta/recipes-core/systemd/systemd_232.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_232.bb b/meta/recipes-core/systemd/systemd_232.bb
> index fa6a6a817f..398cb46f0d 100644
> --- a/meta/recipes-core/systemd/systemd_232.bb
> +++ b/meta/recipes-core/systemd/systemd_232.bb
> @@ -47,6 +47,7 @@ PACKAGECONFIG ??= "xz \
>                     randomseed \
>                     machined \
>                     backlight \
> +                   vconsole \
>                     quotacheck \
>                     hostnamed \
>                     ${@bb.utils.contains('TCLIBC', 'glibc', 'myhostname sysusers', '', d)} \
> @@ -79,6 +80,7 @@ PACKAGECONFIG[resolved] = "--enable-resolved,--disable-resolved"
>  PACKAGECONFIG[networkd] = "--enable-networkd,--disable-networkd"
>  PACKAGECONFIG[machined] = "--enable-machined,--disable-machined"
>  PACKAGECONFIG[backlight] = "--enable-backlight,--disable-backlight"
> +PACKAGECONFIG[vconsole] = "--enable-vconsole,--disable-vconsole,,${PN}-vconsole-setup"
>  PACKAGECONFIG[quotacheck] = "--enable-quotacheck,--disable-quotacheck"
>  PACKAGECONFIG[hostnamed] = "--enable-hostnamed,--disable-hostnamed"
>  PACKAGECONFIG[myhostname] = "--enable-myhostname,--disable-myhostname"
> @@ -475,7 +477,6 @@ RDEPENDS_${PN} += "kmod dbus util-linux-mount udev (= ${EXTENDPKGV})"
>  RDEPENDS_${PN} += "volatile-binds update-rc.d"
>
>  RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'serial-getty-generator', '', 'systemd-serialgetty', d)} \
> -                      systemd-vconsole-setup \
>                        systemd-extra-utils \
>                        systemd-compat-units udev-hwdb \
>                        util-linux-agetty  util-linux-fsck e2fsprogs-e2fsck \
>

Ooops, forgot the maintainer CC ;)

Enrico

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5080 |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


