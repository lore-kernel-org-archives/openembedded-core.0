Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qm1yF-0000Jr-FQ for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 13:08:11 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6RB3vIl029335
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 12:03:57 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28368-10 for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 12:03:53 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6RB3mrg029329
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jul 2011 12:03:48 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <32b657583d80fc2bd481b1e5ea12af01dda14e49.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
	<32b657583d80fc2bd481b1e5ea12af01dda14e49.1311752531.git.sgw@linux.intel.com>
Date: Wed, 27 Jul 2011 12:03:38 +0100
Message-ID: <1311764618.2344.350.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [Consolidated & Tested 34/35] classes/image*: Revamp creation of live images
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
X-List-Received-Date: Wed, 27 Jul 2011 11:08:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-27 at 00:47 -0700, Saul Wold wrote:
> This creates a live image as an IMAGE_FSTYPES, thus removing the
> need to have additional -live.bb recipes.  To create a live image
> one just needs to add live to the IMAGE_FSTYPES list
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/image-live.bbclass  |   13 +++++++++++++
>  meta/classes/image.bbclass       |    3 +++
>  meta/classes/image_types.bbclass |   15 +++++++++++++--
>  3 files changed, 29 insertions(+), 2 deletions(-)
>  create mode 100644 meta/classes/image-empty.bbclass
>  create mode 100644 meta/classes/image-live.bbclass
> 
> diff --git a/meta/classes/image-empty.bbclass b/meta/classes/image-empty.bbclass
> new file mode 100644
> index 0000000..e69de29
> diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
> new file mode 100644
> index 0000000..2568d5c
> --- /dev/null
> +++ b/meta/classes/image-live.bbclass
> @@ -0,0 +1,13 @@
> +
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
> +inherit image-live

You mean bootimg here but I fixed up the patch ;-)

Cheers,

Richard



