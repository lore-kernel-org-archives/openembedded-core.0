Return-Path: <net147@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 91723723B3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 06:26:11 +0000 (UTC)
Received: by pabxg6 with SMTP id xg6so18563790pab.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 23:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=cGoTw3KjMZK+dCb+hLkRtE4Xf2yuAaN0Om4AyTZ6iF4=;
	b=XuQegMAhX4GdC3eN1egexi4kCP90YnurHbtxbiGqgSBZHVky42EnRDhC9HpZ4cBp0B
	b57k4SEeB9GNX8thT11q+1Uh3qgvXuZUcBNaGx8X8f7h98jBOVmRVXLIeBaGkXc9hGan
	7o90NQPAGgygFhvfOO6XH/vwNKgmLC47ABZxCDZeWDdnXQZNOgn9gs8d+ygUmLxYO+MY
	Az4sjldvLImRme4BYfQuO8ouTDv6AjV1wThS7xPze8kdonln79MntN+Z/TZ3eeg/1PVf
	TDnUV3b+snLurLd/LjFSKfHuqJCNRNhHqEtIfTrdjgX4zlEGgZ/joo5IW5mdLSuxUZJb
	EqsA==
X-Received: by 10.66.102.65 with SMTP id fm1mr13894333pab.115.1427264773274;
	Tue, 24 Mar 2015 23:26:13 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id x4sm1193788pbt.81.2015.03.24.23.26.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Mar 2015 23:26:12 -0700 (PDT)
Message-ID: <551254FE.7070709@gmail.com>
Date: Wed, 25 Mar 2015 17:26:06 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
References: <cover.1427263291.git.Qi.Chen@windriver.com>
	<4493f45f7db4274425f6eee908543f82b63dd6e5.1427263291.git.Qi.Chen@windriver.com>
In-Reply-To: <4493f45f7db4274425f6eee908543f82b63dd6e5.1427263291.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 1/1] systemd: fix SULOGIN path
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
X-List-Received-Date: Wed, 25 Mar 2015 06:26:14 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 25/03/2015 5:03 PM, Chen Qi wrote:
> Fix SULOGIN path so that rescue.service doesn't use `sulogin' from the sysroot
> part of the build on host, which would lead to errors like below when booting
> into rescue mode.
>
>      /bin/sh: /buildarea2/chenqi/poky/build-systemd/tmp/sysroots/x86_64-linux/sbin/sulogin: not found
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-core/systemd/systemd_219.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
> index f2d3c13..843e30b 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -123,6 +123,7 @@ do_configure_prepend() {
>   	export AR="${HOST_PREFIX}gcc-ar"
>   	export RANLIB="${HOST_PREFIX}gcc-ranlib"
>   	export KMOD="${base_bindir}/kmod"
> +	export SULOGIN="${base_sbindir}/sulogin"
>   	if [ -d ${S}/units.pre_sed ] ; then
>   		cp -r ${S}/units.pre_sed ${S}/units
>   	else
Wasn't this already fixed by:
https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/recipes-core/systemd/systemd_219.bb?id=8e19349b696d4a3e8576ba64e935cf3a43bc7940 
?

Regards,
Jonathan

