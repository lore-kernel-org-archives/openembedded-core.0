Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web08.6936.1615805364412685890
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 03:49:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BD8O0dQr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id g8so7833514wmd.4
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 03:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=YhwCYDk+FNQLXOlwSLuHnbWSdX6z4ndVH76yySTB0C4=;
        b=BD8O0dQrMSPqgTSfyF8epXh7qyy56f0IrIK/71d90DAOet1YU509bYx7G+b9GrNzlS
         Z8r95MRFZ2BTuOeRS/tCL1zD1oWPBay+ixPMnlWb3syodqHfM/ApheKvaOdt68a17MPE
         bFD8vpyremokD0dkZh0NZbgks35EGwsHjhXww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YhwCYDk+FNQLXOlwSLuHnbWSdX6z4ndVH76yySTB0C4=;
        b=WybD+MZsHYjH94UVl/gYgDrvLioC0H0/U9L7tdk6nwPSL28sqYKy6DpdRlsvztEmu9
         2WHk3IxUduIi2xNRIMik6U92oi90Zjs8287LzxtKjgs7rMfYibLf6kvWUwy4GXoqO+Rc
         du0bIRIwzN3M84iFyyn/ye+flkbZYmSrjw2XneX+l7CWX+YVMZ0gkxH7WmnWxYL5+Osr
         siHC1IzBLjBQjucDPhw5TtNlXxuAshXxhjmPToosPFtJtEGP4DGxhvKH97wdFqZC2wY2
         SE9yzk2rxBJ8XwYbtH+yzO9Z4MDB2eNeGWjA8a3fqRlwMuaEZJFk2elkdeexH1dFRYHk
         J7MA==
X-Gm-Message-State: AOAM533wpiL3f4CdHeSRIRV0ZMTqkH6HLCBpZ3jHEh4dRlyez22B0nz2
	sjr0+cGjjBDzpS9uVFR5c++f6A==
X-Google-Smtp-Source: ABdhPJxc6ECjjjQI47XSKG9Oqq0btKMawb3y0V6vpQW8JB6kdd3jtLNpOQPKzgJ4uaoCwZIOXiu/sA==
X-Received: by 2002:a05:600c:2102:: with SMTP id u2mr25589003wml.22.1615805362832;
        Mon, 15 Mar 2021 03:49:22 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4ab3:e50e:5e50:fc1e? ([2001:8b0:aba:5f3c:4ab3:e50e:5e50:fc1e])
        by smtp.gmail.com with ESMTPSA id j9sm11874803wmi.24.2021.03.15.03.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 03:49:22 -0700 (PDT)
Message-ID: <307a85e26da1a6fb90c274da8dbb5fbea457a156.camel@linuxfoundation.org>
Subject: Re: [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Luca Boccassi <luca.boccassi@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org
Date: Mon, 15 Mar 2021 10:49:20 +0000
In-Reply-To: <96cb1cfec8dca5eeca800aa238cab4912701621e.camel@gmail.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210311150959.782186-1-luca.boccassi@gmail.com>
	 <39f7cdcc297fb447632b8b8f222c1a80d88d0871.camel@linuxfoundation.org>
	 <96cb1cfec8dca5eeca800aa238cab4912701621e.camel@gmail.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-03-15 at 10:44 +0000, Luca Boccassi wrote:
> On Sun, 2021-03-14 at 22:10 +0000, Richard Purdie wrote:
> > On Thu, 2021-03-11 at 15:09 +0000, luca.boccassi@gmail.com wrote:
> > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > 
> > > Recently util-linux gained an (optional) build dependency on libcryptsetup.
> > > But libcryptsetup build-depends on util-linux for blkid (optional, can be disabled)
> > > and uuid (mandatory).
> > > Split out util-linux-uuid in a different recipe to break the cycle.
> > > 
> > > https://github.com/karelzak/util-linux/pull/898
> > > 
> > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > 
> > Unfortunately I noticed we had a performance regression in buildtimes in 
> > recent changes. The closest I have this narrowed down to so far:
> > 
> > https://autobuilder.yocto.io/pub/non-release/20210314-14/testresults/buildperf-ubuntu1604/perf-ubuntu1604_master_20210314181831_d42487bf52.html
> > 
> > suggests it may be this change. I have more tests queued to confirm
> > that definitively, if so we'll have to figure out why as this shouldn't
> > really happen, its an 8% regression :(.
> 
> Very strange that a single recipe could do that - is there something
> wrong in the new .bb that I missed and could cause this?

I'm wondering if it is because we're building util-linux twice now and
there is some key choke point in the dependency chain. I have no evidence
for that yet, it is just speculation though.

Cheers,

Richard


