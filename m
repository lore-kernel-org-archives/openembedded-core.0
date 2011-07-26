Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qlioo-0005t0-6u for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 16:41:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6QEavfw022277
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:36:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22091-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:36:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6QEaqnD022271
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2011 15:36:53 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1f4c4205e480da53c3af9bb89f8d49a73fdc1c1e.1311668437.git.sgw@linux.intel.com>
References: <cover.1311668437.git.sgw@linux.intel.com>
	<1f4c4205e480da53c3af9bb89f8d49a73fdc1c1e.1311668437.git.sgw@linux.intel.com>
Date: Tue, 26 Jul 2011 15:36:44 +0100
Message-ID: <1311691004.2344.256.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC-WIP 1/3] classes/image*: Revamp creation of live images
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jul 2011 14:41:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-07-26 at 01:24 -0700, Saul Wold wrote:
> This creates a live image as an IMAGE_FSTYPES, thus removing the
> need to have additional -live.bb recipes.  To create a live image
> one just needs to add live to the IMAGE_FSTYPES list
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../{bootimg.bbclass => image-live.bbclass}        |   11 +++++++++++
>  meta/classes/image.bbclass                         |    3 +++
>  meta/classes/image_types.bbclass                   |   20 ++++++++++++++++++--
>  3 files changed, 32 insertions(+), 2 deletions(-)
>  create mode 100644 meta/classes/image-empty.bbclass
>  rename meta/classes/{bootimg.bbclass => image-live.bbclass} (91%)
> 
> diff --git a/meta/classes/image-empty.bbclass b/meta/classes/image-empty.bbclass
> new file mode 100644
> index 0000000..e69de29
> diff --git a/meta/classes/bootimg.bbclass b/meta/classes/image-live.bbclass
> similarity index 91%
> rename from meta/classes/bootimg.bbclass
> rename to meta/classes/image-live.bbclass
> index 49ee85e..c9cd524 100644
> --- a/meta/classes/bootimg.bbclass
> +++ b/meta/classes/image-live.bbclass
> @@ -25,6 +25,17 @@
>  # ${APPEND} - an override list of append strings for each label
>  # ${SYSLINUX_OPTS} - additional options to add to the syslinux file ';' delimited 
>  
> +AUTO_SYSLINUXCFG = "1"
> +INITRD = "${DEPLOY_DIR_IMAGE}/core-image-minimal-initramfs-${MACHINE}.cpio.gz"
> +APPEND += "root=/dev/ram0 "
> +TIMEOUT = "10"
> +LABELS += "boot install"
> +
> +ROOTFS = "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
> +
> +do_bootimg[depends] += "core-image-minimal-initramfs:do_rootfs"
> +do_bootimg[depends] += "${IMAGE_BASENAME}:do_rootfs"
> +
>  do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
>                         syslinux:do_populate_sysroot \
>                         syslinux-native:do_populate_sysroot \

It might be an idea to leave bootimg.bbclass as is for anyone using it
as it currently stands and make this image-xxx.bbclass inherit it?


> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index edfb2d6..79a56f0 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -29,6 +29,9 @@ LDCONFIGDEPEND_libc-uclibc = ""
>  do_rootfs[depends] += "makedevs-native:do_populate_sysroot virtual/fakeroot-native:do_populate_sysroot ${LDCONFIGDEPEND}"
>  do_rootfs[depends] += "virtual/update-alternatives-native:do_populate_sysroot update-rc.d-native:do_populate_sysroot"
>  
> +IMAGE_TYPE = ${@base_contains("IMAGE_FSTYPES", "live", "live", "empty", d)}
> +inherit image-${IMAGE_TYPE}
> +
>  python () {
>      deps = bb.data.getVarFlag('do_rootfs', 'depends', d) or ""
>      for type in (bb.data.getVar('IMAGE_FSTYPES', d, True) or "").split():
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 1108802..1efdf06 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -1,7 +1,23 @@
> +
>  def get_imagecmds(d):
>      cmds = "\n"
>      old_overrides = bb.data.getVar('OVERRIDES', d, 0)
> -    for type in bb.data.getVar('IMAGE_FSTYPES', d, True).split():
> +
> +    types = bb.data.getVar('IMAGE_FSTYPES', d, True).split()

Er, how about:

if "live" in types:
    # For live images, ensure they get processed last
    # live images also depend on ext3 so ensure its present
    types.remove("live")
    if "ext3" not in types:
        types.append("ext3")
    types.append("live")

> +    try:
> +        live_pos = types.index("live")
> +        try:
> +            ext3_pos = types.index("ext3")
> +        except ValueError:
> +            types.insert(live_pos, "ext3")
> +        else:
> +            if ext3_pos > live_pos:
> +                types.pop(live_pos)
> +                #types.append("live")
> +    except ValueError:
> +        pass
> +
> +    for type in types:
>          localdata = bb.data.createCopy(d)
>          localdata.setVar('OVERRIDES', '%s:%s' % (type, old_overrides))
>          bb.data.update_data(localdata)
> @@ -103,4 +119,4 @@ IMAGE_DEPENDS_ubi = "mtd-utils-native"
>  IMAGE_DEPENDS_ubifs = "mtd-utils-native"
>  
>  # This variable is available to request which values are suitable for IMAGE_FSTYPES
> -IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz squashfs squashfs-lzma ubi"
> +IMAGE_TYPES = "jffs2 cramfs ext2 ext2.gz ext3 ext3.gz live squashfs squashfs-lzma ubi"

Otherwise looks good :)

Cheers,

Richard



