Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web10.10224.1593783073370844424
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Jul 2020 06:31:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QckiTfZS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id f18so34109412wml.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Jul 2020 06:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=j+JtvdzbEYsGXZKaYSYWlR1UzLWPjhF4s7Q3gv/eiKc=;
        b=QckiTfZSRroZNxyQqQWF0M/SLa/M5Q2Xy1XdSdQzaHEAbqwzyYkNJSyqtnbfJPdXOS
         a9flew8BDyegZivOQEGmYctD6Diovw40wkOOdCMTvZKiDvwyh4XsEFJGhZ9rOiSztsJe
         0TW/VDq9meKZGL7Oattz30lrg9z3iNve3hDiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=j+JtvdzbEYsGXZKaYSYWlR1UzLWPjhF4s7Q3gv/eiKc=;
        b=hx805o+R18QtftaHT7ITSHaC9zq2MU7/ewIndvDufr1EnWNBiJygQDeL0f8UAFsISM
         Di013SxlajZVMnW4BLe8P6J3mtXctBii96N9bTKz94QlPb1tvA2waJP7LzNG/kmkH7em
         8Us9/sZcS7sPACX40o6bJ444yRPtZwe0wtQ8L9Y8FZmI/dfj0PskvkgTdjtsx+VCm6kM
         P0mGQCG2i6PPSrfmQKHw4LGdzbgfGjYvy3MMlQHii4ZpEt+6iYfVuOf7JDLOnJinWm33
         NGaEF6mKRsHvuPqB69l/YA/V4Nf2DILEUPeDobMYO0OpqRk/wK9pZtAMzUj7UXtLKC9g
         rRTQ==
X-Gm-Message-State: AOAM530n+u/9n4V8uzu0+r2qv68C0H0tkpSz+VVFlhz8fbI3ZYOKrLNO
	GKv0aGdEFDnSWYqr+82WQHOGQQ==
X-Google-Smtp-Source: ABdhPJwkTbq9vLn4aZdmtQJvwyCaj81bnkdT5Z5lx3nlgo/G/l4WoiIiOFrPAd+j2M8vxfAd93dNAA==
X-Received: by 2002:a7b:c14a:: with SMTP id z10mr35507624wmi.19.1593783071658;
        Fri, 03 Jul 2020 06:31:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id u84sm13269145wmg.7.2020.07.03.06.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 06:31:10 -0700 (PDT)
Message-ID: <5495a287c87c02af4ac4114c8fe69e63a7f9bc6b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] kernel.bbclass: add lz4 dependency and fix the call to lz4
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>, "T. Ulrich"
 <timon.ulrich@kabelmail.de>,  openembedded-core@lists.openembedded.org
Date: Fri, 03 Jul 2020 14:31:09 +0100
In-Reply-To: <d457e91e-8345-b9ea-49c0-e4654b64398a@gmail.com>
References: <140262> <20200703123940.24779-1-timon.ulrich@kabelmail.de>
	 <ba256db6-8174-c98d-e145-0ee358afef63@gmail.com>
	 <d457e91e-8345-b9ea-49c0-e4654b64398a@gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-07-03 at 15:10 +0200, Jacob Kroon wrote:
> On 7/3/20 2:46 PM, Jacob Kroon wrote:
> > On 7/3/20 2:39 PM, T. Ulrich wrote:
> > > From: Timon Ulrich <t.ulrich@anapur.de>
> > > 
> > > If the initramfs image is type lz4, then a native lz4 is needed.
> > > 
> > > Additionally an output filename needs to be specified when calling lz4,
> > > otherwise STDOUT will be used implicitly.
> > > 
> > > Signed-off-by: Timon Ulrich <t.ulrich@anapur.de>
> > > ---
> > >   meta/classes/kernel.bbclass | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > > index 6d07b29e2d..9e3c34ad48 100644
> > > --- a/meta/classes/kernel.bbclass
> > > +++ b/meta/classes/kernel.bbclass
> > > @@ -5,6 +5,7 @@ KERNEL_DEPLOYSUBDIR ??= "${@ "" if 
> > > (d.getVar("KERNEL_PACKAGE_NAME") == "kernel")
> > >   PROVIDES += "${@ "virtual/kernel" if 
> > > (d.getVar("KERNEL_PACKAGE_NAME") == "kernel") else "" }"
> > >   DEPENDS += "virtual/${TARGET_PREFIX}binutils 
> > > virtual/${TARGET_PREFIX}gcc kmod-native bc-native lzop-native 
> > > bison-native"
> > > +DEPENDS += "${@bb.utils.contains("INITRAMFS_FSTYPES", "cpio.lz4", 
> > > "lz4-native", "", d)}"
> > 
> > Should/Could we do a similar thing for "lzop-native" above ? To me it 
> > looks like that would be possible, assuming I interpreted my taskexp 
> > correctly.
> > 
> 
> I took the liberty of doing some more history digging, lzop-native 
> dependency was added in OE-Core commit
> 
> ee0640cb0c32b959ffaaac6752d582ed1d76e313
> kernel.bbclass: add lzop dependency
> 
> and it looks to me it'd be worth doing the same fix.

Agreed, I was hoping that would be possible for this too.

Cheers,

Richard

