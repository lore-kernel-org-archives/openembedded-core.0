Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6EA5D6AD31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 02:48:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5O2mQgT021165
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jun 2013 19:48:26 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Sun, 23 Jun 2013 19:48:25 -0700
Message-ID: <51C7B387.2080906@windriver.com>
Date: Mon, 24 Jun 2013 10:48:39 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1371623706.git.rongqing.li@windriver.com>
	<92a2562fcefd5791424d47935898308b289eaf75.1371623706.git.rongqing.li@windriver.com>
In-Reply-To: <92a2562fcefd5791424d47935898308b289eaf75.1371623706.git.rongqing.li@windriver.com>
X-Originating-IP: [128.224.162.233]
Subject: Re: [PATCH 1/2] image-live.bbclass: enable read-only-rootfs IMAGE_FEATURE
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
X-List-Received-Date: Mon, 24 Jun 2013 02:48:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 06/19/2013 02:37 PM, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>
>
> enable read-only-rootfs to make /tmp be able to be written when using sysvinit
>
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> ---
>   meta/classes/image-live.bbclass |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
> index bfb59f8..3f203d1 100644
> --- a/meta/classes/image-live.bbclass
> +++ b/meta/classes/image-live.bbclass
> @@ -9,6 +9,8 @@ LABELS_append = " ${SYSLINUX_LABELS} "
>   
>   ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext3"
>   
> +IMAGE_FEATURES_append = " read-only-rootfs"
> +
This will result in installation of a read-only-rootfs image by default 
if we use this live image as an installer.
We should use aufs in live image. Note that the unionfs has been 
disabled for more than a year.
See https://bugzilla.yoctoproject.org/show_bug.cgi?id=4761 for more info.

Best Regards,
Chen Qi

>   do_bootimg[depends] += "${INITRD_IMAGE}:do_rootfs"
>   do_bootimg[depends] += "${PN}:do_rootfs"
>   


