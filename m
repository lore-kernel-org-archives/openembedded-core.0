Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id B086C6D3A7
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2013 11:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 3222331468D1
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2013 12:43:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id rzJWt5_p7x1x
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2013 12:43:26 +0100 (CET)
Received: from [172.22.22.61] (unknown [212.255.226.106])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id EA9323144AEB
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2013 12:43:25 +0100 (CET)
Message-ID: <52A45B5D.90600@opendreambox.org>
Date: Sun, 08 Dec 2013 12:43:25 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1384242441-27215-1-git-send-email-rongqing.li@windriver.com>
In-Reply-To: <1384242441-27215-1-git-send-email-rongqing.li@windriver.com>
Subject: Re: [PATCH v8] connman: ignore the networking device which nfs for rootfs is working on
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
X-List-Received-Date: Sun, 08 Dec 2013 11:43:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Roy,

On 12.11.2013 08:47, rongqing.li@windriver.com wrote:
> From: Roy Li <rongqing.li@windriver.com>
> 
> Create connman-evn.service, which will run a script to compute the networking
                 ^^^
this should read connman-env.service.

> device when nfs root is on, and pass the result to connman.service
> 
> Connmand.service add ExecStartPre into Connmand.service to release
> do_configure_append work, use the options which is passed by connman-evn.service
> 
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  meta/recipes-connectivity/connman/connman.inc      |   17 +++++-----
>  .../connman/connman/connman-env.service            |   13 ++++++++
>  .../connman/connman/connmand-env                   |   26 +++++++++++++++
>  ...ardcode-and-add-EnvironmentFile-and-Wants.patch |   33 ++++++++++++++++++++
>  meta/recipes-connectivity/connman/connman_1.19.bb  |    3 ++
>  5 files changed, 85 insertions(+), 7 deletions(-)
>  create mode 100644 meta/recipes-connectivity/connman/connman/connman-env.service
>  create mode 100644 meta/recipes-connectivity/connman/connman/connmand-env
>  create mode 100644 meta/recipes-connectivity/connman/connman/replace-hardcode-and-add-EnvironmentFile-and-Wants.patch
> 
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index 12f3edd..648b9f6 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -64,15 +64,9 @@ python __anonymous () {
>  
>  SYSTEMD_SERVICE_${PN} = "connman.service"
>  SYSTEMD_SERVICE_${PN}-vpn = "connman-vpn.service"
> -SYSTEMD_WIRED_SETUP = "ExecStartPre=-${libdir}/connman/wired-setup"
>  
>  inherit autotools gtk-doc pkgconfig systemd update-rc.d
>  
> -do_configure_append () {
> -	sed -i "s#ExecStart=#${SYSTEMD_WIRED_SETUP}\nExecStart=#" ${S}/src/connman.service
> -
> -}
> -
>  # This allows *everyone* to access ConnMan over DBus, without any access
>  # control.  Really the at_console flag should work, which would mean that
>  # both this and the xuser patch can be dropped.
> @@ -88,6 +82,15 @@ do_install_append() {
>  		sed -i s%@LIBDIR@%${libdir}% ${D}${sysconfdir}/init.d/connman
>  	fi
>  
> +	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +		install -m 0755 ${WORKDIR}/connmand-env ${D}${sbindir}/
> +		install -m 0644 ${WORKDIR}/connman-env.service  ${D}/${systemd_unitdir}/system/
> +		sed -i  -e 's,@SBINDIR@,${sbindir},g' \
> +			-e 's,@LIBDIR@,${libdir},g' \
> +			-e 's,@LOCALSTATEDIR@,${localstatedir},g' \
> +			${D}${systemd_unitdir}/system/*.service
> +	fi
> +
>  	install -d ${D}${bindir}
>  	install -m 0755 ${S}/tools/*-test ${D}${bindir}
>  	if [ -e ${S}/tools/wispr ]; then
> @@ -163,7 +166,7 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
>              ${libdir}/connman/plugins \
>              ${sysconfdir} ${sharedstatedir} ${localstatedir} \
>              ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${datadir}/${PN} \
> -            ${datadir}/dbus-1/system-services/*"
> +            ${datadir}/dbus-1/system-services/* ${systemd_unitdir}/system/connman-env.service"
>  
>  FILES_${PN}-dbg += "${libdir}/connman/*/.debug"
>  
> diff --git a/meta/recipes-connectivity/connman/connman/connman-env.service b/meta/recipes-connectivity/connman/connman/connman-env.service
> new file mode 100644
> index 0000000..c4dc278
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/connman-env.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=Generate options for connection service
> +Before=connman.service
> +ConditionKernelCommandLine=root=/dev/nfs

I received a report of this test failing. It turned out that
root=/dev/nfs is not mandatory. nfsroot=$ip:$path may be used alternatively.

Regards,
Andreas

