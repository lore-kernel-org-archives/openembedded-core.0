Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com
	[209.85.221.175])
	by mail.openembedded.org (Postfix) with ESMTP id 8F13C6C198
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 18:03:50 +0000 (UTC)
Received: by mail-vk1-f175.google.com with SMTP id q189so3017063vkq.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 11:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dzwSap1nR5HHLRQShK1suHaVKanJw+bga0WivXWHxCU=;
	b=hihPy3PyLR0vghwjGlcQZIcKk2CMlpTj7Tolx7f/s0lC5O8E4MTfC/aOhX1VNYFarY
	DSd/kftIaH+Wjc8f6q7LXNkrNVgc0iXBr0w+cogb9tsXl2S3Jd/P7h5itcirT89kNbW1
	uqdzIEk5nqAsbAo5N6J96vqSrwIykbvGD6HIQKnaOB9/cnYKHLdcNnF/9E3LZ39yniS5
	T01DBGvtQRZQZQ8FpDBfM4RMYWSgzLFIS/qaYzNTpQ3Cjm8scoKU32MfWlUycNIQz0xP
	GatzxFxUBp3s3G0nBpr5IrVVTawwFGDv2AgB3D64FzYwTL5opfQHX489WELzX8yabXca
	jV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dzwSap1nR5HHLRQShK1suHaVKanJw+bga0WivXWHxCU=;
	b=WZ4uaELZLetBu/Zy05Y6AQkN9ymoax5hzR50JrYkHVzoa8+gQ3um8WHUgncUoBVoAL
	MZu3d0tvBHPCfIBXUzwLPNT6vu/vVclDHRadVIzf0QyH2hOorNaFDbyggxgeDbIpbILI
	RLQQK/V4Pk6u9IA77FuzumRt3JlbdqO6K+Ake2fGuvS1jfhHPDnejPRKmn+uMRimyDlN
	351scjnpMotk2nCB93aSB+70C9i+Fsxs3oGyLXFV/SLl3whcr3+MsdDJ//N04xztwMoZ
	MOHPi4nCSM4BHgPxCIMpERWikgGCR3P+3Pe9ewW90iZj9edR2SiisULDaerF3zPuxYsE
	QBqA==
X-Gm-Message-State: APjAAAU8NTn77REevAc8NDk6qD3GntyA29YFmoCAJsftGnbFgLVKzKtz
	xuuGDXfil0/H+CwCiVpaHVImXdEfmAmVc3MMcJw=
X-Google-Smtp-Source: APXvYqwiq7RozBqHSdzxztL6VFOSYEyd5/2VrNt0LssWaT8NoXa9/1i0UYYk2yg++9ur5RgEDzGxmLNZOMjf/NuMqPM=
X-Received: by 2002:a1f:1a49:: with SMTP id a70mr9708301vka.33.1553623431217; 
	Tue, 26 Mar 2019 11:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190326164341.5086-1-rosbrookn@ainfosec.com>
In-Reply-To: <20190326164341.5086-1-rosbrookn@ainfosec.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 26 Mar 2019 11:03:39 -0700
Message-ID: <CAJ86T=WbN8hZkWMMODzSXtkvDnsij0Zekw7zh=c3Njxf3R3SBA@mail.gmail.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rootfs-postcommands.bbclass: break up read_only_rootfs_hook
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
X-List-Received-Date: Tue, 26 Mar 2019 18:03:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 26, 2019 at 9:44 AM Nick Rosbrook <rosbrookn@gmail.com> wrote:
>
> The function read_only_rootfs_hook makes changes to ssh, dropbear,
> fstab, and sysvinit configurations. Replace this function with
> four new functions for each component so that they can be removed
> from postprocess independently of each other.

Just curious... but why would you want to remove them? Is one of them
buggy in some way?

> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> ---
>  meta/classes/rootfs-postcommands.bbclass | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
> index bde58ad6cd..110f67e40d 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -15,7 +15,16 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", [ 'deb
>  ROOTFS_POSTPROCESS_COMMAND += "rootfs_update_timestamp ; "
>
>  # Tweak the mount options for rootfs in /etc/fstab if read-only-rootfs is enabled
> -ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_rootfs_hook; ", "",d)}'
> +ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_fstab; ", "",d)}'
> +
> +# Change the default sshd_config if read-only-rootfs is enabled

These comments describing the individual functions should perhaps be
moved to be next to functions themselves.

> +ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_sshd; ", "",d)}'
> +
> +# Change the default key locations for dropbear if read-only-rootfs is enabled
> +ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_dropbear; ", "",d)}'
> +
> +# Tweaks for sysvinit if read-only-rootfs is enabled
> +ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("IMAGE_FEATURES", "read-only-rootfs", "read_only_sysvinit; ", "",d)}'
>
>  # We also need to do the same for the kernel boot parameters,
>  # otherwise kernel or initramfs end up mounting the rootfs read/write
> @@ -86,15 +95,14 @@ systemd_create_users () {
>         done
>  }
>
> -#
> -# A hook function to support read-only-rootfs IMAGE_FEATURES
> -#
> -read_only_rootfs_hook () {
> +read_only_fstab () {
>         # Tweak the mount option and fs_passno for rootfs in fstab
>         if [ -f ${IMAGE_ROOTFS}/etc/fstab ]; then
>                 sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:space:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${IMAGE_ROOTFS}/etc/fstab
>         fi
> +}
>
> +read_only_sshd () {
>         # If we're using openssh and the /etc/ssh directory has no pre-generated keys,
>         # we should configure openssh to use the configuration file /etc/ssh/sshd_config_readonly
>         # and the keys under /var/run/ssh.
> @@ -107,14 +115,18 @@ read_only_rootfs_hook () {
>                         echo "SSHD_OPTS='-f /etc/ssh/sshd_config_readonly'" >> ${IMAGE_ROOTFS}/etc/default/ssh
>                 fi
>         fi
> +}
>
> +read_only_dropbear () {
>         # Also tweak the key location for dropbear in the same way.
>         if [ -d ${IMAGE_ROOTFS}/etc/dropbear ]; then
>                 if [ ! -e ${IMAGE_ROOTFS}/etc/dropbear/dropbear_rsa_host_key ]; then
>                         echo "DROPBEAR_RSAKEY_DIR=/var/lib/dropbear" >> ${IMAGE_ROOTFS}/etc/default/dropbear
>                 fi
>         fi
> +}
>
> +read_only_sysvinit () {
>         if ${@bb.utils.contains("DISTRO_FEATURES", "sysvinit", "true", "false", d)}; then
>                 # Change the value of ROOTFS_READ_ONLY in /etc/default/rcS to yes
>                 if [ -e ${IMAGE_ROOTFS}/etc/default/rcS ]; then
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

