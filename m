Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B645C369AF
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 13:46:01 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.26379.1744379156487601447
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 06:45:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CWzxt5Xg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39727fe912cso944993f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 06:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744379155; x=1744983955; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RtEi7lD3NbnER5tmdAcY55MJgc7QWOprBZtIapBWfmY=;
        b=CWzxt5Xgwc70KZx+ouoaKtHy/FKnwC5oqCfmIBBFSSAls16IDNBiXhWYhViwnCy4VP
         fa3nFUtMsz+9erpQuyICJgGQ9Yx8XW8o+Ehl4jOhl8/qhkP0PrhGtNiYuW5fQj+2ao7Z
         BJWMcHse1I7RAJgBgkmAkNv/hh2dtKyBJATug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744379155; x=1744983955;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RtEi7lD3NbnER5tmdAcY55MJgc7QWOprBZtIapBWfmY=;
        b=RIraOtkqImtSMpHPD806kkvdrFpt8omxVgSYPywEvcUG7FeIPpjjVRtdOTFzcCObf4
         tvdhLwx/V3n9vdQCWjmbLUnr6ZKF7S5UNUD3yvlfQK+c61X2xDJbGOwu6lVWPm1REyJ5
         FYkuUNKxVhACcqt6tHTfjQmad+oqA4CaoJElKmJSX1XhNuBKK3xBQwW67xGDP/NYRoxi
         Nj9zx6KWX5oD0aqnzpdi+9qlIRd6SEYKGEL28riNlwiWx40oFg90xFw0k8oplbrG6a2G
         eQ/P9FBKGOBPCv87P0b76Aj1RlLJQOtC/n/Eyc33v5t/UbKhyAUvIEIA4Z/pndNRvY4e
         8B4w==
X-Gm-Message-State: AOJu0YyORUjti1u9JMKSF3BYfSWHofxwW5u9G2ys6Ol3wU6mKH9lWNTL
	aB/H1myukKQaQwnlAJ6FUHq95ZhQiSunw7a35x3r3NzYwiZ3rpUNiYhteuUunGg=
X-Gm-Gg: ASbGnct9Nr7EfontZeHCxCbcD7IuRHo2/B1fUwKsFYw59FJcyRoqtFBTi5+vzeehLRf
	ea2y/+Ul69i04Un5+URugBU5s+gokkHPtKjLqH6zB5b65B+4QC8H0AzrlM5nyReJZM5IaFQbhr+
	BK93pQXUIMi7deH96RZbB5P5Vi1IsgXcBI5aotlu0LJBQAVJKBaXOGMMvD8aIz3zKeEdaBoA4hC
	JJFXxfdI7UfddenTlzG3nQv4ieexQJOitIgpZnHyQKZWpUUH6ItX5Gv/d0NA0AqnIOV/nA4uIN4
	A+ZkKXFJgAxA4/QGdAS272QVvdX2cU5+MP/pqhu7uXoJpk9QY3ap0HTLAiM8QSev4+9febh7pvc
	dY3Y5I8s6G2cB0dDXXShZLhe1Im7F2A==
X-Google-Smtp-Source: AGHT+IE69b5g/QISZBYsUMK54hya41z+rNhxfnyz+5QLUMTwbqKW5GYNaMhaC+v81EdasKjjAFU21w==
X-Received: by 2002:a5d:6da8:0:b0:39a:ca04:3e4d with SMTP id ffacd0b85a97d-39ea51d3184mr2324093f8f.7.1744379154880;
        Fri, 11 Apr 2025 06:45:54 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:1556:e863:7570:d375? ([2001:8b0:aba:5f3c:1556:e863:7570:d375])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445708sm2061859f8f.96.2025.04.11.06.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 06:45:53 -0700 (PDT)
Message-ID: <9ee91ca81c09a5c98482d235ba88f2898f83b492.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 03/11] kernel.bbclass: add
 kernel-initrd-modules meta package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Mikko Rapeli
	 <mikko.rapeli@linaro.org>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 11 Apr 2025 14:45:53 +0100
In-Reply-To: <CADkTA4O9JXtr6XFO_rdzoAumtmp=5YUUkwgKMJyOtDBau7MEDQ@mail.gmail.com>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
	 <20250404162932.447699-4-mikko.rapeli@linaro.org>
	 <1c55e7536de5f36fa37076ad04ff35588b6b5f1e.camel@linuxfoundation.org>
	 <Z_fBAsbV-hY-x_SC@nuoska>
	 <CADkTA4MamOxjfPE8uHhFDmZ12OhxpJ9dfhxbsxKGZxwQ4_cCkQ@mail.gmail.com>
	 <Z_jJX05RuRTcFf4P@nuoska>
	 <CADkTA4MWWtMXdRhvmdXhoS38SVpqXUz=p5G5H1i820QaV4CR0A@mail.gmail.com>
	 <Z_kVI4bN7xWOyUi-@nuoska>
	 <CADkTA4O9JXtr6XFO_rdzoAumtmp=5YUUkwgKMJyOtDBau7MEDQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 13:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214743

On Fri, 2025-04-11 at 09:39 -0400, Bruce Ashfield wrote:
> Richard: If you are reading this and get this far, is there any way
> to add some sort of RPROVIDES to a package that is almost a
> wild card ?=C2=A0 I just haven't had time to think it through or
> experiment.
> Rather than the directory listings, if the new initrd kernel module
> meta-package could be constructed (or just the image doing the
> installs) from something like IMAGE_INSTALL=C2=A0+=3D "kernel-essential-
> boot-*'
> and that RPROVIDES was put into the packages when they were
> created .. we'd have the top down control and explicit configuration
> I'm looking for.

I think the package rprovides would have to be unique but you could do
that with kernel-essential-boot-XXX. Installing globs of packages
doesn't work well at the package manager level but we do have support
for things like the dev/dbg/locale globbing (*-dev and friends) at the
image construction level so that much is possible, albeit for a quite
difference usecase atm.

Cheers,

Richard

