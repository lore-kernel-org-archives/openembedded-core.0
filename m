Received: from mail-oa0-f51.google.com ([209.85.219.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tq6Zh-0006LR-VS
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Jan 2013 19:28:30 +0100
Received: by mail-oa0-f51.google.com with SMTP id n12so12560841oag.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Jan 2013 10:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=DpCOCNxPD6Jxla1Xrlv4cXA928Ni8S0LegQ5qWxLWlk=;
	b=lwMuUPZpiC/Fh6b6rFlospj2QUWi6RpLDkBFpvgdmt4KYMBFluJqrl99bnK2r06s+D
	C151GeGSOqJO2tgxlYgknTN9rsw999rPeooul8SeFILhSRefLlBW8r5Q6wGWemqTu/Ym
	hkZNgQtsaRe1DaRZOZ8VghB+fItZhTxBUBkXzf2TNqIq2YQQOYBVlbp+2YXcZ+zuwaYn
	uimXfdsxrL+QD9+EIArYxMG4cv56ylyoZATI/zqV5jxUahTjyGF09XG0GKQAX/4S92wn
	LT0PHkIw0r3920cQ2N6r4yh2zEhGaMSLmfR9yU2xd9TdzgR0dnhfUb65u/QI+hs08jeU
	Tu2A==
MIME-Version: 1.0
Received: by 10.60.171.11 with SMTP id aq11mr24731146oec.104.1357064008276;
	Tue, 01 Jan 2013 10:13:28 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.219.130 with HTTP; Tue, 1 Jan 2013 10:13:28 -0800 (PST)
In-Reply-To: <7d6c79b382b07771da688930a34ae0ec8b3ba97a.1356919994.git.Qi.Chen@windriver.com>
References: <cover.1356919994.git.Qi.Chen@windriver.com>
	<7d6c79b382b07771da688930a34ae0ec8b3ba97a.1356919994.git.Qi.Chen@windriver.com>
Date: Tue, 1 Jan 2013 16:13:28 -0200
X-Google-Sender-Auth: IBp0APXGFNyv1cPpf7o863XI1Ww
Message-ID: <CAP9ODKqYRyFC==AF-ubfRTJk7epT+VzgURHsr3hrZYZ=HF6xyg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: ChenQi <Qi.Chen@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V5 3/4] core-image.bbclass: support read-only-rootfs image feature
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 01 Jan 2013 18:28:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 31, 2012 at 12:16 AM,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Two hook functions are appended to ROOTFS_POSTPROCESS_COMMAND
> properly to support the 'read-only-rootfs' image feature.
>
> [YOCTO #3406]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/core-image.bbclass |    7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
> index 2e67018..dc8fdc3 100644
> --- a/meta/classes/core-image.bbclass
> +++ b/meta/classes/core-image.bbclass
> @@ -28,6 +28,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3
>  # - dev-pkgs            - development packages (headers, etc.) for all installed packages in the rootfs
>  # - dbg-pkgs            - debug symbol packages for all installed packages in the rootfs
>  # - doc-pkgs            - documentation packages for all installed packages in the rootfs
> +# - read-only-rootfs    - tweaks an image to support read-only rootfs
>  #
>  PACKAGE_GROUP_x11 = "packagegroup-core-x11"
>  PACKAGE_GROUP_x11-base = "packagegroup-core-x11-base"
> @@ -73,9 +74,11 @@ inherit image
>
>  # Create /etc/timestamp during image construction to give a reasonably sane default time setting
>  ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
> -
> +# Choose the correct configuartion files for volatile storage handling
> +ROOTFS_POSTPROCESS_COMMAND += "choose_volatile_conf_file ; "

You can remove this if you use a package to provide the volatile configuration.

>  # Zap the root password if debug-tweaks feature is not enabled
>  ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks", "", "zap_root_password ; ",d)}'
>  # Allow openssh accept empty password login if both debug-tweaks and ssh-server-openssh are enabled
>  ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "debug-tweaks ssh-server-openssh", "openssh_allow_empty_password; ", "",d)}'
> -
> +# Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
> +ROOTFS_POSTPROCESS_COMMAND += '${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


