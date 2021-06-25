Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web12.6672.1624623401683718533
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jun 2021 05:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dwVzhfi8;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id i94so10386541wri.4
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jun 2021 05:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=hwWU7v9EHIV8fKyJzPfsz0KIyv6zHdOBY0zSAH7veo4=;
        b=dwVzhfi8spMvjMh0vlfD5tZ4O7PiI9h/kYq5bgKFHa8l6doldUhQQIFKvb1gNApoJq
         WukbyegD/PqsdVntCCF3PyfHEQnWxo4iDXmWthx/t9Z1cZeIfpqf4607i8SyxD0AzSK2
         YE6HCEmnLYWrWRiIhFW8dtrO6WAjaqVLoGG+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=hwWU7v9EHIV8fKyJzPfsz0KIyv6zHdOBY0zSAH7veo4=;
        b=iG3C4Gun+XQE0I7GDEQjaMkDd460rmO6rcmL9Xme1ix9LBpuTcwtT/YunS0TWd6T9N
         rS/SUuUSP9adLIs6ZUqENaTfi3KHVY7zjobLf/tzW4Ly3LVhXQbjTWS2J3q/HB59KVE8
         ZVOIRB65EXrvpsQHt9//ljFu9QnIUs8sqnS0gd/p2Oa4fRaIBL7zXJ94l4JwG5UoeRH1
         85jSeb4udGzRINmQxJRrREiwCdZA7AfvKsJPqV8ujVoXk5PubKJEVy+LygkNnPoKalix
         5Kwm0h/y+cPQug7c5F0CBKwbk7sPlzgX5myTBXsRx85UDwM1OHEVjgNhWx7+Xft4srbC
         S1Ig==
X-Gm-Message-State: AOAM531aWmRUByjw5gjant9QvWXlYY58imDxu7TlR6acP3EfcICIE3+D
	L7Z3yIAeg86opyu+P9YEx3uUGg==
X-Google-Smtp-Source: ABdhPJx6bZAZSlTUKO8AYdknT+xO4mJRgi06wU+ay1D7EMLZGNVsjsqGSkFoplJy/zRmv9SdMxMGRw==
X-Received: by 2002:adf:e706:: with SMTP id c6mr620945wrm.13.1624623400228;
        Fri, 25 Jun 2021 05:16:40 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:628a:47d1:4c03:7e6d? ([2001:8b0:aba:5f3c:628a:47d1:4c03:7e6d])
        by smtp.gmail.com with ESMTPSA id x7sm5883664wre.8.2021.06.25.05.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 05:16:39 -0700 (PDT)
Message-ID: <599d48303a40d8c4db4d0d380d4cfcc5f0c7acfb.camel@linuxfoundation.org>
Subject: Re: [OE-core] RRECOMMENDS "masking" unsatisfiable IMAGE_INSTALL
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: rasmus.villemoes@prevas.dk, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 25 Jun 2021 13:16:39 +0100
In-Reply-To: <5d6b6934-bd33-04e5-cf55-ce09895bbd6c@prevas.dk>
References: <5d6b6934-bd33-04e5-cf55-ce09895bbd6c@prevas.dk>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-06-25 at 09:37 +0200, Rasmus Villemoes via lists.openembedded.org wrote:
> I noticed that if I have an image recipe that says
> 
> IMAGE_INSTALL += "kernel-module-foo"
> 
> it fails as expected when the kernel hasn't been built with CONFIG_FOO=m.
> 
> However, if at the same time some other package which happens to get
> installed in the same image says
> 
> RRECOMMENDS_${PN} += "kernel-module-foo"
> 
> the image build silently succeeds, obviously without any foo.ko
> included. This doesn't seem right. [I'm well aware that the RRECOMMENDS
> line alone works as expected, this is about the case where both the
> above lines are in play.]

Which package backend are you using and does this happen if you
use a different one, particularly swapping ipk and rpm?

That might tell us if this is a package manager issue or a bitbake
metadata one.

Cheers,

Richard


