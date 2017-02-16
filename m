Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 63C1C71A32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 04:44:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1G4iebE005195; Thu, 16 Feb 2017 04:44:40 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0Z_RLNHg9V_R; Thu, 16 Feb 2017 04:44:40 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v1G4iZck005186
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 16 Feb 2017 04:44:38 GMT
Message-ID: <1487220274.4999.5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Geoffrey Levillain <geoffrey.levillain@smile.fr>,
	openembedded-core@lists.openembedded.org
Date: Wed, 15 Feb 2017 20:44:34 -0800
In-Reply-To: <20170215173323.10466-3-geoffrey.levillain@smile.fr>
References: <20170215173323.10466-1-geoffrey.levillain@smile.fr>
	<20170215173323.10466-3-geoffrey.levillain@smile.fr>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH v2 2/3] image_overlay.bbclass: Add possibility to install overlays to image
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
X-List-Received-Date: Thu, 16 Feb 2017 04:44:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-02-15 at 18:33 +0100, Geoffrey Levillain wrote:
> There is often a need to add configuration files specific to an
> image,
> to simplify this process we can use a task.
> 
> Fetching is set as noexec for images, but there is a need to fetch
> files
> here. This class permit to use do_fetch, do_unpack and do_patch in
> order
> to get your image-specific overlays to install.
> 
> Signed-off-by: Geoffrey Levillain <geoffrey.levillain@smile.fr>
> ---
>  meta/classes/image_overlay.bbclass | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta/classes/image_overlay.bbclass
> 
> diff --git a/meta/classes/image_overlay.bbclass
> b/meta/classes/image_overlay.bbclass
> new file mode 100644
> index 0000000000..93c1ea6f9f
> --- /dev/null
> +++ b/meta/classes/image_overlay.bbclass
> @@ -0,0 +1,24 @@
> +# Enable SRC_URI for images and use it to install overlays
> +
> +# Let these task be executed to fetch overlay
> +unset do_fetch[noexec]
> +unset do_unpack[noexec]
> +unset do_patch[noexec]

At the same time as you're submitting this, I'm seriously considering a
change where instead of noexec, we'd deltask these tasks. The reason
being I'm not very keen on subverting the package manager and I'm not
convinced this is a particularly desirable way to be altering the
rootfs.

> +# Add a task to install the overlay
> +# (content of folders listed in OVERLAY_ROOT_DIRS is copied in
> rootfs)
> +addtask install_overlay after do_unpack do_patch do_rootfs before
> do_image
> +fakeroot do_install_overlay() {
> +    for dir in ${OVERLAY_ROOT_DIRS}; do
> +        if [ ! -d "${WORKDIR}/${dir}" ] ; then
> +            bbfatal "${dir} not found, please check your
> OVERLAY_ROOT_DIRS and SRC_URI variables."
> +        fi
> +        cp -dr --no-preserve=ownership "${WORKDIR}/${dir}"/*
> "${IMAGE_ROOTFS}"
> +    done
> +}
> +do_install_overlay[depends] += "virtual/fakeroot-
> native:do_populate_sysroot"
> +do_install_overlay[dirs] = "${IMAGE_ROOTFS}"
> +do_install_overlay[umask] = "022"
> +do_install_overlay[vardeps] += "OVERLAY_ROOT_DIRS"
> +
> +SSTATETASKS += "do_install_overlay"

Except this isn't an sstate task? There is no setscene task variant of
the main task. There are no sstate variables set either...

Cheers,

Richard




