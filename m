Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.1424.1616229256282690554
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Mar 2021 01:34:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SohLuSN6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id d191so6625817wmd.2
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Mar 2021 01:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=tRAgM7BUggMoVt8R/b8+oglAyt5i4LrecwWNmisTSuc=;
        b=SohLuSN6lAYr4ltp4vyeMKmVOHuxZ81SMwuxzdHa2f9LH85RvogKPciQf0Vr1TzG4w
         ZcoMiJ6VQsy1TG2Uo2bbuZjI9rxvHTKwhoBrEfly3H+mxhpMaMX0cL2Pr6jmW8qDfFpz
         vt6w4+X5pbSGVpbVtAi45zgUQiYQRphgHpIfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=tRAgM7BUggMoVt8R/b8+oglAyt5i4LrecwWNmisTSuc=;
        b=hvVWLgCesfE6/OWJ6f6+XYzDPA3Jz6w8SOHHzTlbzEjifhbvj0Ro3gRcompEGlJWz8
         rJV6YtfTc54xzw9jyz/3uqd07JOKgd2PzsCseXupQdci7n+5BF5Mth/gVczrv+0fbEOy
         RX72DXlauh26NqQtXvFzoj92jn3s9Om4hV0A8vJ6slKnNDF5yQVFEMWuOtgkutHLT8U1
         Ru7whS+qc1OSjhteFBDgWZXACYOIfVNujWNomrCRddhSKqQhH62AWAw8ovGw1UXKPy3v
         dUhP9mnL/sHxTwGDBCzXMbArzJ1dFnVd79FPCO0dkFbpnkUAd3QfYhp8O+PSellyt4rR
         S+ag==
X-Gm-Message-State: AOAM533ZvzISh/p5s+L8w1pYcqGGnfbYkpQg+cK3R8bo+MPpZCExmo4+
	/bnm1SG3DRk0QIhXDvtnGbU5CQ==
X-Google-Smtp-Source: ABdhPJwIbKw+itiOWKgcOj8zt1PlJZv2ptyvas+Ejtax6Ik+1HesFxhAEH6gt4DenbxljcaceFK/lQ==
X-Received: by 2002:a1c:23d0:: with SMTP id j199mr6962326wmj.52.1616229254468;
        Sat, 20 Mar 2021 01:34:14 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:585f:9b77:4475:9530? ([2001:8b0:aba:5f3c:585f:9b77:4475:9530])
        by smtp.gmail.com with ESMTPSA id b15sm939259wrx.73.2021.03.20.01.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 01:34:14 -0700 (PDT)
Message-ID: <ff7b6c5bc9802ad17521c3d561d2fa392efd3b19.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: Prevent pyc file creation in pseudo context for shell tasks
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
 openembedded-core@lists.openembedded.org, Paul Barker <pbarker@konsulko.com>
Date: Sat, 20 Mar 2021 08:34:10 +0000
In-Reply-To: <20210319203032.16009-1-pkj@axis.com>
References: <20210319203032.16009-1-pkj@axis.com>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2021-03-19 at 21:30 +0100, Peter Kjellerstedt wrote:
> In commit 73d538f2 (bitbake.conf: Prevent pyc file generation in
> pseudo context), pyc generation was disabled for fakeroot python
> tasks. However, Python applications started from a fakeroot shell task
> were not affected by this and would still generate pyc files, which
> could trigger pseudo to abort. To avoid this, add
> PYTHONDONTWRITEBYTECODE=1 also to FAKEROOTENV.
> 
> Also add a test case to ensure that pyc files are not created by
> Python applications started from shell tasks that are executed under
> pseudo.
> 
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

It is looking like this might not be quite so simple.

https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/3225

Basically if we do what this patch does, it disables pyc files everywhere
including target recipes/output.

Cheers,

Richard

