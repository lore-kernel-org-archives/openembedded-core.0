Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 09B3777E82
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Apr 2017 11:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id E729C31E51EE;
	Sun,  9 Apr 2017 13:00:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id RMf5sW-ao3eM; Sun,  9 Apr 2017 13:00:27 +0200 (CEST)
Received: from t510.zcs.saftware.de (p57A6179E.dip0.t-ipconnect.de
	[87.166.23.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 340A231E449C;
	Sun,  9 Apr 2017 13:00:27 +0200 (CEST)
Date: Sun, 9 Apr 2017 13:00:26 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: liu.ming50@gmail.com
Message-ID: <20170409130026.74315f43@t510.zcs.saftware.de>
In-Reply-To: <1491669825-17958-2-git-send-email-liu.ming50@gmail.com>
References: <1491669825-17958-1-git-send-email-liu.ming50@gmail.com>
	<1491669825-17958-2-git-send-email-liu.ming50@gmail.com>
MIME-Version: 1.0
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V6 1/2] image.bbclass: remove initramfs bundle related code
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
X-List-Received-Date: Sun, 09 Apr 2017 11:00:31 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  8 Apr 2017 18:43:44 +0200
liu.ming50@gmail.com wrote:

> From: Ming Liu <peter.x.liu@external.atlascopco.com>
> 
> The original purpose of these code was to repackage initramfs bundled
> kernel before image do_build, but it does not really work because the
> initramfs bundled kernel images are not packaged at all after commit
> a49569e3a7534779bbe3f01a0647fd076c95798d:
> [ kernel.bbclass: do not copy bundled initramfs to /boot ]

Note that deploying the bundled image works. Installing a bundled image to
/boot seems unnecessary, because if a bootloader is able to load a kernel
from the filesystem containing /boot, then it should be able to load an
unbundled initramfs from there, too.

Regards,
Andreas

> 
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta/classes/image.bbclass | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 405fd73..bc00884 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -184,10 +184,6 @@ python () {
>      d.setVar('IMAGE_FEATURES', ' '.join(sorted(list(remain_features))))
>  
>      check_image_features(d)
> -    initramfs_image = d.getVar('INITRAMFS_IMAGE') or ""
> -    if initramfs_image != "":
> -        d.appendVarFlag('do_build', 'depends', " %s:do_bundle_initramfs" %  d.getVar('PN'))
> -        d.appendVarFlag('do_bundle_initramfs', 'depends', " %s:do_image_complete" % initramfs_image)
>  }
>  
>  IMAGE_CLASSES += "image_types"
> @@ -608,12 +604,3 @@ do_packagedata[noexec] = "1"
>  do_package_write_ipk[noexec] = "1"
>  do_package_write_deb[noexec] = "1"
>  do_package_write_rpm[noexec] = "1"
> -
> -# Allow the kernel to be repacked with the initramfs and boot image file as a single file
> -do_bundle_initramfs[depends] += "virtual/kernel:do_bundle_initramfs"
> -do_bundle_initramfs[nostamp] = "1"
> -do_bundle_initramfs[noexec] = "1"
> -do_bundle_initramfs () {
> -	:
> -}
> -addtask bundle_initramfs after do_image_complete


