Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212DAD111B0
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 06:53:41 +0000 (UTC)
Received: from h2.cmg2.smtp.forpsi.com (h2.cmg2.smtp.forpsi.com [81.2.195.189])
 by mx.groups.io with SMTP id smtpd.web11.52008.1730703214182110797
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Nov 2024 22:53:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=A7VOzk5z;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=A7VOzk5z;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 81.2.195.189, mailfrom: andrej.v@skyrain.eu)
Received: from [192.168.10.89] ([62.197.243.174])
	by cmgsmtp with ESMTPSA
	id 7qxutJHJgEiu27qxutrz0u; Mon, 04 Nov 2024 07:53:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1730703211; bh=afqtKJ40zUlQRxdF+FAS6JcO9RY6IKr44NxYgtOR10M=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=A7VOzk5zZCUcC/mT774n6oVNdzKPEEmPdK3MhfgtfYmvVONbi5yjh7Rl7nL+U83Cx
	 jBbfjdMGu7MMF19hNWmj2mslzbJRF9XUu9Y/Gws91FF4y4t+O8vFtSo1b+aFt8+Kt6
	 zYAEfOr9dBZRF9XnSa0JgObxeKpeKVe43gIBAcCzP9cKuIxCB6WD7zzF2lQ3cvIgGO
	 JxklBz8R5ckuzX+xMT8ko2AzhjqXHp8AG65/VuOq+e1O39uqebSgmk4KyTaz1zUBWW
	 sXNNwXC7NauXLAKojSMN/k0Y4oyjFx2lU+aIugYU0CAan9RCGwqu7+Fw+t5zGzRiIu
	 A6/VrILK/Y9Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1730703211; bh=afqtKJ40zUlQRxdF+FAS6JcO9RY6IKr44NxYgtOR10M=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=A7VOzk5zZCUcC/mT774n6oVNdzKPEEmPdK3MhfgtfYmvVONbi5yjh7Rl7nL+U83Cx
	 jBbfjdMGu7MMF19hNWmj2mslzbJRF9XUu9Y/Gws91FF4y4t+O8vFtSo1b+aFt8+Kt6
	 zYAEfOr9dBZRF9XnSa0JgObxeKpeKVe43gIBAcCzP9cKuIxCB6WD7zzF2lQ3cvIgGO
	 JxklBz8R5ckuzX+xMT8ko2AzhjqXHp8AG65/VuOq+e1O39uqebSgmk4KyTaz1zUBWW
	 sXNNwXC7NauXLAKojSMN/k0Y4oyjFx2lU+aIugYU0CAan9RCGwqu7+Fw+t5zGzRiIu
	 A6/VrILK/Y9Ew==
Message-ID: <fe7bc9ae-fa11-4d96-817b-c04b8ccd3bba@skyrain.eu>
Date: Mon, 4 Nov 2024 07:53:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] busybox: Backport a patch to build with
 CONFIG_SHA1_HWACCEL on non-x86
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
 openembedded-core@lists.openembedded.org
References: <20241102203910.1267120-1-pkj@axis.com>
Content-Language: en-US
From: Andrej Valek <andrej.v@skyrain.eu>
In-Reply-To: <20241102203910.1267120-1-pkj@axis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfO1NxUBLqsvto1uFx/5CL6oU7ZD3tw44HU+DZNJcV45RDNMDyr/fqnqkyzVNTAbwumBI8BHwmffv/6c4CbIsl1v/ebCJAgptT2oYiTBZiEf8WXnbSBa2
 xrHoNGz5ttYnxi1lyOCSzJRIkIVPStXoT48deXYsSKMh+8hnJCds7vOPmNCztLCncepXyp7U3wR+nMGAD+mLBTw6TaHI7Bf0ghJ+uhkY6UpLcr3LLULqug8H
 HTFg4tk9dwZ+xMCi66vrK49s9L+IF4x6B+iOF5HWCKc=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 06:53:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206673

Hello Peter,

I was also thinking about picking this two patches, but I didn't have a 
time for verification. Are you sure, that this 
https://lists.busybox.net/pipermail/busybox/2023-January/090078.html has 
been fixed, right? Or did you verify it?

