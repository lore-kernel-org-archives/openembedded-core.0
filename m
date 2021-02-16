Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web12.6619.1613475530865932988
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 03:38:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=HREdGP4i;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id x4so14134985wmi.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 03:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=QN4iBysttcI2Fb9Zkq5ojZmUGvr24ruU6Xp3yvUCqhg=;
        b=HREdGP4iVMnzXVQIZ3A/jXtDZrRqPo8sX5Ts/lTRD/gCDhEyLmgnzBtFHhdp4euAlz
         c2c+cYEP712FYRY8v/4eb0yyKC0aLuQCyb0Q1OHFNVi2HVMjgBiiGw5gUHY2mT49EUDZ
         3Y/6kfNWtszPsRoB0eaQRDBfp620Y5JPPhZCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=QN4iBysttcI2Fb9Zkq5ojZmUGvr24ruU6Xp3yvUCqhg=;
        b=sS0axizrDzxQSth8ljQuwFokIlb4J5wT7d+OdsH1Uq11F063rY9rPv3xYoukMs168E
         qsvELUA5tqbt/Ewf19tseVgCDObln41/C+VQ+UADW2meJIUnTmxgWBpc2T05CZizUY9w
         1UD6qW66Re3criOHhvnD5ia5eJ7jBlIashPLVJgm6DDSvaIBdu99Y6U6bmpIR/+rqk8h
         658i0wOSpG0b4oCPjG8y8pL7FSiAkSwkMOI6QjUW+K/fusOesXiMqduX1DccotVul6AB
         jyUl+akjR5lyA0ClY0RNjzPK9/GmtWzCLik2aer1HkRnFtQYBa7KqcE2LzvmbtaGgBl8
         GuBQ==
X-Gm-Message-State: AOAM533xW80OmvAyFe0lGWK514siZRkd1C5PIJq0yLC0WKPqiYPy6b8A
	rciAgDm3BEivHPtWgx1XiYFjNg==
X-Google-Smtp-Source: ABdhPJys1eEykeXefgjWlFahgL9tOWUQTp3JBbO6FNiYQrXK+eOP7Om01KqYTKaGG/EzvvUHunaOYA==
X-Received: by 2002:a7b:c1d6:: with SMTP id a22mr2919562wmj.113.1613475529215;
        Tue, 16 Feb 2021 03:38:49 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:3cdf:51ac:3008:b3cc? ([2001:8b0:aba:5f3c:3cdf:51ac:3008:b3cc])
        by smtp.gmail.com with ESMTPSA id n187sm3247608wmf.29.2021.02.16.03.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Feb 2021 03:38:48 -0800 (PST)
Message-ID: <77fb6e42e9f858710792627660b116bafb168b2c.camel@linuxfoundation.org>
Subject: Re: [OE-core] native python recipes using setuptools
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Konrad Weihmann <kweihmann@outlook.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 16 Feb 2021 11:38:45 +0000
In-Reply-To: <AM9PR09MB46427C15B7F9F7652EA41605A8879@AM9PR09MB4642.eurprd09.prod.outlook.com>
References: 
	<AM9PR09MB46427C15B7F9F7652EA41605A8879@AM9PR09MB4642.eurprd09.prod.outlook.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-02-16 at 10:59 +0100, Konrad Weihmann wrote:
> I'm a bit puzzled at the moment - after 
> fd6a007efa7cb45101a66f294af81d9d33bb3fab in meta-openembedded I faced a 
> lot of changes in the behavior of native-only recipes (@RP yes the ones 
> that don't use BBCLASSEXTEND :-))
> 
> after this change I had a couple of dependency loops like
> 
> python3-my-recipe-native > python3 > ... > python3-my-recipe-native
> 
> and I could track it down to distutils3-base.bbclass [1].
> There for all recipes no matter what the set (I guess BBCLASSEXTEND 
> magic will solves that in the end) "python3-native python3" is set in 
> DEPENDS.
> 
> My question is, is that intended behavior or would it make sense to be 
> more explicit here, like
> 
> DEPENDS += "python3-native"
> DEPENDS_class-target += "python3"
> 
> ?
> 
> Mainly this happens when a globally inherited class requests a native 
> python3 package via DEPENDS (a not too uncommon use case for me).
> 
> Thoughts?

Definitely a bug, I've sent a patch. The DEPENDS would be needed for
nativesdk too and since it doesn't appear to require python3-native in
the native case, I didn't change that.

Cheers,

Richard

