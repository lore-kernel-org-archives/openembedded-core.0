Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.682.1618865038655696809
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Apr 2021 13:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eXnDSIRw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id y5-20020a05600c3645b0290132b13aaa3bso7030489wmq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Apr 2021 13:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=9AybZvhagqN37vtjGHXYeWh4D4F7ilrPtAj6k1WzcII=;
        b=eXnDSIRwiON/SPSu2+oIarlFfT4PjMuEMDk352IgOfGyANcrlEjK0JWnM3bdNzdYmM
         rSevyz1Xu7TN669QVkZchcvc0fQ1neO2hD12tZq1wUP/162PxcTBKACRMSs4tisG5Aii
         BNlcCle3GRDd8wMDg4+QHX2giA8zFafham4MY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9AybZvhagqN37vtjGHXYeWh4D4F7ilrPtAj6k1WzcII=;
        b=jLmFYAuVwGK2/0pIePbREyjziJF7K5EpRcQhVCruLDkV23t4ap7G92KZVQ/SCIbMPt
         kgXeynYL+Au1lgMare0PW1xnl2E2758052O7SwbdRG41+ovCDFZlitBtsbxz8KbIAk6e
         ZUeGyqsAZqErZsm3nZ+opr5fqpaRDU9bb8HYx+jgDCu9LkP9aagfAgsGkgBphOhHoJs7
         AR1S5+X9UbMv56LYGbRNxBjSFSismn58i5Nvt0kbOKrsxqBswKfc6TdI+ZvB8aQObzXX
         neL/MNhaJVsNLtPrGYuW7yP4w/2pSLmVorUvGpUwJ9t1nliHYTun96gPasHFb7GXbb7Q
         gfog==
X-Gm-Message-State: AOAM5304AwOoHMQl2B8UqffxqmOtXaPAe09S4+seEFAKHIntOgwb6rHK
	MXD//kV8u8i3FDGGHiEwhuZ2jQ==
X-Google-Smtp-Source: ABdhPJy6qvSUpAiOPJRrv7v5BeMRsZiX4maJCK+CO/o9wIptdxHvZRGJ1X/AygrNz3xZZyNhoM7pLw==
X-Received: by 2002:a1c:f705:: with SMTP id v5mr809196wmh.105.1618864977261;
        Mon, 19 Apr 2021 13:42:57 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:e28b:7bcb:6782:eaf2? ([2001:8b0:aba:5f3c:e28b:7bcb:6782:eaf2])
        by smtp.gmail.com with ESMTPSA id l7sm27143226wrb.35.2021.04.19.13.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 13:42:56 -0700 (PDT)
Message-ID: <6058118357d8a7604faaa961066937f346fcaa7c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/4] default-distrovars.inc: add debuginfod to default DISTRO_FEATURES
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Naveen Saini <naveen.kumar.saini@intel.com>
Date: Mon, 19 Apr 2021 21:42:55 +0100
In-Reply-To: <16774CB2FBD0E460.32333@lists.openembedded.org>
References: <20210419090044.582453-1-alex.kanavin@gmail.com>
	 <20210419090044.582453-3-alex.kanavin@gmail.com>
	 <16774CB2FBD0E460.32333@lists.openembedded.org>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-04-19 at 16:41 +0100, Richard Purdie via lists.openembedded.org wrote:
> On Mon, 2021-04-19 at 11:00 +0200, Alexander Kanavin wrote:
> > Obtaining debug information by having it served automatically via http
> > is far more pleasant than messing about with debugfs and gdbserver or
> > transferring and installing -dbg packages by hand.
> > 
> > I believe we should follow the desktop distros and have it enabled
> > out of the box. Please see the following commit for the description
> > of how it works.
> > 
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/conf/distro/include/default-distrovars.inc  | 2 +-
> >  meta/recipes-devtools/binutils/binutils_2.36.bb  | 2 +-
> >  meta/recipes-devtools/elfutils/elfutils_0.183.bb | 2 +-
> >  meta/recipes-devtools/gdb/gdb-common.inc         | 2 +-
> >  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> I agree we should do this, it did blow up in testing:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/3289/steps/11/logs/stdio
> 
> Hopefully an easy fix?

Also:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/1993
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/1705

(elfutils ptest warning)

Cheers,

Richard

