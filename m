Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9DD8571A9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 14:47:02 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id x1so67452266lff.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 06:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=fiqElka2VZlcgTEPPE0INgRyYK1tWliyJDlPO9AaiZ8=;
	b=f57eoK48HWFhV0UP9WfRaYoHGojhFHwzW2QLeZVPObJISmHYnhZITtCuT5v/bZ89UW
	nypLKuKxVIysvYoSvOAYf+AI+K3jQGyZhOBoO+tTFtP38MpLoRuzSiTzZR8h61iHnGwx
	ZJ2ozaqFMg1pH+ZWllfSTtXP6vNW0Kp29kUqC/FEoHydW5otUUKSdlRM+vUXi8upviYd
	OPAbHag8a81JNcYS/sL636ikViMypW/rhB1kbgpkrs02BQTK1ZtF5slfUaSExQvLuguD
	PhudneGuCqtvFXCTbm++YxbyBZhPZxh0pkjUG69Acx4iLJX5xDg8Oz38zDPm6vKh7fMc
	gsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=fiqElka2VZlcgTEPPE0INgRyYK1tWliyJDlPO9AaiZ8=;
	b=VP236ZiEmyaMYNxbEcbuRzp6QNgNYCbSBxjcozbiLackes2QKwpGLABfW1+J+u9vgy
	uuwgphSxdBgZZ8G+zF1y5DCKUg43H2I9tZpzuDrj//Sb63jsVYMjSyWdmYcwLL2lzTKx
	KSYudf9aBQGygDS1C4IvvoRPKXCraBDov9xsrlbfrHJp01OKy8bWlsdCIz1l9w+sYYIB
	ZV2jK8wJ4mg9RZbGq+cFY/sc30fDe2VmLhrggZeObCl+y/n9NjV7iffoRfvbtZ4zt7aR
	efaRt+hbqeHVN02Kbod0GjGbUwlzoRbsCqVggfgtd3zeRhbga4nScacabsdxR96RGVaR
	EvCw==
X-Gm-Message-State: AMke39m18tOzUcaed4yL3ngOqb4hgzZ1w+fdimgPA+DgVx5m6nYW6hoexsbjzBPxvDKSnw==
X-Received: by 10.25.221.217 with SMTP id w86mr8456269lfi.141.1487083621904;
	Tue, 14 Feb 2017 06:47:01 -0800 (PST)
Received: from [192.168.1.14] ([176.111.205.58])
	by smtp.googlemail.com with ESMTPSA id
	u18sm193467ljd.28.2017.02.14.06.47.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Feb 2017 06:47:00 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1485499897-15737-1-git-send-email-kristian.amlie@mender.io>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <e1d3535e-79b9-f21a-efae-ef53e5745cde@mender.io>
Date: Tue, 14 Feb 2017 15:46:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <1485499897-15737-1-git-send-email-kristian.amlie@mender.io>
Subject: Re: [PATCH] wic/partionedfs: Avoid reserving space for non-existing ext. partition
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
X-List-Received-Date: Tue, 14 Feb 2017 14:47:02 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Ping. Patch still applies, should be a very easy change.

-- 
Kristian


On 27/01/17 07:51, Kristian Amlie wrote:
> We don't need the gap that the extended partition occupies if we
> already know that we have less than five partitions. Saves up to one
> full alignment of space.
> 
> Signed-off-by: Kristian Amlie <kristian.amlie@mender.io>
> ---
>  scripts/lib/wic/utils/partitionedfs.py | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
> index 721d514..9db6d56 100644
> --- a/scripts/lib/wic/utils/partitionedfs.py
> +++ b/scripts/lib/wic/utils/partitionedfs.py
> @@ -131,6 +131,10 @@ class Image():
>  
>          self._partitions_layed_out = True
>  
> +        # The number of primary and logical partitions. Extended partition and
> +        # partitions not listed in the table are not included.
> +        num_real_partitions = len([p for p in self.partitions if not p['no_table']])
> +
>          # Go through partitions in the order they are added in .ks file
>          for num in range(len(self.partitions)):
>              part = self.partitions[num]
> @@ -162,7 +166,7 @@ class Image():
>                  # Skip one sector required for the partitioning scheme overhead
>                  disk['offset'] += overhead
>  
> -            if disk['realpart'] > 3:
> +            if disk['realpart'] > 3 and num_real_partitions > 4:
>                  # Reserve a sector for EBR for every logical partition
>                  # before alignment is performed.
>                  if ptable_format == "msdos":
> @@ -202,7 +206,7 @@ class Image():
>  
>              if disk['ptable_format'] == "msdos":
>                  # only count the partitions that are in partition table
> -                if len([p for p in self.partitions if not p['no_table']]) > 4:
> +                if num_real_partitions > 4:
>                      if disk['realpart'] > 3:
>                          part['type'] = 'logical'
>                          part['num'] = disk['realpart'] + 1
> 

