Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D83AB10D14A8
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 12:06:13 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49126.1774870957191480515
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Mar 2026 04:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rH50p/65;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: ernestvanhoecke@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66bf6aa4858so973646a12.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 04:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774870955; x=1775475755; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c4rwKIn/avE31FkJyV4qUjdKEQl43tjA+Stu6FGLM/E=;
        b=rH50p/65SkAJA8fxJKIPzJ3o8C5bkETz/L/sYKmpGylGAL+BeOrmnRkyRPD1+OW4Nw
         AWIcgSsURt0hujiYqxBTG1R5XOH4dUjG7848GW+uHJqtpKBXLH7/lC6dhynmJSIhPwPE
         8c1Agbvx77fM5GhKKHOv+cJ0vuEzitEMENdWnIe7SUI8uJLcX9qv4jaeGORR0KLC11W0
         u4a0a6gYBt9oRBHNkpCs7ZHu7BfU37EFgcf3f+yGPcnQPE/4TmVIpZARcPA0oa8oTkds
         e5pt2GIV7XKCCwFL/AnW+qc8yTNVw0hggZMVzWmKYrU/ztknvO3oXKBbM1jD4UrPTsED
         X6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774870955; x=1775475755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4rwKIn/avE31FkJyV4qUjdKEQl43tjA+Stu6FGLM/E=;
        b=Di1Ja/+vzLu2kCN8p7F+OqNsd/+TIlQSB4O+AJ5uVJMnigdTBGRqywDb8ZhUfmBRbN
         57lP4/QonOYF8T2/+pAv+aJ35UciMSfH7R3YxmIKQL8GCEr6lwfTWKUC6C7aw1OeDRCl
         CEot1K4/vt/sH6gTtoiSGaZ1JVLsZn/lzk3Jqguw05pLIAP2DoXDLL+brqY77J9YGw/1
         z8FNtImk8qTl1kEUkiO9ytk+Axdjnhz42kHpsHLhjpXWwhNkBE4kZ6KDFtc9Ex4j74zW
         1j/nP+6Kb/oTFyqogD43eualtCLIQhUrW5pP/IIr+i7zx4AKgp8bLwHZ4NWGWPe3j29+
         zAoQ==
X-Gm-Message-State: AOJu0YxLH74dEiMiQALB/Drl1i4T11rYTvxMfieyl7ftY0yXwWwAb4qu
	+p06dRXIzwFSz/cQweNdTt6b6eLLpiswa9Gt0Mv/oG7ftBXot2QJrlRd
X-Gm-Gg: ATEYQzzkNTDyDS7wmOkol3Q4o9XhqnlS3yXKwNgguZiDQ+OPJwOQBRXdLAwLKujb+md
	sKcP+lmgEK/Kx1jbVq1xsuf47dUovjDoOKJAHL71YdPdiz6nPhXxJd5zT4By4IhJ7KcLt42ER1p
	bu6/FtYYp2Y8+/AhGS14OlsIq8Xgjx81y184vgyKGgQmChkVEn7vntTyaSn8Uk2S9rs2DN6wplY
	2ZOqWR/q8b1ttH1lDQq7CsYznlllU0+tSNZfDxVlUb9TjUNQknLy51aCWh0na8XBtdFIhYJVdNB
	cBQaSu/9tmXKqyE5ckVD3JZql/n1RNh9SwPTfSUuyjJZ2TECNPPoYSoU2WDnOAoyQWwPL2zGBA/
	p/Qh1WFyjAUZy4Ay+yA1Qg5emWoJfJjWeOXMPW0fpEGllO4kiwCTTzBwLS+OX/p2j4lOyImiE9T
	cgZ1577iHlGNLw7JKdzuKZfM0q2uN12FShfjhQFFa43DhHkpkcyEBLwP2sapBw5oRHIW5+xk8R+
	SHnpl87I+UvecdmAHz+isq24DQ=
X-Received: by 2002:a17:907:97c4:b0:b9b:e5d:71db with SMTP id a640c23a62f3a-b9b50960ed3mr726433266b.46.1774870955075;
        Mon, 30 Mar 2026 04:42:35 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae515fdsm278274966b.17.2026.03.30.04.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:42:34 -0700 (PDT)
Date: Mon, 30 Mar 2026 13:42:33 +0200
From: "Ernest Van Hoecke" <ernestvanhoecke@gmail.com>
To: Quentin Schulz <foss+yocto@0leil.net>
Cc: openembedded-core@lists.openembedded.org, 
	Quentin Schulz <quentin.schulz@cherry.de>
Subject: Re: [PATCH 2/3] mesa: fix building imagination Vulkan driver
Message-ID: <p622d2eobfz6lcovsmuaqc3ipsunvb43eldgilxnmmo6bau2ix@xvoivqeknimf>
References: <20260326-mesa-libdrm-imagination-v1-0-fe018f03be6a@cherry.de>
 <20260326-mesa-libdrm-imagination-v1-2-fe018f03be6a@cherry.de>
MIME-Version: 1.0
In-Reply-To: <20260326-mesa-libdrm-imagination-v1-2-fe018f03be6a@cherry.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Mar 2026 12:06:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234231

Hi Quentin,

On Thu, Mar 26, 2026 at 12:05:50PM +0100, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@cherry.de>
> 
> The imagination Vulkan driver requires a precomp-compiler from
> mesa-tools-native since we've decoupled libclc from target mesa in
> commit ac5e0160df78 ("mesa: depend on mesa-tools-native for less
> expensive libclc dependency"). This is achieved by building the
> imagination precomp-compiler tool in mesa-tools-native and making use of
> it via the libclc PACKAGECONFIG for the Vulkan driver such that
> mesa-tools-native dependency (and its imagination precomp-compiler) are
> brought in.
> 
> Fixes: ac5e0160df78 ("mesa: depend on mesa-tools-native for less expensive libclc dependency")
> Reported-by: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
> ---
>  meta/recipes-graphics/mesa/mesa-tools-native.bb | 2 +-
>  meta/recipes-graphics/mesa/mesa.inc             | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb b/meta/recipes-graphics/mesa/mesa-tools-native.bb
> index 50d2f5cbb0..0fff6ef1dd 100644
> --- a/meta/recipes-graphics/mesa/mesa-tools-native.bb
> +++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
> @@ -3,7 +3,7 @@ inherit_defer native
>  
>  SUMMARY += " (tools only)"
>  
> -PACKAGECONFIG = "tools asahi panfrost"
> +PACKAGECONFIG = "tools asahi imagination panfrost"
>  # llvm required for libclc
>  PACKAGECONFIG += "gallium-llvm"
>  # Doesn't compile without wayland-scanner if PLATFORMS has wayland in, and,
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index e5ee4ad259..cc4937ae97 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -137,7 +137,7 @@ VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'asahi libclc gallium-l
>  VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
>  VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
>  VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'virtio', ',gfxstream', '', d)}"
> -VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination', ',imagination', '', d)}"
> +VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'imagination libclc', ',imagination', '', d)}"
>  VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc gallium-llvm', ',intel', '', d)}"
>  VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'intel libclc', ',intel_hasvk', '', d)}"
>  VULKAN_DRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'panfrost libclc', ',panfrost', '', d)}"
> 
> -- 
> 2.53.0
> 

Thanks again for this work, I can confirm that everything builds and
runs as expected on the Toradex Aquila AM69 SoM.

Tested-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com> # Aquila AM69

Kind regards,
Ernest


