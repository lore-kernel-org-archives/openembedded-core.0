Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B4F837C274
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 12:59:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8QCxHcU014144
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 26 Sep 2019 05:59:19 -0700 (PDT)
Received: from [192.168.10.15] (172.25.59.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 26 Sep 2019 05:59:16 -0700
To: Alessio Igor Bogani <alessio.bogani@elettra.eu>,
	<openembedded-core@lists.openembedded.org>
References: <f313da8e-6f87-a0d3-413b-d69d0fec9f12@windriver.com>
	<20190926093506.18853440E38_D8C864AB@spamalot.elettra.eu>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <9e377ef6-d5a9-7ebe-4542-e56f99376037@windriver.com>
Date: Thu, 26 Sep 2019 07:59:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190926093506.18853440E38_D8C864AB@spamalot.elettra.eu>
Subject: Re: [PATCH v2] wic: Using the right rootfs size during prepare_rootfs
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
X-List-Received-Date: Thu, 26 Sep 2019 12:59:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

This looks correct now with the two patches merged.

Thanks,
Jason.

On 9/26/19 4:35 AM, Alessio Igor Bogani wrote:
> The commit 8e48b4d6c4 makes wic ignores IMAGE_ROOTFS_SIZE for rootfs
> size and makes it uses the computed one only. Re-add support for
> IMAGE_ROOTFS_SIZE variable and compute roots size only if the former
> is not defined. Moreover the size of a provided directory with
> --rootfs-dir="" in the .wks file should always be computed on the fly,
> else every partition will be constrained to be the same size as what
> ever value was in ROOTFS_SIZE.
>
> Signed-off-by: Alessio Igor Bogani <alessio.bogani@elettra.eu>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>   scripts/lib/wic/partition.py | 23 +++++++++++++++++------
>   1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
> index 2a71d7b1d6..d809408e1a 100644
> --- a/scripts/lib/wic/partition.py
> +++ b/scripts/lib/wic/partition.py
> @@ -212,13 +212,24 @@ class Partition():
>           if os.path.isfile(rootfs):
>               os.remove(rootfs)
>   
> -        # If size is not specified compute it from the rootfs_dir size
>           if not self.size and real_rootfs:
> -            # Use the same logic found in get_rootfs_size()
> -            # from meta/classes/image.bbclass
> -            du_cmd = "du -ks %s" % rootfs_dir
> -            out = exec_cmd(du_cmd)
> -            self.size = int(out.split()[0])
> +            # The rootfs size is not set in .ks file so try to get it
> +            # from bitbake variable
> +            rsize_bb = get_bitbake_var('ROOTFS_SIZE')
> +            rdir = get_bitbake_var('IMAGE_ROOTFS')
> +            if rsize_bb and rdir == rootfs_dir:
> +                # Bitbake variable ROOTFS_SIZE is calculated in
> +                # Image._get_rootfs_size method from meta/lib/oe/image.py
> +                # using IMAGE_ROOTFS_SIZE, IMAGE_ROOTFS_ALIGNMENT,
> +                # IMAGE_OVERHEAD_FACTOR and IMAGE_ROOTFS_EXTRA_SPACE
> +                self.size = int(round(float(rsize_bb)))
> +            else:
> +                # Bitbake variable ROOTFS_SIZE is not defined so compute it
> +                # from the rootfs_dir size using the same logic found in
> +                # get_rootfs_size() from meta/classes/image.bbclass
> +                du_cmd = "du -ks %s" % rootfs_dir
> +                out = exec_cmd(du_cmd)
> +                self.size = int(out.split()[0])
>   
>           prefix = "ext" if self.fstype.startswith("ext") else self.fstype
>           method = getattr(self, "prepare_rootfs_" + prefix)



