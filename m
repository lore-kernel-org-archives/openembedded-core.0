Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 96AAA731B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 20:32:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8FKWODH011100
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 15 Sep 2016 13:32:25 -0700 (PDT)
Received: from [172.25.44.6] (172.25.44.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Sep 2016 13:32:24 -0700
To: Patrick Williams <patrick@stwcx.xyz>,
	<openembedded-core@lists.openembedded.org>
References: <1473966359-13292-1-git-send-email-patrick@stwcx.xyz>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <b88d60f8-7916-b1a0-f381-b62c9111c7be@windriver.com>
Date: Thu, 15 Sep 2016 16:32:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1473966359-13292-1-git-send-email-patrick@stwcx.xyz>
X-Originating-IP: [172.25.44.6]
Subject: Re: [PATCH 1/2] util-linux: Disable minix support.
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
X-List-Received-Date: Thu, 15 Sep 2016 20:32:27 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-09-15 03:05 PM, Patrick Williams wrote:
> Disable building of {mkfs,fsck}.minix.

Nice clean-up patch Patrick.

I know what minux is but your next patch disables
bfs and I don't have a clue what that is.

Could you re-send with longer commit messages that
explains what the change is in a way that doesn't
require knowing 25 years of linux history? :)

Something like:


Disable building of {mkfs,fsck}.minix.

Disable filesystem tools for minix filesystems.
The Minix OS predates linux and such filesystems are rarely used.
No other oe-core or meta-oe recipes reference minux so
this should not cause secondary problems.

and something similar for bfs.

Thanks,
../Randy

>
> Signed-off-by: Patrick Williams <patrick@stwcx.xyz>
> ---
>  meta/recipes-core/util-linux/util-linux.inc | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index bf770d8..608f198 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -45,7 +45,8 @@ SHARED_EXTRA_OECONF = "--disable-use-tty-group \
>                         --enable-raw --enable-reset --disable-login \
>                         --disable-vipw --disable-newgrp --disable-chfn-chsh \
>                         --enable-write --enable-mount \
> -                       --enable-libuuid --enable-libblkid --enable-fsck --without-udev \
> +                       --enable-libuuid --enable-libblkid --enable-fsck \
> +                       --disable-minix --without-udev \
>                         usrsbin_execdir='${sbindir}' \
>  "
>
> @@ -191,7 +192,7 @@ do_install_append_class-native () {
>  ALTERNATIVE_PRIORITY = "80"
>
>  ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root switch_root"
> -ALTERNATIVE_${PN} += "mkfs.minix hexdump last lastb logger mesg renice wall"
> +ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall"
>  ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject"
>
>  ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
> @@ -201,7 +202,6 @@ ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
>  ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
>  ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
>  ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
> -ALTERNATIVE_LINK_NAME[mkfs.minix] = "${base_sbindir}/mkfs.minix"
>  ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
>
>  ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 lastb.1 mesg.1 wall.1 nologin.8 sulogin.8 utmpdump.1 reset.1 kill.1 libblkid.3 blkid.8 findfs.8 fsck.8 uuid.3"
> @@ -248,8 +248,7 @@ ALTERNATIVE_util-linux-swaponoff = "swapoff swapon"
>  ALTERNATIVE_LINK_NAME[swapoff] = "${base_sbindir}/swapoff"
>  ALTERNATIVE_LINK_NAME[swapon] = "${base_sbindir}/swapon"
>
> -ALTERNATIVE_util-linux-fsck = "fsck.minix fsck"
> -ALTERNATIVE_LINK_NAME[fsck.minix] = "${base_sbindir}/fsck.minix"
> +ALTERNATIVE_util-linux-fsck = "fsck"
>  ALTERNATIVE_LINK_NAME[fsck] = "${base_sbindir}/fsck"
>
>  ALTERNATIVE_util-linux-blkid = "blkid"
>


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

