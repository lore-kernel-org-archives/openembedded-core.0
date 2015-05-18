Return-Path: <psidhu@gateworks.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id CFB2360125
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 23:05:55 +0000 (UTC)
Received: by wibt6 with SMTP id t6so1346245wib.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 16:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=V7IYQ03HexnNBLmsAH2gv0i3U9Tc9MqN0oypZTTqbRs=;
	b=Vv2yT1/6CIj7WNcCjU95ywSqqqPOvHddOJzS5ucF/rTOoWRmVGR2gXNa6WRaL8JKME
	LUll9X4kF6sW2WSCIX0FM24xtNM4xeuNI+PKznkcbvE7BE7cXJQaPZ3gDrdBfIOw8FmB
	hVKVcUlgVfBnBsOgzxONoXOCA0E75bJsD5a2j2ZUffJcvVT7jM7PROlI9ODoML2kWI9t
	ujbDS302kQuEEdNaNCXnckKyOzKXhXvIjRxwHBzQulgNMmH1XfgxC9NnoWKahDPnLQNe
	mxwx1qpqL5eBNXztWDFnzO+1XTRwjnAAKumGjFoz9w64wHcBduMwqeBAelj+X5iXfRl0
	mNSg==
X-Gm-Message-State: ALoCoQlMVA4N/+xOq3yNylV3+XygkXCfNj8OZqh4ShEkRanXtCVL2dv8zPo03jDNffTUkEyFC6mR
X-Received: by 10.180.84.168 with SMTP id a8mr26428756wiz.40.1431990357060;
	Mon, 18 May 2015 16:05:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.58.70 with HTTP; Mon, 18 May 2015 16:05:26 -0700 (PDT)
In-Reply-To: <1429921386-17007-2-git-send-email-psidhu@gateworks.com>
References: <1429921386-17007-1-git-send-email-psidhu@gateworks.com>
	<1429921386-17007-2-git-send-email-psidhu@gateworks.com>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Mon, 18 May 2015 16:05:26 -0700
Message-ID: <CAD1M060jUQOR4XQZvNTtkZyscV3O-+e5D5mdEiN=5UXNErDwLg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types.bbclass: add support for multiple ubi sizes
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
X-List-Received-Date: Mon, 18 May 2015 23:05:57 -0000
Content-Type: text/plain; charset=UTF-8

Richard,

Can I get some feedback/consumption on this?

- Pushpal

On Fri, Apr 24, 2015 at 5:23 PM, Pushpal Sidhu <psidhu@gateworks.com> wrote:
> Add new FSTYPE called 'multiubi'. This new type has the ability to
> create multple ubi's, something that's extremely useful on boards that
> can include varying flash sizes (e.g. 256MB vs 2GB).
>
> Because we don't want to reuse code, I extracted the mkfs and ubinize
> commands out to a new function that will handle the creation of both
> multiple ubi's, as well as the 'ubi' FSTYPE (so as not to break current
> boards).
>
> Due to the single processes nature of the OE when doing it's
> 'create_image', this new multiubi_mkfs function also creates it's own
> symlinks as well as cleans up it's own cfg file.
>
> Signed-off-by: Pushpal Sidhu <psidhu@gateworks.com>
> ---
>  meta/classes/image_types.bbclass | 55 +++++++++++++++++++++++++++++++---------
>  1 file changed, 43 insertions(+), 12 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 72c7337..b250dbd 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -97,18 +97,48 @@ IMAGE_TYPEDEP_elf = "cpio.gz"
>
>  UBI_VOLNAME ?= "${MACHINE}-rootfs"
>
> -IMAGE_CMD_ubi () {
> -       echo \[ubifs\] > ubinize.cfg
> -       echo mode=ubi >> ubinize.cfg
> -       echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs >> ubinize.cfg
> -       echo vol_id=0 >> ubinize.cfg
> -       echo vol_type=dynamic >> ubinize.cfg
> -       echo vol_name=${UBI_VOLNAME} >> ubinize.cfg
> -       echo vol_flags=autoresize >> ubinize.cfg
> -       mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}
> -       ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubi ${UBINIZE_ARGS} ubinize.cfg
> +multiubi_mkfs() {
> +       local mkubifs_args="$1"
> +       local ubinize_args="$2"
> +       local vname="_$3"
> +
> +       echo \[ubifs\] > ubinize${vname}.cfg
> +       echo mode=ubi >> ubinize${vname}.cfg
> +       echo image=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}.rootfs.ubifs >> ubinize${vname}.cfg
> +       echo vol_id=0 >> ubinize${vname}.cfg
> +       echo vol_type=dynamic >> ubinize${vname}.cfg
> +       echo vol_name=${UBI_VOLNAME} >> ubinize${vname}.cfg
> +       echo vol_flags=autoresize >> ubinize${vname}.cfg
> +       mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}.rootfs.ubifs ${mkubifs_args}
> +       ubinize -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}${vname}.rootfs.ubi ${ubinize_args} ubinize${vname}.cfg
> +
> +       # Cleanup cfg file
> +       mv ubinize${vname}.cfg ${DEPLOY_DIR_IMAGE}/
> +
> +       # Create own symlink
> +       cd ${DEPLOY_DIR_IMAGE}
> +       if [ -e ${IMAGE_NAME}${vname}.rootfs.ubifs ]; then
> +               ln -sf ${IMAGE_NAME}${vname}.rootfs.ubifs \
> +               ${IMAGE_LINK_NAME}${vname}.ubifs
> +       fi
> +       if [ -e ${IMAGE_NAME}${vname}.rootfs.ubi ]; then
> +               ln -sf ${IMAGE_NAME}${vname}.rootfs.ubi \
> +               ${IMAGE_LINK_NAME}${vname}.ubi
> +       fi
> +       cd -
> +}
> +
> +IMAGE_CMD_multiubi () {
> +       # Split MKUBIFS_ARGS_<name> and UBINIZE_ARGS_<name>
> +       for name in ${MULTIUBI_BUILD}; do
> +               eval local mkubifs_args=\"\$MKUBIFS_ARGS_${name}\"
> +               eval local ubinize_args=\"\$UBINIZE_ARGS_${name}\"
> +
> +               multiubi_mkfs "${mkubifs_args}" "${ubinize_args}" "${name}"
> +       done
>  }
> -IMAGE_TYPEDEP_ubi = "ubifs"
> +
> +IMAGE_CMD_ubi = "multiubi_mkfs "${MKUBIFS_ARGS}" "${UBINIZE_ARGS}" "${UBI_VOLNAME}""
>
>  IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.ubifs ${MKUBIFS_ARGS}"
>
> @@ -139,6 +169,7 @@ IMAGE_DEPENDS_squashfs-lzo = "squashfs-tools-native"
>  IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
>  IMAGE_DEPENDS_ubi = "mtd-utils-native"
>  IMAGE_DEPENDS_ubifs = "mtd-utils-native"
> +IMAGE_DEPENDS_multiubi = "mtd-utils-native"
>
>  # This variable is available to request which values are suitable for IMAGE_FSTYPES
>  IMAGE_TYPES = " \
> @@ -151,7 +182,7 @@ IMAGE_TYPES = " \
>      iso \
>      hddimg \
>      squashfs squashfs-xz squashfs-lzo \
> -    ubi ubifs \
> +    ubi ubifs multiubi \
>      tar tar.gz tar.bz2 tar.xz tar.lz4 \
>      cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
>      vmdk \
> --
> 2.3.5
>

