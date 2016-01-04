Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 797AE65CBF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jan 2016 14:58:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u04EwnTi009924
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Jan 2016 06:58:49 -0800 (PST)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 4 Jan 2016 06:58:49 -0800
To: Ming Liu <liu.ming50@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <1451510400-7446-1-git-send-email-liu.ming50@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <568A8891.3050200@windriver.com>
Date: Mon, 4 Jan 2016 09:58:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1451510400-7446-1-git-send-email-liu.ming50@gmail.com>
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: Re: [PATCH V1 1/3] kernel.bbclass: do not install initramfs bundled kernel image
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
X-List-Received-Date: Mon, 04 Jan 2016 14:58:57 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 15-12-30 04:19 PM, Ming Liu wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> It makes no sense to install a initramfs bundled kernel image since
> do_package does not depend on do_bundle_initramfs at all, otherwise, it
> leads to a impicit kernel-image package depending on do_package run before
> or after do_bundle_initramfs.

It may just be the holiday break that has me thinking slower than
normal .. but I'm missing an overall description of the problem you are
trying to solve with this series, and also a writeup of how the new
implementation works.

Can you re-submit this with a 0/N that describes the issue with the
current implementation, and how this series solves it .. and then
perhaps the individual patches will make more sense.

We were able to bundle in the past, but the message I'm getting from
the commit messages is that something fundamental isn't working, but
I can't quite put the whole picture together without some more context.

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


