Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5552E60962
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 06:17:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6O6H48H011474
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 23:17:04 -0700 (PDT)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.235.1;
	Thu, 23 Jul 2015 23:16:53 -0700
Message-ID: <55B1D89E.4020000@windriver.com>
Date: Fri, 24 Jul 2015 14:18:06 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1435641416-2577-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1435641416-2577-1-git-send-email-rongqing.li@windriver.com>
X-Originating-IP: [128.224.162.211]
Subject: Re: [PATCH] systemd: fix systemd-udev-hwdb-update service
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
X-List-Received-Date: Fri, 24 Jul 2015 06:17:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

Anybody has objection for this one?

Best Regards,
Chen Qi

On 06/30/2015 01:16 PM, rongqing.li@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> The new version of systemd has implemented the following feature.
> Opointer.de/blog/projects/stateless.html
>
> As a result, the systemd-udev-hwdb-update.service would always run
> at first boot. This will cause failure if the target device doesn't
> have enough storage space. Besides, as we run `udevadm hwdb --update' as
> a postinst of udev-hwdb at rootfs time, there's no need to run this
> again at system start-up.
>
> The purpose of this patch is as follows.
> If `udev hwdb --update' fails at rootfs time, systemd-udev-hwdb-update.service
> is executed at first boot; otherwise, the service is not executed.
>
> This patch achieves the above goal by setting CondistonNeedsUpdate to
> "/etc/udev" in the service file, and creating /etc/udev/.updated file if the
> postinst succeeds.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>   meta/recipes-core/systemd/systemd_219.bb | 18 +++++++++++++++---
>   1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
> index 6ed4fe0..dc5c7b3 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -180,6 +180,10 @@ do_install() {
>   	if [ -s ${D}${libdir}/tmpfiles.d/systemd.conf ]; then
>   		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${libdir}/tmpfiles.d/systemd.conf', d)}
>   	fi
> +
> +	# Make systemd-udev-hwdb-update to check /etc/udev
> +	cp ${D}${systemd_unitdir}/system/systemd-udev-hwdb-update.service ${D}${sysconfdir}/systemd/system
> +	sed -i -e 's#ConditionNeedsUpdate=/etc#ConditionNeedsUpdate=/etc/udev#g' ${D}${sysconfdir}/systemd/system/systemd-udev-hwdb-update.service
>   }
>   
>   do_install_ptest () {
> @@ -381,10 +385,18 @@ ALTERNATIVE_PRIORITY[runlevel] ?= "300"
>   
>   pkg_postinst_udev-hwdb () {
>   	if test -n "$D"; then
> -		${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
> -			--root $D
> +		if ${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} hwdb --update \
> +			--root $D; then
> +			touch $D/etc/udev/.updated
> +		else
> +			exit 1
> +		fi
>   	else
> -		udevadm hwdb --update
> +		if udevadm hwdb --update; then
> +			touch $D/etc/udev/.updated
> +		else
> +			exit 1
> +		fi
>   	fi
>   }
>   


