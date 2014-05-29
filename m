Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C3B276FD56
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 22:52:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4TMqv1o000447
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 15:52:57 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.169.1; Thu, 29 May 2014 15:52:57 -0700
Message-ID: <5387BA48.4030109@windriver.com>
Date: Thu, 29 May 2014 17:52:56 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1401400854-21736-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1401400854-21736-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] util-linux: add sulogin to alternatives list
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
X-List-Received-Date: Thu, 29 May 2014 22:53:00 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/29/14, 5:00 PM, Saul Wold wrote:
> sulogin is provided by both busybox in /sbin/sulogin and util-linux provides one
> in /usr/sbin/sulogin, so move util-linux's to sbin and setup ALTERNATIVE_LINK.
>
> [YOCTO #6384]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

I verified that the util-linux sulogin is now the default if available.

I did not boot the resulting filesystem

(build) tested-by: Mark Hatle <mark.hatle@windriver.com>

> ---
>   meta/recipes-core/util-linux/util-linux.inc | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index c2a3cf7..83bb4a6 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -132,7 +132,7 @@ do_install () {
>   	mkdir -p ${D}${base_bindir}
>
>           sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
> -        sbinprogs_a="pivot_root hwclock mkswap mkfs.minix fsck.minix losetup swapon swapoff fdisk readprofile fsck blkid blockdev fstrim"
> +        sbinprogs_a="pivot_root hwclock mkswap mkfs.minix fsck.minix losetup swapon swapoff fdisk readprofile fsck blkid blockdev fstrim sulogin"
>           usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp renice utmpdump wall setsid chrt flock getopt"
>           binprogs_a="dmesg kill more umount mount login reset su"
>
> @@ -166,7 +166,7 @@ ALTERNATIVE_PRIORITY = "100"
>
>   ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root"
>   ALTERNATIVE_${PN} += "mkfs.minix hexdump last logger mesg renice wall"
> -ALTERNATIVE_${PN} += "setsid chrt flock hwclock utmpdump eject getopt"
> +ALTERNATIVE_${PN} += "setsid chrt flock hwclock utmpdump eject getopt sulogin"
>
>   ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
>   ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
> @@ -177,6 +177,7 @@ ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
>   ALTERNATIVE_LINK_NAME[mkfs.minix] = "${base_sbindir}/mkfs.minix"
>   ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
>   ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
> +ALTERNATIVE_LINK_NAME[sulogin] = "${base_sbindir}/sulogin"
>   ALTERNATIVE_TARGET[getopt] = "${bindir}/getopt"
>
>   ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8 utmpdump.1 reset.1"
>


