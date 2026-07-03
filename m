Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C037C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 14:39:12 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.93825.1783089542276370165
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2026 07:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=GM3U6eaQ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso5859295e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 07:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1783089540; x=1783694340; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JSDKJDMYaCZLl1q0yE/b1AtJbwBS6lsxW6AotdjUpEY=;
        b=GM3U6eaQ/RaaMmkj4lJlyCAJR7AVeasxEeBlUIz9UxuNGTksgSTmeudYD6aYmpKmDD
         Uxfl7aa4vo7u+9mb9OYkbo8Kj/EGErz8G8cPZxnudZ5Kt0N2ZOXAyhY7WFxB3QsZil60
         GyRtC9IRzcKBqfTHjN+hhZdtB96y8sUSYonz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783089540; x=1783694340;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSDKJDMYaCZLl1q0yE/b1AtJbwBS6lsxW6AotdjUpEY=;
        b=TT74LjqxXt97wfgYo61VMjlgU7wwnzYM6BUulQbfiIc/C43vVUl9Y7PxoovU/Czdso
         Hmr3n8eV6/GY9ZBSLHhJwvdHt2A54QJQnMrzycZAHm5F1kOu9TQteWe0FfEg/buu96hW
         BBPubE58SOLKR7LugWytPlSGEIipZyvCrQ9qViApRftjdDShXD+SnArdMpnEqbTn3ahh
         Zgzr1yZOwq9hDE8GUEeYifnXq01JLT3FY5pCE5AmHHEr4GJ9L9j+nNyolWmL5zPxo0RU
         0du/shF6nftlFGHZ3UgkLew3k2hTKJlBPQN2H9oAKRBoD4wZWvs6rkwmp+22BktJ0EbR
         DKhA==
X-Gm-Message-State: AOJu0YxehTIK/x4coHY6QiqHmGji+Vj7admTOneeOmbA3pdUNDN7f2gJ
	C55hmd/lDlgCB5q2d6YQoQzkDVBLZkGFybCtll+VQYX2QfEAwMV2LKO3BYQI7px1m+24a+mTjpj
	gdEo7
X-Gm-Gg: AfdE7cn633YeXzlQzqhUlKl7ApgF5zKoJC9SUVHmcEazfmQQrSANb9PBecX4H9ant0z
	vWs0OC4pORDqYCm8/gDLjaHWSukAyOYvLex9G0ywd4vEWlGsCo9uvxikQKr2NVHpg5UIqcDiKBj
	HGAyLTxF7pA8hkM+CPVh2jTfQNRKjT3pl5NsbJ6DZWXD5UVEgtr91NlJhJKY10OOv6gjs1LCLsL
	7875Luk+MrcXuFVJ1RREEtUlY+XjQMUjL2OWUVJytYR5o9R+967sAhaRYffCIy3Wi+24WtulpoE
	HSvX7nxMDu47QCvPDhJTUMGYPEXcPU7Gag/z9e1B+bdwLX7oLn3TSysAp2hsiiVnUj3hnfAjnkV
	nhrXPQl44syDyAeiU68xLWuAgUTKGejN/bMAGKEXDknFXICbR9YAq+5r20RoeQfoa94PcS3JE2l
	HvSFzc5jsi2CM58z0W2ck0qqXEoe6/so9KRRgv+iNBT71eeXreUwI=
X-Received: by 2002:a05:600c:314a:b0:493:b6e2:1b0f with SMTP id 5b1f17b1804b1-493d0f3eb12mr1327195e9.33.1783089540502;
        Fri, 03 Jul 2026 07:39:00 -0700 (PDT)
Received: from [192.168.5.161] ([46.55.231.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63b6f8csm124588225e9.11.2026.07.03.07.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 07:39:00 -0700 (PDT)
Message-ID: <0444a610-6069-487f-9451-0d2ef9372b9e@konsulko.com>
Date: Fri, 3 Jul 2026 17:38:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] meta: Add pam to the defaults if using systemd
To: openembedded-core@lists.openembedded.org
References: <18BECDF7D56D24A3.114350@lists.openembedded.org>
Content-Language: en-US
From: Leon Anavi <leon.anavi@konsulko.com>
Cc: Tom Rini <tom.rini@konsulko.com>
In-Reply-To: <18BECDF7D56D24A3.114350@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2026 14:39:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240116

Hi,

Please note that, if accepted, this patch should be cherry-picked to 
Wrynose as well.

Sharing some context and feedback regarding these yocto-check-layer 
failures:

I submitted this patch because the recent changes mentioned in the 
commit cause test_machine_world to fail when running yocto-check-layer 
on the meta-tegra BSP layer. This regression subsequently broke the 
private commercial layer I am working on with the exact same error.

I am using the yocto-check-layer script to assess how compatible our 
private commercial layers are with the Yocto Project. However, in this 
case using yocto-check-layer has become a bit pesky with issues like 
this, alongside the requirement that the layer under test cannot be 
present in BBLAYERS and that the layer's dependencies must be specified 
with the --dependency argument.

Best regards, Leon

On 7/3/26 17:29, Leon Anavi via lists.openembedded.org wrote:
> Add pam to the list of DISTRO_FEATURES_DEFAULTS if variable
> VIRTUAL-RUNTIME_init_manager has been set to systemd. Otherwise
> having systemd in conjunction with wayland but without pam leads
> to a conflict with the REQUIRED_DISTRO_FEATURES for weston related
> recipes.
>
> This adjustment is required following these recent changes that
> switched VIRTUAL-RUNTIME_init_manager to systemd by default and added
> wayland to DISTRO_FEATURES_DEFAULTS which affects "nodistro":
>
> - 159148f4de2595556fef6e8678578df83383857b
>    meta: Support opting out of any distro features
>    (Please note that this commit also extended DISTRO_FEATURES_DEFAULTS
>    with wayland and vulkan.)
>
> - 0b4061c5d50261f826d0edb4b478d2d305274b7c
>    conf: Switch to systemd by default and simplify init manager selection
>
> This fixes issues with test_machine_world when running the
> yocto-check-layer script for BSP layers that include weston in the
> dependency chain, for example meta-tegra:
>
> ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'l4t-graphics-demos', 'weston']
>
> The weston recipe has pam in REQUIRED_DISTRO_FEATURES if systemd is
> enabled. Therefore, it makes sense to also add pam to the defaults
> through DISTRO_FEATURES_DEFAULTS.
>
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
> ---
>   meta/conf/distro/include/default-distrovars.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta/conf/distro/include/default-distrovars.inc b/meta/conf/distro/include/default-distrovars.inc
> index 69c6db589b..2eadfcbd74 100644
> --- a/meta/conf/distro/include/default-distrovars.inc
> +++ b/meta/conf/distro/include/default-distrovars.inc
> @@ -29,6 +29,7 @@ DISTRO_FEATURES_DEFAULTS ?= " \
>       acl alsa bluetooth debuginfod ext2 ipv4 ipv6 \
>       wifi xattr nfs zeroconf pci 3g nfc x11 vfat seccomp pulseaudio \
>       gobject-introspection-data ldconfig opengl ptest multiarch wayland vulkan \
> +    ${@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam', '', d)} \
>       "
>   IMAGE_FEATURES ?= ""
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#240113): https://lists.openembedded.org/g/openembedded-core/message/240113
> Mute This Topic: https://lists.openembedded.org/mt/120100403/2167311
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [leon.anavi@konsulko.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

