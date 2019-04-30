Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id AFE8A7DAEF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 14:46:36 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id f7so12847126wrs.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Apr 2019 07:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=2MlQbcRtyrqvJa0yEcs3EHKUDJkbyOCBLfhT1RZ8AFM=;
	b=htm94N7ExbmKQoVrzDPoKEro6BxiTICzKbyF4jaAPGGgCAUOcJgTpM4WMSqYnbyvYF
	brx0NOSai3yTkSj8Kxm+6yQHwCBc1vBiNr5SAkiIKkYEKXLaHnbk0ezVqZoSWl4xnLoG
	MX2BGKcy4FGcMKNfTMQT5DBnXzHtLrnA2/so4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=2MlQbcRtyrqvJa0yEcs3EHKUDJkbyOCBLfhT1RZ8AFM=;
	b=UQm4RTMYxaltZXVTCUczLMhXaOX2oHLsnejqH4RDMN43o+hZ7HXDsAn+2/8pmKL1DM
	mHD9e6CgRWsQr718ZNwb1KX5hjIqHKCCb8RtwXrkI2JYuEZiHCwSlbYwPwL0tOperLa2
	w+7w83npskjJ1VIwnL/c2H7ECfMr95l9o8Tyxa4n34D0PAKcwZLDg68l/KZKXcoWYqdw
	VJqAGrYzP3TorKDjAJVHMlev9Halt/8EYsJMAyx3gIhQ3asiy42eYMx+qwji7qOwoJzk
	vrpCAXkRuZ3ZuFl8nxyXjRg/wuoxvC+e0ckymvb6oEnVtHUoEPpquFrcjFKtc5JbRCQE
	MdbA==
X-Gm-Message-State: APjAAAVdp18tgXicIGsT/ry++/MCjEvvQgITkLlOD5U6hmHJxUqJ0WzE
	jVmGciEpMgY0gVEvN2BrbmV0dQ==
X-Google-Smtp-Source: APXvYqxCYSludU4cBD/SrhEIZt8bFZiugfWX0gQIhg7YMKelZ4CnRCHY/hY2OSRGOatYYrpLdrsDNg==
X-Received: by 2002:adf:f1d1:: with SMTP id z17mr24500793wro.282.1556635597444;
	Tue, 30 Apr 2019 07:46:37 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id i8sm2638332wrb.5.2019.04.30.07.46.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Apr 2019 07:46:36 -0700 (PDT)
Message-ID: <9686ed6db87337e7f1a6c8ab72555f5d2ebadd02.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai.kang@windriver.com, raj.khem@gmail.com
Date: Tue, 30 Apr 2019 15:46:35 +0100
In-Reply-To: <20190430142351.92592-1-kai.kang@windriver.com>
References: <20190430142351.92592-1-kai.kang@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] virglrenderer: use gold linker for x86 if cflag -fvisibility=default set
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
X-List-Received-Date: Tue, 30 Apr 2019 14:46:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-04-30 at 10:23 -0400, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> When gcc compile options '-fvisibility=default' is set in CFLAGS, it
> fails to compile virglrenderer for x86:
> 
> > i586-wrs-linux-libtool: link: i586-wrs-linux-gcc  -m32 -march=i586 ...
>   -Wl,--whole-archive ./.libs/libvrend.a
>   gallium/auxiliary/.libs/libgallium.a -Wl,--no-whole-archive ...
>   -Wl,-Bsymbolic -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
>   -fstack-protector-strong -Wl,-z -Wl,relro -Wl,-z -Wl,now   -pthread
>   -Wl,-soname -Wl,libvirglrenderer.so.0 -o .libs/libvirglrenderer.so.0.2.0
> > ld: gallium/auxiliary/.libs/libgallium.a(u_cpu_detect.o): relocation
>   R_386_GOTOFF against undefined symbol `util_cpu_caps' can not be used
>   when making a shared object
> > ld: final link failed: bad value
> > collect2: error: ld returned 1 exit status
> 
> It seems GNU bfd linker doesn't work well to handle option '-Bsymbolic'
> and gcc option '-fvisibility=default'. Use gold instead under this
> circumstance.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
> index 225a0b8b0c..f72cfbd9b4 100644
> --- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.7.0.bb
> @@ -15,6 +15,8 @@ S = "${WORKDIR}/git"
>  
>  inherit autotools pkgconfig distro_features_check
>  
> +EXTRA_OEMAKE_x86 = "${@bb.utils.contains('CFLAGS', '-fvisibility=default', 'GM_LDFLAGS+=-fuse-ld=gold', '', d)}"
> +
>  BBCLASSEXTEND = "native nativesdk"
>  
>  REQUIRED_DISTRO_FEATURES = "opengl"

Do we really want to start adding hacks to recipes to work around
linker bugs like this?

Has the bug been reported upstream? Why doesn't this happen on non-x86?

Cheers,

Richard


