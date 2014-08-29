Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 69E8971044
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 10:55:31 +0000 (UTC)
Received: by mail-pd0-f169.google.com with SMTP id g10so198251pdj.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 03:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=mJhWL5sH0XQNKA51pOmsAHTYp5+YGGr5ZSd7S8iFQIk=;
	b=Y4pHMrXS5KD0InRhFVhQuaMfq0e3tav/Tjr/Lh6modo4k3TjgF0ikScn5N5KuSErTN
	d2vGvQuGQmIjO8FVlGBj8VfyRRTbrcxVWePgcUTAOCsxLfNQHWH8Po72ORN6mfHaGP2c
	RsqVuPVLow0iUw5nDLUCgELDgZ/z9ZgprF9XwOBxYiJiMdmQKHPxhQDwYJGh1oHpih9W
	SWkZCoqXCicybM/dRL397++dZCH4yQ8UIVFInuKvjlztNrZ/QvLvrOff/im2Kp1JsiHD
	1YgZMN4QeP82Fpy6tefrlUedtrrYXcS0t68bbPKAIu3bE4UnZa39hI+pFBFU8M+iKF5V
	3oNA==
X-Gm-Message-State: ALoCoQl5NPzbkIVm48ItZJltZj9mhLwO+4UvGemqDPj3WF3w2ARoUCwTDFrP3zJ0Elfr6FGkeTOD
MIME-Version: 1.0
X-Received: by 10.66.222.74 with SMTP id qk10mr14558960pac.70.1409309733416;
	Fri, 29 Aug 2014 03:55:33 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.136 with HTTP; Fri, 29 Aug 2014 03:55:33 -0700 (PDT)
In-Reply-To: <1408720803-11737-1-git-send-email-lpapp@kde.org>
References: <1408720803-11737-1-git-send-email-lpapp@kde.org>
Date: Fri, 29 Aug 2014 11:55:33 +0100
X-Google-Sender-Auth: y4XTwQ3xfkT-rT2dU6pgh-RaWqY
Message-ID: <CAOMwXhNdwEdKY_5o8Mvtyam1LdrnNEUz0vbvW-_WdqBFEH-WxA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add support for ccache builds with the SDK
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
X-List-Received-Date: Fri, 29 Aug 2014 10:55:36 -0000
Content-Type: text/plain; charset=UTF-8

One week passed and there is neither feedback, nor progress. What am I
doing wrong?

On Fri, Aug 22, 2014 at 4:20 PM, Laszlo Papp <lpapp@kde.org> wrote:
> Signed-off-by: Laszlo Papp <lpapp@kde.org>
> ---
>  meta/classes/toolchain-scripts.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index 6cc8eba..60278d6 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -19,6 +19,7 @@ toolchain_create_sdk_env_script () {
>                 EXTRAPATH="$EXTRAPATH:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_ARCH}${TARGET_VENDOR}-$i"
>         done
>         echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS}'$EXTRAPATH':$PATH' >> $script
> +       echo 'export CCACHE_PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${TARGET_SYS}'$EXTRAPATH':$CCACHE_PATH' >> $script
>         echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >> $script
>         echo 'export PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig' >> $script
>         echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
> @@ -37,6 +38,7 @@ toolchain_create_tree_env_script () {
>         rm -f $script
>         touch $script
>         echo 'export PATH=${STAGING_DIR_NATIVE}/usr/bin:${PATH}' >> $script
> +       echo 'export CCACHE_PATH=${STAGING_DIR_NATIVE}/usr/bin:${CCACHE_PATH}' >> $script
>         echo 'export PKG_CONFIG_SYSROOT_DIR=${PKG_CONFIG_SYSROOT_DIR}' >> $script
>         echo 'export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}' >> $script
>         echo 'export CONFIG_SITE="${@siteinfo_get_files(d)}"' >> $script
> --
> 2.0.4
>

