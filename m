Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1B16876EBF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Sep 2015 08:00:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8180qox010044
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Sep 2015 01:00:53 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 1 Sep 2015 01:00:52 -0700
Message-ID: <55E55B33.70606@windriver.com>
Date: Tue, 1 Sep 2015 16:00:51 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1441094079-19289-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1441094079-19289-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH][meta-oe] lvm2: enable lvmetad
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
X-List-Received-Date: Tue, 01 Sep 2015 08:00:53 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

please drop it, send to wrong mail

sorry for the noise

-Roy

On 2015年09月01日 15:54, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
>
> the systemd unit file of lvm2-monitor requires lvm2-lvmetad.socket which
> asks to enable lvmetad, lvmetad is a metadata caching daemon for LVM. so
> this fixed the below error:
>    # systemctl start lvm2-monitor
>    Failed to start lvm2-monitor.service: Unit lvm2-lvmetad.socket failed to load: No such file or directory.
>    #
>
> replace the installation of system unit file by make install_systemd_units
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>   meta-oe/recipes-support/lvm2/lvm2.inc | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
> index 099164c..2b2d8ed 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2.inc
> +++ b/meta-oe/recipes-support/lvm2/lvm2.inc
> @@ -24,6 +24,7 @@ EXTRA_OECONF = "--with-user= \
>                   --enable-udev_rules \
>                   --enable-pkgconfig \
>                   --enable-dmeventd \
> +                --enable-lvmetad \
>                   --with-udev-prefix= \
>                   --with-usrlibdir=${libdir} \
>   "
> @@ -38,14 +39,13 @@ do_install_append() {
>       # Install machine specific configuration file
>       install -m 0644 ${WORKDIR}/lvm.conf ${D}${sysconfdir}/lvm/lvm.conf
>       sed -i -e 's:@libdir@:${libdir}:g' ${D}${sysconfdir}/lvm/lvm.conf
> -    install -d ${D}${systemd_unitdir}/system
> -    install -m 0644 ${B}/scripts/lvm2_monitoring_systemd_red_hat.service ${D}${systemd_unitdir}/system/lvm2-monitor.service
> -    install -m 0644 ${B}/scripts/dm_event_systemd_red_hat.socket ${D}${systemd_unitdir}/system/dm-event.socket
> -    install -m 0644 ${B}/scripts/dm_event_systemd_red_hat.service ${D}${systemd_unitdir}/system/dm-event.service
> +    oe_runmake 'DESTDIR=${D}' install install_systemd_units
> +    sed -i -e 's:/usr/bin/true:${base_bindir}/true:g' ${D}${systemd_unitdir}/system/blk-availability.service
>   }
>
>   SYSTEMD_PACKAGES = "${PN}"
> -SYSTEMD_SERVICE_${PN} = "lvm2-monitor.service dm-event.socket dm-event.service"
> +SYSTEMD_SERVICE_${PN} = "lvm2-monitor.service dm-event.socket dm-event.service lvm2-lvmetad.socket \
> +                         lvm2-pvscan@.service blk-availability.service"
>   SYSTEMD_AUTO_ENABLE = "disable"
>
>   TARGET_CC_ARCH += "${LDFLAGS}"
>

-- 
Best Reagrds,
Roy | RongQing Li

