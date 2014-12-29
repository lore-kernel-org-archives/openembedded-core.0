Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E77CE725E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Dec 2014 10:50:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBTAoUsf005413
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Mon, 29 Dec 2014 02:50:30 -0800 (PST)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 29 Dec 2014 02:50:30 -0800
Message-ID: <54A131F4.6000209@windriver.com>
Date: Mon, 29 Dec 2014 18:50:28 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>, <otavio@ossystems.com.br>
References: <fc5e255d320745caa24d7734547c35b34a17cb63.1419840627.git.hongxu.jia@windriver.com>
	<6085402fe2d84510e4262bd3c2b8fd84ff5fa805.1419846944.git.hongxu.jia@windriver.com>
In-Reply-To: <6085402fe2d84510e4262bd3c2b8fd84ff5fa805.1419846944.git.hongxu.jia@windriver.com>
Subject: Re: [PATCH V3 4/4] busybox.inc: fix QA package-missing warnings
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
X-List-Received-Date: Mon, 29 Dec 2014 10:50:36 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Changed in V3:

There is a failure to build core-image-minimal while
IMAGE_INSTALL_append = " busybox-udhcpd"
...
NOTE: Runtime target 'busybox-udhcpd' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['busybox-udhcpd']
ERROR: Required build target 'core-image-minimal' has no buildable 
providers.
Missing or unbuildable dependency chain was: ['core-image-minimal', 
'busybox-udhcpd']
...

Treat these as dynamic packages could fix this issue.

//Hongxu

On 12/29/2014 06:45 PM, Hongxu Jia wrote:
> While building busybox with QA package-missing checking enabled,
> there was warning:
> ...
> WARNING: QA Issue: package busybox-mdev not generated, but listed in PACKAGES
> WARNING: QA Issue: package busybox-httpd not generated, but listed in PACKAGES
> ...
>
> The config in ${B}/.config decides to generate busybox-mdev, busybox-hwclock,
> busybox-udhcpd, busybox-httpd, busybox-udhcpc, busybox-syslog or not. Files
> are copied if the packages generated. Set PACKAGES in do_package according
> to the existance of these files, so we could dynamicly generate these packages
> according to the configuration.
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta/recipes-core/busybox/busybox.inc | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 0769d92..7b23190 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -19,7 +19,7 @@ export EXTRA_CFLAGS = "${CFLAGS}"
>   export EXTRA_LDFLAGS = "${LDFLAGS}"
>   export EXTRA_OEMAKE += "'LD=${CCLD}'"
>   
> -PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
> +PACKAGES_DYNAMIC += "^${PN}-(udhcpd|hwclock|mdev|httpd|syslog|udhcpc)"
>   
>   FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
>   FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
> @@ -317,6 +317,24 @@ python () {
>   }
>   
>   python do_package_prepend () {
> +    if os.path.exists(d.expand("${D}${sysconfdir}/udhcpc.d")):
> +        d.prependVar('PACKAGES', d.expand('${PN}-udhcpc '))
> +
> +    if os.path.exists(d.expand("${D}${sysconfdir}/init.d/syslog.${BPN}")):
> +        d.prependVar('PACKAGES', d.expand('${PN}-syslog '))
> +
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