Regards,
Andrej

On 02.11.2024 21:39, Peter Kjellerstedt wrote:
> This allows CONFIG_SHA1_HWACCEL to be enabled regardless of the
> architecture.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>   ...sha1-on-x86-if-CONFIG_SHA1_HWACCEL-y.patch | 33 +++++++++++++++++++
>   meta/recipes-core/busybox/busybox_1.37.0.bb   |  1 +
>   2 files changed, 34 insertions(+)
>   create mode 100644 meta/recipes-core/busybox/busybox/0001-libbb-fix-sha1-on-x86-if-CONFIG_SHA1_HWACCEL-y.patch
>
> diff --git a/meta/recipes-core/busybox/busybox/0001-libbb-fix-sha1-on-x86-if-CONFIG_SHA1_HWACCEL-y.patch b/meta/recipes-core/busybox/busybox/0001-libbb-fix-sha1-on-x86-if-CONFIG_SHA1_HWACCEL-y.patch
> new file mode 100644
> index 0000000000..2af188938e
> --- /dev/null
> +++ b/meta/recipes-core/busybox/busybox/0001-libbb-fix-sha1-on-x86-if-CONFIG_SHA1_HWACCEL-y.patch
> @@ -0,0 +1,33 @@
> +From bf57f732a5b6842f6fa3e0f90385f039e5d6a92c Mon Sep 17 00:00:00 2001
> +From: Rudi Heitbaum <rudi@heitbaum.com>
> +Date: Sun, 29 Sep 2024 17:57:55 +0000
> +Subject: [PATCH] libbb: fix sha1 on !x86 if CONFIG_SHA1_HWACCEL=y
> +
> +fixes non i386 and x86 builds
> +
> +libbb/hash_md5_sha.c: In function 'sha1_end':
> +libbb/hash_md5_sha.c:1316:35: error: 'sha1_process_block64_shaNI' undeclared
> + 1316 |          || ctx->process_block == sha1_process_block64_shaNI
> +
> +Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
> +Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
> +Upstream-Status: Backport [https://git.busybox.net/busybox/commit/?id=bf57f732a5b6842f6fa3e0f90385f039e5d6a92c]
> +Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> +---
> + libbb/hash_md5_sha.c | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/libbb/hash_md5_sha.c b/libbb/hash_md5_sha.c
> +index 57a801459..75a61c32c 100644
> +--- a/libbb/hash_md5_sha.c
> ++++ b/libbb/hash_md5_sha.c
> +@@ -1313,7 +1313,9 @@ unsigned FAST_FUNC sha1_end(sha1_ctx_t *ctx, void *resbuf)
> + 	hash_size = 8;
> + 	if (ctx->process_block == sha1_process_block64
> + #if ENABLE_SHA1_HWACCEL
> ++# if defined(__GNUC__) && (defined(__i386__) || defined(__x86_64__))
> + 	 || ctx->process_block == sha1_process_block64_shaNI
> ++# endif
> + #endif
> + 	) {
> + 		hash_size = 5;
> diff --git a/meta/recipes-core/busybox/busybox_1.37.0.bb b/meta/recipes-core/busybox/busybox_1.37.0.bb
> index c3131eb453..3aae6eff4d 100644
> --- a/meta/recipes-core/busybox/busybox_1.37.0.bb
> +++ b/meta/recipes-core/busybox/busybox_1.37.0.bb
> @@ -53,6 +53,7 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://0001-syslogd-fix-wrong-OPT_locallog-flag-detection.patch \
>              file://0002-start-stop-daemon-fix-tests.patch \
>              file://0003-start-stop-false.patch \
> +           file://0001-libbb-fix-sha1-on-x86-if-CONFIG_SHA1_HWACCEL-y.patch \
>              "
>   SRC_URI:append:libc-musl = " file://musl.cfg"
>   SRC_URI:append:x86-64 = " file://sha_accel.cfg"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206655): https://lists.openembedded.org/g/openembedded-core/message/206655
> Mute This Topic: https://lists.openembedded.org/mt/109357849/3619876
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [andrej.v@skyrain.eu]
> -=-=-=-=-=-=-=-=-=-=-=-
>


