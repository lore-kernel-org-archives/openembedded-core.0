Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 615036022F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 03:50:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v053oSiZ009463
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Jan 2017 19:50:28 -0800 (PST)
Received: from server.local (128.224.20.231) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 4 Jan 2017 19:50:27 -0800
To: California Sullivan <california.l.sullivan@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1483563479-4673-1-git-send-email-california.l.sullivan@intel.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <476dc218-767f-83c6-2e66-7529469b4ddd@windriver.com>
Date: Wed, 4 Jan 2017 22:50:26 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1483563479-4673-1-git-send-email-california.l.sullivan@intel.com>
Subject: Re: [PATCH RFC] kernel.bbclass: symlink initramfs kernel bundle to kernel
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
X-List-Received-Date: Thu, 05 Jan 2017 03:50:29 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-01-04 3:57 PM, California Sullivan wrote:
> Image creation seems to always grab ${type} (usually bzImage), even if
> we specifically use INITRAMFS_IMAGE_BUNDLE to create a bundled
> initramfs/kernel. Work around this by linking ${type}.initramfs to
> ${type} as a final step when it exists.
>
> Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
> ---
> I've been experimenting with initramfs stuff lately and discovered that
> despite the bundled initramfs being built, it isn't being used by image
> creation by default. This is one way to solve the issue, but ultimately
> its probably a deficiency with image creation. Anyone with more
> knowledge in this area have some thoughts?

I'm also not clear why the image creation wouldn't be grabbing whatever
is named in the INITRAMFS variables.

Is there some interaction between the python in image.bbclass and 
kernel.bbclass ? I see both trying to set the depends on
do_image_complete when INITRAMFS_IMAGE is defined.

.. but yah, other than creating the dependency on the initramfs build,
I don't see the image creation with any extra conditionals to switch to
the initramfs bundled kernel.

So your change should hold up, but I agree it doesn't feel right.

Bruce

>
>  meta/classes/kernel.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 3630042..5b5a642 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -618,6 +618,10 @@ kernel_do_deploy() {
>  			initramfs_symlink_name=${type}-initramfs-${MACHINE}
>  			install -m 0644 ${KERNEL_OUTPUT_DIR}/${type}.initramfs ${DEPLOYDIR}/${initramfs_base_name}.bin
>  			ln -sf ${initramfs_base_name}.bin ${DEPLOYDIR}/${initramfs_symlink_name}.bin
> +			if [ x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
> +				echo "INITRAMFS_IMAGE_BUNDLE is set. Linking to ${type}..."
> +				ln -sf ${initramfs_base_name}.bin ${DEPLOYDIR}/${type}
> +			fi
>  		fi
>  	done
>  }
>


