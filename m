Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B129D6011A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 17:06:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0EH6qJN006886
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Jan 2016 09:06:52 -0800 (PST)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 14 Jan 2016 09:06:52 -0800
To: Ming Liu <liu.ming50@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <1451999565-3502-1-git-send-email-liu.ming50@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <5697D5AA.1030109@windriver.com>
Date: Thu, 14 Jan 2016 12:06:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1451999565-3502-1-git-send-email-liu.ming50@gmail.com>
Cc: yue.tao@windriver.com
Subject: Re: [PATCH 0/3] Introduces kernel-initramfs recipe to resolve a implicit dependency issue
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
X-List-Received-Date: Thu, 14 Jan 2016 17:06:54 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Just bumping this review to let you know that I haven't forgotten
about it.

I've been looking at the details at least twice now, but haven't
managed to sort everything out.

I'll pick this up again shortly.

Bruce

On 16-01-05 08:12 AM, Ming Liu wrote:
> In current initramfs bundled kernel packaging policy, there are several
> dependency chains co-existing:
>
> | "core-image-minimal.do_build" -> "core-image-minimal.do_bundle_initramfs"
> | "core-image-minimal.do_bundle_initramfs" -> "virtual/kernel.do_bundle_initramfs"
> | "core-image-minimal.do_bundle_initramfs" -> "core-image-minimal.do_rootfs"
> | "core-image-minimal.do_rootfs" -> "virtual/kernel.do_package_write_${IMAGE_PKGTYPE}"
> | "virtual/kernel.do_package_write_${IMAGE_PKGTYPE}" -> "virtual/kernel.do_package"
> | "virtual/kernel.do_package" -> "virtual/kernel.do_install"
> |
> | "virtual/kernel.do_deploy" -> "virtual/kernel.do_bundle_initramfs"
> | "virtual/kernel.do_bundle_initramfs" -> "virtual/kernel.do_install"
>
> We could see, virtual/kernel.do_package is not explicitly depending on
> virtual/kernel.do_bundle_initramfs so far, therefore, there is not a
> workable way to add initramfs bundled kernel image into rootfs, because
> kernel's do_bundle_initramfs could run parallelly with its do_package,
> which means we will get a implicit kernel-image package that sometimes it
> contains the initramfs bundled kernel or sometimes it doesn't.
>
> To fix this problem, the idea is to let the initramfs bundled kernel
> packaging depend on do_bundle_initramfs, meanwhile, to avoid the circular
> dependency issue that commit: 609d5a9ab9e58bb1c2bcc2145399fbc8b701b85a
> [ kernel.bbclass, image.bbclass: Implement kernel INITRAMFS dependency and bundling ]
>
> was trying to address, this dependency has to be splitted from kernel
> recipe(at least, I could not figure out another way to achieve it), so a
> new kernel-initramfs is introduced, in which a dependency chain is created:
>
> | "kernel-initramfs.do_install" -> "virtual/kernel.do_deploy"
> | "virtual/kernel.do_deploy" -> "virtual/kernel.do_bundle_initramfs"
>
> Then the users can add initramfs bundled kernel image into rootfs by:
>
> IMAGE_INSTALL_append = " kernel-initramfs"
>
> without introducing any circular dependencies.
>
> Ming Liu (3):
>    kernel.bbclass: do not install initramfs bundled kernel image
>    image.bbclass: removes bundle_initramfs related code
>    kernel-initramfs: new recipe, creates initramfs bundled kernel
>      packaging
>
>   meta/classes/image.bbclass                    | 11 -----
>   meta/classes/kernel.bbclass                   |  4 --
>   meta/recipes-kernel/linux/kernel-initramfs.bb | 69 +++++++++++++++++++++++++++
>   3 files changed, 69 insertions(+), 15 deletions(-)
>   create mode 100644 meta/recipes-kernel/linux/kernel-initramfs.bb
>


