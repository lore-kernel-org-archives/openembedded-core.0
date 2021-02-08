Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.36.1612808674228986707
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Feb 2021 10:24:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cota8nlY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id i9so71447wmq.1
        for <openembedded-core@lists.openembedded.org>; Mon, 08 Feb 2021 10:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=UwwV9GlrOUpCV5rZ4L+SK0MAGSyKLDbGtP0XOYLH7y8=;
        b=cota8nlY2ueGTCrgMagAeMW2rFA+6T3m/4NFrUXGmwis5BtFs4ENgbgPPXAFF3fReZ
         JC10nGLP4eH2Z81t/t0KhsVxKZexM+3VvWFDK2iHLCAm4lL9pIJ818DL2xl1jaC5V8b3
         oUz3Y894s7sCX+HT2YMLDhegSrXdLONl7FjZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=UwwV9GlrOUpCV5rZ4L+SK0MAGSyKLDbGtP0XOYLH7y8=;
        b=aOrJ81FRFf1cjG9ZG6nlECDnA7DJ2l1bbQPbX0BxAzWOVvGPidUxqb3c4ST1138xbq
         FGKb6p9TlM+ZfkNfso3q/Pf5hUqCH3lkVbAc2AEzxtZSomGtESuF3TvSFQsIJF84FAqf
         Hm8EYAjPfkqW4P/ds4k/5bO6NtQSyi9e0CNP6CguN8EcR4HD/6CRbTmywyWv1X16ZSpV
         /PKQn5EAQliZ6iplZMuYU+gxe46nLB3l/nFrgeMJH9iH0thbVw17/xE0LyLMmZvcE27v
         W3I2N0Wuxio89L3hKz1y8pm6VkIIjsShTC8KjUf53PbA7BtWstbdij1YiaEm1Os1/uh4
         nBuA==
X-Gm-Message-State: AOAM53340ZV9urYvp3Gk83dCRRfegZhCw2JK9sIqnpVxHp1lgOoddac+
	eUur+KVTd3Qh8AvfpeACRdVT6g==
X-Google-Smtp-Source: ABdhPJwKSrAIi0p2NaXSvNsC+V+u1Ih4CH+W7aFq57effMdlDAAKbwRstCVYP8WSsu70elViIM/+1A==
X-Received: by 2002:a1c:e08a:: with SMTP id x132mr74624wmg.184.1612808672685;
        Mon, 08 Feb 2021 10:24:32 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:ff1a:4654:ede1:462c? ([2001:8b0:aba:5f3c:ff1a:4654:ede1:462c])
        by smtp.gmail.com with ESMTPSA id m18sm30251075wrx.17.2021.02.08.10.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 10:24:32 -0800 (PST)
Message-ID: <4a694c6541b5121ae913bc75a62fd07b497948bd.camel@linuxfoundation.org>
Subject: Re: [PATCH] opkg: Fix build reproducibility issue
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Alex Stewart <alex.stewart@ni.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 08 Feb 2021 18:24:29 +0000
In-Reply-To: <cc33b921-3b59-8c11-ffbf-df8fdb4d3173@ni.com>
References: <20210202234835.1532984-1-richard.purdie@linuxfoundation.org>
	 <cc33b921-3b59-8c11-ffbf-df8fdb4d3173@ni.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-02-08 at 12:21 -0600, Alex Stewart wrote:
> On 2/2/21 5:48 PM, Richard Purdie wrote:
> > A build date was leaking into the generated docs and makefile used for
> > ptests leading to reproducibility issues each time the month changed.
> > 
> > Add a patch to use SOURCE_DATE_EPOCH to derive it if available.
> 
> ACK the objective, but I have a couple concerns about the patch below.
> 
> > +--- opkg-0.4.4.orig/configure.ac
> > ++++ opkg-0.4.4/configure.ac
> > +@@ -281,7 +281,12 @@ AC_FUNC_UTIME_NULL
> > + AC_FUNC_VPRINTF
> > + AC_CHECK_FUNCS([memmove memset mkdir regcomp strchr strcspn strdup strerror strndup strrchr strstr strtol strtoul sysinfo utime])
> > +
> > +-CLEAN_DATE=`date +"%B %Y" | tr -d '\n'`
> > ++1607446883
> 
> Is this `1607...` timestamp just some leftover pollution in the 
> configure.ac file or does it serve some purpose?

Sorry, its just junk that crept in from testing. I'm surprised that
doesn't error!

> > ++if [ ! -z "$SOURCE_DATE_EPOCH" ]; then
> 
> AutoConf doesn't have the shell interpretation of `[`; right? At least 
> on my system, AutoConf drops the brackets in this statement and writes 
> the ./configure file as:
> 
> if ! -z "$SOURCE_DATE_EPOCH" ; then
> 
> which obviously fails when executed. Can you use `if test ! -z ...` instead?

I should know better than using [] in configure :) The other format
should be fine. It probably works as OE always sets this now.

Cheers,

Richard


