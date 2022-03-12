Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FEC5C433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 17:11:55 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.6619.1647105114560776514
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 09:11:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=X0u421k+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id x15so17451203wru.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 09:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=cfzEVzxzLT145m/0G/cTa44Eo/Ciepw3v1NLu8ssBxY=;
        b=X0u421k+HSIJnlT3S9LG8aUtlIaqkrdCWKJ2WCM2/p07j3Bx1ApJuV1FTMzQvGOo3b
         TI6ZxHqlWnnnEf7r2eQOPB+yTdyS/tTtrLnGBj2lbXvcmmGbCX4N2agMgAFQ+vANFchR
         RDbMCV4dqC9pBvcSWBF+ZVTe9x8VC/bateMjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cfzEVzxzLT145m/0G/cTa44Eo/Ciepw3v1NLu8ssBxY=;
        b=0SEJsfrq6GoZvuORT0LJUid33+xsCfOadgcJCmS4/VeQI+SgVi6nz3rHihyLmwsvGv
         CmxDIaosfFsQbyHFMB/MsUINwXuZx9UIPfT7Wpz0KUbAAPmdaehym8a8rbSgU7GkhdJl
         IyViuNfvtQL2sgvXENGhu5hPMooIPCdoZCFELbSXQT8cLIELIvlbGfYWQ2dw2a/Qnxfx
         EeHIw9VzOQX3gj0mIApulEKSZT7tJG1fuZG6tkQGbCR1U+luU/3UJ+7M6pdQPcUNJ0VM
         z3vsR6ktBHSqRY7ZPWX/rKVjPSknP458hQs0g+41rQekdOex3DwkWx2QxInQiX5hRrx2
         xBfA==
X-Gm-Message-State: AOAM533lGLlKR2umMe0LDoIaiyRFPUKoyGAd/PswsB31pPY2NCLXAlB6
	V3dnWDNfWu35AGAmCnIS5n0zCA==
X-Google-Smtp-Source: 
 ABdhPJx/pTEO7jQiz5Pu2GVnXMCsv8/NpufLv5KxmwbsjPD6fOTbbrY1qWtu34n5WnjSLlbVxyhUoA==
X-Received: by 2002:a05:6000:23a:b0:1f0:2359:9cd5 with SMTP id
 l26-20020a056000023a00b001f023599cd5mr10918624wrz.335.1647105112823;
        Sat, 12 Mar 2022 09:11:52 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fe04:8f35:800e:f4a7?
 ([2001:8b0:aba:5f3c:fe04:8f35:800e:f4a7])
        by smtp.gmail.com with ESMTPSA id
 l8-20020a5d6688000000b001f04ae0bb6csm8994884wru.58.2022.03.12.09.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 09:11:52 -0800 (PST)
Message-ID: 
 <c2bf5b0dc76b78ce72d54b8d0a7bee40c0512f4f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] meson.bbclass: add exe_wrapper helper
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sat, 12 Mar 2022 17:11:50 +0000
In-Reply-To: <20220312154011.499012-1-quaresma.jose@gmail.com>
References: <20220312154011.499012-1-quaresma.jose@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 17:11:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163096

On Sat, 2022-03-12 at 15:40 +0000, Jose Quaresma wrote:
> Sometimes when we use the exe_wrapper we need a way to
> costumize or circumvent some limitations of the qemu usermode.
> The ideia of this help script is to handle such cases before
> the qemu usermode was launched.
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/meson.bbclass | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
> index 0bfe945811..877f5e7794 100644
> --- a/meta/classes/meson.bbclass
> +++ b/meta/classes/meson.bbclass
> @@ -114,6 +114,8 @@ cpp_link_args = ${@meson_array('BUILD_LDFLAGS', d)}
>  EOF
>  }
>  
> +MESON_QEMU_WRAPPER_HELPER ?= ""
> +
>  do_write_config:append:class-target() {
>      # Write out a qemu wrapper that will be used as exe_wrapper so that meson
>      # can run target helper binaries through that.
> @@ -127,10 +129,14 @@ export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules-dummy
>  # meson sets this wrongly (only to libs in build-dir), qemu_wrapper_cmdline() and GIR_EXTRA_LIBS_PATH take care of it properly
>  unset LD_LIBRARY_PATH
>  
> +# import any customization provided in the helper
> +test -f "${MESON_QEMU_WRAPPER_HELPER}" && . ${MESON_QEMU_WRAPPER_HELPER}
> +
>  $qemu_binary "\$@"
>  EOF
>      chmod +x ${WORKDIR}/meson-qemuwrapper
>  }
> +do_write_config:class-target[vardeps] += "MESON_QEMU_WRAPPER_HELPER"

You can't use overrides with flags like that, I'm surprised that even parses!

Cheers,

Richard



