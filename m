Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.843.1615759820124188266
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Mar 2021 15:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fHmcVz7d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id j4-20020a05600c4104b029010c62bc1e20so18398539wmi.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Mar 2021 15:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=rXnuuAukEDzjFIJYerU1pMUWWcAL41CGOEoDEmxMf0o=;
        b=fHmcVz7dEkX6O1Z56PbNJflvqVja+EOW5/W887148G4GCRulwdlMHPq9CWoQxgEs+0
         H76d3WbV8dBYBQ4cOx8t+MLw+IgO9TW/xP1lpy0dPxHt8edN8WcXevCHyhhoeIFi9I66
         ZrHVehvZw80tb1bcIVrAQztFbpe+3gisCw8Kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rXnuuAukEDzjFIJYerU1pMUWWcAL41CGOEoDEmxMf0o=;
        b=ZJU2amnI7f65j3laTA7o297z//crZaWp6oGrbDcx3li2cS/hi+cLlT9jCMyLOLD1fX
         +elyPgZUXV4aAdtl8XQ8vEvitUGV86nt6TCDWlRQ4AJTbueyoeu04JG4VF2bL4Zztm5l
         gqncVDqafY+/hKoGvfNoLTDHx2cfK0ep/RC7fYDTjTM9pH2o410n8csxU9uQKdcUpwOA
         R2nftBDM0LHPjpRIwrf0QWPRj23SRmJzYFuAn+zBA1OaNAcoih9GQNkYkmTk4G/6XEab
         ieh0GyneI/kDmaOyFvfzgAxJ7GIXDxXdR8kI1rrQ0tCUnCpgxPIIY2DBG04RiEtoh9Yy
         ue8g==
X-Gm-Message-State: AOAM533gQxsK4wtvEBkRzD7lXOHSuA1sK0ipaZKeprnpAIfDzOBCtwhv
	kdvStj1ZB5wjHatO+6moEg2T9w==
X-Google-Smtp-Source: ABdhPJw4xOV0aZkAnaGGN7Fkn30H5WmKPJmdttj1L5BM/0kkNG+aKPqPgfD1zg60CySju3gO6Xp4Mw==
X-Received: by 2002:a1c:1bc7:: with SMTP id b190mr23494697wmb.115.1615759818573;
        Sun, 14 Mar 2021 15:10:18 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:4ab3:e50e:5e50:fc1e? ([2001:8b0:aba:5f3c:4ab3:e50e:5e50:fc1e])
        by smtp.gmail.com with ESMTPSA id j136sm10800052wmj.35.2021.03.14.15.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Mar 2021 15:10:18 -0700 (PDT)
Message-ID: <39f7cdcc297fb447632b8b8f222c1a80d88d0871.camel@linuxfoundation.org>
Subject: Re: [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: luca.boccassi@gmail.com, openembedded-core@lists.openembedded.org
Cc: bluelightning@bluelightning.org
Date: Sun, 14 Mar 2021 22:10:17 +0000
In-Reply-To: <20210311150959.782186-1-luca.boccassi@gmail.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	 <20210311150959.782186-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-03-11 at 15:09 +0000, luca.boccassi@gmail.com wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> Recently util-linux gained an (optional) build dependency on libcryptsetup.
> But libcryptsetup build-depends on util-linux for blkid (optional, can be disabled)
> and uuid (mandatory).
> Split out util-linux-uuid in a different recipe to break the cycle.
> 
> https://github.com/karelzak/util-linux/pull/898
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>

Unfortunately I noticed we had a performance regression in buildtimes in 
recent changes. The closest I have this narrowed down to so far:

https://autobuilder.yocto.io/pub/non-release/20210314-14/testresults/buildperf-ubuntu1604/perf-ubuntu1604_master_20210314181831_d42487bf52.html

suggests it may be this change. I have more tests queued to confirm
that definitively, if so we'll have to figure out why as this shouldn't
really happen, its an 8% regression :(.

Cheers,

Richard



