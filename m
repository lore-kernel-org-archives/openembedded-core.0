Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 459D06FF9B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 21:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2LLBlvu008560; Mon, 21 Mar 2016 21:11:47 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Vtf_0q-s0PLu; Mon, 21 Mar 2016 21:11:47 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2LLBfBB008538
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 21 Mar 2016 21:11:43 GMT
Message-ID: <1458594701.20442.20.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ed Bartosh <ed.bartosh@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 21 Mar 2016 21:11:41 +0000
In-Reply-To: <1458578170-13054-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1458578170-13054-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] image.bbclass: run wicenv task only for wic images
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
X-List-Received-Date: Mon, 21 Mar 2016 21:11:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-03-21 at 18:36 +0200, Ed Bartosh wrote:
> Currently do_wicenv task is run for all images. However, its
> result is used only to produce wic image. It's better to
> run this task only for wic images. If another rootfs is
> required to produce wic image, dependency to its do_wicenv
> must be added to the wic image recipy.
> 
> Stopped running do_wicenv for all images. Added explicit
> dependency to this task in wic-image-minimal recipe.
> 
> [YOCTO #9095]
> 
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta-selftest/recipes-test/images/wic-image-minimal.bb | 2 +-
>  meta/classes/image.bbclass                             | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.bb
> b/meta-selftest/recipes-test/images/wic-image-minimal.bb
> index 9c50ddb..e98f60f 100644
> --- a/meta-selftest/recipes-test/images/wic-image-minimal.bb
> +++ b/meta-selftest/recipes-test/images/wic-image-minimal.bb
> @@ -11,7 +11,7 @@ DEPENDS = "syslinux syslinux-native parted-native
> dosfstools-native mtools-nativ
>  
>  # core-image-minimal is referenced in .wks, so we need its rootfs
>  # to be ready before our rootfs
> -do_rootfs[depends] += "core-image-minimal:do_rootfs_wicenv"
> +do_rootfs[depends] += "core-image-minimal:do_rootfs core-image
> -minimal:do_rootfs_wicenv"
>  
>  IMAGE_ROOTFS_EXTRA_SPACE = "2000"
>  
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 3ab432e..63a0fb6 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -275,7 +275,7 @@ python do_rootfs_wicenv () {
>              if value:
>                  envf.write('%s="%s"\n' % (var, value.strip()))
>  }
> -addtask do_rootfs_wicenv after do_image before do_image_wic
> do_image_complete
> +addtask do_rootfs_wicenv after do_rootfs before do_image_wic
>  do_rootfs_wicenv[vardeps] += "${WICVARS}"
>  do_rootfs_wicenv[prefuncs] = 'set_image_size'
>  
I think I tried do_rootfs here originally and there was a race of some
sort so this needs to be do_image. You can check the commit logs for
the exact reason (prelink can cause the image size to change during
do_image and we need the image size?).

Cheers,

Richard

