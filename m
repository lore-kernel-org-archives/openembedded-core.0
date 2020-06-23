Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.5069.1592912469366543430
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 04:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BDy2DxTz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id r12so2851378wrj.13
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 04:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=I2QlwT7qWgoFGryoBMkDSYqr8Aiq9Zsr8zOCoUiJpZ0=;
        b=BDy2DxTzr0jZ7qTuw0tkAvhkyxkHaH6bbH+gKzauFbNNq4y9EkMdn0PYGNpmBDC2jR
         8q4Oy1L2jdFp2nL37lO+pi0YwSsrLsQmOPFbGUwHAE6DP+4HTOKh6yVcPEiP6l9AH2YY
         gn0l7IfDL76jggy5267+8KFYvIZXqdWl2AVi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=I2QlwT7qWgoFGryoBMkDSYqr8Aiq9Zsr8zOCoUiJpZ0=;
        b=qpYpelHzEh/YQNiYSzQ4XAlxTSjN9vGxSxT4vLkPL73aLuNShph1x3bkMbN4aFsQWq
         PxzzhwhTxGob2KU31mFn2bCAM6LptFIuWJH8m1y/Rt97tRWNUcdfSvjo+Jj7CA5bKXOI
         uV7RSg95nueZmed/RxUYuj/Ls2rzXa/WlGbwBo64BM2g18nOzbPJPQoMRpBCRlJndAjx
         abPwwbt9ReEXDW0Fh/5j1kAxkD0x6xKqCopJc5UUBaU9c/oeWpbNFCnpF6cOPZDE6o5I
         MdFPv9G65efBFcGrtg6MSDeWr7AIihChXxiEMf3VJKY5hUDGFxRJJuvQm8nJR0oaxwGp
         HR0w==
X-Gm-Message-State: AOAM532u+u+udav4ZgMtUjf7PDk3K0EAFX9ze0HaGc6GdHkrzOUiE84u
	T4CXvIhzcTju2ezjyBJ5Pks8/A==
X-Google-Smtp-Source: ABdhPJxTOj5OEN/4PASBIeQd5fkMIFofpglU1ZIfrb9IVKQskFxhUbG4u+VMQQ/jKC5055AaIKYXiw==
X-Received: by 2002:a5d:664e:: with SMTP id f14mr24766330wrw.6.1592912467868;
        Tue, 23 Jun 2020 04:41:07 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id l1sm23735941wrb.31.2020.06.23.04.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 04:41:07 -0700 (PDT)
Message-ID: <2907b99d3713af98ba3dd91e0ec7d10318819426.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] nopackages.bbclass: Move to nopackages_base.bbclass
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Fredrik Gustafsson <fredrik.gustafsson@axis.com>, 
	openembedded-core@lists.openembedded.org
Cc: tools-cfpbuild-internal@axis.com, hugo.cedervall@axis.com, Fredrik
	Gustafsson <fredrigu@axis.com>
Date: Tue, 23 Jun 2020 12:41:05 +0100
In-Reply-To: <20200623111328.5838-2-fredrigu@axis.com>
References: <20200623111328.5838-1-fredrigu@axis.com>
	 <20200623111328.5838-2-fredrigu@axis.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-23 at 13:13 +0200, Fredrik Gustafsson wrote:
> When for example adding an other package mananger a two rows
> deltask do_package_write_PKGMGR
> deltask do_package_write_PKGMGR_setscene
> is needed to be added to nopackages.bbclass. When adding the new
> package
> manager in a new layer in order to extend poky (rather than forking
> it)
> the whole nopackages.bbclass needs to be copied which is a
> maintenance
> problem. Moving nopackages.bbclass to nopackages.bbclass would make
> the
> new layer just adding an image.bbclass containing:
> inherit nopackages_base.bbclass
> deltask do_package_write_PKGMGR
> deltask do_package_write_PKGMGR_setscene
> 
> Which is much easier to maintain.
> 
> Signed-off-by: Fredrik Gustafsson <fredrigu@axis.com>
> ---
>  meta/classes/nopackages.bbclass      | 15 +++------------
>  meta/classes/nopackages_base.bbclass | 12 ++++++++++++
>  2 files changed, 15 insertions(+), 12 deletions(-)
>  create mode 100644 meta/classes/nopackages_base.bbclass

I personally think "_base" bbclasses are not helpful to making our code
easier to understand and I'd prefer to see fewer of them, not more.

I can't remember if deltask support multiple parameters but if not, it
can be made to. That would then allow this to be configured with a
variable. I'd suggest we explore other options along those lines for
this.

Cheers,

Richard

