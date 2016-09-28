Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D4E760107
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Sep 2016 07:14:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8S7E32C014344
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 28 Sep 2016 00:14:03 -0700
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 28 Sep 2016 00:14:03 -0700
To: Martin Jansa <martin.jansa@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20160928070314.24504-1-Martin.Jansa@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <4e1404d9-e1b3-ce24-4c20-55757352e2a6@windriver.com>
Date: Wed, 28 Sep 2016 15:14:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160928070314.24504-1-Martin.Jansa@gmail.com>
Subject: Re: [PATCH] qemuboot: don't fail when QB_DEFAULT_KERNEL isn't symlink
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
X-List-Received-Date: Wed, 28 Sep 2016 07:14:06 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/28/2016 03:03 PM, Martin Jansa wrote:
> * in some cases we might set QB_DEFAULT_KERNEL to the real filename
>   instead of symlink and then this whole readlink work around actually
>   breaks the build, because os.readlink fails on normal files:
>
>   >>> os.readlink('deploy/images/qemux86/bzImage-linux-yocto-qemux86-master-20160927084848.bin')
>   'bzImage-linux-yocto-qemux86.bin'
>   >>> os.readlink('deploy/images/qemux86/bzImage-linux-yocto-qemux86.bin')
>   Traceback (most recent call last):
>     File "<stdin>", line 1, in <module>
>   OSError: [Errno 22] Invalid argument: '/jenkins/mjansa/build-starfish-master-mcf/BUILD/deploy/images/qemux86/bzImage-linux-yocto-qemux86.bin'
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/classes/qemuboot.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
> index 97a2357..a3a05ba 100644
> --- a/meta/classes/qemuboot.bbclass
> +++ b/meta/classes/qemuboot.bbclass
> @@ -69,7 +69,11 @@ python write_qemuboot_conf() {
>      # to the kernel file, which hinders relocatability of the qb conf.
>      # Read the link and replace it with the full filename of the target.
>      kernel_link = os.path.join(d.getVar('DEPLOY_DIR_IMAGE', True), d.getVar('QB_DEFAULT_KERNEL', True))
> -    kernel = os.readlink(kernel_link)

os.path.realpath(kernel_link) should work for regular file or symlink.

// Robert

> +    try:
> +        kernel = os.readlink(kernel_link)
> +    except OSError as e:
> +        # we assume it failed, because QB_DEFAULT_KERNEL is already real file or hardlink, not symlink
> +        kernel = kernel_link
>      cf.set('config_bsp', 'QB_DEFAULT_KERNEL', kernel)
>
>      bb.utils.mkdirhier(os.path.dirname(qemuboot))
>

