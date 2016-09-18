Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9038360620
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 07:24:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8I7Nxv9001914
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 18 Sep 2016 00:23:59 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Sun, 18 Sep 2016 00:23:59 -0700
To: Joshua Lock <joshua.g.lock@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1474030160.git.joshua.g.lock@intel.com>
	<97cc9b5ba54f6dc1e8fa9b7938ebf220ac5fe95b.1474030160.git.joshua.g.lock@intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57acde8d-d3ae-7fea-0ac1-e2fb763aa083@windriver.com>
Date: Sun, 18 Sep 2016 15:23:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <97cc9b5ba54f6dc1e8fa9b7938ebf220ac5fe95b.1474030160.git.joshua.g.lock@intel.com>
Subject: Re: [PATCH 5/6] runqemu: try symlinks when kernel or rootfs can't be found
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
X-List-Received-Date: Sun, 18 Sep 2016 07:24:02 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/16/2016 08:52 PM, Joshua Lock wrote:
> If the kernel or rootfs names written to the qemuboot.conf can't
> be found, try and find the symlinked variant of the filename.
>
> This will help usability of runqemu, for example where a user
> downloads an image and associated files as the symlinked names
> yet the qemuboot.conf variables point to the full, non-linked,
> file names.
>
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> ---
>  scripts/runqemu | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 6aaae44..38f9b30 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -451,7 +451,12 @@ class BaseConfig(object):
>              if all_files:
>                  self.rootfs = all_files[0]
>              else:
> -                raise Exception("Failed to find rootfs: %s" % cmd)
> +                cmd = '%s/%s*.%s' % (self.get('DEPLOY_DIR_IMAGE'), self.get('IMAGE_LINK_NAME'), self.fstype)
> +                all_files = glob.glob(cmd)
> +                if all_files:
> +                    self.rootfs = all_files[0]
> +                else:
> +                    raise Exception("Failed to find rootfs: %s" % cmd)
>
>          if not os.path.exists(self.rootfs):
>              raise Exception("Can't find rootfs: %s" % self.rootfs)
> @@ -462,13 +467,18 @@ class BaseConfig(object):
>          if self.fstype in self.vmtypes:
>              return
>          kernel = self.kernel
> +        deploy_dir_image = self.get('DEPLOY_DIR_IMAGE')
>          if not kernel:
> -            kernel = "%s/%s" % (self.get('DEPLOY_DIR_IMAGE'), self.get('QB_DEFAULT_KERNEL'))
> +            kernel = "%s/%s" % (deploy_dir_image, self.get('QB_DEFAULT_KERNEL'))
>
>          if os.path.exists(kernel):
>              self.kernel = kernel
>          else:
> -            raise Exception("KERNEL %s not found" % kernel)
> +            kernel = "%s/%s" % (deploy_dir_image, self.get('KERNEL_IMAGETYPE'))
> +            if kernel != deploy_dir_image and os.path.exists(kernel):


Thank you very much for fixing this, can we use KERNEL_IMAGETYPE* here, please ?
Please take a look at here:
http://autobuilder.yoctoproject.org/pub/releases/yocto-2.2_M3.rc1/machines/qemu/qemuppc/

Its kernel name might be vmlinux-qemuppc.bin, while KERNEL_IMAGETYPE is vmlinux.

I have local patches conflicted with this, they also fix dtb,
OECORE_NATIVE_SYSROOT and nfs. I will send a V2 including your patches,
and please feel free to comment.

// Robert

> +                self.kernel = kernel
> +            else:
> +                raise Exception("KERNEL %s not found" % kernel)
>
>          dtb = self.get('QB_DTB')
>          if dtb:
>

