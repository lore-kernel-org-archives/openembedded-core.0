Return-Path: <martin@geanix.com>
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id DA82D606AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 08:12:16 +0000 (UTC)
Received: from [192.168.8.20] (unknown [85.184.140.241])
	by first.geanix.com (Postfix) with ESMTPSA id 536A18104;
	Thu, 27 Feb 2020 08:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1582791136; bh=tGwApo0H763E5DRg/R3WBvpgL65mJtrICQcvo9Fsvlk=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=TR9yr6SRlun72YDk0zhtCkRQeMidw+F3rwo/OmBZojq2q5HRf5Xro4G02kvnor61B
	I6CB9N3X3MZsErdmstxs1vLnrgV+hUfGm0+yrSLoNruOdxty88YPOmPssWQviIAgKj
	QFBdp+28fKsyKNHx4tjMRpZSZlcIBSVMCnwl/ih9GL/YIrJeGzJ+F8xEwP5UtNvR3f
	bkv1RMiYaE3l3YEJwP2p1YmMeYuw5zGB5GyWVEIy0yaS6sLo6b3BKEPwF5FJfEN/2s
	YV/Nz98oUm+NXys5PuG2Aita9t/hAvdfbI/lhwFXwE//ZKxWfrNSCZ/aAjfUJRpfQr
	yomSb8YJypccQ==
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20200227042658.19619-1-akuster808@gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <martin@geanix.com>
Message-ID: <312d477b-f5f5-16df-7867-c5c9f5619abb@geanix.com>
Date: Thu, 27 Feb 2020 09:12:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200227042658.19619-1-akuster808@gmail.com>
X-Spam-Status: No, score=-3.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on 05ff821c8cf1
Subject: Re: [PATCH] wic: Add include-dir option
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
X-List-Received-Date: Thu, 27 Feb 2020 08:12:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit

Hi Armin,

On 27/02/2020 05.26, Armin Kuster wrote:
> This option allows for the inclusion of a single directory
> for a partition.

I am unsure how this is used in a .wks file.

 From the code it looks similar to the include-path option, but relative 
to the rootfs source dir instead of the wic working dir?

But the include-dir value is also used in the destination path?

Thanks,
Martin

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>   scripts/lib/wic/help.py                  |  3 +++
>   scripts/lib/wic/ksparser.py              |  1 +
>   scripts/lib/wic/partition.py             |  1 +
>   scripts/lib/wic/plugins/source/rootfs.py | 10 ++++++++--
>   4 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/lib/wic/help.py b/scripts/lib/wic/help.py
> index 4d342fcf05..517f68e11e 100644
> --- a/scripts/lib/wic/help.py
> +++ b/scripts/lib/wic/help.py
> @@ -979,6 +979,9 @@ DESCRIPTION
>                            copies. This option only has an effect with the rootfs
>                            source plugin.
>   
> +         --include-dir: This option is specific to wic. It adds the contents
> +                        of the given directory to the resulting partition.
> +
>            --extra-space: This option is specific to wic. It adds extra
>                           space after the space filled by the content
>                           of the partition. The final size can go
> diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
> index 650b976223..b8abc33c87 100644
> --- a/scripts/lib/wic/ksparser.py
> +++ b/scripts/lib/wic/ksparser.py
> @@ -138,6 +138,7 @@ class KickStart():
>           part.add_argument('--align', type=int)
>           part.add_argument('--exclude-path', nargs='+')
>           part.add_argument('--include-path', nargs='+')
> +        part.add_argument('--include-dir')
>           part.add_argument("--extra-space", type=sizetype)
>           part.add_argument('--fsoptions', dest='fsopts')
>           part.add_argument('--fstype', default='vfat',
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 2d95f78439..0b735fffd9 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -31,6 +31,7 @@ class Partition():
>           self.extra_space = args.extra_space
>           self.exclude_path = args.exclude_path
>           self.include_path = args.include_path
> +        self.include_dir = args.include_dir
>           self.fsopts = args.fsopts
>           self.fstype = args.fstype
>           self.label = args.label
> diff --git a/scripts/lib/wic/plugins/source/rootfs.py b/scripts/lib/wic/plugins/source/rootfs.py
> index 705aeb5563..d1c59cab8a 100644
> --- a/scripts/lib/wic/plugins/source/rootfs.py
> +++ b/scripts/lib/wic/plugins/source/rootfs.py
> @@ -71,7 +71,7 @@ class RootfsPlugin(SourcePlugin):
>   
>           new_rootfs = None
>           # Handle excluded paths.
> -        if part.exclude_path or part.include_path:
> +        if part.exclude_path or part.include_path or part.include_dir:
>               # We need a new rootfs directory we can delete files from. Copy to
>               # workdir.
>               new_rootfs = os.path.realpath(os.path.join(cr_workdir, "rootfs%d" % part.lineno))
> @@ -79,7 +79,13 @@ class RootfsPlugin(SourcePlugin):
>               if os.path.lexists(new_rootfs):
>                   shutil.rmtree(os.path.join(new_rootfs))
>   
> -            copyhardlinktree(part.rootfs_dir, new_rootfs)
> +            if part.include_dir:
> +                src = os.path.realpath(os.path.join(part.rootfs_dir, part.include_dir))
> +                dst = os.path.realpath(os.path.join(new_rootfs, part.include_dir))
> +                copyhardlinktree(src, dst)
> +
> +            else:
> +                copyhardlinktree(part.rootfs_dir, new_rootfs)
>   
>               for path in part.include_path or []:
>                   copyhardlinktree(path, new_rootfs)
> 

