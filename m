Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 342F17317D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 19:39:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0JJdd1A028551
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 19 Jan 2016 11:39:39 -0800
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jan 2016 11:39:38 -0800
To: Ming Liu <liu.ming50@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <1451999565-3502-1-git-send-email-liu.ming50@gmail.com>
	<1451999565-3502-2-git-send-email-liu.ming50@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <569E90F9.6020806@windriver.com>
Date: Tue, 19 Jan 2016 14:39:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1451999565-3502-2-git-send-email-liu.ming50@gmail.com>
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: Re: [PATCH 1/3] kernel.bbclass: do not install initramfs bundled kernel image
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
X-List-Received-Date: Tue, 19 Jan 2016 19:39:50 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 16-01-05 08:12 AM, Ming Liu wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> It makes no sense to install a initramfs bundled kernel image since
> do_package does not depend on do_bundle_initramfs at all, otherwise, it
> leads to a implicit kernel-image package depending on do_package run before
> or after do_bundle_initramfs.

Again. So why not just add the ordering in the task dependencies ?

I'm probably missing something, which just means we need to tweak
the commit log a bit more.

The code you are removing is conditional, and is run after an
explicit kernel_do_compile is called, to rebuild the existing
kernel configuration with an embedded initramfs (via alternate initrd).
So outside of some ordering/parallel execution issues, I'm not seeing
it as broken.

Bruce

>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>   meta/classes/kernel.bbclass | 4 ----
>   1 file changed, 4 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 4ce1611..d1ca614 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -179,10 +179,6 @@ do_bundle_initramfs () {
>   		kernel_do_compile
>   		mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
>   		mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
> -		# Update install area
> -		echo "There is kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT}.initramfs"
> -		install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
> -		echo "${B}/${KERNEL_OUTPUT}.initramfs"
>   	fi
>   }
>
>


