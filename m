Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.680.1619028623064392408
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Apr 2021 11:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QFCH4aF0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id m9so29530224wrx.3
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Apr 2021 11:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=EYL08bZIKWKIoslgRALg7bzLYbHCEbkVyDthK/CL87s=;
        b=QFCH4aF0uy6wr+O+IJeD5Tl+Ux3V1xRfQPBJ4n+G3BwRGaGkxDQMNi3mcm1GVrYP3H
         q+QZKAxgZjzxH0OX+Ghc2WUTu4cp4ltAh10HaM7huPNYIsNbSlTVlK7AuMT23Vcl9iJw
         0knpGHccg7mZ5+6MHtZXlhpc55kig/PE7+xkA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=EYL08bZIKWKIoslgRALg7bzLYbHCEbkVyDthK/CL87s=;
        b=AsCX4Kmd40llbTm1Dz523McOkAFH+6wE9K3vUFR+vt4dmx1tQdlzsfNgTM9lX2fEFu
         6fJewJj0+e7l37YrI471L/lKnXrEwRGvGrq8p58KXXySrcbicb0tj8k1WmLt420AoKdx
         WB2a6vB1Ytl3p/Aw1FhEyoFh8z3tvT7SMtvFigJ8YyiNszXRlZ7gWL5iZQHSyN8Hg7GK
         H6oXeTaI66oavHEZqAMLnAOmsJjvKezwnPMLelNHLW2zxtVd5ocm/TeJNlmE4tJMkiZa
         engMiNpUR+nkXSgAZCaCHpxlLvdELP96jNaoBVS4UShrKTSZ4YXfoOQgfCzCTC8rmL3X
         C5rA==
X-Gm-Message-State: AOAM533w3+6QZtymj2zaDsKnE1cAFWVhmwEqrD7FGkmsxpfjF6ozIu9I
	S+fWFdFGUQEzFpJr2QdKhbTOiw==
X-Google-Smtp-Source: ABdhPJyGFGkcdYCHPhlsfdO1hlKxrnplIfAS8ZBB1fmwvr+v4vdsz1o4PM1z0yozQ22ZqZURhguKkA==
X-Received: by 2002:adf:f00e:: with SMTP id j14mr27631205wro.180.1619028621519;
        Wed, 21 Apr 2021 11:10:21 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:95dc:b210:2777:ba53? ([2001:8b0:aba:5f3c:95dc:b210:2777:ba53])
        by smtp.gmail.com with ESMTPSA id q126sm116309wma.6.2021.04.21.11.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 11:10:21 -0700 (PDT)
Message-ID: <d59ab2e71f0115018fb1c957276ce71e3292cd95.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Use shutil.move when os.rename fails
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Devendra Tewari <devendra.tewari@gmail.com>, Khem Raj
 <raj.khem@gmail.com>
Cc: Andre McCurdy <armccurdy@gmail.com>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Apr 2021 19:10:20 +0100
In-Reply-To: <F23C2F80-7F48-4384-A946-34152D4FCBDD@gmail.com>
References: 
	<CAMKF1sqYpfoFeThNAJDyhH5KZgpbBS2TRj8CSmiiyK_edqBkJw@mail.gmail.com>
	 <F23C2F80-7F48-4384-A946-34152D4FCBDD@gmail.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2021-04-21 at 11:43 -0300, Devendra Tewari wrote:
> I created an image for Raspberry Pi Zero W from code at  
> https://github.com/tewarid/docker-meta-raspberrypi/tree/sstate, using Docker for macOS, and on Ubuntu 20.04-
> LTS, and wrote it out to an SDCard using bmaptool. Booted and checked that busybox symlinks in rootfs look
> all right.
> 
> > Em 21 de abr. de 2021, à(s) 02:22, Khem Raj <raj.khem@gmail.com> escreveu:
> > 
> > ﻿None of my images are bootable when this patch is applied, because
> > symlinks that busybox should provide arent created in the image. This
> > patch should be looked into a bit further,  how was it tested ?

I think there is some element to this we're not understanding. I'm also
worried that the exception is quite generic, OSError covers a lot of things
and we probably need to make it more specific.

I'd suggest we add a patch changing all the call sites to use a new
wrapper function in bb.utils and then we can adjust that single site to
handle issues as they arise and as we understand them.

Cheers,

Richard

