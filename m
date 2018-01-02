Return-Path: <prvs=5336259ac=Martin.Hundeboll@prevas.dk>
Received: from mail01.prevas.se (mail01.prevas.se [62.95.78.3])
	by mail.openembedded.org (Postfix) with ESMTP id 499E6606CB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jan 2018 08:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=prevas.dk; i=@prevas.dk; l=2257; q=dns/txt;
	s=ironport1; t=1514883367; x=1546419367;
	h=subject:to:cc:references:from:message-id:date:
	mime-version:in-reply-to:content-transfer-encoding;
	bh=fhyLlLxNgRoH5kl7iEDex/6p9ijz0szxFSUkom148PQ=;
	b=sjnpbKxF9ede/mLoOyJRbNHS9+3haG9UvvRAkFoM1mjqULZFbah9ptp2
	vflx6XSJTUahjfarGAIyWtLwnjOX/Z2yffbNNyV1KmIXCW2S88i/2+nyI
	XHuEBri/Zf0wWjxvt+Dbkm0+457cE2DYPpsksJ9pQsI4qwgM0Ea1kI3mA M=;
X-IronPort-AV: E=Sophos;i="5.45,496,1508796000"; 
   d="scan'208";a="3021426"
Received: from vmprevas8.prevas.se (HELO smtp.prevas.se) ([172.16.8.36])
	by ironport1.prevas.se with ESMTP/TLS/DHE-RSA-AES256-SHA;
	02 Jan 2018 09:56:05 +0100
Received: from [172.16.11.15] (172.16.11.15) by smtp.prevas.se (172.16.8.36)
	with Microsoft SMTP Server (TLS) id 14.3.361.1; Tue, 2 Jan 2018 09:56:05
	+0100
To: OE-core <openembedded-core@lists.openembedded.org>, Armin Kuster
	<akuster808@gmail.com>
References: <20171211071242.5675-1-mnhu@prevas.dk>
From: =?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>
Message-ID: <95eeb8aa-2a17-79f5-96a8-35e7bb9bebaf@prevas.dk>
Date: Tue, 2 Jan 2018 09:55:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20171211071242.5675-1-mnhu@prevas.dk>
X-Originating-IP: [172.16.11.15]
Subject: Re: [PATCH][rocko] wic: support filesystem label for rawcopy
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
X-List-Received-Date: Tue, 02 Jan 2018 08:56:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Armin,

Any idea about when this will land in the rocko branch?

Thanks,
Martin

On 2017-12-11 08:12, Martin Hundebøll wrote:
> The '--label' argument should work for '--source rawcopy' as it does for
> '--source rootfs', so add a method in RawCopyPlugin to update the label
> on the temporary filesystem images.
> 
> Signed-off-by: Martin Hundebøll <mnhu@prevas.dk>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> 
> Hi Armin,
> 
> Please consider this for Rocko.
> 
> Thanks
> 
>   scripts/lib/wic/plugins/source/rawcopy.py | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/plugins/source/rawcopy.py
> index 424ed26ed6..e86398ac8f 100644
> --- a/scripts/lib/wic/plugins/source/rawcopy.py
> +++ b/scripts/lib/wic/plugins/source/rawcopy.py
> @@ -32,6 +32,25 @@ class RawCopyPlugin(SourcePlugin):
>   
>       name = 'rawcopy'
>   
> +    @staticmethod
> +    def do_image_label(fstype, dst, label):
> +        if fstype.startswith('ext'):
> +            cmd = 'tune2fs -L %s %s' % (label, dst)
> +        elif fstype in ('msdos', 'vfat'):
> +            cmd = 'dosfslabel %s %s' % (dst, label)
> +        elif fstype == 'btrfs':
> +            cmd = 'btrfs filesystem label %s %s' % (dst, label)
> +        elif fstype == 'swap':
> +            cmd = 'mkswap -L %s %s' % (label, dst)
> +        elif fstype == 'squashfs':
> +            raise WicError("It's not possible to update a squashfs "
> +                           "filesystem label '%s'" % (label))
> +        else:
> +            raise WicError("Cannot update filesystem label: "
> +                           "Unknown fstype: '%s'" % (fstype))
> +
> +        exec_cmd(cmd)
> +
>       @classmethod
>       def do_prepare_partition(cls, part, source_params, cr, cr_workdir,
>                                oe_builddir, bootimg_dir, kernel_dir,
> @@ -66,4 +85,7 @@ class RawCopyPlugin(SourcePlugin):
>           if filesize > part.size:
>               part.size = filesize
>   
> +        if part.label:
> +            RawCopyPlugin.do_image_label(part.fstype, dst, part.label)
> +
>           part.source_file = dst
> 

