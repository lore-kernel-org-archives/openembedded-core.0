Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.18690.1592229597818545108
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 06:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ETiRUGck;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id l17so14773036wmj.0
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2020 06:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=iC8OwYZTTdgKPEKYJnZ5p27wTd/41AVuUW6V0Ca+OlI=;
        b=ETiRUGckATnDQW0RBe/byxyoRdVHr01sURzH/fsy/xX+cmtuJjVOObAY92fqc4OcBo
         YwS1ACU50nuH8tzv7vZVhXjvuxcELFhAJ+gZ/7FrZZJx/VOJLf4k8Dgb66dwE0GItthZ
         KbP6nt3e1OMjlyLW/fvW2s3j9GHSa+W5SgL1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=iC8OwYZTTdgKPEKYJnZ5p27wTd/41AVuUW6V0Ca+OlI=;
        b=HRe3Pl1GuBDvy4DfPniqiAXKIRTWR7tZQ605OXei8Km0842P3Ztnifo4qcEkHdBJpC
         fZgeGdVEE5aYPRQEgXr9znkysEqbBDt9Bz9S+Ho5tGUiev8EHKAfkqsJ/6/yVxvO7EsA
         dTkwm8r0FCGcoOQsfNU8yJaVhQp+jQEB5/q5MV2qzVA6ErijzmvDg7K4JAax4izKlM59
         sg9zQf0a400VumJmDT5b6lSvgzk1yN+9kd6PDMfLnzuE7oEqqY1zvqFgc4DZMyZzul9W
         1vCdy2ScExsp5IK9NginPpCcZ0Y7TaqfQ1yTrr+QWOw6bSoufd8cpZFABprMGMdm16rd
         xznQ==
X-Gm-Message-State: AOAM532GRln7d35givcNrG5XZTmAB9xMsuiXn4M+CPsdkxagYyZ22RkE
	LeRSw9gi1XrSq9ld/q63qAf0cA==
X-Google-Smtp-Source: ABdhPJyth2IDpl2y6E+4Y5Ay04tqp6KdgNJ+Wyb9htWdxORJmyUNeDH9gQsuNoDRpCx+f+El4CBWoQ==
X-Received: by 2002:a1c:a74f:: with SMTP id q76mr13972590wme.65.1592229596282;
        Mon, 15 Jun 2020 06:59:56 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id o15sm22254508wmm.31.2020.06.15.06.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2020 06:59:55 -0700 (PDT)
Message-ID: <8960c8c17b33c28a53ef121eefb38cb5d21e4630.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH] recipetool: Fix list concatenation when using edit
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jun 2020 14:59:54 +0100
In-Reply-To: <CAO5Uq5Svd45REbgn3xEZhd_NzS8sX7FQrpVS0yo4pyNGkkT2Rw@mail.gmail.com>
References: <1617CF6F85240247.10901@lists.openembedded.org>
	 <CAO5Uq5Svd45REbgn3xEZhd_NzS8sX7FQrpVS0yo4pyNGkkT2Rw@mail.gmail.com>
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-06-12 at 16:17 +0100, Alex Kiernan wrote:
> On Fri, Jun 12, 2020 at 2:38 PM Alex Kiernan via
> lists.openembedded.org <alex.kiernan=gmail.com@lists.openembedded.org
> >
> wrote:
> > If there are multiple appends, ensure we concatenate compatible
> > things:
> > 
> > Traceback (most recent call last):
> >   File "/home/akiernan/poky/scripts/recipetool", line 111, in
> > <module>
> >     ret = main()
> >   File "/home/akiernan/poky/scripts/recipetool", line 100, in main
> >     ret = args.func(args)
> >   File "/home/akiernan/poky/scripts/lib/recipetool/edit.py", line
> > 38, in edit
> >     return scriptutils.run_editor([recipe_path] + appends, logger)
> > TypeError: can only concatenate list (not "tuple") to list
> > 
> > Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> > ---
> > 
> 
> I should add a test to this too, since what's there is well tested
> today (apart from edit!)

That would be much appreciated as it does have some of our better test
coverage!

Cheers,

Richard

