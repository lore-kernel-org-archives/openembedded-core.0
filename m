Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24852C4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 10:46:38 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.9713.1714733190356968869
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 03:46:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=FLwJtXqW;
 spf=pass (domain: linaro.org, ip: 209.85.167.43, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-51fa75d54a4so261895e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 03:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714733188; x=1715337988; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yiWUF5Qi6mscFw93Lpc/m9lxtNs4EsI8AIYZvGsEUWY=;
        b=FLwJtXqWcBv1FSgW0R3NqijoHQBvAuwY7n5GgVHVfzffnXhA6fpsK4f34exJ8of0oJ
         f4RDLjpzcgexLVDAHAOmFP+68+4JCGsrixunj+Gow6pUPFrtES9Z8YpwA/UkFDaq5cKP
         sHJeEegLb9dA7unXiO1RmwH/dLnJgdpeTGsWaFpvspO666ZWmVq9SFOaL9j2sUDqd9v0
         C8P6HdsfFbdQs9GMFYsrt2C68c0fSlA68c7zGD1N3RMOVQIKladiuJmF6arcNoB1M7hR
         uO6fUfDywTdOQf/smjHeBcw5QYsnxBkEJsXgvsYbqXUyy7h4aAGJ/Vz73O6qW8sqgxUZ
         jzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714733188; x=1715337988;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yiWUF5Qi6mscFw93Lpc/m9lxtNs4EsI8AIYZvGsEUWY=;
        b=HCX3CaWlWs32Js3U7npEwipAGdiFk/8VgS+A+dXoVaHg2AkbRbGbY3RYB12QWj0JQn
         AtC1dxY8E1A5fl/J+QF/UMiqqXO/uBL2dvEoralWKTIZIGn67NGq6frtxakzh+eXb3qf
         t6ALDk23Qq04jwrXeI6YqFQ+MDkpLSYo9v/LwcgYpTgRmkv/wgPyN3oOfXHZBqqiyw85
         v8CNLcEajQJcBRqhG5KrTpY475iNfl/tK402B4pbiqA0GKhvlYChKOEi/RA703vEN8b8
         5RJ4cTAPH/tVsR9SHGuvF1rmLbE3CfSSPjFPfirc1EM+X2ysKYVZpjwBiDGUEAyNY0Tc
         N8+g==
X-Forwarded-Encrypted: i=1; AJvYcCVP/6GVhIJcLe8kHv5xkPuScEQXu5IY15BMPJ5vrY2O9+pRmAJwDUgsLphW8V13oqqy8dUC1OrjX4sf8YhL5n+YumFu+nowMtUIkzIL7ELB6DlVN9cpFcpQ
X-Gm-Message-State: AOJu0Yw+ukgokaJI7/qfl2UgiHzE9mMv2BGc2QwWHa+OKRevQeinBIIl
	gzWGVJyrPLgE99Wv8IyZG3/bfXdIOWN4C0G0NMqlx2PDf2Z2rUYNOI3oCnj2Rv8=
X-Google-Smtp-Source: AGHT+IG3OSi1bxwHoV+EzX3KXtdBa/tTrUJNKcjPTUcxda3VlfOdAELHwlBBKjs5IPTgKjnQXpOhNw==
X-Received: by 2002:ac2:4541:0:b0:51e:efec:dfaa with SMTP id j1-20020ac24541000000b0051eefecdfaamr622291lfm.19.1714733188500;
        Fri, 03 May 2024 03:46:28 -0700 (PDT)
Received: from nuoska (87-100-245-199.bb.dnainternet.fi. [87.100.245.199])
        by smtp.gmail.com with ESMTPSA id w20-20020a19c514000000b0051d98076e07sm494210lfe.217.2024.05.03.03.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 03:46:27 -0700 (PDT)
Date: Fri, 3 May 2024 13:46:26 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] openssl: fix pkg-config file libdir from /usr
 back to /usr/lib
Message-ID: <ZjTAgqXvKuet2hvc@nuoska>
References: <20240503102624.594443-1-mikko.rapeli@linaro.org>
 <CANNYZj8RStk4X-HkTp01THZdrtZ+AF3pLoDm6v04TsFKumSVDA@mail.gmail.com>
 <ZjS-QQ1wDTt-lXsc@nuoska>
 <CA+chaQeXOqrc_UKyYUt=JCiJfJyxDNGSFwn3f9q7mi6NiGA1pw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+chaQeXOqrc_UKyYUt=JCiJfJyxDNGSFwn3f9q7mi6NiGA1pw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 10:46:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198973

Hi,

On Fri, May 03, 2024 at 12:43:29PM +0200, Martin Jansa wrote:
> On Fri, May 3, 2024 at 12:37 PM Mikko Rapeli via
> lists.openembedded.org
> <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> >
> > Hi,
> >
> > On Fri, May 03, 2024 at 12:32:42PM +0200, Alexander Kanavin wrote:
> > > I’m sorry, this doesn’t look right. Shouldn’t we rather ensure $(LIBDIR) is
> > > correctly set? Besides, hardcoding to lib is certainly incorrect as it will
> > > break multilib. We constantly have to fix upstreams in the opposite
> > > direction.
> >
> > Yes, you and Ross on #yocto are right. This is not right. I tried also setting
> > LIBDIR=${BASELIB} in do_install() and do_configure but those did not work
> > either. openssl builds scripts are quite hard to work with...
> 
> Isn't it easier to fix tpm2-openssl then?
> 
> I had similar issue in chip which was using "pkg-config
> --variable=prefix openssl" and didn't expect it to be empty in "if
> prefix[-4] == '/usr'" and rather patched chip than changing openssl.

To me this is a bug/regression in openssl pkg-config since libdir changed
from /usr/lib to /usr which doesn't work for same use cases anymore.

Cheers,

-Mikko

