Return-Path: <ejo@pengutronix.de>
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id EFF4E77C9E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 13:32:11 +0000 (UTC)
Received: from mango.hi.pengutronix.de ([2001:67c:670:100:76d4:35ff:fee8:98b3])
	by metis.ext.pengutronix.de with esmtp (Exim 4.84_2)
	(envelope-from <ejo@pengutronix.de>)
	id 1ctaBP-0001c1-Sl; Thu, 30 Mar 2017 15:32:11 +0200
To: Daniel Schultz <d.schultz@phytec.de>
References: <1490877011-3374-1-git-send-email-d.schultz@phytec.de>
From: Enrico Joerns <ejo@pengutronix.de>
Message-ID: <57e781f0-3607-a12f-ff6a-fd66edf76b2a@pengutronix.de>
Date: Thu, 30 Mar 2017 15:32:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <1490877011-3374-1-git-send-email-d.schultz@phytec.de>
X-SA-Exim-Connect-IP: 2001:67c:670:100:76d4:35ff:fee8:98b3
X-SA-Exim-Mail-From: ejo@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH morty] wic: partition: Add fsck to avoid corrupt EXT file systems
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
X-List-Received-Date: Thu, 30 Mar 2017 13:32:13 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

Hi Daniel,

On 03/30/2017 02:30 PM, Daniel Schultz wrote:
> This patch avoids the creation of a corrupt EXT file system.
>
> Since there are no checks if a EXT file system was successfully created,
> this should add to prevent possible system failures.
>
> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> ---
>  scripts/lib/wic/partition.py | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 3b3bd2d..152eb7b 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -239,6 +239,9 @@ class Partition():
>              (self.fstype, extra_imagecmd, rootfs, label_str, rootfs_dir)
>          exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
>
> +        mkfs_cmd = "fsck.%s -pvfD %s" % (self.fstype, rootfs)
> +        exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
> +
>      def prepare_rootfs_btrfs(self, rootfs, oe_builddir, rootfs_dir,
>                               native_sysroot, pseudo):
>          """
>

maybe it's worth noting this check should not primary target fixing a 
corrupt ext4 (bad if mkfs created on!) but performs some directory 
optimization on the build host that otherwise would be performed on the 
target the next time something triggers an fsck.
Performing those optimizations on the target will also make fsck trigger 
a reboot!

As the options as provided will not fix a real corrupted EXT it might 
also be useful to change the patch description to not confuse about the 
impact of the change.

Regards, Enrico

-- 
Pengutronix e.K.                           | Enrico Jörns                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5080 |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |


