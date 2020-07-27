Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.59234.1595865984946805593
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 09:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Kn2t2g/d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id 3so8389545wmi.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 09:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=zYRF8qyBzGYoZ2FOdVBo4A9PTYZcrWZsnIuYi35HGRc=;
        b=Kn2t2g/ddO1a+cAL5zli8atWH/urHPgNyRXPB7SuMCGwwXB6sSYFuXm1CsrKLvDEGz
         Auo/htBWN7WnqvIQBSBJz8zjd2q7zhOhGTDovn2a8iQly1zgBny+auDjdYc9Y1eGDdS+
         Lg6nYYfAnQZdTpeLv5sl3O4odhrkIVEqx0wMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=zYRF8qyBzGYoZ2FOdVBo4A9PTYZcrWZsnIuYi35HGRc=;
        b=MP7h+zNY2bRDgRZZnAyQxu4L3D7i3EQvGJoYDKsDZwnWQbPtF5EHvqrbkD5Jj3LxSe
         GNQKs6lLJX2uWo7t5fWAbXkK/100bRkFKriS9B2mXxc+TNt+Vxb8nb6uqebM2CLoaczk
         m1rxlChB/VxDQRoODOf/8kfOpcYsHlkvF3Kx3tw+b9Wrb5EXkddUR/469MqmjM6Mq2ql
         ryzvRGyg6pWjEH/bYKyz39rC/XzxeoYZ/m9ymn+AU/WGOXd4rxeVNWns7kOmHQyv8s76
         D4MOSRcRkXTsTybEbEX954f7OAkfSYMScDdjh3K/i0OOhTQoONA55svfAO0V2mA/ufRD
         zibQ==
X-Gm-Message-State: AOAM530ezxyYKVKZrQLuaS8eaSRQg2+vpup4GA3cmOHmrNlq82e9kGJ3
	rLbnevGYZtEHRYFkVUtQ8c7ngA==
X-Google-Smtp-Source: ABdhPJx9v3WPS1J0l8cUMsgY2olag7d3t9hO2DgdOtO1CunIYnvWnSjQKnFvx25JR++2vDspOtRTYQ==
X-Received: by 2002:a1c:2dc6:: with SMTP id t189mr58383wmt.26.1595865983459;
        Mon, 27 Jul 2020 09:06:23 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.0.f.e.b.e.7.9.7.7.5.0.0.c.1.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c1c0:577:97eb:ef04])
        by smtp.gmail.com with ESMTPSA id f16sm13113943wro.34.2020.07.27.09.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 09:06:20 -0700 (PDT)
Message-ID: <58f6f225e3e005694a481165a0258e61e3554e2e.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v2 1/2] toolchain-scripts.bbclass: also recognize ${SDK_SYS} env setups
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jens Rehsack <rehsack@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Jens Rehsack <sno@netbsd.org>
Date: Mon, 27 Jul 2020 17:06:19 +0100
In-Reply-To: <20200724052606.6726-1-sno@netbsd.org>
References: <20200724052606.6726-1-sno@netbsd.org>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-24 at 07:26 +0200, Jens Rehsack wrote:
> Instead of recognizing only environment-setup scripts in
> ${STAGING_DIR_TARGET} or ${STAGING_DIR_NATIVE}, respectively - lurk also into
> ${SDKPATH}/buildtools/sysroots/${SDK_SYS} where nativesdk-openssl installs
> setup files.
> 
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/classes/toolchain-scripts.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
> index db1d3215ef..e3959e21e8 100644
> --- a/meta/classes/toolchain-scripts.bbclass
> +++ b/meta/classes/toolchain-scripts.bbclass
> @@ -119,6 +119,11 @@ if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
>  	    . \$envfile
>      done
>  fi
> +if [ -d "${SDKPATH}/buildtools/sysroots/${SDK_SYS}/environment-setup.d" ]; then
> +    for envfile in ${SDKPATH}/buildtools/sysroots/${SDK_SYS}/environment-setup.d/*.sh; do
> +	    . \$envfile
> +    done
> +fi
>  EOF
>  }

I finally got around to looking at this, sorry about the delay. Whilst
this fixes the issue and doesn't harm anything, I think its incorrect.
I suspect that $OECORE_NATIVE_SYSROOT should be pointing at
${SDKPATH}/buildtools/sysroots/${SDK_SYS}.

Could you see where $OECORE_NATIVE_SYSROOT is pointing and see if we
perhaps can't fix that instead?

Cheers,

Richard



