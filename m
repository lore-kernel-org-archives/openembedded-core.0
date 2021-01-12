Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.13130.1610474986811466556
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 10:09:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fxmv/Qgk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 190so2746685wmz.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Jan 2021 10:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Hl6lOzDiHR6XKiapJ9xKErVlmV1HzOfmpXjYQAp01fE=;
        b=Fxmv/QgkoOMlih4yt5JR30AQkhwWWHjarN+0F6cwHKtuhNuS3HEBcIoZT3vaVSUNwM
         w08cTwLEpCvbrZUcGnP39PoclxsTUHpXXse6bHCyN1PG3/Th+JV31txRi+dYcCXMBX4S
         XqGpetbX0xJhSTmXHErAuP6+l8rWIg9nNJBys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Hl6lOzDiHR6XKiapJ9xKErVlmV1HzOfmpXjYQAp01fE=;
        b=XibbjYRYaadCd2J6BfDP3KKfNsDXOvQWcr5JfgGumiiHk8l4pDcMyH9e463yGEyeow
         UmKg8FUUiNxY86cyG9Hd8H8dcUHt92s+41eaHzRMNUvZSZIDunxR15dAimuTv5LNLH+i
         kxLyvDZtcc6z7bRXRZuQZ0/AizKTASH43Ykp00yytZkpAyaM3Mf6h+r4NrvBLrtJIkky
         qXN+fz0RcUDuAN65dY5FGE7JHroVZeBXLqahXcIm3691PJuyBl6QrLZgBlry1pU561j/
         9vdf2++80K/CJK8mTppiqcz30b7PpUQB+KkRh9t5AYyKA20TX2suAv9j/pHOPtxjqpw1
         6/Cw==
X-Gm-Message-State: AOAM532WI5/Ll5kmdsM8xR9hwRDIqn5LyRRV7eQTVydmnQKZxCD5Ho+z
	Udk1N0W49pyUR+vV2Q85q6lRMw==
X-Google-Smtp-Source: ABdhPJzQ5a4TFAPxT11SaiwBR4DbrFy5Un4TW9robYRjJBCGMTjkqPw5fzCs181YprbACZXzQGa1yQ==
X-Received: by 2002:a1c:96d7:: with SMTP id y206mr478829wmd.9.1610474985271;
        Tue, 12 Jan 2021 10:09:45 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:281a:af36:8e71:af21? ([2001:8b0:aba:5f3c:281a:af36:8e71:af21])
        by smtp.gmail.com with ESMTPSA id u10sm4937525wmd.43.2021.01.12.10.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 10:09:44 -0800 (PST)
Message-ID: <99744b7868cd7a2e79d6e0461a1bb38a7072ac08.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 1/1] classes/npm: utilize lockfile in do_fetch to avoid multiconfig problems
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "chris.laplante@agilent.com" <chris.laplante@agilent.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Cc: "jean-marie.lemetayer@savoirfairelinux.com"
	 <jean-marie.lemetayer@savoirfairelinux.com>
Date: Tue, 12 Jan 2021 18:09:43 +0000
In-Reply-To: <SN1PR12MB248003905ECEBAA50AB0A5C78BAA0@SN1PR12MB2480.namprd12.prod.outlook.com>
References: <20210112165341.3723-1-chris.laplante@agilent.com>
	 <20210112165341.3723-2-chris.laplante@agilent.com>
	 <c283c960deec844c48af3e0be41ff2c05e8a0665.camel@linuxfoundation.org>
	 <SN1PR12MB248003905ECEBAA50AB0A5C78BAA0@SN1PR12MB2480.namprd12.prod.outlook.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2021-01-12 at 17:53 +0000, chris.laplante@agilent.com wrote:
> Hi Richard,
> 
> > > 
> > > +do_fetch[lockfiles] += "${DL_DIR}/npm2_fetch.lock"
> > > +
> > >  def npm_global_configs(d):
> > >      """Get the npm global configuration"""
> > >      configs = []
> > 
> > If its just multilib, you could put a ${BPN} in the lock name? or is it conflicting
> > general recipes?
> 
> multiconfig, not multilib.
> 
> But it would happen even without multiconfig, if there is overlap in
> the node modules that two recipes try to fetch. For some reason the
> npmsw fetcher (or the proxy fetcher it is using, see
> bitbake/lib/bb/fetch2/npmsw.py around lines 168-181) are not guarding
> against two recipes trying to download the same module concurrently.

Sorry, right. If this isn't multiconfig safe, its also not safe against
concurrent builds against DL_DIR which we do support and allow.

It does sound like there are locks missing in the fetcher code and this
is working around that. Could we add the right locks to the fetcher?

Cheers,

Richard

