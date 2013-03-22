Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1UIxFT-0004g8-FP
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 09:22:54 +0100
Received: by mail-ea0-f175.google.com with SMTP id o10so1225668eaj.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 01:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:date:message-id:in-reply-to:references
	:user-agent:subject:mime-version:content-type
	:content-transfer-encoding;
	bh=L3CuCxrpjmNSY2g1g3c+fF/YmM94t2Q0wOWcyzrHlH0=;
	b=FGEh3zr1NWHaGqkwd4jCyEDWsuqzS6DIvEjSYDPTUVxWh8iBAlAHfPGp91Ky5I1Fzm
	ErAHmSjHSc+Zc1mwiJZUrhWddb7azEyUgQ0WXA+5hFDStdb/AufXbSXxXwdtldHJzLyd
	uR2EtIaV5UddKX0Jz+9202G7NLhofTAMifycud8WHJZOX7J7QOTjyKqRD0wpyxwsagmj
	pznZiSJ218GwpLmngQaxAxFS47pd2fHE7f9ZXbQ2nEIIoN75QLh7F4hO9tZRpgBkwE2S
	Auq7SKVEpxGmrq/7yT9+RK9++eN/vupa3nT2pVCDg6GIJmgyt/quv4wT5R2S+D/oesOn
	GAjQ==
X-Received: by 10.14.194.198 with SMTP id m46mr2610164een.8.1363939557989;
	Fri, 22 Mar 2013 01:05:57 -0700 (PDT)
Received: from [90.152.223.168] (090152223168.atmpu0035.highway.a1.net.
	[90.152.223.168])
	by mx.google.com with ESMTPS id z45sm1438012eeu.10.2013.03.22.01.05.55
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 01:05:57 -0700 (PDT)
From: "Bernhard Reutner-Fischer" <rep.dot.nop@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>,
	<openembedded-core@lists.openembedded.org>
Date: Fri, 22 Mar 2013 09:08:34 +0100
Message-ID: <13d91230233.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <1363792150-24988-1-git-send-email-Martin.Jansa@gmail.com>
References: <1363792150-24988-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1 AquaMail/1.2.2.20 (build:
	2100226)
MIME-Version: 1.0
Subject: Re: [PATCH] util-linux: Use u-a for getopt
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
X-List-Received-Date: Fri, 22 Mar 2013 08:22:55 -0000
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Transfer-Encoding: 8bit

On 20 March 2013 16:09:10 Martin Jansa <martin.jansa@gmail.com> wrote:
> * when enable busybox installs getopt to ${base_bindir} and
>   util-linux to ${bindir}, so there is no file conflict, but
>   because busybox implementation does not support --long used

Do you mean that Busybox' getopt does not support long options?
If so, enable FEATURE_GETOPT_LONG in busybox instead of this patch?

Thanks,
>   by lsb_release (which RDEPENDS on util-linux) we need to use
>   util-linux getopt even when busybox defconfig has it enabled
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/util-linux/util-linux.inc       | 6 ++++--
>  meta/recipes-core/util-linux/util-linux_2.22.2.bb | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc 
> b/meta/recipes-core/util-linux/util-linux.inc
> index 41a5471..c75d318 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -110,7 +110,7 @@ do_install () {
>
>          sbinprogs="agetty ctrlaltdel cfdisk vipw vigr"
>          sbinprogs_a="pivot_root hwclock mkswap mkfs.minix fsck.minix losetup 
>          swapon fdisk readprofile fsck blkid blockdev"
> -        usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp 
> renice utmpdump wall setsid chrt flock"
> +        usrbinprogs_a="chfn chsh hexdump last logger mesg newgrp 
> renice utmpdump wall setsid chrt flock getopt"
>          binprogs_a="dmesg kill more umount mount login reset"
>
>          if [ "${base_sbindir}" != "${sbindir}" ]; then
> @@ -146,7 +146,7 @@ ALTERNATIVE_PRIORITY = "100"
>
>  ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root"
>  ALTERNATIVE_${PN} += "mkfs.minix hexdump last logger mesg renice wall"
> -ALTERNATIVE_${PN} += "setsid chrt flock hwclock utmpdump eject"
> +ALTERNATIVE_${PN} += "setsid chrt flock hwclock utmpdump eject getopt"
>
>  ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
>  ALTERNATIVE_LINK_NAME[kill] = "${base_bindir}/kill"
> @@ -156,6 +156,8 @@ ALTERNATIVE_LINK_NAME[blockdev] = 
> "${base_sbindir}/blockdev"
>  ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
>  ALTERNATIVE_LINK_NAME[mkfs.minix] = "${base_sbindir}/mkfs.minix"
>  ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
> +ALTERNATIVE_LINK_NAME[getopt] = "${base_bindir}/getopt"
> +ALTERNATIVE_TARGET[getopt] = "${bindir}/getopt"
>
>  ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8 
>  utmpdump.1"
>
> diff --git a/meta/recipes-core/util-linux/util-linux_2.22.2.bb 
> b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> index 9b94a47..43a55a6 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> @@ -1,5 +1,5 @@
>  MAJOR_VERSION = "2.22"
> -PR = "r2"
> +PR = "r3"
>  require util-linux.inc
>
>  SRC_URI += "file://util-linux-ng-replace-siginterrupt.patch \
> --
> 1.8.1.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


Sent with AquaMail for Android
http://www.aqua-mail.com




