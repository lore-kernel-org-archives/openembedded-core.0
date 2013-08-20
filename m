Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A28236B7CD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 18:48:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7KIm1nF014563
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 11:48:02 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 20 Aug 2013 11:48:01 -0700
Message-ID: <5213B9E1.1050805@windriver.com>
Date: Tue, 20 Aug 2013 13:48:01 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1377024321-6230-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1377024321-6230-1-git-send-email-fcooper@ti.com>
Subject: Re: [PATCH v2] kernel.bbclass: Create symbolic link to add ${KERNEL_IMAGETYPE} to boot package
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
X-List-Received-Date: Tue, 20 Aug 2013 18:48:01 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/13 1:45 PM, Franklin S. Cooper Jr wrote:
> * By default for some platforms U-boot assumes the kernel image is located in
>    the boot directory of the root filesystem.
> * The kernel.bbclass already includes the kernel image in the /boot directory
>    but adds a version number to the file name.
> * Create a symbolic link that names the kernel image in the exact way that
>    U-boot expects.

This should be done with a package post-install script.  It is fairly common for 
multilib kernel versions to be installed on a machine at the same time, with the 
Link pointing to the 'last-installed' version.  Doing it in the do_install rule 
will cause a conflict (at least in the RPM case), preventing certain field 
upgrade activities.

post install script with something like:

ln -sf $D/boot/<kernel_name> <common-name>

Should work.

(The above assumes that the kernel itself is being packaged.. if it's not being 
packages and just copied to the end image -- then doing the link should be fine.)

--Mark


> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
> Version 2 changes:
> Change "ln -s" to "ln -sf" based on Bruce's comment.
>
>   meta/classes/kernel.bbclass |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index e039dfc..6e7d994 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -109,6 +109,7 @@ kernel_do_install() {
>   	install -d ${D}/${KERNEL_IMAGEDEST}
>   	install -d ${D}/boot
>   	install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
> +	ln      -sf ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}
>   	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
>   	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
>   	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
>


