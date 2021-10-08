Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E95C433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 12:26:59 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.8342.1633696017951581365
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 05:26:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ibLdiXaF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id v17so29282001wrv.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 05:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=QLnAmELmkXkJx0vSDBAF1witi0rEKnSKpb1dDFI27F8=;
        b=ibLdiXaFZSiVHg9mcQIpQNwChCoN9t4qsEBQvZzCkJ2h+xIIscqGZetM1t9YlP7tGq
         Ag7u8HN0xf/SyQrCWLH/8guLRdVu0V75H/jgvfhv3U7c5OHnyVVpDBBmBOidp+e0oQbR
         o8DqkDf+kRkWeo2wd/qvSUBsqcctBjtIHkAfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=QLnAmELmkXkJx0vSDBAF1witi0rEKnSKpb1dDFI27F8=;
        b=VoAU2tEvXFcW4qFpVrA2EaXVzypXkb3LvaOrfOwAMOKCcKhltPZLZZyoVGWI+/OpSk
         JS/n8dcxlKtDsVSWGzOG6ivXLyVK73NLbRBGwI1CthOIXEBaI7XAF4+62i+70T/jPKSZ
         aHhN2ejNEYHQDfi17xTXfM5dkvbotFyqIqfGadIdJsX6lN5l0Q4ObScqDXWmf0XnI5uE
         i0niqaufuXVqeULB+AJwiJNAkgkTM9S6x0cEtJ2FhRB9kKfZnzfk5C2UDXHtBknKB09+
         hy0bmth+P4jP+VmEyQq6dtSQ8rTHaXzUGLCaAZcc06GOioaaHfDGu5h/noOtAMtV6B52
         XySw==
X-Gm-Message-State: AOAM533dox7MbAwXsbFhY5OlrJslBvxplHEvpiQr7nXxhsTaGCiC63SH
	jV1/59NALpWO2nof7x6m2uJsNA==
X-Google-Smtp-Source: 
 ABdhPJw2CS2aG3WipBUa2ya/oairjwN9HQw/oiPCBCWJ5E7hWQxko6qr63K0kAKqLXC9kzZCovfq9w==
X-Received: by 2002:a7b:cbd1:: with SMTP id n17mr1344543wmi.113.1633696016433;
        Fri, 08 Oct 2021 05:26:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5719:ccd0:9969:333f?
 ([2001:8b0:aba:5f3c:5719:ccd0:9969:333f])
        by smtp.gmail.com with ESMTPSA id
 s13sm12047531wmc.47.2021.10.08.05.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 05:26:56 -0700 (PDT)
Message-ID: 
 <f0cd4a9480197ec5659fd4023b3650131e8a6c63.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 03/12] recipetool: Skip common source files in
 guess_license
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, Stefan Herbrechtsmeier
	 <stefan.herbrechtsmeier-oss@weidmueller.com>,
	openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Date: Fri, 08 Oct 2021 13:26:52 +0100
In-Reply-To: 
 <AM9PR09MB4642A1F4033A48A1FF7EC20CA8B29@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: 
	<20211008074228.8635-1-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <20211008074228.8635-3-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <AM9PR09MB4642A1F4033A48A1FF7EC20CA8B29@AM9PR09MB4642.eurprd09.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 12:26:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156781

On Fri, 2021-10-08 at 09:45 +0200, Konrad Weihmann wrote:
> 
> On 08.10.21 09:42, Stefan Herbrechtsmeier wrote:
> > From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> > 
> > Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> > ---
> > 
> > (no changes since v1)
> > 
> >   scripts/lib/recipetool/create.py | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
> > index e88a4253da..83cf25d9b7 100644
> > --- a/scripts/lib/recipetool/create.py
> > +++ b/scripts/lib/recipetool/create.py
> > @@ -1114,6 +1114,8 @@ def guess_license(srctree, d):
> >       licfiles = []
> >       for root, dirs, files in os.walk(srctree):
> >           for fn in files:
> > +            if fn.endswith(".html") or fn.endswith(".js") or fn.endswith(".json") or fn.endswith(".svg") or fn.endswith(".ts"):
> 
> Why not
> 
> _, _ext = os.path.splitext(fn)
> if _ext in [".html", ".js", ".json", ".svg", ".ts"]:

you can do fn.endswith((".html", ".js", ".json", ".svg", ".ts"))

Cheers,

Richard


