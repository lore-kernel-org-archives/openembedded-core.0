Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 597B6760AA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Apr 2016 14:34:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3AEYUQx015537
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Apr 2016 07:34:30 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 10 Apr 2016 07:34:29 -0700
To: Joshua Lock <joshua.g.lock@intel.com>,
	<openembedded-core@lists.openembedded.org>
References: <1460106859-14007-1-git-send-email-joshua.g.lock@intel.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <570A6473.6070000@windriver.com>
Date: Sun, 10 Apr 2016 22:34:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1460106859-14007-1-git-send-email-joshua.g.lock@intel.com>
Cc: Joshua Lock <joshua.lock@collabora.co.uk>
Subject: Re: [PATCH 1/2] wic/utils/partitionedfs.py: assemble .wic images as sparse files
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
X-List-Received-Date: Sun, 10 Apr 2016 14:34:37 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/08/2016 05:14 PM, Joshua Lock wrote:
> From: Joshua Lock <joshua.lock@collabora.co.uk>
>
> The individual partitions created by wic are sparse but without
> this change the assembled image is written as one (potentially
> very) large file.
>
> Preserve sparseness in the assembled image by passing the sparse
> conversion symbol.
>
> [YOCTO #9099]
>
> Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
> ---
>   scripts/lib/wic/utils/partitionedfs.py | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
> index 5a103bb..3e2b420 100644
> --- a/scripts/lib/wic/utils/partitionedfs.py
> +++ b/scripts/lib/wic/utils/partitionedfs.py
> @@ -340,7 +340,7 @@ class Image(object):
>               source = part['source_file']
>               if source:
>                   # install source_file contents into a partition
> -                cmd = "dd if=%s of=%s bs=%d seek=%d count=%d conv=notrunc" % \
> +                cmd = "dd if=%s of=%s bs=%d seek=%d count=%d conv=notrunc,sparse" % \

Hi Joshua,

I got errors with this patch since my dd doesn't support conversion sparse:
dd: invalid conversion: `sparse'
Try `dd --help' for more information.

So that it would fail.

$ dd --version
dd (coreutils) 8.13
Copyright (C) 2011 Free Software Foundation, Inc.

The host is Ubuntu 12.04, it works well except this error.

// Robert

>                         (source, image_file, self.sector_size,
>                          part['start'], part['size'])
>                   exec_cmd(cmd)
>

