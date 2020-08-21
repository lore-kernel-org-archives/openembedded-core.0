Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.135953.1598022850985039924
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2020 08:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cJrm7S5N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id a15so2260883wrh.10
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2020 08:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=YprLvt8JmEP2wvIxscVFpelV5MM5Z66p0juZYF/Z4qY=;
        b=cJrm7S5NwEhVdWbMzj+3VJQGJYkcFPtGuDKSpFf3Lj+RFTOAKICrd0PbVOEwfDvidS
         RorF1e74HsrGS/y8lBhGqTvGT3qhAskVDZnfH1fZ8aRl/mELzMA9XfVbLMlcqgQpE4yd
         YhpETkz4SCos75wNqs249AxGmGww0zC4bPmUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=YprLvt8JmEP2wvIxscVFpelV5MM5Z66p0juZYF/Z4qY=;
        b=RFg3hdjO1eADENutVmNhxuQm30aGoD0eY5cGKUcUV9yNzYl17S2V8bLoXQg9jzEYVi
         AuKgJ6Eo5OBA2t+aOLlpD29L3o/wPyxY/PBcopASDB/HwpgQdxmaquJ4ZiOSJBaJpnZp
         xVom09IpcUUNcfS+AnErMzMmyY4qULfo3lZwYiKndB9JZhKtoSye2mKoAww2RmACiIMT
         C8vcbTkG+WCU8OK4l1omoE7NJB4bbaP7AiEWz/ozAPMws797XBI9lv3X9QFXGLYdiNDB
         O5wM4sjlzUWeqpm5pD8Y0yAt4eZPfkDdDLciQPyuD62maKNfFgEqbXQnOGllaeaXI9yp
         ClCg==
X-Gm-Message-State: AOAM5307suhMwT5iSzgtRbCXf4zzAIPQ05AlmPTVwGXT/mAyh8/w4C8W
	15Z3ZmGY6uoO1sQ0n2OxzQWh2pLXamRD0NVP
X-Google-Smtp-Source: ABdhPJwPlyC0ar3nqr5hjMyJaAYSE80WuuglBYX8BV2EoFZlvOvRyh87KXRNGSP2chlzYlVsQkBPNg==
X-Received: by 2002:adf:f186:: with SMTP id h6mr3250272wro.144.1598022849323;
        Fri, 21 Aug 2020 08:14:09 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from d.d.0.9.8.0.3.8.5.d.6.d.5.a.5.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (d.d.0.9.8.0.3.8.5.d.6.d.5.a.5.4.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:45a5:d6d5:8308:90dd])
        by smtp.gmail.com with ESMTPSA id m126sm6008271wmf.3.2020.08.21.08.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 08:14:08 -0700 (PDT)
Message-ID: <92644e498d7a7ab6cbd2dba763d7c0900309c31b.camel@linuxfoundation.org>
Subject: Re: [OE-core] cleansstate
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Joe Slater <joe.slater@windriver.com>, 
	"'openembedded-core@lists.openembedded.org'"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Aug 2020 16:14:07 +0100
In-Reply-To: <BY5PR11MB3992C1180C5A53CCD612FD47885D0@BY5PR11MB3992.namprd11.prod.outlook.com>
References: 
	<BY5PR11MB3992C1180C5A53CCD612FD47885D0@BY5PR11MB3992.namprd11.prod.outlook.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2020-08-19 at 23:28 +0000, Joe Slater wrote:
> This might be specific to the distro I am typically using (take a
> guess) but I notice that cleansstate usually pauses at the 33% mark
> for a significant amount of time.  I don’t think this used to be
> quite as bad as it is now, but it is hard to remember.  Just an
> observation that someone might be able to confirm/deny/explain.

sstateclean iterates through all the sstate directories globbing for
potential things to remove. If your sstate cache is large or remote
(e.g. NFS), this will be slow.

Note it doesn't remove just the current hash but any sstate for the
given recipe.

In normal use you should never be needing sstateclean.

Cheers,

Richard

