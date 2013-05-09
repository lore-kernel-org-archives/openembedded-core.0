Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UaMZV-0000Zo-N3
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2013 10:51:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r498XOwT014943
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 9 May 2013 01:33:24 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 9 May 2013 01:33:24 -0700
Message-ID: <518B5F4F.8090707@windriver.com>
Date: Thu, 9 May 2013 16:33:19 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Jonathan Liu <net147@gmail.com>
References: <1368069844-13706-1-git-send-email-net147@gmail.com>
	<1368069844-13706-3-git-send-email-net147@gmail.com>
In-Reply-To: <1368069844-13706-3-git-send-email-net147@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] image-vmdk: Fix error recreating symbolic link
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 May 2013 08:51:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/09/2013 11:24 AM, Jonathan Liu wrote:
> If the vmdk image symbolic link already exists from a previous build,
> overwrite it instead of returning an error.
>
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>   meta/classes/image-vmdk.bbclass | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/image-vmdk.bbclass b/meta/classes/image-vmdk.bbclass
> index 6f7df3f..c225bed 100644
> --- a/meta/classes/image-vmdk.bbclass
> +++ b/meta/classes/image-vmdk.bbclass
> @@ -18,8 +18,8 @@ inherit boot-directdisk
>
>   create_vmdk_image () {
>   	qemu-img convert -O vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.hdddirect ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.vmdk
> +	rm -f ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk
>   	ln -s ${IMAGE_NAME}.vmdk ${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.vmdk

How about "ln -sf", the '-f' will remove existing destination files.

// Robert

> -
>   }
>
>   python do_vmdkimg() {
>


