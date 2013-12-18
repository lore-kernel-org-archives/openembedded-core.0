Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E15D60CB1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2013 07:32:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rBI7Wevu016778
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2013 23:32:40 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Tue, 17 Dec 2013 23:32:40 -0800
Message-ID: <52B14FD7.30006@windriver.com>
Date: Wed, 18 Dec 2013 15:33:43 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1387271027.git.Qi.Chen@windriver.com>
	<81011ef08bf3b30e8ccdf7c9ee58b010d13dec77.1387271027.git.Qi.Chen@windriver.com>
In-Reply-To: <81011ef08bf3b30e8ccdf7c9ee58b010d13dec77.1387271027.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.213]
Subject: Re: [PATCH 1/1] image.bbclass: add ability to set systemd default target
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
X-List-Received-Date: Wed, 18 Dec 2013 07:32:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Please drop this one.  It has some problem with live images.
I'll send out a V2.

//Chen Qi

On 12/17/2013 05:05 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Add ability to set the default target for systemd images.
>
> The default value for the target is derived from checking whether
> IMAGE_FEATRUES contains 'x11-base' or not. Each image could override
> this value in its own recipe. For now, we don't need to do any change,
> because all images that support graphical environment has 'x11-base'
> in its IMAGE_FEATRUES.
>
> [YOCTO #3816]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/classes/image.bbclass |    8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index c595721..c8366d6 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -186,6 +186,9 @@ IMAGE_MANIFEST = "${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.manifest"
>   ROOTFS_POSTPROCESS_COMMAND =+ "write_image_manifest ; "
>   # Set default postinst log file
>   POSTINST_LOGFILE ?= "${localstatedir}/log/postinstall.log"
> +# Set default target for systemd images
> +SYSTEMD_DEFAULT_TARGET ?= '${@base_contains("IMAGE_FEATURES", "x11-base", "graphical.target", "multi-user.target", d)}'
> +ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("DISTRO_FEATURES", "systemd", "set_systemd_default_target; ", "", d)}'
>   
>   # some default locales
>   IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
> @@ -596,6 +599,11 @@ postinst_enable_logging () {
>   	echo "LOGFILE=${POSTINST_LOGFILE}" >> ${IMAGE_ROOTFS}${sysconfdir}/default/postinst
>   }
>   
> +# Modify systemd default target
> +set_systemd_default_target () {
> +	ln -sf ${systemd_unitdir}/system/${SYSTEMD_DEFAULT_TARGET} ${IMAGE_ROOTFS}${sysconfdir}/systemd/system/default.target
> +}
> +
>   # Turn any symbolic /sbin/init link into a file
>   remove_init_link () {
>   	if [ -h ${IMAGE_ROOTFS}/sbin/init ]; then


