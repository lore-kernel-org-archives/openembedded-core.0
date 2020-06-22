Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.12334.1592810893524990593
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 00:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=D5N+NwFx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id q2so13086576wrv.8
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 00:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=1vO19ET0azUn4CeNPj1596zhg4SOGr47KumkecFQaWY=;
        b=D5N+NwFxw3fS6NHi9bxVlpam+NhGCC/2wDcZhb3Ei6ImmUyfl/sFaej0WBKpOzsVH8
         DVIlK6R16qz9DG7Q8RBbp9PnXEr3QqD95TbKkmd84gPw8StrkydO3e8BvhoBQ2g7A855
         hBjf4oN8t0ZUsvPdJy5xggTD9ouUjugTk+AwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1vO19ET0azUn4CeNPj1596zhg4SOGr47KumkecFQaWY=;
        b=RXuQaogqRh5/uTKXmQ11iOlnjM8XZlolo/Ybx7sz5t4dWUr2AQ+r+NNqTRqgLvbcGp
         kwYWSUdYNhgcOVCHX5M0ohfoyThVAreFZ7aUKChfHsFDXavO8G/3e1dFENDWIHsJ6uQn
         wT71MqnHLamtME7/SfAktZ/eUUP4s5IupkJzBnJ3+2nuMcm3h+HLlBKvQXU2cpXjaqeT
         o/xTpty7nN9vOsw1RtvCKk9LxSPYuOAH9z0IihDqJNHwi+qvxe5ANjXePF9dL8s9iGAQ
         15gZrEQPoseDTzbFRjxd00OudRYu5buFeWVeJsN4Ufjw+ZZQ2hqbcLJXMQfkmWmtKGN3
         yeHw==
X-Gm-Message-State: AOAM531z3MCfHU01chhofSzYxdTQUyAVu9WD3IzqCSmLD/oh3MJzT7LI
	Xim0aZD0K0SILDIO9Xz0OY9cpw==
X-Google-Smtp-Source: ABdhPJz5rPg2NEUe8T8Y2XY/TjJRkScZPJ0Tlygcmz7WYTr5b1h4uMuhwgk0NlABTXA+p+iv9RvR8A==
X-Received: by 2002:adf:e74e:: with SMTP id c14mr4686139wrn.143.1592810892043;
        Mon, 22 Jun 2020 00:28:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id r8sm2491723wrp.40.2020.06.22.00.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 00:28:11 -0700 (PDT)
Message-ID: <0e5d1212520efb2be866d21a7bad59531ed29108.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] xinit: add rxvt in RDEPENDS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>, Changqing Li
	 <changqing.li@windriver.com>, openembedded-core@lists.openembedded.org
Date: Mon, 22 Jun 2020 08:28:10 +0100
In-Reply-To: <5c541bf2-f2ee-f792-3371-99d577d3f8cb@gmail.com>
References: <20200622015153.3877288-1-changqing.li@windriver.com>
	 <5c541bf2-f2ee-f792-3371-99d577d3f8cb@gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-06-22 at 06:40 +0200, Jacob Kroon wrote:
> On 6/22/20 3:51 AM, Changqing Li wrote:
> > From: Changqing Li <changqing.li@windriver.com>
> > 
> > fix below error:
> > /etc/X11/xinit/xinitrc: line 55: exec: xterm: not found
> > 
> > by default, xinit will generate /etc/X11/xinit/xinitrc,
> > and have below config in it:
> > XTERM -geometry 80x50+494+51 &
> > XTERM -geometry 80x20+494-0 &
> > exec XTERM -geometry 80x66+0+0 -name login
> > 
> > the default XTERM is xterm, but xterm is in meta-oe,
> > use rxvt instead
> > 
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >   meta/recipes-graphics/xorg-app/xinit_1.4.1.bb | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
> > b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
> > index c9e28d9bba..2f2ba3af71 100644
> > --- a/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
> > +++ b/meta/recipes-graphics/xorg-app/xinit_1.4.1.bb
> > @@ -19,4 +19,7 @@ SRC_URI[sha256sum] =
> > "de9b8f617b68a70f6caf87da01fcf0ebd2b75690cdcba9c921d0ef54fa
> >   
> >   EXTRA_OECONF = "ac_cv_path_MCOOKIE=${bindir}/mcookie"
> >   
> > -RDEPENDS_${PN} += "util-linux-mcookie"
> > +PACKAGECONFIG ??= "xterm"
> > +PACKAGECONFIG[xterm] = "--with-xterm=rxvt,,,"
> > +
> 
> Maybe "rxvt" would be a more suitable name for the PACKAGECONFIG ?

Also, the RDEPENDS should be in the PACKAGECONFIG entry itself.

Cheers,

Richard

