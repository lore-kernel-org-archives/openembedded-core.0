Return-Path: <prvs=486987640=Martin.Hundeboll@prevas.dk>
X-Greylist: delayed 595 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 16 Nov 2017 13:36:29 UTC
Received: from mail01.prevas.se (mail01.prevas.se [62.95.78.3])
	by mail.openembedded.org (Postfix) with ESMTP id 578A37865F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 13:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=1875; q=dns/txt;
	s=ironport1; t=1510839392; x=1542375392;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=ofre5Vp/orEuTdlvdfZZSThC3io8WJYFKN64c6RJQf0=;
	b=UnqBrYjFUpbJpJ+qGTYUvhtaUPNT2s+vmARWA9v8w3wP6CkNS+PfTjk1
	hOH8VlssSmIsnh9OXRR7D0mlj9D9OhcF1At68W09Uh/+OkIkFUWSn7qDZ
	+ADzXTS65wG2AhwIz1pRIv//fw9arzk1J6EOs7HbfWewxpyfJRCM1MWn3 0=;
X-IronPort-AV: E=Sophos;i="5.44,403,1505772000"; 
   d="scan'208";a="2830004"
Received: from vmprevas4.prevas.se (HELO smtp.prevas.se) ([172.16.8.104])
	by ironport1.prevas.se with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Nov 2017 14:26:34 +0100
Received: from [172.17.20.204] (172.16.8.31) by smtp.prevas.se (172.16.8.104)
	with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 16 Nov 2017 14:26:34 +0100
To: Dogukan Ergun <dogukan.ergun@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <1510832983-801-1-git-send-email-dogukan.ergun@gmail.com>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
Message-ID: <4549aa61-dc57-37d6-aa43-5f76d110feae@prevas.dk>
Date: Thu, 16 Nov 2017 14:26:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1510832983-801-1-git-send-email-dogukan.ergun@gmail.com>
X-Originating-IP: [172.16.8.31]
Subject: Re: [PATCH] wic: fallback to dd, if sparse_copy does not work
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
X-List-Received-Date: Thu, 16 Nov 2017 13:36:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2017-11-16 12:49, Dogukan Ergun wrote:
> Docker's aufs filesystem doesn't support file ioctl operations like FIGETBSZ
> or FIEMAP.
> Sparse_copy operation will fail if those ioctls are not supported.
> If sparse_copy fails while generating wic images, fallback to dd for copying
> filesystems on final image.
> 
> Signed-off-by: Dogukan Ergun <dogukan.ergun@gmail.com>
> ---
>   scripts/lib/wic/plugins/imager/direct.py | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
> index da1c061..70f93ee 100644
> --- a/scripts/lib/wic/plugins/imager/direct.py
> +++ b/scripts/lib/wic/plugins/imager/direct.py
> @@ -577,8 +577,14 @@ class PartitionedImage():
>           for part in self.partitions:
>               source = part.source_file
>               if source:
> -                # install source_file contents into a partition
> -                sparse_copy(source, self.path, seek=part.start * self.sector_size)
> +                try:
> +                    # install source_file contents into a partition
> +                    sparse_copy(source, self.path, seek=part.start * self.sector_size)
> +                except:

I guess a failing sparse_copy() would raise an IOError. Shouldn't you 
limit the except to catching only those?

// Martin

> +                    # Sparse_copy failed, fallback to dd method
> +                    dd_cmd = "dd if=%s of=%s bs=%d seek=%d count=%d conv=notrunc" % \
> +                        (source, self.path, self.sector_size, part.start, part.size_sec)
> +                    exec_cmd(dd_cmd)
>   
>                   logger.debug("Installed %s in partition %d, sectors %d-%d, "
>                                "size %d sectors", source, part.num, part.start,
> 

