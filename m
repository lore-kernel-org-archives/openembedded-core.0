Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2A03B71449
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 08:19:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBT8Jtpv021989
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 29 Dec 2014 00:19:55 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 29 Dec 2014 00:19:55 -0800
Message-ID: <54A10EA9.4020001@windriver.com>
Date: Mon, 29 Dec 2014 16:19:53 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <otavio@ossystems.com.br>
References: <883cc974857e6896b33eb4be4f5c326840bb90ad.1419471695.git.hongxu.jia@windriver.com>
	<fc5e255d320745caa24d7734547c35b34a17cb63.1419840627.git.hongxu.jia@windriver.com>
In-Reply-To: <fc5e255d320745caa24d7734547c35b34a17cb63.1419840627.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH V2 4/4] busybox.inc: fix QA package-missing warnings
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
X-List-Received-Date: Mon, 29 Dec 2014 08:19:58 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

BTW, just update the git repo in this thread:

   git://git.pokylinux.org/poky-contrib hongxu/package-missing
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/package-missing

//Hongxu

On 12/29/2014 04:16 PM, Hongxu Jia wrote:
> While building busybox with QA package-missing checking enabled,
> there was warning:
> ...
> WARNING: QA Issue: package busybox-mdev not generated, but listed in PACKAGES
> WARNING: QA Issue: package busybox-httpd not generated, but listed in PACKAGES
> ...
>
> The config in ${B}/.config decides to generate busybox-mdev, busybox-hwclock,
> busybox-udhcpd, busybox-httpd or not. Files are copied if the packages generated.
> Set PACKAGES in do_package according to the existance of these files, so we could
> dynamic generate these packages according to the configuration.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-core/busybox/busybox.inc | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 0769d92..95c3b0f 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -19,7 +19,7 @@ export EXTRA_CFLAGS = "${CFLAGS}"
>   export EXTRA_LDFLAGS = "${LDFLAGS}"
>   export EXTRA_OEMAKE += "'LD=${CCLD}'"
>   
> -PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
> +PACKAGES =+ "${PN}-udhcpc ${PN}-syslog"
>   
>   FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
>   FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
> @@ -317,6 +317,18 @@ python () {
>   }
>   
>   python do_package_prepend () {
> +    if os.path.exists(d.expand("${D}${sysconfdir}/init.d/busybox-httpd")):
> +        d.prependVar('PACKAGES', d.expand('${PN}-httpd '))
> +
> +    if os.path.exists(d.expand("${D}${sysconfdir}/init.d/hwclock.sh")):
> +        d.prependVar('PACKAGES', d.expand('${PN}-hwclock '))
> +
> +    if os.path.exists(d.expand("${D}${sysconfdir}/init.d/busybox-udhcpd")):
> +        d.prependVar('PACKAGES', d.expand('${PN}-udhcpd '))
> +
> +    if os.path.exists(d.expand("${D}${sysconfdir}/init.d/mdev")):
> +        d.prependVar('PACKAGES', d.expand('${PN}-mdev '))
> +
>       # We need to load the full set of busybox provides from the /etc/busybox.links
>       # Use this to see the update-alternatives with the right information
>   


