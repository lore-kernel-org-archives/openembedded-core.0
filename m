Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web11.5827.1586425665623099996
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2020 02:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=M/ytSNh0;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id y24so3529511wma.4
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2020 02:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=KJ2Nuncg24f20mpIYPtNlWIHagtbqwM61bD/fLBfwBc=;
        b=M/ytSNh0lIGFF6Z+PobvUHeurRwwGb5m15iJe7z5JDmBbuCwK/PIoxF1agAKAwVYc1
         g0+U1408B2y7+HAmumPtIAIiM7pZIr6rBLdrm2o62ksGxlLJsXVheWEBIhf+k2nQ3N9U
         zCqBhMO2uMRawuJdP8e2bkuyqVNWztYhJS38U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KJ2Nuncg24f20mpIYPtNlWIHagtbqwM61bD/fLBfwBc=;
        b=PXF/htPuuBh/RwTU+IKjYbDQixD7pxesh4J8PjSl6ZByvkTnSzzeh2KvhpJ3m0QQ0I
         1kM7HopU8alojj35Px1BRfbh75UdUS4CUY8rL5oc48WP+8oIkBKg9FAVL62FzZWmItKz
         r1hD0U0Mz43wCrHK8xMQQ/uyzSrJW6DzcTlW41btVRVLhi3FxslLxG14oob2UvpBfIlx
         9CEdogDbR+6T+1VN8gV80XTPxSXtUvrqKwCYvSA4JbRIsJcpiFh9lPptOPMdoTs1gHDt
         P0d1fSuQZvL/2zYcFiduPtJ0HNkmUjWGof7hkPCrmanJocIBf1pesjUW83h2OGoXDT2M
         Av6A==
X-Gm-Message-State: AGi0PuYqibiaLVMOWBpN5Ok2K/m60p7GOy3ntWTNWJ2wKz5WSl5Q29LH
	dzDV/aUl4oUkMR0yiwZZbA/TfA==
X-Google-Smtp-Source: APiQypL3LFjiXRJk75TLK5ESBX/MZKcuMfws7O0+tsj4OaWJXv4j74w9u+7q8F0FYv76+7XUIaCw1g==
X-Received: by 2002:a7b:cb03:: with SMTP id u3mr8654550wmj.12.1586425664004;
        Thu, 09 Apr 2020 02:47:44 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id k3sm2968082wmf.16.2020.04.09.02.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 02:47:43 -0700 (PDT)
Message-ID: <ed42da631684e5b7151a03a3bfd692fe779ded65.camel@linuxfoundation.org>
Subject: Re: [PATCH] musl: Show error when used with multilibs
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 09 Apr 2020 10:47:42 +0100
In-Reply-To: <CAMKF1srJ72-knr8BJxGcJ6Mct=y_Dt4DtZWMhs5UM+eoCf4i6A@mail.gmail.com>
References: <20200408231808.393685-1-richard.purdie@linuxfoundation.org>
	 <CAMKF1srJ72-knr8BJxGcJ6Mct=y_Dt4DtZWMhs5UM+eoCf4i6A@mail.gmail.com>
User-Agent: Evolution 3.36.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-04-08 at 16:45 -0700, Khem Raj wrote:
> On Wed, Apr 8, 2020 at 4:18 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > As discussed in the bugzilla entry, musl is not compatible with
> > multilibs
> > and has no plans to support this. Therefore tell users this from
> > the
> > recipe rather than letting them run into build failures.
> > 
> 
> I dont think thats the case anymore, I have sent patches to fix
> multilib on musl. this seems a broad brush. What are you trying to
> fix ?

The bug said we don't support multilib and musl and the code clearly
currently doesn't, so this patch was to make the situation clearer to
users.

Based on the need for your patch and other patches, its clear that musl
and multilib doesn't work as things stand today.

The question becomes whether we want to support that? Do we want/need
to add automated tests for it?

We've built 3.1 rc2 which is in QA so this wasn't going into the
release, maybe the point release, or if we rebuild for some reason. I
do want to do something with the bug. If we want to enable multilib
with musl that would be a 3.2 activity.

Perhaps we should merge this change, then remove it when the other
issues are fixed?

Cheers,

Richard


